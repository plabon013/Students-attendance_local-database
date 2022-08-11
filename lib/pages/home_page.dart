import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:student_attendance/pages/first_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
late Size size;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SplashScreen(
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // backgroundColor: Colors.blueGrey.shade900,
      splash:
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 200,),
            Image.asset('images/App_logo.png',height: 150,width: 150,),
            SizedBox(height: 5,),
            Center(child: Text('Presence Student Attendance',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),)),
            SizedBox(height: 5,),
            Lottie.asset('assets/loading-circles.json',height: 80,width: 80),
          ],
        ),
      ),
      nextScreen: const FirstPage(),
      splashIconSize: size.height ,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(microseconds: 1),
    );
  }
}

