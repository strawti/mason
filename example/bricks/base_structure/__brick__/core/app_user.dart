// class AppUser {
//   AppUser._();

//   static AppUser instance = AppUser._();

//   UserResponseModel? get data {
//     final data = GetStorage().read('user');

//     if (data != null) {
//       return UserResponseModel.fromJson(data);
//     }

//     return null;
//   }

//   Future<void> setUser(UserResponseModel user) async {
//     await GetStorage().write('user', user.toJson());
//   }
// }