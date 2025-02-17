import 'package:banka/domain/enities/city_entity.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:flutter/material.dart';

class CardCountriesWidget extends StatelessWidget {
  const CardCountriesWidget(
      {super.key, required this.city, required this.onFavorite, this.delete=false});

  final CityEntity city;
  final Function(String) onFavorite;
  final bool delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                city.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )),
            IconButton(
                onPressed: () => onFavorite(city.name),
                icon: Icon(
                  delete
                      ? Icons.delete_outline
                      : city.favorite
                          ? Icons.star
                          : Icons.star_border,
                  color: AppTheme.instance.bnkPrimary,
                ))
          ],
        ),
      ),
    );
  }
}
