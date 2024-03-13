class EmployeeResponse {
  String? status;
  List<Employee>? data;
  String? message;

  EmployeeResponse(
      {required this.status, required this.data, required this.message});

  EmployeeResponse.fromJson(Map<String, dynamic> map)
      : status = map['status'],
        data =
            List<Employee>.from(map['data'].map((e) => Employee.fromJson(e))),
        message = map['message'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': List<Employee>.from(data!.map((e) => e.toJson())),
        'message': message,
      };
}

class Employee {
  int? id;
  String? employee_name;
  int? employee_salary;
  int? employee_age;
  String? profile_image;

  Employee({
    required this.id,
    required this.employee_name,
    required this.employee_salary,
    required this.employee_age,
    required this.profile_image,
  });

  Employee.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        employee_name = map['employee_name'],
        employee_salary = map['employee_salary'],
        employee_age = map['employee_age'],
        profile_image = map['profile_image'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'employee_name': employee_name,
        'employee_salary': employee_salary,
        'employee_age': employee_age.toString(),
        'profile_image': profile_image,
      };
}
