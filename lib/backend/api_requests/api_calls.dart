import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '\$.data[0].playback_ids[0].id',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/${playbackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzFhM2NlMWMtMDM2Yy00MGQ5LWI3ZmItY2Q4ODg3ODY2MzdmOmk3TDZ3M2x2bGdoa1Q0WGw0bGpjTXVXaDhkR0VGZk9STlNqYVcxRUhBMnBiczk3WlBsb2RjcCtUOVR4RGpXSnBGcEJweWM0aUcrQQ==',
      },
      params: {
        'PLAYBACK_ID': playbackId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic playBackID(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets?live_stream_id=${streamId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzFhM2NlMWMtMDM2Yy00MGQ5LWI3ZmItY2Q4ODg3ODY2MzdmOmk3TDZ3M2x2bGdoa1Q0WGw0bGpjTXVXaDhkR0VGZk9STlNqYVcxRUhBMnBiczk3WlBsb2RjcCtUOVR4RGpXSnBGcEJweWM0aUcrQQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic playbackID(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class GetLiveStreamIdCopyCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '\$.data[0].playback_ids[0].id',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId Copy',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/${playbackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NzFhM2NlMWMtMDM2Yy00MGQ5LWI3ZmItY2Q4ODg3ODY2MzdmOmk3TDZ3M2x2bGdoa1Q0WGw0bGpjTXVXaDhkR0VGZk9STlNqYVcxRUhBMnBiczk3WlBsb2RjcCtUOVR4RGpXSnBGcEJweWM0aUcrQQ==',
      },
      params: {
        'PLAYBACK_ID': playbackId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic playBackID(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
