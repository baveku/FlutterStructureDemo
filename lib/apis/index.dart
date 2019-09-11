import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as Client;
import 'package:http/http.dart';

class HTTPClient {
  static final HTTPClient _singleton = new HTTPClient._internal();

  factory HTTPClient() {
    return _singleton;
  }

  HTTPClient._internal();
  static Future<Response> post(String url, Map<String, dynamic> parameter) {
    var headers = Header().normal;
    return Client.post(url,
        headers: headers,
        body: parameter,
        encoding: Encoding.getByName('utf-8'));
  }

  static Future<Response> get(String url) async {
    var headers = Header().normal;
    return await Client.get(url, headers: headers);
  }

  static Future<Response> upload(
      String url, Map<String, dynamic> parameters) async {
    var request = new Client.MultipartRequest('POST', Uri.parse(url));
    final header = Header().normal;
    parameters.forEach((key, value) async {
      if (value is File) {
        var length = await value.length();
        request.files
            .add(new Client.MultipartFile('avatar', value.openRead(), length));
      } else {
        request.fields[key] = value;
      }
    });

    request.fields.addAll(header);

    Client.Response response =
        await Client.Response.fromStream(await request.send());
    print("Result: ${response.body}");
    return json.decode(response.body);
  }
}

class Header {
  static final Header _singleton = new Header._internal();

  Map<String, dynamic> _header = {};

  Map<String, dynamic> get normal => _header;

  Header.write(String key, dynamic value) {
    Header()._header[key] = value;
  }

  factory Header() {
    return _singleton;
  }

  Header._internal();
}
