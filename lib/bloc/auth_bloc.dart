import 'package:hayum/models/auth_model.dart';
import 'package:hayum/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _repository = AuthRepository();
  final _authRx = PublishSubject<Auth>();

  Observable<Auth> get loggedInUser => _authRx.stream;

  loginUser(Map<String, String> data) async {
    Auth auth = await _repository.loginUser(data);
    print("Login User:" + auth.toString());
    _authRx.sink.add(auth);
  }

  dispose() {
    _authRx.close();
  }
}

final authBloc = AuthBloc();
