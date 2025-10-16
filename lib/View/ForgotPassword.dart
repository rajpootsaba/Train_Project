import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/View/VerifyAccount.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
   final formKey = GlobalKey<FormState>();
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
              color: Color(0xFF015768),
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
                    child: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),))
              ],
            ),
            
            
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        
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
      vertical: 10, 
      // horizontal: 12,
    ),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Enter Your Email";
                            }else if(!value.contains("@")){
                              return "Email Must Containen @";
                            }
                          },
                        ),
                     
                        
                      
                        SizedBox(height: 25,),
                        InkWell(
                          onTap: () {
                            Get.to(()=>VerifyAccount());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF015768)
                            ),
                            child: Center(child: Text("Send Code", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                          ),
                        ),
                       
                       
                        SizedBox(height: 25,),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: "Go Back to ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                  TextSpan(text: "Login", style: TextStyle(color: Color(0xFF015768), fontWeight: FontWeight.bold)),
                                ]
                              ))
                            ],
                          ),
                        )

                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            )
        ],
      ),
    );
  }
}