import 'package:fetchingapi_riverpod/models/user_model.dart';
import 'package:fetchingapi_riverpod/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
}
);