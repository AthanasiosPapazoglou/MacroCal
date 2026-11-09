import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Stubs a mocked [cubit] to start at a given state and [emit] later ones.
class CubitStub<S> {
  new(this.cubit, S initial) {
    when(() => cubit.state).thenReturn(initial);
    when(() => cubit.stream).thenAnswer((_) => _states.stream);
    when(cubit.close).thenAnswer((_) async {});
    addTearDown(_states.close);
  }

  final BlocBase<S> cubit;
  final _states = StreamController<S>.broadcast();

  void emit(S state) {
    when(() => cubit.state).thenReturn(state);
    _states.add(state);
  }
}
