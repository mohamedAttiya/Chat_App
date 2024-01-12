abstract class AuthStates{}
class InitialState extends AuthStates{}
class TermsAndConditionUpdateState extends AuthStates{}
class ChangeIconState extends AuthStates{}
class LoadingCreateUserWithEmailAndPassword extends AuthStates{}
class LoadingForgetPasswordState extends AuthStates{}
class SuccessForgetPasswordState extends AuthStates{}
class ErrorForgetPasswordState extends AuthStates
{
  final String error;
  ErrorForgetPasswordState(this.error);
}
class SuccessCreateUserWithEmailAndPassword extends AuthStates{}
class ErrorCreateUserWithEmailAndPassword extends AuthStates
{
  final String error;
  ErrorCreateUserWithEmailAndPassword(this.error);
}
class BottomNavigationBarState extends AuthStates{}