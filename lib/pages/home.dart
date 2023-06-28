import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String headline =
    "Vision to Reality: Building Excellence in Every Detail";
const String overview =
    "Vision to Reality: Building Excellence in Every Detail";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff000d16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image(
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            image: const AssetImage('images/house.png'),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: TrapeziumClipper(),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 20 / 28,
              height: MediaQuery.of(context).size.height,
              child: const Column(
                children: [],
              ),
            ),
          ),
        ),
        Image(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: const AssetImage('images/top_layer.png'),
        ),
        Transform.rotate(
          angle: 3.14159,
          child: Opacity(
            opacity: 0.2,
            child: Image(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              image: const AssetImage('images/circuit.png'),
            ),
          ),
        ),
        Image(
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: const AssetImage('images/bottom_layer.png'),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 28,
          top: MediaQuery.of(context).size.height * 4 / 16,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 5 / 16,
                  maxWidth: MediaQuery.of(context).size.width * 16 / 28,
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'VISION TO REALITY:',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFAD2B2B),
                            fontWeight: FontWeight.w300,
                            fontSize: 64,
                            letterSpacing: 2.24,
                          ),
                        ),
                        TextSpan(
                          text: '\nBUILDING EVERY DETAIL WITH EXCELLENCE',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF000D16),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.24,
                            fontSize: 64,
                          ),
                        ),
                      ],
                    ),
                    softWrap: true,
                    minFontSize: 24,
                    maxFontSize: 64,
                    maxLines: 3,


                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width * 22 / 28, size.height);
    path.lineTo(size.width, 0);
    // path.moveTo(size.width , size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
