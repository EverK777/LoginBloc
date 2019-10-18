import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Email invalid');
      }
    }
  );
  final validatePassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length > 6){
        sink.add(password);
      }else{
        sink.addError('Password should have more than 5 characters');
      }
    }
  );
}