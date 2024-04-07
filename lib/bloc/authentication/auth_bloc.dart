import 'package:apple_shop/bloc/authentication/auth_State.dart';
import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/data/repository/authintication_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class authBloc extends Bloc<authEvent, authState> {
  final IauthRepository _repository = locator.get();
  authBloc() : super(authInotioateState()) {
    on<authLoginRequest>(
      (event, emit) async {
        emit(authLodingState());
        var response = await _repository.login(event.username, event.passwore);
        emit(authResponeState(response));
      },
    );
  }
}
