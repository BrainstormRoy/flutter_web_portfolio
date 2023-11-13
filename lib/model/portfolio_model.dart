// To parse this JSON data, do
//
//     final portfolio = portfolioFromJson(jsonString);

import 'dart:convert';

List<Portfolio> portfolioFromJson(String str) =>
    List<Portfolio>.from(json.decode(str).map((x) => Portfolio.fromJson(x)));

String portfolioToJson(List<Portfolio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Portfolio {
  String username;
  String name;
  String designation;
  String location;
  String about;
  String youtubeId;
  List<Email> email;
  List<Phone> phone;
  List<Education> education;

  Portfolio({
    required this.username,
    required this.name,
    required this.designation,
    required this.location,
    required this.about,
    required this.youtubeId,
    required this.email,
    required this.phone,
    required this.education,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        username: json["username"],
        name: json["name"],
        designation: json["designation"],
        location: json["location"],
        about: json["about"],
        youtubeId: json["youtube_id"],
        email: List<Email>.from(json["email"].map((x) => Email.fromJson(x))),
        phone: List<Phone>.from(json["phone"].map((x) => Phone.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "designation": designation,
        "location": location,
        "about": about,
        "youtube_id": youtubeId,
        "email": List<dynamic>.from(email.map((x) => x.toJson())),
        "phone": List<dynamic>.from(phone.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
      };
}

class Education {
  String id;
  String userUsername;
  String universityName;
  String degree;
  String yearStart;
  String yearEnd;
  String grade;
  String fieldOfStudy;

  Education({
    required this.id,
    required this.userUsername,
    required this.universityName,
    required this.degree,
    required this.yearStart,
    required this.yearEnd,
    required this.grade,
    required this.fieldOfStudy,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        userUsername: json["user_username"],
        universityName: json["university_name"],
        degree: json["degree"],
        yearStart: json["year_start"],
        yearEnd: json["year_end"],
        grade: json["grade"],
        fieldOfStudy: json["Field_of_study"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_username": userUsername,
        "university_name": universityName,
        "degree": degree,
        "year_start": yearStart,
        "year_end": yearEnd,
        "grade": grade,
        "Field_of_study": fieldOfStudy,
      };
}

class Email {
  String emailId;
  String emailType;

  Email({
    required this.emailId,
    required this.emailType,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        emailId: json["email_id"],
        emailType: json["email_type"],
      );

  Map<String, dynamic> toJson() => {
        "email_id": emailId,
        "email_type": emailType,
      };
}

class Phone {
  String phoneNo;
  String phoneType;

  Phone({
    required this.phoneNo,
    required this.phoneType,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        phoneNo: json["phone_no"],
        phoneType: json["phone_type"],
      );

  Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "phone_type": phoneType,
      };
}
