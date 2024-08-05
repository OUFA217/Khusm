import 'package:dartz/dartz.dart';
import 'package:khusm/core/network/failure.dart';
import 'package:khusm/features/home/data/datasources/test_datasource.dart';
import 'package:khusm/features/home/domain/entities/test_entitie.dart';
import 'package:khusm/features/home/domain/interface/random_contract.dart';

class TestContractImpl implements TestContract {
  final TestClient testClient;

  TestContractImpl({
    required this.testClient,
  });

  @override
  Future<Either<Failure, TestEntitie>> getTest() async {
    try {
      final response = await testClient.getTest();
      return Right(response);
    } on Object {
      return Left(ServerFailure());
    }
  }
}
