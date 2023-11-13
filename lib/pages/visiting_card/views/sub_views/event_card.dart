import 'package:flutter/material.dart';
import 'package:visiting_webpage/global/resources/dynamic_colors.dart';
import 'package:visiting_webpage/global/widgets/text_widget_1.dart';

class EventCard extends StatelessWidget {
  final String instituteName, degree, year, grade, studyField;
  final IconData iconData;

  const EventCard({
    super.key,
    required this.instituteName,
    required this.degree,
    required this.year,
    required this.grade,
    required this.studyField,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    // ! font color
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    Color currentFontColor = bodyText(currentBrightness);

    Color accentColor = Colors.orange.shade600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.0,
                child: Icon(
                  iconData,
                  color: accentColor,
                ),
              ),
              const SizedBox(width: 20.0),
              TextWidget1(
                text: instituteName,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontColor: currentFontColor,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              TextWidget1(
                text: degree,
                fontSize: 16.0,
                fontColor: currentFontColor,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              TextWidget1(
                text: year,
                fontSize: 16.0,
                fontColor: currentFontColor,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              TextWidget1(
                text: grade,
                fontSize: 16.0,
                fontColor: currentFontColor,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              TextWidget1(
                text: studyField,
                fontSize: 16.0,
                fontColor: currentFontColor,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
