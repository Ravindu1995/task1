import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'signout_event.dart';
part 'signout_state.dart';
class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(SignoutInitial());
  @override
  Stream<SignoutState> mapEventToState(
    SignoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
