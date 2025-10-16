import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/View/AccountCreate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  toNextScreen(){
    Future.delayed(Duration(seconds: 5),(){
      Get.to(()=>AccountCreate());
      }
    );
  }
  @override void initState() {
    // TODO: implement initState
    super.initState();
    toNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "T", style: TextStyle(color: Color(0xFFF88A29)
        ),
                  
                ),
                TextSpan(
                  text: 'icket', style:  TextStyle(color: Color(0xFF015768))
                )
              ]
            )),
            Text("Book your train ticket", style: TextStyle(color: Colors.black, fontSize: 18),)
          ],
        ),
      ),
    );
  }
}