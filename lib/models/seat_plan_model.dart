class SeatPlanModel {
  int? id;
  String? seatNumber;
  bool? isReserved;

  SeatPlanModel({this.id, this.seatNumber, this.isReserved});

  SeatPlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seatNumber'];
    isReserved = json['isReserved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seatNumber'] = this.seatNumber;
    data['isReserved'] = this.isReserved;
    return data;
  }
}