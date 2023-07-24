import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:news_app/Screens/openning_screen.dart';

import '../Data/Models/ll_news_model/ll_news_model.dart';

class detailed_screen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final LlNewsModel? response;
  final int? index;
  const detailed_screen({super.key, this.response, this.index});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: SvgPicture.asset("lib/assets/Group.svg"),
      ),
      body: Container(
        width: screensize.width,
        height: screensize.height,
        child: Stack(children: [
          SizedBox(
              width: screensize.width,
              height: screensize.height * (0.6),
              child: Image.network(
                response!.articles![index!].urlToImage!,
                fit: BoxFit.cover,
              )),
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
                          text: response!.articles![index!].title!,
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                        TextSpan(
                          text: response!.articles![index!].content!,
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
              // sigmx : 40 , 40
              //   color: Color(0xFFF5F5F5),
              height: screensize.height * (171 / 812),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(response!.articles![index!].publishedAt!,
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            color: Color(0xFF2E0505),
                          )),
                      Spacer(),
                      Text(response!.articles![index!].title!,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0505),
                          )),
                      Spacer(),
                      Text(
                        "Published by : ${response!.articles![index!].author!}",
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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => openning_screen(),
                  ),
                );
              },
              child: Container(
                width: screensize.width * (52 / 375),
                height: screensize.height * (52 / 812),
                child: SvgPicture.asset("lib/assets/Group 26.svg"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
