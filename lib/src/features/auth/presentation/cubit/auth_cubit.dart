import 'package:dartz/dartz.dart';
import '../../../../core/errors/error_strings.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  AuthCubit({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  void loginWithEmail({required String email, required String password}) async {
    emit(AuthEmailLoginLoading());
    Either<Failure, UserEntiy> response =
        await loginUseCase.call(email: email, password: password);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const AuthEmailLoginError(msg: ErrorsString.noInternet));
        } else {
          emit(const AuthEmailLoginError(msg: ErrorsString.invaildCredential));
        }
      },
      (r) {
        emit(AuthEmailLoginSuccess());
      },
    );
  }

  void registerWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    emit(AuthEmailRegisterLoading());
    Either<Failure, UserEntiy> response = await registerUseCase.call(
        email: email, password: password, name: name);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const AuthEmailRegisterError(msg: ErrorsString.noInternet));
        } else {
          emit(const AuthEmailRegisterError(msg: ErrorsString.serverError));
        }
      },
      (r) {
        emit(AuthEmailRegisterSuccess());
      },
    );
  }

  void loginWithGoogle() async {
    emit(AuthGoogleLoginLoading());
    Either<Failure, UserEntiy> response = await loginWithGoogleUseCase.call();
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(const AuthGoogleLoginError(msg: ErrorsString.noInternet));
        } else {
          emit(const AuthGoogleLoginError(msg: ErrorsString.serverError));
        }
      },
      (r) {
        emit(AuthGoogleLoginSuccess());
      },
    );
  }
}
