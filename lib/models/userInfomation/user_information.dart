import '../Information.dart';

class UserInformation {
  bool? resp;
  String? msj;
  Information? information;

  UserInformation({this.resp, this.msj, this.information});

  UserInformation.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    information = json['information'] != null
        ? Information.fromJson(json['information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (information != null) {
      data['information'] = information!.toJson();
    }
    return data;
  }
}


