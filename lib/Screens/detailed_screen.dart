import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class detailed_screen extends StatelessWidget {
  const detailed_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screensize.width,
        height: screensize.height,
        child: Stack(children: [
          SizedBox(
            width: screensize.width,
            height: screensize.height * (0.6),
            child: Image.asset(
              "lib/assets/Rectangle 60.png",
              //    fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 10.0,
                    blurRadius: 10.0,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 88, left: 15, right: 15),
                child: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'LONDON',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                        TextSpan(
                          text:
                              " — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\n\n Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.\n\nAsked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn\’t mean to say people don\’t put value on them, because they can have extrinsic value. But they have no intrinsic value.\n\nBailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority ",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screensize.height * (281 / 812),
            left: screensize.width * (32 / 375),
            right: screensize.width * (32 / 375),
            child: BlurryContainer(
              width: screensize.width * 0.7,
              blur: 50,
              //   color: Color(0xFFF5F5F5),
              height: screensize.height * (171 / 812),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text("Sunday, 9 May 2021",
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            color: Color(0xFF2E0505),
                          )),
                      Spacer(),
                      Text(
                          "Crypto investors should be prepared to lose all their money, BOE governor says",
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0505),
                          )),
                      Spacer(),
                      Text(
                        "Published by Ryan Browne",
                        style: GoogleFonts.nunito(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E0505),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            top: 37,
            left: 25,
            child: Container(
              width: screensize.width * (52 / 375),
              height: screensize.height * (52 / 812),
              child: SvgPicture.asset("lib/assets/Group 26.svg"),
            ),
          ),
        ]),
      ),
    );
  }
}
