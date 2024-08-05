import 'dart:convert';

import 'package:khusm/core/network/server_api_client.dart';
import 'package:khusm/features/home/data/datasources/test_datasource.dart';
import 'package:khusm/features/home/data/models/test_model.dart';

class TestClientImpl implements TestClient {
  final ServerApiClient apiClient;

  TestClientImpl({
    required this.apiClient,
  });

  @override
  Future<TestModel> getTest() async {
    final response = await apiClient.get('/jokes/random');
    return TestModel.fromJson(jsonDecode(response.data));
  }
}
