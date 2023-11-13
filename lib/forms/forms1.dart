import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiting_webpage/forms/forms.dart';

import '../global/widgets/navigate_page.dart';
import '../global/widgets/text_widget_1.dart';

// !============== MyPhone ==============
class MyPhone extends StatefulWidget {
  const MyPhone({
    super.key,
    required this.username,
    required this.name,
    required this.designation,
    required this.location,
    required this.about,
    required this.youtubeId,
  });

  final String username, name, designation, location, about, youtubeId;

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  final TextEditingController phoneNumber1 = TextEditingController();
  final TextEditingController phoneNumber2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload Contact Data',
            style: GoogleFonts.poppins(fontSize: 24.0),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextWidget(title: 'Primary', controller: phoneNumber1),
              TextWidget(title: 'Business', controller: phoneNumber2),
              const Gap(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (phoneNumber1.text.isNotEmpty &&
                          phoneNumber2.text.isNotEmpty) {
                        navigateToPage(
                          context,
                          MyEmail(
                            username: widget.username,
                            name: widget.name,
                            designation: widget.designation,
                            location: widget.location,
                            about: widget.about,
                            youtubeId: widget.youtubeId,
                            phoneNumber1: phoneNumber1.text,
                            phoneNumber2: phoneNumber2.text,
                          ),
                        );
                      } else {}
                    },
                    child: const TextWidget1(
                      text: 'Next',
                      fontColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// !============== MyPhone ==============

// !============== MyEmail ==============
class MyEmail extends StatefulWidget {
  const MyEmail({
    super.key,
    required this.username,
    required this.name,
    required this.designation,
    required this.location,
    required this.about,
    required this.youtubeId,
    required this.phoneNumber1,
    required this.phoneNumber2,
  });

  final String username,
      name,
      designation,
      location,
      about,
      youtubeId,
      phoneNumber1,
      phoneNumber2;
  @override
  State<MyEmail> createState() => _MyEmailState();
}

class _MyEmailState extends State<MyEmail> {
  final TextEditingController emailId1 = TextEditingController();
  final TextEditingController emailId2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload Contact Data',
            style: GoogleFonts.poppins(fontSize: 24.0),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextWidget(title: 'Primary Email', controller: emailId1),
              TextWidget(title: 'Business Email', controller: emailId2),
              const Gap(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (emailId1.text.isNotEmpty &&
                          emailId2.text.isNotEmpty) {
                        navigateToPage(
                          context,
                          MyEducation(
                            username: widget.username,
                            name: widget.name,
                            designation: widget.designation,
                            location: widget.location,
                            about: widget.about,
                            youtubeId: widget.youtubeId,
                            phoneNumber1: widget.phoneNumber1,
                            phoneNumber2: widget.phoneNumber2,
                            emailId1: emailId1.text,
                            emailId2: emailId2.text,
                          ),
                        );
                      } else {}
                    },
                    child: const TextWidget1(
                      text: 'Next',
                      fontColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// !============== MyEmail ==============

// !============== MyEducation ==============
class MyEducation extends StatefulWidget {
  const MyEducation({
    super.key,
    required this.username,
    required this.name,
    required this.designation,
    required this.location,
    required this.about,
    required this.youtubeId,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.emailId1,
    required this.emailId2,
  });

  final String username,
      name,
      designation,
      location,
      about,
      youtubeId,
      phoneNumber1,
      phoneNumber2,
      emailId1,
      emailId2;

  @override
  State<MyEducation> createState() => _MyEducationState();
}

class _MyEducationState extends State<MyEducation> {
  final TextEditingController universityName = TextEditingController();
  final TextEditingController degree = TextEditingController();
  final TextEditingController yearStart = TextEditingController();
  final TextEditingController yearEnd = TextEditingController();
  final TextEditingController grade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload Education Data',
            style: GoogleFonts.poppins(fontSize: 24.0),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextWidget(title: 'University Name', controller: universityName),
              TextWidget(title: 'Degree', controller: degree),
              TextWidget(title: 'Year Start', controller: yearStart),
              TextWidget(title: 'Year End', controller: yearEnd),
              TextWidget(title: 'Grade', controller: grade),
              const Gap(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (universityName.text.isNotEmpty &&
                          degree.text.isNotEmpty) {
                        navigateToPage(
                          context,
                          MyEducation(
                            username: widget.username,
                            name: widget.name,
                            designation: widget.designation,
                            location: widget.location,
                            about: widget.about,
                            youtubeId: widget.youtubeId,
                            phoneNumber1: widget.phoneNumber1,
                            phoneNumber2: widget.phoneNumber2,
                            emailId1: widget.emailId1,
                            emailId2: widget.emailId2,
                          ),
                        );
                      } else {}
                    },
                    child: const TextWidget1(
                      text: 'Save',
                      fontColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// !============== MyEducation ==============