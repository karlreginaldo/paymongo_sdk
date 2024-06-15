import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paymongo_sdk/paymongo_sdk.dart';

///
/// ### 🚧 DO NOT USE SECRET KEY IN PRODUCTION
/// {@template paymonggosdk}
/// Following methods will use secret key
///
/// - [createPayment]
/// Initialize PayMongo SDK.
///
///
/// The code provided is an example of using a secret key
/// ```dart
/// final publicKeyClient = PayMongoSDK(publicKey);
/// final secretKeyClient = PayMongoSDK(secretKey);
/// ```
/// {@endtemplate}

class PayMongoSDK {
  /// {@macro paymonggosdk}
  PayMongoSDK(
    this.secret, {
    this.httpClient,
    String apiUrl = 'api.paymongo.com',
  })  : _apiUrl = apiUrl,
        assert(
          secret.isNotEmpty,
          "API KEY must be provided, go to PayMongo Dashboard",
        );

  /// key generated from paymongo dashboard
  /// you can use `--dart-define` command to store your private key.
  final String secret;
  final String _apiUrl;

  /// custom http. be sure you include your api key to have basic base64
  /// authorization headers.
  final http.BaseClient? httpClient;
  T _request<T>(http.Response response, String path) {
    final json = jsonDecode(response.body);
    final jsonError = json['errors'];
    if (response.statusCode != 200) {
      throw http.ClientException("$jsonError", response.request?.url);
    }
    if (jsonError != null) {
      throw http.ClientException(jsonError.toString(), response.request?.url);
    }
    return json?['data'] as T;
  }

  /// make POST response.
  Future<T> post<T>(PayMongoOptions options) async {
    final httpClient = this.httpClient ?? PayMongoHttp(secret);
    final body = jsonEncode({"data": options.data});
    final response = await httpClient.post(
      Uri.https(_apiUrl, "v1${options.path}", options.params),
      body: body,
    );
    httpClient.close();
    return _request(response, options.path);
  }

  /// make GET response
  Future<T> get<T>(PayMongoOptions options) async {
    final httpClient = this.httpClient ?? PayMongoHttp(secret);
    final uri = Uri.https(_apiUrl, "v1${options.path}", options.params);
    final response = await httpClient.get(uri);
    httpClient.close();
    return _request(response, options.path);
  }
}

/// {@template paymongohttp}
/// Alternative HTTP client. can be extensible for custom http
/// client. use [base64] to generate authorization key.
/// {@endtemplate}
///
class PayMongoHttp extends http.BaseClient {
  /// {@macro paymongohttp}
  PayMongoHttp(this.apiKey);

  /// uses public or secret PayMongo key.
  final String apiKey;
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final client = http.Client();
    final bytes = utf8.encode(apiKey);
    final base64Str = base64.encode(bytes);
    final headers = {
      'Authorization': 'Basic $base64Str',
      'Content-Type': 'application/json',
    };

    request.headers.addAll(headers);
    return client.send(request);
  }
}
