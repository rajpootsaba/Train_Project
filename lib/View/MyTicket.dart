import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/Utils/CustomBottomBar.dart';
import 'package:trainticketapp/View/HomeScreen.dart';
import 'package:trainticketapp/View/SearchCustomContainer2.dart';
import 'package:trainticketapp/View/TrainInfo.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({super.key});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
      final HomeController homeController = Get.find<HomeController>();
        RxInt selectedIndex = 0.obs; 
        
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Stack(
        children: [Column(
          children: [
             Stack(
                        children: [
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                              color: Color(0xFF015768),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "My Ticket",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                      child: Column(
                                        children: [
                                          Row(
                                            
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Ongoing" ,style: TextStyle(
                                                    color: Colors.white,
                                                   
                                                    fontSize: 16),),
                                              Text("Completed", style: TextStyle(
                                                    color: Colors.white,
                                                    
                                                    fontSize: 16),),
                                              Text("Cancelled", style: TextStyle(
                                                    color: Colors.white,
                                                    
                                                    fontSize: 16),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          Positioned(
                            top: 40,
                            left: 25,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: () => Get.back(), 
                                child: Icon(Icons.arrow_back, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 185),
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Obx(() {
                                            if (homeController.selectedTrain.value == null) {
                                              return const SizedBox();
                                            }
                                            return SearchCustomContainer2(train: homeController.selectedTrain.value!);
                                            
                                          }),
                                          SizedBox(height: 10,),
                                           Obx(() {
                                            if (homeController.selectedTrain.value == null) {
                                              return const SizedBox();
                                            }
                                            return SearchCustomContainer2(train: homeController.selectedTrain.value!);
                                            
                                          }),
                              
                              ],),
                            ),
                          ),
                        ),
                      )
          ],
        ),
         Positioned(
            top: 140,
            left: 16,
            right: 16,
            child: Obx(() {
              if (homeController.selectedTrain.value == null) {
                return const SizedBox();
              }
              return SearchCustomContainer2(train: homeController.selectedTrain.value!);
              
            }),
          ),
      ]),
       bottomNavigationBar: CustomBottomBar(),
    );
  }
}