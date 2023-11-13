// TODO: no longer using
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global/resources/dynamic_colors.dart';

class ContactSocial extends StatefulWidget {
  const ContactSocial({
    super.key,
    required this.title,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.label1,
    required this.label2,
    required this.label3,
  });
  final Widget icon1, icon2, icon3;
  final String title, value1, value2, value3, label1, label2, label3;

  @override
  State<ContactSocial> createState() => _ContactSocialState();
}

class _ContactSocialState extends State<ContactSocial> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.roboto(
            color: bodyText(currentBrightness),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(12.0),
        // email // skype
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // phone
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: widget.icon1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+91 9999888822',
                        style: GoogleFonts.lato(
                          color: bodyText(currentBrightness),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Phone',
                        style: GoogleFonts.roboto(
                          color: bodyText(currentBrightness),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(12.0),
              // email
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: widget.icon2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.value2,
                        style: GoogleFonts.lato(
                          color: bodyText(currentBrightness),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.label2,
                        style: GoogleFonts.roboto(
                          color: bodyText(currentBrightness),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(12.0),
        // skype
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: widget.icon3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.value3,
                  style: GoogleFonts.lato(
                    color: bodyText(currentBrightness),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.label3,
                  style: GoogleFonts.roboto(
                    color: bodyText(currentBrightness),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
