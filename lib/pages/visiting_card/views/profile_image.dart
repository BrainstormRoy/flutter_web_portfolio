import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
    required this.name,
    required this.designation,
    required this.location,
  });

  final String name, designation, location;
  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    // Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with your image URL
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Gap(MediaQuery.sizeOf(context).width * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: const Color(0xffFF671B),
                  ),
                ),
                Text(
                  '${widget.designation}, ${widget.location}',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Colors.black45,
                  ),
                ),
                const Gap(10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
