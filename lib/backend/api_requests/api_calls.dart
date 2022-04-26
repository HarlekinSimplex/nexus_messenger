import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class NexsusServerGetCall {
  static Future<ApiCallResponse> call({
    String serverLink = 'https://nexus.deltamatrix.org:8243',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NexsusServerGet',
      apiUrl: '${serverLink}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.msg''',
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.time''',
      );
}

class NexusServerPostCall {
  static Future<ApiCallResponse> call({
    String postBody =
        '{\"time\": \"2022-03-09 03:42:00\", \"msg\": \"Hello World from Flutter Flow\", \"id\": 164647256425086\", \"msgv\": \"4.2\"}',
    String serverLink = 'https://nexus.deltamatrix.org:8243',
  }) {
    final body = '''
${postBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NexusServerPost',
      apiUrl: '${serverLink}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'PostBody': postBody,
      },
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
    );
  }
}
