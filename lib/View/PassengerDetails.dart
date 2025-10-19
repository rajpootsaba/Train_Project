import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/PassengerDetails2.dart';
import 'package:trainticketapp/View/SearchCustom.dart';
import 'package:trainticketapp/View/SearchCustomContainer2.dart';

class PassengerDetails extends StatefulWidget {
 

  const PassengerDetails({super.key,});
   

  @override
  State<PassengerDetails> createState() => _PassengerDetailsState();
}
 
 String selectedPassengerType = 'Adult';

class _PassengerDetailsState extends State<PassengerDetails> {
     final HomeController homeController = Get.find<HomeController>();
      bool isPassenger1Selected = false;
  bool isPassenger2Selected = false;

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
                                "Passenger Details",
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
                   child: Container(child: Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(children: [Text("Passenger Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)],),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 230,
                              width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200),
                              color: Colors.white),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPassenger1Selected = !isPassenger1Selected;
                                    if (isPassenger1Selected) {
                                      homeController.selectedPassengers.add("Passenger 01");
                                    } else {
                                      homeController.selectedPassengers.remove("Passenger 01");
                                    }
                                  });
                                },
                                child: Text(
                                  "Passenger 01",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isPassenger1Selected ? Color(0xFF015768) : Colors.grey,
                                  ),
                                ),
                                                          ),
                                                          GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPassenger2Selected = !isPassenger2Selected;
                                    if (isPassenger2Selected) {
                                      homeController.selectedPassengers.add("Passenger 02");
                                    } else {
                                      homeController.selectedPassengers.remove("Passenger 02");
                                    }
                                  });
                                },
                                child: Text(
                                  "Passenger 02",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isPassenger2Selected ? Color(0xFF015768) : Colors.grey,
                                  ),
                                ),),],)),
                                    Divider(color: Colors.grey.shade200, thickness: 1,),
                                    SizedBox(height: 13,),
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
                                          SizedBox(height: 20,),
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
                                ),);}).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                setState(() {
                                  selectedPassengerType = value;
                                  homeController.identityType.value = value; 
                                });}
                                },)],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(children: [Text("Contect Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)],),
                         ) 
                         ],
                        ),
                      ),
                    ),),
                 ),
                  InkWell(
                  splashColor: Colors.transparent,   
          highlightColor: Colors.transparent, 
          hoverColor: Colors.transparent, 
                onTap: () {
                  Get.to(()=>PassengerDetails2());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF015768),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
          Positioned(
  top: 118,
  left: 16,
  right: 16,
  child: Obx(() {
    if (homeController.selectedTrain.value == null) {
      return const SizedBox();
    }
    return SearchCustomContainer2(train: homeController.selectedTrain.value!);
  }),
),

     ] ),
    );
  }
}


