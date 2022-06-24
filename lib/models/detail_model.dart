class Details {
  String? about;
  double? fee;

  Details({this.about, this.fee});

  Details.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['fee'] = this.fee;
    return data;
  }
}
