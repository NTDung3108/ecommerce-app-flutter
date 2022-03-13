class Person {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? reference;
  String? image;

  Person(
      {this.uid,
      this.firstName,
      this.lastName,
      this.phone,
      this.address,
      this.reference,
      this.image});

  Person.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    address = json['address'];
    reference = json['reference'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['address'] = address;
    data['reference'] = reference;
    data['image'] = image;
    return data;
  }
}