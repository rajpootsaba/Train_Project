import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/Utils/CustomBottomBar.dart';
import 'package:trainticketapp/View/TrainInfoCustomContainer.dart';

class TrainInfo extends StatefulWidget {
  const TrainInfo({super.key});

  @override
  State<TrainInfo> createState() => _TrainInfoState();
}

class _TrainInfoState extends State<TrainInfo> {
  final HomeController homeController = Get.find<HomeController>();
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
                                          "Train Info",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                                      child: Column(children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            // color: Colors.amber
                                            color: Color(0xFF196676)
        
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Row(
                                            children: [
                                              Icon(Icons.search, color: Colors.white, size: 25,),
                                              SizedBox(width: 10,),
                                              Text("Search Train", style: TextStyle(color: Colors.white, fontSize: 16),)
                                            ],
                                                                                  ),
                                          ),)
                                      ],),
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
                                onTap: () => Get.back(), // reactive back
                                child: Icon(Icons.arrow_back, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // color: Colors.white,
                        child:
                                Expanded(
                                  child: Obx(()=>
                                    ListView.builder(
                                      itemCount: homeController.trainsList.length,
                                      itemBuilder: (context, index) {
                                        final train = homeController.trainsList[index];
                                        return TrainInfoCustomContainer(
                                          name: train.trainName,
                                          toCity: train.toCity,
                                          time: train.getDuratin(),
                                          fare: train.fare,
                                          fromCity: train.fromCity,
                                          date: train.date,
                                     
                                          
                                          
                                        );
                                      },
                                    ),
                                  ),
                                                    )
                      )
                      ]
                      ),
          //             Positioned(
          //   top: 140,
          //   left: 16,
          //   right: 16,
          //   child: Container(
          //                 // color: Colors.white,
          //                 child:
          //                         Expanded(
          //                           child: Obx(()=>
          //                             ListView.builder(
          //                               itemCount: homeController.trainsList.length,
          //                               itemBuilder: (context, index) {
          //                                 final train = homeController.trainsList[index];
          //                                 return TrainInfoCustomContainer(
          //                                   name: train.trainName,
          //                                   toCity: train.toCity,
          //                                   time: train.getDuratin(),
          //                                   fare: train.fare,
          //                                   fromCity: train.fromCity,
          //                                   date: train.date,
                                       
                                            
                                            
          //                                 );
          //                               },
          //                             ),
          //                           ),
          //                                             )
          //               ),
          // ),
     ] ),
                      bottomNavigationBar: CustomBottomBar(),
                    );
                            
                    
        
      
      
    
  }
}