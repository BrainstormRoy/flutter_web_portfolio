import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:visiting_webpage/pages/visiting_card/views/sub_views/contact_card.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../global/resources/dynamic_colors.dart';
import 'sub_views/timeline_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.aboutUs,
    required this.phoneValue1,
    required this.phoneValue2,
    required this.phoneType1,
    required this.phoneType2,
    required this.emailValue1,
    required this.emailValue2,
    required this.emailType1,
    required this.emailType2,
  });

  final String aboutUs,
      phoneValue1,
      phoneValue2,
      phoneType1,
      phoneType2,
      emailValue1,
      emailValue2,
      emailType1,
      emailType2;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: YoutubePlayerController.convertUrlToId(
            'https://www.youtube.com/watch?v=on2yz8SN3fg') ??
        '',
    params: const YoutubePlayerParams(
      mute: false,
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! ============================================
        const Gap(12.0),

        // ! ========================== about us ==========================
        Text(
          'About',
          style: GoogleFonts.poppins(
            color: bodyText(currentBrightness),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(8.0),
        Text(
          // 'wannabe parkour athlete\nMaya’s bed🛏🦮\nWatchout My show in youtube Links below\nContact for collab',
          widget.aboutUs,
          style: GoogleFonts.poppins(
            color: bodyText(currentBrightness),
            fontSize: 14.0,
          ),
        ),
        // ! ========================== about us ==========================
        const Gap(12.0),

        const Gap(12.0),
        // ! ========================== youtube video ==========================
        Container(
          color: Colors.amber,
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ),
        // ! ========================== youtube video ==========================
        const Gap(12.0),

        const Gap(12.0),
        // ! ========================== email & phone ==========================
        LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            if (screenWidth < 600) {
              // * mobile view *
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContactPage(
                      cardWidth:
                          // MediaQuery.of(context).size.width >= 600
                          //     ? MediaQuery.sizeOf(context).width *
                          //         0.3 // Desktop width
                          //     :
                          MediaQuery.sizeOf(context).width * 0.9,
                      color1: const Color(0xff192949),
                      color2: const Color(0xff587DD6),
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue.shade400,
                      ),
                      title: 'Phone',
                      value1: widget.phoneValue1,
                      value2: widget.phoneValue2,
                      text1: widget.phoneType1,
                      text2: widget.phoneType2,
                    ),
                    const Gap(8.0),
                    ContactPage(
                      cardWidth:
                          // MediaQuery.of(context).size.width >= 600
                          //     ? MediaQuery.sizeOf(context).width *
                          //         0.3 // Desktop width
                          //     :
                          MediaQuery.sizeOf(context).width * 0.9,
                      color1: const Color.fromARGB(255, 17, 20, 23),
                      color2: const Color(0xff00468B),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue.shade400,
                      ),
                      title: 'Email',
                      value1: widget.emailValue1,
                      value2: widget.emailValue2,
                      text1: widget.emailType1,
                      text2: widget.emailType2,
                    ),
                    // Add more ContactPage widgets as needed
                  ],
                ),
              );
            }

            // * desktop view *
            else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ContactPage(
                      cardWidth: MediaQuery.sizeOf(context).width * 0.3,
                      color1: const Color(0xff192949),
                      color2: const Color(0xff587DD6),
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue.shade400,
                      ),
                      title: 'Phone',
                      value1: widget.phoneValue1,
                      value2: widget.phoneValue2,
                      text1: widget.phoneType1,
                      text2: widget.phoneType2,
                    ),
                    const Gap(12.0),
                    ContactPage(
                      cardWidth: MediaQuery.sizeOf(context).width * 0.3,
                      color1: const Color.fromARGB(255, 17, 20, 23),
                      color2: const Color(0xff00468B),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue.shade400,
                      ),
                      title: 'Email',
                      value1: widget.emailValue1,
                      value2: widget.emailValue2,
                      text1: widget.emailType1,
                      text2: widget.emailType2,
                    ),
                    // Add more ContactPage widgets as needed
                  ],
                ),
              );
            }
          },
        ),
        // ! ========================== email & phone ==========================

        // ! education
        Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 28.0, 12.0, 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // itemCount: education!.length,
              itemCount: 2,
              itemBuilder: (context, index) {
                // ^ Education view

                return CustomTimelineTile(
                  iconData: Icons.school,
                  // isFirst: true,
                  isFirst: (index == 1) ? true : false,
                  // isLast: (index == (education!.length) - 1) ? true : false,
                  isLast: true,
                  isPast: true,
                  // instituteName: education![index].institutionName,
                  instituteName: 'University of Cambridge, USA',
                  degree: 'M.Tech',
                  // year:
                  // '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)} - ${DateFormat('yyyy').format(education![index].endDate)}',
                  year: '2012-2015',
                  grade: 'Grade: 9.5',
                  studyField: 'Computer Science',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
