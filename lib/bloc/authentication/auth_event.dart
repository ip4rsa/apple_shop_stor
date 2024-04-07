abstract class authEvent {}

class authLoginRequest extends authEvent {
  String username;
  String passwore;
  authLoginRequest(this.username, this.passwore);
}
