class EmployeeModel {
  String empID;
  String fullName;
  Designation designation;
  Null sortOrder;
  String email;
  String phone;
  int employementStatus;
  int zoneId;

  EmployeeModel(
      {this.empID,
        this.fullName,
        this.designation,
        this.sortOrder,
        this.email,
        this.phone,
        this.employementStatus,
        this.zoneId});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    empID = json['empID'];
    fullName = json['fullName'];
    designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
    sortOrder = json['sortOrder'];
    email = json['email'];
    phone = json['phone'];
    employementStatus = json['employementStatus'];
    zoneId = json['zoneId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empID'] = this.empID;
    data['fullName'] = this.fullName;
    if (this.designation != null) {
      data['designation'] = this.designation.toJson();
    }
    data['sortOrder'] = this.sortOrder;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['employementStatus'] = this.employementStatus;
    data['zoneId'] = this.zoneId;
    return data;
  }
}

class Designation {
  String name;
  int sortOrder;

  Designation({this.name, this.sortOrder});

  Designation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}
