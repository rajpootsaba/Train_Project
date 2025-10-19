import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/BookingDetails2.dart';
import 'package:trainticketapp/View/PassengerDetails.dart';
import 'package:trainticketapp/View/SearchCustom.dart';
import 'package:trainticketapp/View/SearchCustomContainer2.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
   final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ Column(
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Booking Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                      color: Colors.white,
                      child:Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(children: [Text("Passenger Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)],),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200),
                            color: Colors.white),
                              child: Column(
                              children: [
                               Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [Text("Passenger 01"), Text("Passenger 02")],),
                                ),
                                Divider(color: Colors.grey.shade200, thickness: 1,),
                                SizedBox(height: 11,),
                                Obx(()=>
                                   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                       mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text("Passenger Name",style: TextStyle(color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                            ), Text(homeController.passengerName.value,  style: const TextStyle(
                                              color: Colors.black)),
                                                
                                    ],),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                 Obx(()=>
                                   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                       mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text("Passenger Type",style: TextStyle(color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                            ), Text(homeController.passengerType.value,  style: const TextStyle(
                                              color: Colors.black)),
                                                 
                                    ],),
                                  ),
                                )
                        
                        
                        
                              ],
                            ),
                            ),
                             SizedBox(height: 10,),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(children: [Text("Contect Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)],),
                                             ) ,
                        
                                           Stack(
                          children: [
                       
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade200),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Email Address",
                                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                      Text(homeController.emailController.text,
                                          style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Phone Number",
                                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                      Text(homeController.phoneController.text,
                                          style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Obx(() => Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Identity Type",
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                          Text(homeController.identityType.value,
                        style: TextStyle(color: Colors.black)),
                                        ],
                                      )),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Identity Number",
                                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                      Text(homeController.identityNumberController.text,
                                          style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                 
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                                 ] 
                                 ),
                      ) 
                               )
                             ),
                  ) 
                  ],
        ),
         Positioned(
            top: 95,
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
      bottomNavigationBar: Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  color: Colors.white,
  child: Row(
    children: [
     
      Expanded(
        flex: 1,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "PKR ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${homeController.totalPrice}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Total Price",
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                )),
          ),
        ),
      ),
      SizedBox(width: 8),

      Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            Get.to(() => BookingDetails2());
          },
          splashColor: Colors.transparent, 
          highlightColor: Colors.transparent,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF015768),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Pay Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ],
  ),
),

    );
  }
}