import 'package:banka/domain/enities/city_entity.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:flutter/material.dart';

class CardWeatherWidget extends StatelessWidget {
  const CardWeatherWidget(
      {super.key, required this.city});

  final CityEntity city;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        child: SizedBox(
          width: 140,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                      child: Text(
                        '${city.weather?.temperature2M??0} ${city.weather?.temperature2MUnit??''}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )),

                Expanded(child: Center(
                  child: Text(
                    city.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      Positioned(top:-6, right:-6,child: Image.asset(
        city.weather?.image??'',
        width: 50,
        fit: BoxFit.fill,
      )),


    ],);
  }
}
