import '../../core/api_client/api_client.dart';
import '../api_endpoints.dart';
import '../models/defaults/default_response_model.dart';
import '../models/defaults/response_model.dart';
import '../models/requests/login_request_model.dart';
import '../models/responses/user_response_model.dart';

abstract class LoginRepository {
  Future<ResponseModel<UserResponseModel>> loginWithEmailAndPassword(
    LoginRequestModel requestModel,
  );

  Future<ResponseModel<UserResponseModel>> loginWithCellPhone(String cellPhone);
}

class LoginRepositoryImpl implements LoginRepository {
  final ApiClient _connect;
  LoginRepositoryImpl(this._connect);

  @override
  Future<ResponseModel<UserResponseModel>> loginWithEmailAndPassword(
    LoginRequestModel requestModel,
  ) async {
    final response = await _connect.post(
      ApiEndpoints.login,
      requestModel.toMap(),
    );

    final model = DefaultResponse.fromMap(response.body);
    if (response.isOk) {
      return ResponseModel.success(
        UserResponseModel.fromMap(model.data),
      );
    }

    return const ResponseModel.error('Não deu para fazer o login');
  }

  @override
  Future<ResponseModel<UserResponseModel>> loginWithCellPhone(
    String cellPhone,
  ) {
    // TODO: implement loginWithCellPhone
    throw UnimplementedError();
  }
}
