// lib/features/login/domain/usecases/load_countries.dart
import 'package:dartz/dartz.dart';
import 'package:khusm/features/login/domain/entities/country_entitie.dart';

abstract class LoadCountries {
  Future<Either<Exception, List<Country>>> call();
}

abstract class GetCountryWithName {
  Either<Exception, Country?> call(String name);
}
