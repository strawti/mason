import 'package:get/get.dart';

import '../models/defaults/response_model.dart';
import '../models/responses/product_model.dart';

abstract class GetAllProductsByUseCase {
  Future<ResponseModel<List<ProductModel>>> byCategoryId(int categoryId);
  Future<ResponseModel<List<ProductModel>>> byName(int name);
}

class GetAllProductsByUseCaseImpl implements GetAllProductsByUseCase {
  final GetConnect _connect;
  GetAllProductsByUseCaseImpl(this._connect);

  @override
  Future<ResponseModel<List<ProductModel>>> byCategoryId(
    int categoryId,
  ) async {
    return const ResponseModel.success([]);
  }

  @override
  Future<ResponseModel<List<ProductModel>>> byName(int name) async {
    return const ResponseModel.success([]);
  }
}
