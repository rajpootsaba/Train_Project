import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/View/AccountCreate.dart';
import 'package:trainticketapp/View/ForgotPassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
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
                    child: Text("Welcom Back", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),))
              ],
            ),),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF015768),),
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            contentPadding: EdgeInsets.symmetric(
                            vertical: 10, ),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Enter Your Email";
                            }else if(!value.contains("@")){
                              return "Email Must Containen @";
                            }
                          },
                        ),
                        SizedBox(height: 12,),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined, color: Color(0xFF015768),),
                            suffixIcon: Icon(Icons.visibility_off_outlined, color: Color(0xFF015768),),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.black, fontSize: 16,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            contentPadding: EdgeInsets.symmetric(
                            vertical: 10,),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Enter Your Password";
                            }else if(value.length < 6){
                              return "Password Must Containen at leat 6 digits";
                            }
                          },
                          
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                       width: 20,
                                       decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: Colors.black)
                                    ),
                                  ),
                                   SizedBox(width: 5,),
                                  Text("Remember Me"),
                                ],
                              ),
                              Text("Forgot Password", style: TextStyle(color: Color(0xFF015768), decoration: TextDecoration.underline),)
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            Get.to(()=>ForgotPassword());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF015768)
                            ),
                            child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey.shade100, thickness: 1, endIndent: 10,)),
                            Text("Or Continue with", style: TextStyle(color: Colors.black),),
                            Expanded(child: Divider(color: Colors.grey.shade100, thickness: 1, indent: 10,))

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                               height: 70,
                               width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Image.asset("assets/images/image.png",   fit: BoxFit.contain,),
                              )
                            ),
                            SizedBox(width: 11,),
                            Container(
                              height: 70,
                               width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(17),
                                child: Image.asset("assets/images/facebook.jpeg",   fit: BoxFit.contain,),
                              )
                            ),
                            SizedBox(width: 11,),
                            Container(
                              height: 70,
                               width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(17),
                                child: Image.asset("assets/images/iphone.png",   fit: BoxFit.contain,),
                              )
                            )
                          ],
                        ),
                        SizedBox(height: 18,),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: "Don't Have An Account? ", style: TextStyle(color: Colors.black)),
                                  TextSpan(text: "Create An Account", style: TextStyle(color: Color(0xFF015768))),
                                ]
                              ))
                            ],
                          ),
                        )],
                    ),
                  ),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}