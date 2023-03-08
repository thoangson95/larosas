import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'formz.dart';

class UserState extends Equatable {
  const UserState(
      {this.id,
      this.username,
      this.phone,
      this.email,
      this.password,
      this.status,
      this.errorMess});

  // All properties should be `final` on our class.
  final String? id;
  final String? username;
  final CheckPhone? phone;
  final String? email;
  final String? password;
  final dynamic status;
  final String? errorMess;

  // Since UserState is immutable, we implement a method that allows cloning the
  // UserState with slightly different content.
  UserState copyWith(
      {String? id,
      String? username,
      CheckPhone? phone,
      String? email,
      String? password,
      dynamic status,
      String? errorMess}) {
    return UserState(
      id: id ?? this.id,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMess: errorMess ?? this.errorMess,
    );
  }

  @override
  List<Object?> get props => [phone, status];
}

class UserControler extends StateNotifier<UserState> {
  UserControler() : super(const UserState());

  void onClickForget(String phoneNumber) {
    final phone = CheckPhone.dirty(phoneNumber);
    state = state.copyWith(
      phone: phone,
      status: Formz.validate([phone]),
    );
  }
}

final forgetProviders =
    StateNotifierProvider<UserControler, UserState>((ref) => UserControler());
