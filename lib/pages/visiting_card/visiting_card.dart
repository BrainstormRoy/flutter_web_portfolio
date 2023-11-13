import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiting_webpage/forms/forms.dart';
import 'package:visiting_webpage/global/widgets/navigate_page.dart';
import 'package:visiting_webpage/model/portfolio_model.dart';
import 'package:visiting_webpage/pages/visiting_card/views/header_image.dart';
import 'package:visiting_webpage/pages/visiting_card/views/home_view.dart';
import 'package:http/http.dart' as http;

import 'views/profile_image.dart';

class VisitingCard extends StatefulWidget {
  const VisitingCard({super.key});

  @override
  State<VisitingCard> createState() => _VisitingCardState();
}

class _VisitingCardState extends State<VisitingCard> {
  // ! get user details
  final user = Get.parameters['user'];
  bool homeClicked = true;
  bool requestClicked = false;
  bool servicesClicked = false;

  List<Portfolio> portfolioData = [];
  late Future<List<Portfolio>> futureVariable;

  Future<List<Portfolio>> getDetails() async {
    final response = await http.get(
      Uri.parse(
          'https://flutterportfolio.kyptronixllp.co.in/getData/getData.php?username=$user'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Portfolio> portfolioJsonData =
          jsonData.map((json) => Portfolio.fromJson(json)).toList();

      setState(() {
        portfolioData = portfolioJsonData;
      });
    }

    return portfolioData;
  }

  @override
  void initState() {
    futureVariable = getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: futureVariable,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: portfolioData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffFF671B), Color(0xff4A1B03)])),
                      child: Padding(
                        // padding: const EdgeInsets.symmetric(vertical: 24.0),
                        padding: MediaQuery.of(context).size.width >= 600
                            ? const EdgeInsets.symmetric(
                                vertical: 24.0) // Desktop width
                            : const EdgeInsets.symmetric(vertical: 0.0),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width >= 600
                                ? MediaQuery.of(context).size.width *
                                    0.65 // Desktop width
                                : MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onBackground,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ! header image and profile image
                                  Stack(
                                    children: [
                                      const HeaderImage(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.32,
                                        ),
                                        child: ProfileImage(
                                          name: portfolioData[index].name,
                                          designation:
                                              portfolioData[index].designation,
                                          location:
                                              portfolioData[index].location,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // const NameDesignation(),
                                  const Gap(30.0),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 12.0,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          // ! home
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              backgroundColor: homeClicked
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .background
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                              elevation: 0,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                homeClicked = true;
                                                requestClicked = false;
                                                servicesClicked = false;
                                              });
                                            },
                                            child: Text(
                                              'Home',
                                              style: GoogleFonts.roboto(
                                                color: homeClicked
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .onBackground
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                              ),
                                            ),
                                          ),
                                          const Gap(10.0),

                                          // ! create yours button
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              backgroundColor: homeClicked
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .background
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                              elevation: 0,
                                            ),
                                            onPressed: () {
                                              navigateToPage(
                                                  context, const SingleForm());
                                            },
                                            child: Text(
                                              'Create your profile',
                                              style: GoogleFonts.roboto(
                                                color: homeClicked
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .onBackground
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                              ),
                                            ),
                                          ),

                                          //  ! request
                                          // ElevatedButton(
                                          //   style: ElevatedButton.styleFrom(
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius:
                                          //           BorderRadius.circular(5.0),
                                          //     ),
                                          //     backgroundColor: requestClicked
                                          //         ? Theme.of(context)
                                          //             .colorScheme
                                          //             .background
                                          //         : Theme.of(context)
                                          //             .colorScheme
                                          //             .onBackground,
                                          //     elevation: 0,
                                          //   ),
                                          //   onPressed: () {
                                          //     setState(() {
                                          //       homeClicked = false;
                                          //       requestClicked = true;
                                          //       servicesClicked = false;
                                          //     });
                                          //   },
                                          //   child: Text(
                                          //     'Request',
                                          //     style: GoogleFonts.roboto(
                                          //       color: requestClicked
                                          //           ? Theme.of(context)
                                          //               .colorScheme
                                          //               .onBackground
                                          //           : Theme.of(context)
                                          //               .colorScheme
                                          //               .background,
                                          //     ),
                                          //   ),
                                          // ),
                                          // const Gap(10.0),

                                          //  ! services
                                          // ElevatedButton(
                                          //   style: ElevatedButton.styleFrom(
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius:
                                          //           BorderRadius.circular(5.0),
                                          //     ),
                                          //     backgroundColor: servicesClicked
                                          //         ? Theme.of(context)
                                          //             .colorScheme
                                          //             .background
                                          //         : Theme.of(context)
                                          //             .colorScheme
                                          //             .onBackground,
                                          //     elevation: 0,
                                          //   ),
                                          //   onPressed: () {
                                          //     setState(() {
                                          //       homeClicked = false;
                                          //       requestClicked = false;
                                          //       servicesClicked = true;
                                          //     });
                                          //   },
                                          //   child: Text(
                                          //     'Services',
                                          //     style: GoogleFonts.roboto(
                                          //       color: servicesClicked
                                          //           ? Theme.of(context)
                                          //               .colorScheme
                                          //               .onBackground
                                          //           : Theme.of(context)
                                          //               .colorScheme
                                          //               .background,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(16.0),
                                  homeClicked
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: HomeView(
                                            aboutUs: portfolioData[index].about,
                                            phoneValue1: portfolioData[index]
                                                .phone[0]
                                                .phoneNo,
                                            phoneValue2: portfolioData[index]
                                                .phone[1]
                                                .phoneNo,
                                            phoneType1: portfolioData[index]
                                                .phone[0]
                                                .phoneType,
                                            phoneType2: portfolioData[index]
                                                .phone[1]
                                                .phoneType,
                                            emailValue1: portfolioData[index]
                                                .email[0]
                                                .emailId,
                                            emailValue2: portfolioData[index]
                                                .email[1]
                                                .emailId,
                                            emailType1: portfolioData[index]
                                                .email[0]
                                                .emailType,
                                            emailType2: portfolioData[index]
                                                .email[1]
                                                .emailType,
                                          ),
                                        )
                                      : requestClicked
                                          ? const Text(
                                              'Request',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          : const Text(
                                              'Services',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Text('Oops something went wrong');
            }
          },
        ),
      ),
    );
  }
}
