
class CountryWiseAreaModel {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic uniqueId;

  CountryWiseAreaModel(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.uniqueId});

  CountryWiseAreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    uniqueId = json['uniqueid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['uniqueid'] = this.uniqueId;
    return data;
  }
}



class RequestModel {
  String? leaveTypeId;
  String? leaveType;
  String? leaveDays;

  RequestModel({this.leaveTypeId, this.leaveType, this.leaveDays});

  RequestModel.fromJson(Map<String, dynamic> json) {
    leaveTypeId = json['leave_type_id'];
    leaveType = json['leave_type'];
    leaveDays = json['leave_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leave_type_id'] = this.leaveTypeId;
    data['leave_type'] = this.leaveType;
    data['leave_days'] = this.leaveDays;
    return data;
  }
}