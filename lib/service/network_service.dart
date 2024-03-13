import 'dart:convert';

import 'package:employee_api/model/employee.dart';
import 'package:http/http.dart';

class NetworkService {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> header = {};

  ///APIs
  static String API_GET_ALL = "/api/v1/employees";
  static String API_GET_ONE = "/api/v1/employees/"; // + id;
  static String API_POST = "/api/v1/create";
  static String API_PUT = "/api/v1/update/"; // + id;
  static String API_DELETE = "/api/v1/delete/"; // + id;

  /// request methods
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response =
        await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    Response response =
        await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    Response response = await delete(uri, headers: header);
  }

  static Map<String, String> paramsGET() {
    Map<String, String> params = {};
    return params;
  }

  static paramsPOST({required EmployeeResponse empResponse}) {
    EmployeeResponse employeeResponse = EmployeeResponse(
        status: empResponse.status,
        data: empResponse.data,
        message: empResponse.message);

    return employeeResponse.toJson();
  }

  static paramsPUT({required EmployeeResponse empResponse}) {
    EmployeeResponse employeeResponse = EmployeeResponse(
        status: empResponse.status,
        data: empResponse.data,
        message: empResponse.message);

    return employeeResponse.toJson();
  }

  static Map<String, String> paramsDELETE() {
    Map<String, String> params = {};
    return params;
  }

  static  parsingResponse(String response) {
    dynamic json = jsonDecode(response);
    var data = json.map((e) => EmployeeResponse.fromJson(e));
    return data;
  }
}
