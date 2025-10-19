import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/BookingDetails.dart';
import 'package:trainticketapp/View/PassengerDetails.dart';

class PassengerDetails2 extends StatefulWidget {
  const PassengerDetails2({super.key});

  @override
  State<PassengerDetails2> createState() => _PassengerDetails2State();
}

class _PassengerDetails2State extends State<PassengerDetails2> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
      body: Stack(
        children: [Column(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: const [
                              Text(
                                "Contact Info",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [TextFormField(
                                  controller: homeController.emailController,
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF015768),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                TextFormField(
                                  controller: homeController.phoneController,
                                  decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    prefixIcon: const Icon(
                                      Icons.phone_outlined,
                                      color: Color(0xFF015768),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                TextFormField(
                                  controller:
                                      homeController.identityNumberController,
                                  decoration: InputDecoration(
                                    labelText: "Identity Number",
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    prefixIcon: const Icon(
                                      Icons.credit_card,
                                      color: Color(0xFF015768),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Obx(() => DropdownButtonFormField<String>(value: homeController.identityTypes.contains(homeController.identityType.value)
                              ? homeController.identityType.value
                              : null,
                               decoration: InputDecoration(
                            labelText: "Identity Type",
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),),
                            items: homeController.identityTypes.map((String type) {
                            Icon leadingIcon;
                            if (type == 'CNIC') {
                              leadingIcon = const Icon(Icons.credit_card, color: Color(0xFF015768));
                            } else if (type == 'Passport') {
                              leadingIcon = const Icon(Icons.account_box_outlined, color: Color(0xFF015768));
                            } else {
                              leadingIcon = const Icon(Icons.description_outlined, color: Color(0xFF015768));
                            }
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Row(
                                children: [
                                  leadingIcon,
                                  const SizedBox(width: 8),
                                  Text(type),
                                ],
                              ),
                            );}).toList(),
                            onChanged: (value) {
                            if (value != null) {
                              homeController.identityType.value = value;
                            } },),),
                            const SizedBox(height: 25),]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               InkWell(
                 splashColor: Colors.transparent,   
  highlightColor: Colors.transparent, 
  hoverColor: Colors.transparent, 
                              onTap: () {
                                Get.to(() => BookingDetails());
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                height: 60,
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF015768),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),],),
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
                                    child: const Icon(Icons.arrow_back, color: Colors.white),
                                  ),
                                ),
                              ),
                                Positioned(
                                  top: 100,
                                  left: 16,
                                  right: 16,
                                  child:  Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200),
                          color: Colors.white),
                          child: Column(
                            children: [
                            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
  child:  
    Padding(
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
  child: Obx(() {
    return Row(
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
    );
  }),
)),
Divider(color: Colors.grey.shade200, thickness: 1,),
                              SizedBox(height: 7,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17, ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                       onChanged: (val) {
    homeController.passengerName.value = val;  },
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
)],),)],),),
          ),
        ],
      ),
    );
  }
}
