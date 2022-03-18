import 'package:shop_app/screens/sign_in/model.dart';

abstract class SignInStates {} // Parent State

class SignInInitialState extends SignInStates {}

class LoginChangeSufixIconState extends SignInStates {}


class LoginLoadingState extends SignInStates {}
class LoginSuccessState extends SignInStates {
  late LoginModel loginModel ;
  LoginSuccessState(this.loginModel);
}
class LoginFailState extends SignInStates {}
