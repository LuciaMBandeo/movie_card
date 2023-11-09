import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/resources/data_state.dart';

class ApiService {
  final String _apiKey = "83251767fe0a369051de60819f1ef00f";
  Client client;

  ApiService({
    required this.client,
  });

  Future<DataState<Map<String, dynamic>>> fetchMovieList(
    Endpoints chosenEndpoint,
  ) async {
    try {
      final response = await client.get(
        Uri.parse(
          "${Strings.moviesBaseUrl}${chosenEndpoint.endpointName}${Strings.apiKey}$_apiKey",
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          jsonDecode(
            response.body,
          ),
        );
      } else {
        return DataFailure(
          Exception(Strings.errorText),
        );
      }
    } catch (e) {
      return DataFailure(Exception(e));
    }
  }

  Future<DataState<dynamic>> fetchGenresList() async {
    try {
      final response = await client.get(
        Uri.parse(
          "${Strings.genresUrl}${Strings.apiKey}$_apiKey",
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          response.body,
        );
      } else {
        return DataFailure(
          Exception(Strings.errorText),
        );
      }
    } catch (e) {
      return DataFailure(
        Exception(e),
      );
    }
  }
}
