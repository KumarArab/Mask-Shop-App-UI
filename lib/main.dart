import 'package:MaskShop/Tabs.dart';
import 'package:MaskShop/mask-details.dart';
import 'package:MaskShop/mask-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SizedBox(width: 24),
                SvgPicture.asset(
                  "assets/menu.svg",
                  width: 35,
                  height: 35,
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/shopping-bag.svg",
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "   Acessories",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Tabs(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                width: double.infinity,
                color: Colors.grey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Professional",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "More",
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    MaskItem(
                                      maskData: profList[0],
                                    ),
                                    MaskItem(
                                      maskData: profList[2],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    MaskItem(
                                      maskData: profList[1],
                                    ),
                                    MaskItem(
                                      maskData: profList[3],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Designer",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "More",
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    MaskItem(
                                      maskData: designerList[0],
                                    ),
                                    MaskItem(
                                      maskData: designerList[2],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    MaskItem(
                                      maskData: designerList[1],
                                    ),
                                    MaskItem(
                                      maskData: designerList[3],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaskItem extends StatelessWidget {
  final MaskModel maskData;

  MaskItem({this.maskData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (ctx) => MaskDetails(
                  maskData: maskData,
                )),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.1,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: maskData.color,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(maskData.assetname),
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: ItemClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    maskData.name,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: LikeButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(5, -5, size.width * 0.2, size.height * 0.05);
    path.lineTo(size.width * 0.9, size.height * 0.4);
    path.quadraticBezierTo(
        size.width, size.height * 0.45, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
