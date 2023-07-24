import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Cubit/cubit/all_news_cubit_cubit.dart';
import '../Data/Reposetries/all_news_repo.dart';
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
            ElevatedButton(
              onPressed: () {
                context.read<AllNewsCubitCubit>().getAllNews();
              },
              child: Text('Get News'),
              style: ElevatedButton.styleFrom(
                //     primary: Colors.green,
                textStyle: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 17,
                    fontStyle: FontStyle.normal),
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
                child: BlocBuilder<AllNewsCubitCubit, AllNewsCubitState>(
                  builder: (context, state) {
                    if (state is AllNewsCubitInitial)
                      return Center(
                        child: Text("press above button to get all news "),
                      );
                    else if (state is AllNewsCubitLoading)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else if (state is AllNewsCubiSuccess)
                      return ListView(children: [
                        for (int i = 0;
                            i < state.ourresponse.articles!.length;
                            i++)
                          if ((state.ourresponse.articles![i].urlToImage) !=
                                  null &&
                              (state.ourresponse.articles![i].author) != null &&
                              (state.ourresponse.articles![i].description) !=
                                  null &&
                              (state.ourresponse.articles![i].title) != null)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailed_screen(
                                        response: state.ourresponse, index: i),
                                  ),
                                );
                              },
                              child: Container(
                                width: screensize.width,
                                height: screensize.height * (240 / 812),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          state.ourresponse.articles![i]
                                              .urlToImage!,
                                          fit: BoxFit.cover,
                                          width: screensize.width,

                                          //  width: double.infinity,
                                          height: 300,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Text(
                                                state.ourresponse.articles![i]
                                                    .author!,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFF),
                                                )),
                                            Text(
                                                state.ourresponse.articles![i]
                                                    .title!,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFF),
                                                )),
                                            Spacer(),
                                            Text(
                                                state.ourresponse.articles![i]
                                                    .description!,
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
                              ),
                            ),
                      ]);
                    else
                      return Center(
                        child: Text("Error"),
                      );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
