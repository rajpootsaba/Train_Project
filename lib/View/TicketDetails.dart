import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/MyTicket.dart';
import 'package:trainticketapp/View/SearchCustomContainer2.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key});

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
    final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ticket Details",
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
                              onTap: () => Get.back(), // reactive back
                              child: Icon(Icons.arrow_back, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                   Expanded(
                     child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 145),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade200),
                              color: Colors.white,
                            ),
                            child: Obx(() {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Passenger 01"),
                                      Text(
                                        homeController.passenger1Name.value,   // controller se name
                                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Passenger 02"),
                                      Text(
                                        homeController.passenger2Name.value,   // controller se name
                                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ),
                           SizedBox(height: 11,),
                                                  Container(
                                margin: EdgeInsets.symmetric(horizontal: 17),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Identity Number",
                                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                        Text(homeController.identityNumberController.text,
                                            style: TextStyle(color: Colors.black)),
                                      ],
                                    ),],
                                ),
                              ),
                               SizedBox(height: 11,),
                                                 Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade200),
                                  color: Colors.white,
                                ),
                                                  child: Column(
                                                  children: [
                                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Subtotal", style: TextStyle(  color: Colors.grey)),
                                      Text("PKR ${homeController.subtotal.value.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tax", style: TextStyle(  color: Colors.grey)),
                                      Text("PKR ${homeController.tax.value.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                 Divider(color: Colors.grey.shade200, thickness: 1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total", style: TextStyle( color: Colors.grey)),
                                      Text("PKR ${homeController.totalPrice.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                               ] ),),
                          
                            ],
                          ),
                        ),
                      ),
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
    children: [ Expanded(
        flex: 1,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Text("Cancel", style: TextStyle(color: Colors.red),)
          ),
        ),
      ),

      SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            Get.to(() => MyTicket());
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
          ),))]
       )));
  }
}