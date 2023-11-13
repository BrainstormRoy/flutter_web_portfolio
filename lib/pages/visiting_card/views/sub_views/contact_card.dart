import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:visiting_webpage/global/widgets/text_widget_1.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    super.key,
    required this.cardWidth,
    required this.color1,
    required this.color2,
    required this.icon,
    required this.title,
    required this.value1,
    required this.value2,
    required this.text1,
    required this.text2,
  });

  final double cardWidth;
  final Color color1, color2;
  final Icon icon;
  final String title, value1, value2, text1, text2;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            widget.color1,
            widget.color2,
          ],
        ),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ! logo
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: widget.icon,
              ),
              const Gap(10.0),

              // ! title
              TextWidget1(
                text: widget.title,
                fontColor: Colors.white,
                fontSize: 16.0,
              ),
              const Gap(7.0),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // ! value 1
                    TextWidget1(
                      text: widget.value1,
                      fontColor: Colors.white70,
                      fontSize: 12.0,
                    ),
                    const Gap(8.0),

                    // ! text 2
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 1.0,
                        ),
                        child: TextWidget1(
                          text: widget.text1,
                          fontColor: Colors.white70,
                          fontSize: 8.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(5.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // ! value 2
                    TextWidget1(
                      text: widget.value2,
                      fontColor: Colors.white70,
                      fontSize: 12.0,
                    ),
                    const Gap(8.0),

                    // ! text 2
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 1.0,
                        ),
                        child: TextWidget1(
                          text: widget.text2,
                          fontColor: Colors.white70,
                          fontSize: 8.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
