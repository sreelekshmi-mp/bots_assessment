import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/models/users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';

main() {
  AppServiceMock serviceMock;
  AppBloc appBloc;
  UsersResponse response;

  setUp(() {
    serviceMock = AppServiceMock();
    appBloc = AppBloc(service: serviceMock);
    response = UsersResponse.fromJson(exampleJsonResponse, exampleJsonResponse["results"]);
  });

  tearDown(() {
    appBloc?.close();
  });

  test('close does not emit new app state', () {
    appBloc.close();

    expectLater(
      appBloc,
      emitsInOrder([AppEmpty(), emitsDone]),
    );
  });

  group('AppState', () {
    test('AppEmpty : initialState', () {
      expect(appBloc.initialState, AppEmpty());
    });

    test('AppError', () {
      when(serviceMock.loadUsers()).thenThrow(Error);

      final expectedResponse = [
        AppEmpty(),
        AppLoading(),
        AppError(),
      ];

      appBloc.add(FetchEvent());

      expectLater(
        appBloc,
        emitsInOrder(expectedResponse),
      );
    });

    test('AppLoaded', () {
      when(serviceMock.loadUsers()).thenAnswer((_) => Future.value(response));
      final expectedResponse = [
        AppEmpty(),
        AppLoading(),
        AppLoaded(response: response),
      ];

      appBloc.add(FetchEvent());

      expectLater(
        appBloc,
        emitsInOrder(expectedResponse),
      );
    });
  });
}