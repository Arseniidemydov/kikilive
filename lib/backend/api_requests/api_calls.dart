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
            'Basic NzU0N2JhYTgtMTk0NC00MzM0LThlYWUtMDBhNDUzNzE3N2QwOlNadEo5WmRLMEN3YXRnMGVOY3hxYndSdnhHbTFHaDNMS241Q0JRTzVHbHY2dHZmVUhrdEhQUDg5RUxtbDJzZXhETWFVTk00em4rKw==',
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
            'Basic NzU0N2JhYTgtMTk0NC00MzM0LThlYWUtMDBhNDUzNzE3N2QwOlNadEo5WmRLMEN3YXRnMGVOY3hxYndSdnhHbTFHaDNMS241Q0JRTzVHbHY2dHZmVUhrdEhQUDg5RUxtbDJzZXhETWFVTk00em4rKw==',
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
            'Basic NzU0N2JhYTgtMTk0NC00MzM0LThlYWUtMDBhNDUzNzE3N2QwOlNadEo5WmRLMEN3YXRnMGVOY3hxYndSdnhHbTFHaDNMS241Q0JRTzVHbHY2dHZmVUhrdEhQUDg5RUxtbDJzZXhETWFVTk00em4rKw==',
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

class GetSatoshiCall {
  static Future<ApiCallResponse> call({
    String? id = 'Qwsogvtv82FCd',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSatoshi',
      apiUrl: 'https://api.coinranking.com/v2/coin/${id}/price',
      callType: ApiCallType.GET,
      headers: {
        'x-access-token':
            'coinrankingbbb176fbdfb22bda8a5c1f8674b99091ac934d3f46895f8d',
      },
      params: {
        'referenceCurrencyUuid': "mUE4V6DHMdbT",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic priceTHB(dynamic response) => getJsonField(
        response,
        r'''$.data.price''',
      );
}

class GetSatoshiCopyCall {
  static Future<ApiCallResponse> call({
    String? id = 'Qwsogvtv82FCd',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSatoshi Copy',
      apiUrl: 'https://api.coinranking.com/v2/reference-currencies',
      callType: ApiCallType.GET,
      headers: {
        'x-access-token':
            'coinrankingbbb176fbdfb22bda8a5c1f8674b99091ac934d3f46895f8d',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data.coin.price''',
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
