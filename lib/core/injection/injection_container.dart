import 'package:get_it/get_it.dart';
import 'package:khusm/core/network/network_info.dart';
import 'package:khusm/core/network/server_api_client.dart';
import 'package:khusm/features/home/data/repositories/test_contract_impl.dart';
import 'package:khusm/features/home/domain/interface/random_contract.dart';

final getIt = GetIt.instance;

void initDependecies() {
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
    () => NetworkInfoRepositoryImpl(),
  );
  // Server API Client
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
    ),
  );
}

Future<void> initFeaturesDependecies() async {
  getIt.pushNewScope();

  getIt.registerLazySingleton<TestContract>(() => TestContractImpl(
        testClient: getIt(),
      ));
}
