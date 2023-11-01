import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/enums/endpoints.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/datasources/remote/api_service.dart';

class MockClient extends Mock implements Client {}

void main() {
  late Client client;
  late ApiService apiService;

  setUp(() {
    client = MockClient();
    apiService = ApiService(client: client);
    registerFallbackValue(Uri());
  });

  group("The api provider returns a data state depending on the status", () {
    test(
      'When client returns a status ok, api service returns DataSuccess for fetchMovieList',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async =>
              Future.value(Response("{\"status\": \"ok\"}", HttpStatus.ok)),
        );
        final result = await apiService.fetchMovieList(Endpoints.upcoming);
        expect(result, isA<DataSuccess<dynamic>>());
      },
    );

    test(
      'When client returns a status failed, api service returns DataFailed for fetchMovieList',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async =>
              Future.value(Response("Fetch failed", HttpStatus.badGateway)),
        );
        final result = await apiService.fetchMovieList(Endpoints.upcoming);
        expect(result, isA<DataFailure<dynamic>>());
      },
    );

    test(
      'When client returns a status ok, api service returns DataSuccess for fetchGenresList',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async =>
              Future.value(Response("{\"status\": \"ok\"}", HttpStatus.ok)),
        );
        final result = await apiService.fetchGenresList();
        expect(result, isA<DataSuccess<dynamic>>());
      },
    );

    test(
      'When client returns a status failed, api service returns DataFailed for fetchGenresList',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async =>
              Future.value(Response("Fetch failed", HttpStatus.badGateway)),
        );
        final result = await apiService.fetchGenresList();
        expect(result, isA<DataFailure<dynamic>>());
      },
    );
  });
}
