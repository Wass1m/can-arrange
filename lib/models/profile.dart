class Profile {
  final String id;
  // final String avatar;
  final String firstName;
  final String lastName;
  final String country;
  final String province;
  final String type;


  Profile({this.id, this.firstName,this.lastName, this.country, this.province,  this.type});

  factory Profile.fromMap(Map data) => Profile(
    id: data["id"],
    firstName: data["firstName"],
    lastName: data["lastName"],
    country: data["country"],
    province: data["province"],
    type: data["type"],
    // avatar: data["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "type": type,
    "country" : country,
    "province" : province,
  };
}