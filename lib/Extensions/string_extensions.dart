import 'package:flutter/foundation.dart';

extension StringExtensions on String{
  String asProxyString() {
    if(kDebugMode){
      return "https://dev.fedodo.social/proxy?url=${Uri.encodeQueryComponent(this)}";
    }else{
      return "https://${Uri.base.authority.replaceAll("home.", "")}/proxy?url=${Uri.encodeQueryComponent(this)}";
    }
  }
}