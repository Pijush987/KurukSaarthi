import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kuruk_saarthi/data/network/base_api_services.dart';

import '../exception/app_exception.dart';

class NetworkApiService implements BaseApiServices{
  @override
  Future deleteApi({required String url}) {
    // TODO: implement deleteApi
    throw UnimplementedError();
  }

  @override
  Future getApi({required String url, String? token, Map<String,String>? headers}) async{
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(jsonEncode(url)),headers: headers).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future getApiParams({required String url, queryParams, header}) async{
    if (kDebugMode) {
      log(url);
      log(queryParams.toString());
      log(header.toString());
    }
    dynamic responseJson;
    try {
      Uri requestUrl = Uri.parse(url).replace(queryParameters:queryParams);
      log(requestUrl.toString());
      final response = await http.get(requestUrl,headers: header).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
      log(responseJson.toString());
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future postEncodeApi({required String url, required Map<String,dynamic> data, header}) async{
    if (kDebugMode) {
      print(url);
      print(data);
      print(header);
    }
    dynamic responseJson;
    try {

      final Response response = await http.post(Uri.parse(url), body: jsonEncode(data), headers: header).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future postApi({required String url, required Map<String,dynamic> data, header}) async{
    if (kDebugMode) {
      print(url);
      print(data);
      print(header);
    }
    dynamic responseJson;
    try {

      final Response response = await http.post(Uri.parse(url), body: data, headers: header).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future putApi({required String url, data, header})async {
    if (kDebugMode) {
      print(url);
      print(data);
      print(header);
    }
    dynamic responseJson;
    try {

      final Response response = await http.put(Uri.parse(url), body: data, headers: header).timeout(const Duration(minutes: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server');
    }
  }
}