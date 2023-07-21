import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/data.dart';
import '../Shared/cardimage.dart';
import 'detailed_screen.dart';

class openning_screen extends StatelessWidget {
  const openning_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: screensize.width * (296 / 375),
                    height: screensize.height * (42 / 812),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        /*contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),*/
                        //    enabled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 197, 194, 194)),
                        ),
                        labelText: 'Dogecoin to the Moon...',
                        labelStyle: GoogleFonts.nunito(
                          fontSize: 12,
                          //fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 197, 194, 194),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          color: Color.fromARGB(255, 197, 194, 194),
                          iconSize: 18,
                          onPressed: () {},
                        ),
                      ),
                    ),

                    /*TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Dogecoin to the Moon...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          /*labelStyle: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            //s  color: Color(0xFF818181),
                          ),*/
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: Color(0xFF818181),
                            iconSize: 20,
                            onPressed: () {},
                          )),
                    ),*/
                  ),
                  Container(
                    width: screensize.width * (42 / 375),
                    height: screensize.height * (43 / 812),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                          0xFFFF3A44), // Replace with your desired background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'lib/assets/Group 38.svg',
                        semanticsLabel: 'My SVG Image',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest News",
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      )),
                  Row(
                    children: [
                      Text("See All",
                          style: GoogleFonts.nunito(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0080FF),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailed_screen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'lib/assets/Combined Shape.svg',
                          semanticsLabel: 'My SVG Image',
                          width: 17,
                          height: 17,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(children: [
                  for (int i = 0; i < im.length; i++)
                    Card_image(
                      index: i,
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
