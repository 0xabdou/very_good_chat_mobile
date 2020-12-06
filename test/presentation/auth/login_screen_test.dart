import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';

import '../widget_wrappers.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  AuthCubit mockCubit;

  setUp(() {
    mockCubit = MockAuthCubit();
    when(mockCubit.state).thenReturn(const AuthState.loggedOut());
  });

  Widget _provideCubit(Widget widget) {
    return BlocProvider(
      create: (_) => mockCubit,
      child: wrapInMaterialApp(widget),
    );
  }

  testWidgets(
    'LoginScreen should contain an Image and a LoginButton',
    (tester) async {
      // act
      await tester.pumpWidget(_provideCubit(LoginScreen()));
      // assert
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(LoginButton), findsOneWidget);
    },
  );

  testWidgets(
    'LoginButton should contain text and no spinner '
    'if loggingIn is false',
    (tester) async {
      // arrange
      final widget = wrapInMaterialApp(
        wrapInMaterial(LoginButton(
          loggingIn: false,
          onPressed: () {},
        )),
      );
      // render
      await tester.pumpWidget(widget);
      // assert
      final textFinder = find.text('Login with Google');
      final visibleTextFinder = find.ancestor(
        of: textFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Opacity && widget.opacity == 1,
        ),
      );
      final spinnerFinder = find.byType(SpinKitThreeBounce);
      final invisibleSpinnerFinder = find.ancestor(
        of: spinnerFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Opacity && widget.opacity == 0,
        ),
      );
      expect(visibleTextFinder, findsOneWidget);
      expect(invisibleSpinnerFinder, findsOneWidget);
    },
  );

  testWidgets(
    'LoginButton should contain no text and a spinner '
    'if loggingIn is true ',
    (tester) async {
      // arrange
      final widget = wrapInMaterialApp(
        wrapInMaterial(
          LoginButton(
            loggingIn: true,
            onPressed: () {},
          ),
        ),
      );
      // render
      await tester.pumpWidget(widget);
      // assert
      final textFinder = find.text('Login with Google');
      final invisibleTextFinder = find.ancestor(
        of: textFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Opacity && widget.opacity == 0,
        ),
      );
      final spinnerFinder = find.byType(SpinKitThreeBounce);
      final visibleSpinnerFinder = find.ancestor(
        of: spinnerFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Opacity && widget.opacity == 1,
        ),
      );
      expect(invisibleTextFinder, findsOneWidget);
      expect(visibleSpinnerFinder, findsOneWidget);
    },
  );
}
