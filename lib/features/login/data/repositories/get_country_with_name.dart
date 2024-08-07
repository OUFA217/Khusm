import 'package:dartz/dartz.dart';
import 'package:khusm/features/login/domain/entities/country_entitie.dart';
import 'package:khusm/features/login/domain/usecases/country_usecase.dart';

class GetCountryWithNameImpl implements GetCountryWithName {
  final List<Country> countries;

  GetCountryWithNameImpl(this.countries);

  @override
  Either<Exception, Country?> call(String name) {
    try {
      final country = countries.firstWhere((c) => c.dialCode == name,
          orElse: () => throw Exception(''));
      return Right(country);
    } catch (e) {
      return Left(Exception('Country not found'));
    }
  }
}
