class UserData {
  //data type
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? lastSeenTime;
  String? avatarURL;
  String? status;

  //constructor
  UserData({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.lastSeenTime,
    this.status,
  });

  //method that assign values to respective data type variables
  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstname = json["first_name"];
    lastname = json["last_name"];
    username = json["username"];
    lastSeenTime = json["last_seen_time"];
    avatarURL = json["avatar"];
    status = json["status"];
  }
}
