import 'package:employee_api/model/employee.dart';
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
  List items = [];

  void _getData() {
    NetworkService.GET(NetworkService.API_GET_ALL, NetworkService.paramsGET())
        .then((response) => {
              logger.i(response),
            });
  }

  void _parsingData() {
    NetworkService.GET(NetworkService.API_GET_ALL, NetworkService.paramsGET())
        .then((response) => {
              logger.i(response),
              setState(() {
                items = NetworkService.parsingResponse(response!);
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parsingData();
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
                _parsingData();
              },
              icon: const Icon(
                Icons.download,
                color: Colors.white,
              ))
        ],
      ),
      body: items.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    return empInfo(items[index]);
                  }),
              onRefresh: () async {
                _parsingData();
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget empInfo(Employee employee) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                employee.employee_name.toString().toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                employee.id.toString().toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Age: ${employee.employee_age.toString().toUpperCase()}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Salary: ${employee.employee_salary.toString().toUpperCase()}\$",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
