class Users {
  static void setString(String newVal) {
    value = newVal;
  }

  static getString() {
    return value;
  }

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
