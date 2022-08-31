class StandDroppingBoardModel {
  String? id;
  String? tripId;
  String? standId;
  String? time;
  String? type;
  String? detail;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  StandDroppingBoardModel(
      {this.id,
        this.tripId,
        this.standId,
        this.time,
        this.type,
        this.detail,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  StandDroppingBoardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    standId = json['stand_id'];
    time = json['time'];
    type = json['type'];
    detail = json['detail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip_id'] = this.tripId;
    data['stand_id'] = this.standId;
    data['time'] = this.time;
    data['type'] = this.type;
    data['detail'] = this.detail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}