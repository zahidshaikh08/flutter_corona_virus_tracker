class TwitterUser {
  final String userId;
  final String userName;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String mobileNumber;
  final String email;
  final String password;
  final String profileUrl;
  final String createdAt;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String profession;
  final List<String> interests;

  TwitterUser({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.mobileNumber,
    this.email,
    this.password,
    this.profileUrl,
    this.createdAt,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.profession,
    this.interests,
  });

  factory TwitterUser.fromJson(Map<String, dynamic> json) {
    return TwitterUser(
      userId: json['userId'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      password: json['password'],
      profileUrl: json['profileUrl'],
      createdAt: json['createdAt'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      profession: json['profession'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['userId'] = userId;
    json['userName'] = userName;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['dateOfBirth'] = dateOfBirth;
    json['mobileNumber'] = mobileNumber;
    json['email'] = email;
    json['password'] = password;
    json['profileUrl'] = profileUrl;
    json['createdAt'] = createdAt;
    json['address1'] = address1;
    json['address2'] = address2;
    json['city'] = city;
    json['state'] = state;
    json['country'] = country;
    json['postalCode'] = postalCode;
    json['profession'] = profession;
    return json;
  }
}
