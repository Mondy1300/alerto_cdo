import 'dart:io';

class Report {
  String? uid;
  String? description;
  String? userid;
  String? imageUrl;
  List? name;
  String? contactnum;
  String? type;
  double? latitude;
  double? longitude;
  String? status;
  String? date_time;

  Report(
      {this.uid,
      this.description,
      this.userid,
      this.contactnum,
      this.imageUrl,
      this.name,
      this.type,
      this.latitude,
      this.longitude,
      this.status,
      this.date_time});
}
