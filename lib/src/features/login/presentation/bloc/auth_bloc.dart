
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qit/src/features/login/data/models/user_model.dart';
import 'package:qit/src/features/login/domain/usecases/login.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginIsLoadingState());
        try {
          final user = await loginUseCase(
              LoginParams(email: event.email, password: event.password));
          user.fold((l) {
            emit(LoginErrorState(error: l.toString()));
          }, (r) {
            emit(LoginSuccessState(userModel: r));
          });
          // user.fold((l) => emit(LoginErrorState()),
          //     (r) => emit(LoginSuccessState(userModel: r)));
        } catch (error) {
          emit(LoginErrorState(error: error.toString()));
        }
      }
    });
  }
}
