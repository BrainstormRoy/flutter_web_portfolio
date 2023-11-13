import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/resources/dynamic_colors.dart';

class NameDesignation extends StatefulWidget {
  const NameDesignation({super.key});

  @override
  State<NameDesignation> createState() => _NameDesignationState();
}

class _NameDesignationState extends State<NameDesignation> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 14.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'John Doe',
            style: GoogleFonts.roboto(
              fontSize: 28.0,
              color: headerText(currentBrightness),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(10.0),
          // designation
          Text(
            'Photographer',
            style: GoogleFonts.roboto(
              fontSize: 16.0,
              color: headerText(currentBrightness),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(5.0),
          // location
          Text(
            'Delaware, US',
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
