import 'package:flutter/material.dart';

class ant_bas extends StatelessWidget {
  const ant_bas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFFC3B1F4)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.928,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(color: Color(0xFFFDF6E3)),
            ),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.928,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    style: BorderStyle.solid,
                    color: Colors.black.withOpacity(0.22),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.853,
            top: MediaQuery.of(context).size.height * 0.937,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.056,
              height: MediaQuery.of(context).size.height * 0.041,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/44x35"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.021,
            top: MediaQuery.of(context).size.height * 0.937,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.03,
              height: MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/35x35"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.754,
            top: MediaQuery.of(context).size.height * 0.927,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.width * 0.04,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/39x39"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.569,
            top: MediaQuery.of(context).size.height * 0.407,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.312,
              height: MediaQuery.of(context).size.width * 0.312,
              child: Image.asset("images/1.png", fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.079,
            top: MediaQuery.of(context).size.height * 0.642,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.312,
              height: MediaQuery.of(context).size.width * 0.312,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/122x122"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.569,
            top: MediaQuery.of(context).size.height * 0.642,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.312,
              height: MediaQuery.of(context).size.width * 0.312,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/122x122"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.079,
            top: MediaQuery.of(context).size.height * 0.407,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.312,
              height: MediaQuery.of(context).size.width * 0.312,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/146x146"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.348,
            top: MediaQuery.of(context).size.height * 0.259,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.312,
              height: MediaQuery.of(context).size.width * 0.312,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/146x146"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.021,
            top: MediaQuery.of(context).size.height * 0.603,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.477,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Text(
                'SIRT ANTRENMANI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.033,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.348,
            top: MediaQuery.of(context).size.height * 0.25,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.68,
              child: Text(
                'KARDİYO ANTRENMANI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.033,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.643,
            top: MediaQuery.of(context).size.height * 0.603,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.238,
              height: MediaQuery.of(context).size.height * 0.33,
              child: Text(
                'KARIN KASI ANTRENMANI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.033,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.079,
            top: MediaQuery.of(context).size.height * 0.839,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.285,
              height: MediaQuery.of(context).size.height * 0.027,
              child: Text(
                'BACAK ANTRENMANI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.033,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.569,
            top: MediaQuery.of(context).size.height * 0.889,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.204,
              height: MediaQuery.of(context).size.height * 0.191,
              child: Text(
                'KOL ANTRENMANI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.033,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.152,
            top: MediaQuery.of(context).size.height * 0.076,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.695,
              height: MediaQuery.of(context).size.height * 0.048,
              decoration: ShapeDecoration(
                color: Color(0xFFFDF6E3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.048 / 2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.191,
            top: MediaQuery.of(context).size.height * 0.088,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.618,
              height: MediaQuery.of(context).size.height * 0.91,
              child: Text(
                'Bugün Ne Yapılacak',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.047,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
