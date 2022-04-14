class Information {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? reference;
  String? image;

  Information(
      {this.uid,
        this.firstName,
        this.lastName,
        this.phone,
        this.address,
        this.reference,
        this.image});

  Information.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    address = json['address'];
    reference = json['reference'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['reference'] = this.reference;
    data['image'] = this.image;
    return data;
  }
}