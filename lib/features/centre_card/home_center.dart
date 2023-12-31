import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class HomeCenterUi extends StatefulWidget {
  const HomeCenterUi({super.key});

  @override
  State<HomeCenterUi> createState() => _HomeCenterUiState();
}

class _HomeCenterUiState extends State<HomeCenterUi> {
  final user = Get.parameters['user'];

  Stream<List<Users>> readUsers(String username) => FirebaseFirestore.instance
      .collection('users')
      .where('userName', isEqualTo: username)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<Users>>(
          stream: readUsers(user!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  (MediaQuery.sizeOf(context).height * 0.7) *
                                      0.4,
                              child: Stack(
                                children: [
                                  Container(
                                    height: (MediaQuery.sizeOf(context).height *
                                            0.7) *
                                        0.5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/header1.png'), // Use AssetImage to load an image from assets
                                        fit: BoxFit.cover,
                                      ),
                                      // color: Colors.amber,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    // child: Image.asset('assets/icons/header.png'),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Image.network(
                                        user.dpUrl,
                                        width: 140.0,
                                        height: 140.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Gap(24.0),
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            Text(
                              user.userName,
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade400,
                                fontSize: 14.0,
                                // letterSpacing: 1.0,
                              ),
                            ),
                            const Gap(24.0),

                            /* call, work(call), email, whatsapp, twitter */
                            Card(
                              color: Colors.grey.shade300,
                              child: SizedBox(
                                width:
                                    (MediaQuery.sizeOf(context).height * 0.7) *
                                        0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // ^ call
                                    IconButton(
                                      onPressed: () {
                                        void launchCall(number) async {
                                          final Uri phoneNumber =
                                              Uri.parse('tel:$number');
                                          launchUrl(phoneNumber);
                                        }

                                        launchCall(user.phone);
                                      },
                                      icon: SizedBox(
                                        height: 20.0,
                                        child: Image.asset(
                                          'assets/icons/call.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    // ^ work

                                    // ^ email
                                    IconButton(
                                      onPressed: () {
                                        void launchEmail(String emailId) async {
                                          final Uri email = Uri(
                                            scheme: 'mailto',
                                            path: emailId,
                                            queryParameters: {},
                                          );
                                          launchUrl(email,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }

                                        launchEmail(user.email);
                                      },
                                      icon: SizedBox(
                                        height: 20.0,
                                        child: Image.asset(
                                          'assets/icons/gmail.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    // ^ whatsapp
                                    IconButton(
                                      onPressed: () {
                                        void launchWhatsApp(number) async {
                                          final Uri whatsApp = Uri.parse(
                                              'https://wa.me/$number?');
                                          launchUrl(whatsApp,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }

                                        launchWhatsApp(user.whatsApp);
                                      },
                                      icon: SizedBox(
                                        height: 18.0,
                                        child: Image.asset(
                                          'assets/icons/whatsapp.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    // ^ twitter
                                    IconButton(
                                      onPressed: () {
                                        void launchTwitterProfile(
                                            String username) async {
                                          final Uri twitterProfile = Uri.parse(
                                              'https://twitter.com/$username');
                                          launchUrl(twitterProfile,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }

                                        launchTwitterProfile(user.twitter);
                                      },
                                      icon: SizedBox(
                                        height: 18.0,
                                        child: Image.asset(
                                          'assets/icons/twitter.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(24.0),
                            // ! ====================== bio ======================
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                user.bio,
                                style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontSize: 14.0,

                                  // letterSpacing: 1.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // ! ====================== bio ======================
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Loading state
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
