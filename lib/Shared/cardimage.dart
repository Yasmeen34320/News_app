import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/data.dart';

class Card_image extends StatelessWidget {
  final int? index;
  const Card_image({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width,
      height: screensize.height * (240 / 812),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                '${im[index!]}',
                fit: BoxFit.cover,
                width: screensize.width,

                //  width: double.infinity,
                //height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text('by Ryan Browne',
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      )),
                  Text("${title[index!]}",
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      )),
                  Spacer(),
                  Text("${bottom[index!]}",
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
