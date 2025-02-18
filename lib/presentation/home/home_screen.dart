import 'package:banka/presentation/cities/countries_screen.dart';
import 'package:banka/presentation/cities/cubit/cities_cubit.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:banka/shared/designsystem/widget/card_countries_widget.dart';
import 'package:banka/shared/designsystem/widget/card_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<CitiesCubit, CitiesState>(
              buildWhen: (context, state) {
                return state is CitiesFavoritesWeather;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Clima',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    if (state is CitiesFavoritesWeather &&
                        state.cities.isNotEmpty) ...[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cities.length,
                          itemBuilder: (context, index) {
                            return CardWeatherWidget(
                              city: state.cities[index],
                            );
                          },
                        ),
                      )
                    ] else
                      ...[
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icon.jpeg',
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10,),
                              Expanded(child: Text(
                                'Aqui se mostrara el clima de tus ciudades favoritas',
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        )
                      ],
                  ],
                );
              },
            ),
            BlocBuilder<CitiesCubit, CitiesState>(
              buildWhen: (context, state) {
                return state is CitiesFavorites;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (state is CitiesFavorites &&
                            state.cities.isNotEmpty) ...[
                          Text(
                            '${state.cities.length}-',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                        Text(
                          'Ciudades favoritas',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountriesScreen(
                                    countries: (state is CitiesFavorites &&
                                            state.cities.isNotEmpty)
                                        ? state.cities
                                        : []),
                              ));
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppTheme.instance.bnkPrimary,
                            ))
                      ],
                    ),
                    if (state is CitiesFavorites &&
                        state.cities.isNotEmpty) ...[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.66,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: state.cities.length,
                            itemBuilder: (context, index) {
                              return CardCountriesWidget(
                                city: state.cities[index],
                                delete: true,
                                onFavorite: (String value) => context
                                    .read<CitiesCubit>()
                                    .favoriteCity(state.cities, value),
                              );
                            },
                          ),
                        ),
                      )
                    ] else
                      ...[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/logo.png',
                                width: 120,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Aqui se mostrara tus ciudades favoritas',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        )
                      ]
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
