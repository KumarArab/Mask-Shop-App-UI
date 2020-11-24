import 'package:MaskShop/mask-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

String randomText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class MaskDetails extends StatelessWidget {
  final MaskModel maskData;

  MaskDetails({this.maskData});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actions: [
            SvgPicture.asset(
              "assets/shopping-bag.svg",
              width: 30,
              height: 30,
            ),
            SizedBox(width: 20),
          ]),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.2,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.topRight,
              child: Icon(
                Icons.more_horiz_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: height * 0.1,
                  left: 20,
                  right: 20,
                ),
                height: height * 0.6,
                width: width,
                decoration: BoxDecoration(
                  color: maskData.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Image.asset(maskData.assetname),
              ),
            ),
            Positioned(top: 20, left: 20, child: LikeButton()),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xfff1e9e9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.07,
                      ),
                      Text(
                        maskData.name,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        randomText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                          height: 1.5,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Similar Products",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Show All",
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: height * 0.12,
                        width: width,
                        child: ListView.builder(
                          itemCount: masks.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: 20,
                              ),
                              width: height * 0.12,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset(masks[i]),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "\$ ${maskData.price}",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: height * 0.08,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Shop Now",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  Color bgColor = Colors.white;
  Color heartColor = Colors.grey;

  void like() {
    setState(() {
      bgColor = bgColor == Colors.white ? Colors.red : Colors.white;
      heartColor = heartColor == Colors.grey ? Colors.white : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: like,
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: 18,
        child: Icon(Icons.favorite_outline, color: heartColor, size: 18),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(40, 0);
    // path.quadraticBezierTo(5, -5, size.width * 0.2, size.height * 0.05);
    path.lineTo(size.width * 0.9, size.height * 0.18);
    path.quadraticBezierTo(
        size.width, size.height * 0.2, size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
