class BookingHistoryModel {
  String? id;
  String? bookingId;
  String? tripId;
  String? subtripId;
  String? passangerId;
  String? pickLocationId;
  String? dropLocationId;
  String? pickStandId;
  String? dropStandId;
  String? price;
  String? discount;
  String? totaltax;
  String? paidamount;
  String? offerer;
  String? adult;
  String? chield;
  String? special;
  String? seatnumber;
  String? totalseat;
  String? journeydata;
  String? paymentStatus;
  String? vehicleId;
  String? paymentDetail;
  String? startime;
  String? endtime;
  String? refund;
  String? cancelStatus;
  int? reviewStatus;

  BookingHistoryModel(
      {this.id,
        this.bookingId,
        this.tripId,
        this.subtripId,
        this.passangerId,
        this.pickLocationId,
        this.dropLocationId,
        this.pickStandId,
        this.dropStandId,
        this.price,
        this.discount,
        this.totaltax,
        this.paidamount,
        this.offerer,
        this.adult,
        this.chield,
        this.special,
        this.seatnumber,
        this.totalseat,
        this.journeydata,
        this.paymentStatus,
        this.vehicleId,
        this.paymentDetail,
        this.startime,
        this.endtime,
        this.refund,
        this.cancelStatus,
        this.reviewStatus});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    tripId = json['trip_id'];
    subtripId = json['subtrip_id'];
    passangerId = json['passanger_id'];
    pickLocationId = json['pick_location_id'];
    dropLocationId = json['drop_location_id'];
    pickStandId = json['pick_stand_id'];
    dropStandId = json['drop_stand_id'];
    price = json['price'];
    discount = json['discount'];
    totaltax = json['totaltax'];
    paidamount = json['paidamount'];
    offerer = json['offerer'];
    adult = json['adult'];
    chield = json['chield'];
    special = json['special'];
    seatnumber = json['seatnumber'];
    totalseat = json['totalseat'];
    journeydata = json['journeydata'];
    paymentStatus = json['payment_status'];
    vehicleId = json['vehicle_id'];
    paymentDetail = json['payment_detail'];
    startime = json['startime'];
    endtime = json['endtime'];
    refund = json['refund'];
    cancelStatus = json['cancel_status'];
    reviewStatus = json['review_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['trip_id'] = this.tripId;
    data['subtrip_id'] = this.subtripId;
    data['passanger_id'] = this.passangerId;
    data['pick_location_id'] = this.pickLocationId;
    data['drop_location_id'] = this.dropLocationId;
    data['pick_stand_id'] = this.pickStandId;
    data['drop_stand_id'] = this.dropStandId;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['totaltax'] = this.totaltax;
    data['paidamount'] = this.paidamount;
    data['offerer'] = this.offerer;
    data['adult'] = this.adult;
    data['chield'] = this.chield;
    data['special'] = this.special;
    data['seatnumber'] = this.seatnumber;
    data['totalseat'] = this.totalseat;
    data['journeydata'] = this.journeydata;
    data['payment_status'] = this.paymentStatus;
    data['vehicle_id'] = this.vehicleId;
    data['payment_detail'] = this.paymentDetail;
    data['startime'] = this.startime;
    data['endtime'] = this.endtime;
    data['refund'] = this.refund;
    data['cancel_status'] = this.cancelStatus;
    data['review_status'] = this.reviewStatus;
    return data;
  }
}