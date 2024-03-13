import 'package:employee_api/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class EmployeePage extends StatefulWidget {
  static const String id = "emp_page";

  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  var logger = Logger();

  void getData() {
    NetworkService.GET(NetworkService.API_GET_ALL, NetworkService.paramsGET())
        .then((response) => logger.i(response));
  }

  void parsingData() {
    NetworkService.GET(NetworkService.API_GET_ALL, NetworkService.paramsGET())
        .then((response) => NetworkService.parsingResponse(response!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Employee page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                parsingData();
              },
              icon: const Icon(
                Icons.download,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
