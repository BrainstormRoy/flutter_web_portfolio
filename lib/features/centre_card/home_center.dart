import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCenterUi extends StatefulWidget {
  const HomeCenterUi({super.key});

  @override
  State<HomeCenterUi> createState() => _HomeCenterUiState();
}

class _HomeCenterUiState extends State<HomeCenterUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
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
                      height: (MediaQuery.sizeOf(context).height * 0.7) * 0.4,
                      child: Stack(
                        children: [
                          Container(
                            height:
                                (MediaQuery.sizeOf(context).height * 0.7) * 0.5,
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
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                      'John Doe',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      '@johndoe',
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
                        width: (MediaQuery.sizeOf(context).height * 0.7) * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ^ call
                            IconButton(
                              onPressed: () {
                                void launchCall(number) async {
                                  final Uri phoneNumber =
                                      Uri.parse('tel:$number');
                                  launchUrl(phoneNumber);
                                }

                                launchCall('9999888822');
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
                                void launchEmail(email) async {
                                  final Uri email = Uri(
                                    scheme: 'mailto',
                                    path: 'johndoe@gmail.com',
                                    queryParameters: {},
                                  );
                                  launchUrl(email,
                                      mode: LaunchMode.externalApplication);
                                }

                                launchEmail('johndosse@gmail.com');
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
                                  final Uri whatsApp =
                                      Uri.parse('https://wa.me/$number?');
                                  launchUrl(whatsApp,
                                      mode: LaunchMode.externalApplication);
                                }

                                launchWhatsApp(9999888822);
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
                                      mode: LaunchMode.externalApplication);
                                }

                                launchTwitterProfile('irawnewton');
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
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
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
            )),
      ),
    );
  }
}