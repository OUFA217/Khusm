import 'package:dartz/dartz.dart';
import 'package:khusm/features/signup/data/repositories/load_country.dart';
import 'package:khusm/features/signup/domain/entities/country_entitie.dart';
import 'package:khusm/features/signup/domain/usecases/country_usecase.dart';

class GetCountryWithNameImpl implements GetCountryWithName {
  GetCountryWithNameImpl();

  @override
  Future<Either<Exception, Country?>> call(String name) async {
    try {
      Country? country;
      var data = await CountryRepositoryImpl().call();
      data.fold((l) {
        throw Exception('Failed to load countries');
      }, (data) {
        country = data.firstWhere((c) => c.name.contains(name),
            orElse: () => throw Exception('Country not found'));
      });

      return Right(country);
    } catch (e) {
      return Left(Exception('Country not found'));
    }
  }
}
