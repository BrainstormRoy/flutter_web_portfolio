import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:visiting_webpage/forms/forms1.dart';

import 'package:visiting_webpage/global/widgets/text_widget_1.dart';

import '../global/widgets/navigate_page.dart';

class SingleForm extends StatefulWidget {
  const SingleForm({super.key});

  @override
  State<SingleForm> createState() => _SingleFormState();
}

class _SingleFormState extends State<SingleForm> {
  final TextEditingController username = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController youtubeId = TextEditingController();

  // ! ------------------------- API call -------------------------

  // Future usernameValidation(user) async {
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://flutterportfolio.kyptronixllp.co.in/getData/valid_username.php?username=$user'),
  //   );

  //   if (response.statusCode == 200) {
  //   } else if (response.statusCode == 201) {
  //   } else {}
  // }
  // ! ------------------------- API call -------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload Data',
            style: GoogleFonts.poppins(fontSize: 24.0),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              VerifyUsername(title: 'Username', controller: username),
              TextWidget(title: 'Name', controller: name),
              TextWidget(title: 'Designation', controller: designation),
              TextWidget(title: 'Location', controller: location),
              TextWidget(title: 'Bio', controller: about),
              TextWidget(title: 'Youtube ID', controller: youtubeId),
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
                      if (username.text.isNotEmpty &&
                          name.text.isNotEmpty &&
                          designation.text.isNotEmpty &&
                          location.text.isNotEmpty &&
                          about.text.isNotEmpty &&
                          youtubeId.text.isNotEmpty) {
                        navigateToPage(
                          context,
                          MyPhone(
                            username: username.text,
                            name: name.text,
                            designation: designation.text,
                            location: location.text,
                            about: about.text,
                            youtubeId: youtubeId.text,
                          ),
                        );
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Please complete all fields!'),
                          duration: const Duration(
                              seconds: 3), // Adjust the duration as needed
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              // Code to execute when the user taps the "Close" action
                            },
                          ),
                        );

                        // Display the SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextWidget1(
              text: title,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12.0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyUsername extends StatefulWidget {
  const VerifyUsername({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;

  @override
  State<VerifyUsername> createState() => _VerifyUsernameState();
}

class _VerifyUsernameState extends State<VerifyUsername> {
  bool isInvisible = false;
  bool isAvailable = true;
  // ! ------------------------- API call -------------------------

  Future usernameValidation(user) async {
    final response = await http.get(
      Uri.parse(
          'https://flutterportfolio.kyptronixllp.co.in/getData/valid_username.php?username=$user'),
    );

    if (response.statusCode == 200) {
      setState(() {
        isInvisible = true;
        isAvailable = true;
      });
    } else if (response.statusCode == 201) {
      setState(() {
        isInvisible = true;
        isAvailable = false;
      });
    } else {
      setState(() {
        isInvisible = true;
        isAvailable = false;
      });
    }
  }

  // ! ------------------------- API call -------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextWidget1(
              text: widget.title,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: TextField(
                controller: widget.controller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12.0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (text) async {
                  await usernameValidation(widget.controller.text);
                },
              ),
            ),
          ),
          isInvisible
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget1(
                      text: isAvailable
                          ? 'Username is available'
                          : 'Username is taken!',
                      fontSize: 8,
                      fontColor: isAvailable
                          ? const Color.fromARGB(255, 68, 225, 73)
                          : const Color.fromARGB(255, 223, 47, 47),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
