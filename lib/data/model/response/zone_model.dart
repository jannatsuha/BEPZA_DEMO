class ZoneModel {
  int id;
  String zoneName;
  Null zoneNameInBengali;
  String zoneCode;
  int sortOrder;
  int organogramCategoryTypeId;
  String zoneAddress;
  Null zoneAddressInBengali;
  String prefix;
  bool isHeadOffice;
  String zoneCodeForBillingSystem;

  ZoneModel(
      {this.id,
        this.zoneName,
        this.zoneNameInBengali,
        this.zoneCode,
        this.sortOrder,
        this.organogramCategoryTypeId,
        this.zoneAddress,
        this.zoneAddressInBengali,
        this.prefix,
        this.isHeadOffice,
        this.zoneCodeForBillingSystem});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneName = json['zoneName'];
    zoneNameInBengali = json['zoneNameInBengali'];
    zoneCode = json['zoneCode'];
    sortOrder = json['sortOrder'];
    organogramCategoryTypeId = json['organogramCategoryTypeId'];
    zoneAddress = json['zoneAddress'];
    zoneAddressInBengali = json['zoneAddressInBengali'];
    prefix = json['prefix'];
    isHeadOffice = json['isHeadOffice'];
    zoneCodeForBillingSystem = json['zoneCodeForBillingSystem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zoneName'] = this.zoneName;
    data['zoneNameInBengali'] = this.zoneNameInBengali;
    data['zoneCode'] = this.zoneCode;
    data['sortOrder'] = this.sortOrder;
    data['organogramCategoryTypeId'] = this.organogramCategoryTypeId;
    data['zoneAddress'] = this.zoneAddress;
    data['zoneAddressInBengali'] = this.zoneAddressInBengali;
    data['prefix'] = this.prefix;
    data['isHeadOffice'] = this.isHeadOffice;
    data['zoneCodeForBillingSystem'] = this.zoneCodeForBillingSystem;
    return data;
  }
}
