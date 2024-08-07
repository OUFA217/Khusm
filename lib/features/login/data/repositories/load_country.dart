// lib/features/login/data/repositories/country_repository.dart
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:khusm/features/login/domain/entities/country_entitie.dart';
import 'package:khusm/features/login/domain/usecases/country_usecase.dart';

class CountryRepositoryImpl implements LoadCountries {
  @override
  Future<Either<Exception, List<Country>>> call() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/countries.json');
      final List<dynamic> data = json.decode(response);
      final countries = data.map((e) => Country.fromJson(e)).toList();
      return Right(countries);
    } catch (e) {
      return Left(Exception('Failed to load countries'));
    }
  }
}
