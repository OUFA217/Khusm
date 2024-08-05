import 'package:dartz/dartz.dart';
import 'package:khusm/core/network/failure.dart';
import 'package:khusm/core/usecases/usecase.dart';
import 'package:khusm/features/home/domain/entities/test_entitie.dart';
import 'package:khusm/features/home/domain/interface/random_contract.dart';

class ParamsUseCaseGetRandom {
  const ParamsUseCaseGetRandom();
}

class GetRandomResult {
  final TestEntitie response;
  const GetRandomResult({
    required this.response,
  });
}

class GetRandomUseCase
    extends UseCase<GetRandomResult, ParamsUseCaseGetRandom> {
  final TestContract repository;

  GetRandomUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, GetRandomResult>> call(
      ParamsUseCaseGetRandom params) async {
    final checkResult = await repository.getTest();

    return checkResult.fold(
      (failure) => Left(failure),
      (result) => Right(
        GetRandomResult(response: result),
      ),
    );
  }
}
