import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/BookingDetails.dart';
import 'package:trainticketapp/View/PassengerDetails.dart';
import 'package:trainticketapp/View/TicketDetails.dart';

class BookingDetails2 extends StatefulWidget {
  const BookingDetails2({super.key});

  @override
  State<BookingDetails2> createState() => _BookingDetails2State();
}

class _BookingDetails2State extends State<BookingDetails2> {
  final HomeController homeController = Get.find<HomeController>();
   bool isPassenger1Selected = false;
  bool isPassenger2Selected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// 🔹 Background
          Column(
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
                      // ✅ Back button using GetX
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
                          padding: const EdgeInsets.only(top: 82),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                 Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: Row(children: [Text("Contect Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)],),
                                                 ) ,
                                                 SizedBox(height: 5,),
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
                                      SizedBox(height: 7),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Phone Number",
                                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                          Text(homeController.phoneController.text,
                                              style: TextStyle(color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(height: 7),
                                      Obx(() => Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Identity Type",
                                                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                              Text(homeController.identityType.value,
                                                  style: TextStyle(color: Colors.black)),
                                            ],
                                          )),
                                      SizedBox(height: 7),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Identity Number",
                                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                          Text(homeController.identityNumberController.text,
                                              style: TextStyle(color: Colors.black)),
                                        ],
                                      ),
                                     // extra space for button overlap
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 9), 
                                       Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: Row(children: [Text("Payment Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)],),
                                                 ) ,
                                                 SizedBox(height: 5,),
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
                                    SizedBox(height: 4),
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
                               SizedBox(height: 5,),
                               Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: Row(children: [Text("Payment Method", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)],),
                                                 ) ,
                                                 Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade200),
                                color: Colors.white,
                              ),
                              child: Obx(() => DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                       prefixIcon: CircleAvatar(
                                        // radius: 9,
                                        backgroundColor: Colors.green.shade100, 
                                        child: Icon(
                                          Icons.flight,
                                          color: Colors.red,
                                          size: 23,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    value: homeController.selectedPaymentMethod.value.isEmpty
                                        ? null
                                        : homeController.selectedPaymentMethod.value,
                                    hint: Text("BKSH"),
                                    items: homeController.paymentMethods.map((method) {
                                      return DropdownMenuItem(
                                        value: method['code'], 
                                        child: Text(method['code']!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        homeController.selectedPaymentMethod.value = value;
                                      }
                                    },
                                  )),
                            ),
                            
                            
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
             
                    ]),
                     Positioned(
            top: 95,
            left: 16,
            right: 16,
            child:  Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200),
                          color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                                child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Passenger 01",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: homeController.selectedPassengers.contains("Passenger 01")
                ? const Color(0xFF015768)
                : Colors.grey,
          ),
        ),
        Text(
          "Passenger 02",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: homeController.selectedPassengers.contains("Passenger 02")
                ? const Color(0xFF015768)
                : Colors.grey,
          ),
        ),
      ],
    )
                              ),
                              Divider(color: Colors.grey.shade200, thickness: 1,),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17, ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                       onChanged: (val) {
    homeController.passengerName.value = val;  // name save hoga controller me
  },
                                      decoration: InputDecoration(
                                        labelText: "Passenger Name",
                                        labelStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.person_outline, color: Color(0xFF015768),),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                  DropdownButtonFormField<String>(
                                     decoration: InputDecoration(
                                       labelText: "Passenger Type",
                                        labelStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade200)
                                        )
                                    ),
  value: ['Adult', 'Child', 'Infant'].contains(homeController.identityType.value)
      ? homeController.identityType.value
      : null,
  items: ['Adult', 'Child', 'Infant'].map((String type) {
    Icon leadingIcon;
    if (type == 'Adult') {
      leadingIcon = Icon(Icons.person_outline, color: Color(0xFF015768));
    } else if (type == 'Child') {
      leadingIcon = Icon(Icons.child_care_outlined, color: Color(0xFF015768));
    } else {
      leadingIcon = Icon(Icons.baby_changing_station_outlined, color: Color(0xFF015768));
    }

    return DropdownMenuItem<String>(
      value: type,
      child: Row(
        children: [
          leadingIcon,
          SizedBox(width: 8),
          Text(type),
        ],
      ),
    );
  }).toList(),
  onChanged: (value) {
    if (value != null) {
      setState(() {
        selectedPassengerType = value;
        homeController.identityType.value = value; // save to controller
      });
    }
  },
)

                                
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
          ),
          

                     ] ),
                      bottomNavigationBar: Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  color: Colors.white, // background safe
  child: Row(
    children: [
      // Left - White container (PKR + Total Price)
      Expanded(
        flex: 1,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey.shade300),
          ),
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

      // Right - Blue container (Pay Now)
      Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            Get.to(() => TicketDetails());
          },
          splashColor: Colors.transparent, // 👈 shadow/splash remove
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
       ))])) );
                   
        

  }
}
