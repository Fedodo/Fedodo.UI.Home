import 'package:flutter/foundation.dart';

extension UriExtensions on Uri{
  Uri asProxyUri() {
    if (kDebugMode){
      return Uri.parse("https://dev.fedodo.social/proxy?url=${Uri.encodeQueryComponent(toString())}");
    }else{
      return Uri.parse("https://${Uri.base}/proxy?url=${Uri.encodeQueryComponent(toString())}");
    }
  }
}