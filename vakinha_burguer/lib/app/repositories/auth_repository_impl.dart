import 'dart:developer' as devtools;

import 'package:vakinha_burguer/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burguer/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer/app/models/user_model.dart';
import 'package:vakinha_burguer/app/repositories/auth/auth_repository.dart';

class AuthRepositoryimpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryimpl({
    required RestClient restClient,
  }) : _restClient =
            restClient; //como é um parametro privado nao da pra fazer um construtor nomeado, por isso precisa ser feito dessa forma.

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      devtools.log(message,
          error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }

    return Login(email, password);
  }

  @override
  Future<UserModel> Login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        devtools.log('Usuario ou senha invalidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }

      devtools.log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar  o suruário');
    }
    return UserModel.fromMap(result.body);
  }
}
