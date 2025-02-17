import 'package:banka/domain/enities/city_entity.dart';
import 'package:banka/presentation/cities/cubit/cities_cubit.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:banka/shared/designsystem/widget/card_countries_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key, required this.countries});

  final List<CityEntity> countries;

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {

  @override
  void initState() {
    showLoading();
    context.read<CitiesCubit>().getCities(widget.countries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
      listenWhen: (context, state) {
        return state is CitiesLoading || state is CitiesHideLoading || state is CitiesError;
      },
      listener: (context, state) async {
        if (state is CitiesLoading) {
          showLoading();
        }
        if (state is CitiesHideLoading) {
          Navigator.of(context).pop();
        }

        if(state is CitiesError){
          Toastification().show(
              context: context,
              title: Text(state.error),
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 2),
              alignment: Alignment.bottomCenter);
        }
      },
      buildWhen: (context, state) {
        return state is CitiesResult;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ciudades'),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Column(
            children: [
              if (state is CitiesResult && state.cities.isNotEmpty) ...[
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(right: 24, left: 24),
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return CardCountriesWidget(
                      city: state.cities[index],
                      onFavorite: (String value) async {
                        await context.read<CitiesCubit>().favoriteCity(state.cities, value);
                            Navigator.of(context).pop();
                      },
                    );
                  },
                ))
              ] else
                ...[]
            ],
          ),
        );
      },
    );
  }

  void showLoading(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.instance.bnkPrimary,
              ),
            );
          });
    });

  }
}
