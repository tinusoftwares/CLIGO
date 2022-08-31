class OnlinePaymentModel {
  String? secrateId;
  String? clientId;
  String? email;
  String? merchantid;
  String? secrateKey;
  String? privateKey;
  String? environment;

  OnlinePaymentModel(
      {this.secrateId,
        this.clientId,
        this.email,
        this.merchantid,
        this.secrateKey,
        this.privateKey,
        this.environment});

  OnlinePaymentModel.fromJson(Map<String, dynamic> json) {
    secrateId = json['secrate_id'];
    clientId = json['client_id'];
    email = json['email'];
    merchantid = json['merchantid'];
    secrateKey = json['secrate_key'];
    privateKey = json['private_key'];
    environment = json['environment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secrate_id'] = this.secrateId;
    data['client_id'] = this.clientId;
    data['email'] = this.email;
    data['merchantid'] = this.merchantid;
    data['secrate_key'] = this.secrateKey;
    data['private_key'] = this.privateKey;
    data['environment'] = this.environment;
    return data;
  }
}