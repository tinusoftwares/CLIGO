class FindTicketListModel {
  String? tripid;
  String? id;
  String? fleetId;
  String? scheduleId;
  String? pickLocationId;
  String? dropLocationId;
  String? vehicleId;
  String? distance;
  String? startdate;
  String? journeyHour;
  String? childSeat;
  String? specialSeat;
  String? adultFair;
  String? childFair;
  String? specialFair;
  String? weekend;
  String? companyName;
  String? stoppage;
  String? facility;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? type;
  String? layout;
  String? lastSeat;
  String? totalSeat;
  String? seatNumber;
  String? luggageService;
  String? startTime;
  String? endTime;
  String? regNo;
  String? engineNo;
  String? modelNo;
  String? chasisNo;
  String? woner;
  String? wonerMobile;
  String? company;
  String? assign;
  String? subtripId;
  String? tripId;
  String? show;
  String? imglocation;
  int? totalreview;
  String? rating;
  int? totalbooking;
  int? availableSeat;

  FindTicketListModel(
      {this.tripid,
        this.id,
        this.fleetId,
        this.scheduleId,
        this.pickLocationId,
        this.dropLocationId,
        this.vehicleId,
        this.distance,
        this.startdate,
        this.journeyHour,
        this.childSeat,
        this.specialSeat,
        this.adultFair,
        this.childFair,
        this.specialFair,
        this.weekend,
        this.companyName,
        this.stoppage,
        this.facility,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.type,
        this.layout,
        this.lastSeat,
        this.totalSeat,
        this.seatNumber,
        this.luggageService,
        this.startTime,
        this.endTime,
        this.regNo,
        this.engineNo,
        this.modelNo,
        this.chasisNo,
        this.woner,
        this.wonerMobile,
        this.company,
        this.assign,
        this.subtripId,
        this.tripId,
        this.show,
        this.imglocation,
        this.totalreview,
        this.rating,
        this.totalbooking,
        this.availableSeat});

  FindTicketListModel.fromJson(Map<String, dynamic> json) {
    tripid = json['tripid'];
    id = json['id'];
    fleetId = json['fleet_id'];
    scheduleId = json['schedule_id'];
    pickLocationId = json['pick_location_id'];
    dropLocationId = json['drop_location_id'];
    vehicleId = json['vehicle_id'];
    distance = json['distance'];
    startdate = json['startdate'];
    journeyHour = json['journey_hour'];
    childSeat = json['child_seat'];
    specialSeat = json['special_seat'];
    adultFair = json['adult_fair'];
    childFair = json['child_fair'];
    specialFair = json['special_fair'];
    weekend = json['weekend'];
    companyName = json['company_name'];
    stoppage = json['stoppage'];
    facility = json['facility'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    type = json['type'];
    layout = json['layout'];
    lastSeat = json['last_seat'];
    totalSeat = json['total_seat'];
    seatNumber = json['seat_number'];
    luggageService = json['luggage_service'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    regNo = json['reg_no'];
    engineNo = json['engine_no'];
    modelNo = json['model_no'];
    chasisNo = json['chasis_no'];
    woner = json['woner'];
    wonerMobile = json['woner_mobile'];
    company = json['company'];
    assign = json['assign'];
    subtripId = json['subtripId'];
    tripId = json['trip_id'];
    show = json['show'];
    imglocation = json['imglocation'];
    totalreview = json['totalreview'];
    rating = json['rating'];
    totalbooking = json['totalbooking'];
    availableSeat = json['available_seat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripid'] = this.tripid;
    data['id'] = this.id;
    data['fleet_id'] = this.fleetId;
    data['schedule_id'] = this.scheduleId;
    data['pick_location_id'] = this.pickLocationId;
    data['drop_location_id'] = this.dropLocationId;
    data['vehicle_id'] = this.vehicleId;
    data['distance'] = this.distance;
    data['startdate'] = this.startdate;
    data['journey_hour'] = this.journeyHour;
    data['child_seat'] = this.childSeat;
    data['special_seat'] = this.specialSeat;
    data['adult_fair'] = this.adultFair;
    data['child_fair'] = this.childFair;
    data['special_fair'] = this.specialFair;
    data['weekend'] = this.weekend;
    data['company_name'] = this.companyName;
    data['stoppage'] = this.stoppage;
    data['facility'] = this.facility;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['type'] = this.type;
    data['layout'] = this.layout;
    data['last_seat'] = this.lastSeat;
    data['total_seat'] = this.totalSeat;
    data['seat_number'] = this.seatNumber;
    data['luggage_service'] = this.luggageService;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['reg_no'] = this.regNo;
    data['engine_no'] = this.engineNo;
    data['model_no'] = this.modelNo;
    data['chasis_no'] = this.chasisNo;
    data['woner'] = this.woner;
    data['woner_mobile'] = this.wonerMobile;
    data['company'] = this.company;
    data['assign'] = this.assign;
    data['subtripId'] = this.subtripId;
    data['trip_id'] = this.tripId;
    data['show'] = this.show;
    data['imglocation'] = this.imglocation;
    data['totalreview'] = this.totalreview;
    data['rating'] = this.rating;
    data['totalbooking'] = this.totalbooking;
    data['available_seat'] = this.availableSeat;
    return data;
  }
}