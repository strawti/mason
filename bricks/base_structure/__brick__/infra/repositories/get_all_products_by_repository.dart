import '../../core/api_client/api_client.dart';

import '../models/defaults/response_model.dart';
import '../models/responses/product_model.dart';

abstract class GetAllProductsByRepository {
  Future<ResponseModel<List<ProductModel>>> byCategoryId(int categoryId);
  Future<ResponseModel<List<ProductModel>>> byName(String name);
}

class GetAllProductsByRepositoryImpl implements GetAllProductsByRepository {
  final ApiClient _connect;
  GetAllProductsByRepositoryImpl(this._connect);

  @override
  Future<ResponseModel<List<ProductModel>>> byCategoryId(
    int categoryId,
  ) async {
    await _connect.get('/');
    return const ResponseModel.success([]);
  }

  @override
  Future<ResponseModel<List<ProductModel>>> byName(
    String name,
  ) async {
    await _connect.get('/');
    return const ResponseModel.success([]);
  }
}
