import 'dart:async';
import 'package:login_bloc/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

// with mixins
class Bloc with Validators {
  //bloc
  // final _emailController = StreamController<String>.broadcast();
  //final _passwordController = StreamController<String>.broadcast();
  //rx dart
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  //Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValidation =>
      Observable.combineLatest2(email, password, (e, p) => true);

  String submit() {
    print('logged in');
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
// singleton

// mixins reutilizar codigo entre multiples clases que no cumplen la misma jerarquia
}

final bloc = Bloc();
