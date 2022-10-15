class CompanyInfoModel {
  String? id;
  String? title;
  String? question;
  String? subTitle;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CompanyInfoModel(
      {this.id,
        this.title,
        this.question,
        this.subTitle,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CompanyInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    question = json['question'];
    subTitle = json['sub_title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['question'] = this.question;
    data['sub_title'] = this.subTitle;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}