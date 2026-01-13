import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  bool _isReAuthenticating = false;
  Completer<void>?
  _reAuthCompleter; // Completer to notify other requests when re-authentication is complete

  DioInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var res = await DioProvider.get("/health");

    if (res.data!["status"] == "ok") {
      print(res.data!["status"]);
    }

    if (err.response != null && err.response!.statusCode == 401) {
      log('unauthorized');
      if (_isReAuthenticating) {
        if (_reAuthCompleter != null) {
          await _reAuthCompleter!.future;
        }
        return super.onError(err, handler);
      }

      _isReAuthenticating = true;
      _reAuthCompleter = Completer<void>();

      // LocalAuth().deleteToken();
      // Navigation.go(navigatorKey.currentContext!, Routes.signInScreen);
      _isReAuthenticating = false;
      _reAuthCompleter?.complete();
    }
    return super.onError(err, handler);
  }
}
