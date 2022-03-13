import 'package:ecommerce_app/models/person.dart';

class UserInformation {
  bool? resp;
  String? msj;
  Person? person;

  UserInformation({this.resp, this.msj, this.person});

  UserInformation.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['information'] != null) {
      person = Person.fromJson(json['information']);
    } else {
      person = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (person != null) {
      data['information'] = person!.toJson();
    }
    return data;
  }
}
