class Crypto {
  int id;
  String uid;
  String coinName;
  String acronym;
  String logo;

  Crypto({this.id, this.uid, this.coinName, this.acronym, this.logo});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    coinName = json['coin_name'];
    acronym = json['acronym'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['coin_name'] = this.coinName;
    data['acronym'] = this.acronym;
    data['logo'] = this.logo;
    return data;
  }
}
