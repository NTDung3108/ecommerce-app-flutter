class Information {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? sex;
  String? image;

  Information(
      {this.uid,
        this.firstName,
        this.lastName,
        this.phone,
        this.address,
        this.sex,
        this.image});

  Information.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    address = json['address'];
    sex = json['sex'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['address'] = address;
    data['reference'] = sex;
    data['image'] = image;
    return data;
  }
}