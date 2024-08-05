import 'package:khusm/features/home/data/models/test_model.dart';

abstract class TestClient {
  Future<TestModel> getTest();
}
