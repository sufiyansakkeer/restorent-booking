class ResortsListModal {
  Owner owner;
  String resortName;
  String place;
  Location location;
  String address;
  String zipcode;
  String phoneNumber;
  int roomsAvailable;
  int price;
  String roomType;
  String description;
  bool wifiAvailable;
  bool poolAvailable;
  String imageOne;
  String imageTwo;
  String imageThree;
  String imageFour;
  dynamic mapLocation;
  bool isApproved;
  bool isRejected;
  DateTime createdDate;
  DateTime modifiedDate;

  ResortsListModal({
    required this.owner,
    required this.location,
    required this.resortName,
    this.mapLocation,
    required this.place,
    required this.address,
    required this.zipcode,
    required this.phoneNumber,
    required this.roomType,
    required this.price,
    required this.description,
    required this.roomsAvailable,
    required this.poolAvailable,
    required this.wifiAvailable,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.imageFour,
    required this.isApproved,
    required this.isRejected,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory ResortsListModal.fromJson(Map<String, dynamic> json) =>
      ResortsListModal(
        owner: Owner.fromJson(json["owner"]),
        location: Location.fromJson(json["location"]),
        resortName: json["resort_name"],
        mapLocation: json["map_location"],
        place: json["place"],
        address: json["address"],
        zipcode: json["zipcode"],
        phoneNumber: json["phone_number"],
        roomType: json["room_type"],
        price: json["price"],
        description: json["description"],
        roomsAvailable: json["rooms_available"],
        poolAvailable: json["pool_available"],
        wifiAvailable: json["wifi_available"],
        imageOne: json["image_one"],
        imageTwo: json["image_two"],
        imageThree: json["image_three"],
        imageFour: json["image_four"],
        isApproved: json["is_approved"],
        isRejected: json["is_rejected"],
        createdDate: DateTime.parse(json["created_date"]),
        modifiedDate: DateTime.parse(json["modified_date"]),
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "location": location.toJson(),
        "resort_name": resortName,
        "map_location": mapLocation,
        "place": place,
        "address": address,
        "zipcode": zipcode,
        "phone_number": phoneNumber,
        "room_type": roomType,
        "price": price,
        "description": description,
        "rooms_available": roomsAvailable,
        "pool_available": poolAvailable,
        "wifi_available": wifiAvailable,
        "image_one": imageOne,
        "image_two": imageTwo,
        "image_three": imageThree,
        "image_four": imageFour,
        "is_approved": isApproved,
        "is_rejected": isRejected,
        "created_date": createdDate.toIso8601String(),
        "modified_date": modifiedDate.toIso8601String(),
      };
}

class Location {
  int id;
  String cityName;
  String state;

  Location({
    required this.id,
    required this.cityName,
    required this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        cityName: json["city_name"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
        "state": state,
      };
}

class Owner {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  DateTime dateJoined;
  DateTime lastLogin;
  bool isAdmin;
  bool isStaff;
  bool isActive;
  bool isSuperadmin;

  Owner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.dateJoined,
    required this.lastLogin,
    required this.isAdmin,
    required this.isStaff,
    required this.isActive,
    required this.isSuperadmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        dateJoined: DateTime.parse(json["date_joined"]),
        lastLogin: DateTime.parse(json["last_login"]),
        isAdmin: json["is_admin"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        isSuperadmin: json["is_superadmin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "date_joined": dateJoined.toIso8601String(),
        "last_login": lastLogin.toIso8601String(),
        "is_admin": isAdmin,
        "is_staff": isStaff,
        "is_active": isActive,
        "is_superadmin": isSuperadmin,
      };
}
