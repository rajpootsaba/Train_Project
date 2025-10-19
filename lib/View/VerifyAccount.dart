import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/View/HomeScreen.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(37), topRight: Radius.circular(37)),
              color: Color(0xFF015768)
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 25,
                  
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle
                    ),
                    child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back, color: Colors.white,)))),
                  Positioned(
                    bottom: 18,
                    left: 20,
                    child: Text("Verify Your Account", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),))
              ],
            ),),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade200)
                          ),
                          child: Center(child: Text('6', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(width: 17,),
                         Container(
                           height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade200)
                          ),
                          child: Center(child: Text('2', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(width: 17,),
                         Container(
                            height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade200)
                          ),
                          child: Center(
                            child: Container(
                               height: 15,
                            width: 1,
                              
                              decoration: BoxDecoration(
                              color: Color(0xFF015768)
                            ),),
                          )
                        ),
                        SizedBox(width: 17,),
                         Container(
                             height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade200)
                          ),
                          child: Center(child: Text('', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                        ),
                       

                      ],),
                      SizedBox(height: 25,),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "Re-send Code in ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                TextSpan(text: "40 ", style: TextStyle(color: Color(0xFF015768), fontWeight: FontWeight.bold)),
                                 TextSpan(text: "Seconds", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]
                            ))
                          ],
                        ),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: () {
                          Get.to(()=> HomeScreen());
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF015768)
                          ),
                          child: Center(child: Text("Verify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                        ),
                      ),],
                  ),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}