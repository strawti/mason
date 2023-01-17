import 'dart:io';

import '../../core/app_errors.dart';
import '../models/defaults/response_model.dart';
import '../models/requests/login_request_model.dart';
import '../models/responses/user_response_model.dart';
import '../repositories/login_repository.dart';

abstract class LoginUseCase {
  Future<ResponseModel<UserResponseModel>> loginWithEmailAndPassword(
    LoginRequestModel requestModel,
  );

  Future<ResponseModel<UserResponseModel>> loginWithCellPhone(
    String cellPhone,
  );
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _repository;
  LoginUseCaseImpl(this._repository);

  @override
  Future<ResponseModel<UserResponseModel>> loginWithEmailAndPassword(
    LoginRequestModel requestModel,
  ) async {
    try {
      return await _repository.loginWithEmailAndPassword(requestModel);
    } on SocketException {
      return const ResponseModel.warning(AppErrors.socketException);
    } on NoSuchMethodError {
      return const ResponseModel.error(AppErrors.noSuchMethodError);
    } catch (error) {
      return ResponseModel.error(AppErrors.defaultError('fazer login', error));
    }
  }

  @override
  Future<ResponseModel<UserResponseModel>> loginWithCellPhone(
    String cellPhone,
  ) {
    // TODO: implement loginWithCellPhone
    throw UnimplementedError();
  }
}
