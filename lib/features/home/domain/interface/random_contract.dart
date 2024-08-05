import 'package:dartz/dartz.dart';
import 'package:khusm/core/network/failure.dart';
import 'package:khusm/features/home/domain/entities/test_entitie.dart';

abstract class TestContract {
  /// abstract method for Get Random
  Future<Either<Failure, TestEntitie>> getTest();
}
