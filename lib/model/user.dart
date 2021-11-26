class Users {
  String? uid;
  String? local_uid;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? address;
  String? username;
  String? password;

  Users(
      {this.uid,
      this.local_uid,
      this.firstName,
      this.middleName,
      this.lastName,
      this.address,
      this.username,
      this.password});

  static String? value;
}

class UserData {
  final String? uid;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? birthday;
  final String? address;
  final String? contactNum;

  UserData(
      {this.firstname,
      this.middlename,
      this.lastname,
      this.birthday,
      this.address,
      this.contactNum,
      this.uid});
}
