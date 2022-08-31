class SettingModel {
  String? language;
  String? headerlogo;
  String? favicon;
  String? footerlogo;
  String? logotext;
  String? apptitle;
  String? copyright;
  String? headercolor;
  String? footercolor;
  String? bottomfootercolor;
  String? buttoncolor;
  String? buttoncolorhover;
  String? buttontextcolor;
  String? fontfamely;
  String? taxType;
  String? maxTicket;
  String? country;
  String? timezone;
  String? currencyCountry;
  String? currencyCode;
  String? currencySymbol;

  SettingModel(
      {this.language,
        this.headerlogo,
        this.favicon,
        this.footerlogo,
        this.logotext,
        this.apptitle,
        this.copyright,
        this.headercolor,
        this.footercolor,
        this.bottomfootercolor,
        this.buttoncolor,
        this.buttoncolorhover,
        this.buttontextcolor,
        this.fontfamely,
        this.taxType,
        this.maxTicket,
        this.country,
        this.timezone,
        this.currencyCountry,
        this.currencyCode,
        this.currencySymbol});

  SettingModel.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    headerlogo = json['headerlogo'];
    favicon = json['favicon'];
    footerlogo = json['footerlogo'];
    logotext = json['logotext'];
    apptitle = json['apptitle'];
    copyright = json['copyright'];
    headercolor = json['headercolor'];
    footercolor = json['footercolor'];
    bottomfootercolor = json['bottomfootercolor'];
    buttoncolor = json['buttoncolor'];
    buttoncolorhover = json['buttoncolorhover'];
    buttontextcolor = json['buttontextcolor'];
    fontfamely = json['fontfamely'];
    taxType = json['tax_type'];
    maxTicket = json['max_ticket'];
    country = json['country'];
    timezone = json['timezone'];
    currencyCountry = json['currency_country'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['headerlogo'] = this.headerlogo;
    data['favicon'] = this.favicon;
    data['footerlogo'] = this.footerlogo;
    data['logotext'] = this.logotext;
    data['apptitle'] = this.apptitle;
    data['copyright'] = this.copyright;
    data['headercolor'] = this.headercolor;
    data['footercolor'] = this.footercolor;
    data['bottomfootercolor'] = this.bottomfootercolor;
    data['buttoncolor'] = this.buttoncolor;
    data['buttoncolorhover'] = this.buttoncolorhover;
    data['buttontextcolor'] = this.buttontextcolor;
    data['fontfamely'] = this.fontfamely;
    data['tax_type'] = this.taxType;
    data['max_ticket'] = this.maxTicket;
    data['country'] = this.country;
    data['timezone'] = this.timezone;
    data['currency_country'] = this.currencyCountry;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    return data;
  }
}