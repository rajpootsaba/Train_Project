import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/Utils/CustomBottomBar.dart';
import 'package:trainticketapp/Utils/TrainData.dart';

import 'package:trainticketapp/View/CustomContainer.dart';
import 'package:trainticketapp/View/MyTicket.dart';
import 'package:trainticketapp/View/SearchResult.dart';
import 'package:trainticketapp/View/TrainInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  //  final List<Widget> screens = [
   
  //   MyTicket(),
  //   TrainInfo(),
  // ];
   
  String? selectedClass;

  List<String> classOptions = List<String>.from(
    TrainData[0]["classes"] as List, 
  );

  DateTime? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        homeController.Date.text =
            "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }
  //  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (index == 1) {
  //     Get.to(() => MyTicket());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
         resizeToAvoidBottomInset: true,
        body: 
        
        Column(
          children: [
            /// Stack (Blue Header + White Card)
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      /// Blue Header
                      Container(
                        height: 330,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(37),
                            topRight: Radius.circular(37),
                          ),
                          color: Color(0xFF015768),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 35),
                          child: Column(
                            children: [
                              /// Profile Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage('assets/images/person.jpg'),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Good Morning!",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Shaheen Rahman",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
      
                              const SizedBox(height: 20),
      
                              /// Heading
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Let's Book Your\n Next Trip!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
      
                      /// Background white
                      Expanded(child: Container(color: Colors.white,
                      child:  
                               Padding(
                                 padding: const EdgeInsets.only(top: 270),
                                 child: Column(
                                  
                                  
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 15),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: const [
                                           Text(
                                             "Hot News",
                                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                           ),
                                           Text(
                                             "See All",
                                             style: TextStyle(color: Color(0xFF015768),fontWeight: FontWeight.bold, fontSize: 16),
                                           ),
                                         ],
                                       ),
                                     ),
                                       Flexible(
                                        fit: FlexFit.loose,
                                        child: ListView.builder(
                                          itemCount: homeController.trainsList.length,
                                          itemBuilder: (context, index){
                                            var train = homeController.trainsList[index];
                                            return CustomContainer(
                                              trainName: train.trainName,
                                                 trainNo: train.trainNo,
                                                 fromCity: train.fromCity,
                                                 toCity: train.toCity,
                                                 departure: train.departure,
                                                 arrival: train.arrival,
                                                 duration: train.getDuratin(),
                                                  date: train.date, 
                                                  image: train.image,
                                 
                                            
                                            );
                                            
                                        
                                        
                                          }
                                          
                                          ),
                                      ),
                                   ],
                                 ),
                               ),
                               
                             
                                  ),
                      ),
                    ],
                  ),
      
                  /// White Card (Form)
                  Positioned(
                    top: 190,
                    left: 20,
                    right: 20,
                     
                    child: Container(
                      // height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4),
                        child: Form(
                          key: homeController.formKey,
                          child: Column(
                            children: [
                              /// One Way - Round Trip
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                     Obx(() => Row(
        children: [
      ChoiceChip(
        label: Text(
          "One Way",
          style: TextStyle(
            color: homeController.selectedType.value == "One Way"
                ? Colors.white
                : Colors.black,
          ),
        ),
        selected: homeController.selectedType.value == "One Way",
        selectedColor: Color(0xFF015768),
        backgroundColor: Colors.grey[100],
        checkmarkColor: Colors.white,
        onSelected: (val) {
          homeController.setType("One Way");
        },
      ),
      SizedBox(width: 10), // space between chips
      ChoiceChip(
        label: Text(
          "Round Trip",
          style: TextStyle(
            color: homeController.selectedType.value == "Round Trip"
                ? Colors.white
                : Colors.black,
          ),
        ),
        selected: homeController.selectedType.value == "Round Trip",
        selectedColor: Color(0xFF015768),
        backgroundColor: Colors.grey[100],
        checkmarkColor: Colors.white,
        onSelected: (val) {
          homeController.setType("Round Trip");
        },
      ),
        ],
      )
      ),
                          
                                                        
                                  const SizedBox(height: 10),
                                                        
                                 
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  TextFormField(
                                    controller: homeController.From,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.train, color: Color(0xFF015768)),
                                      labelText: "From",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  TextFormField(
                                    controller: homeController.To,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.location_city, color: Color(0xFF015768)),
                                      labelText: "To",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          
                              /// Swap button placed inside Stack
                              Positioned(
                                top: 40,   // adjust as needed
                                right: 22,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF015768),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // swap logic
                                      var temp = homeController.From.text;
                                      homeController.From.text = homeController.To.text;
                                      homeController.To.text = temp;
                                    },
                                    icon: const Icon(Icons.swap_vert, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                                  
                                                        
                                 
                                                        
                                  const SizedBox(height: 11),
                                                        
                                  /// Date Field
                                  TextFormField(
                                    controller: homeController.Date,
                                    readOnly: true,
                                    onTap: () => _pickDate(context),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.calendar_today,
                                          color: Color(0xFF015768)),
                                      labelText: "Departure Date",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ),
                                                        
                                  const SizedBox(height: 11),
                                                        
                                  /// Class Dropdown
                                  DropdownButtonFormField<String>(
                                    value: selectedClass,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.event_seat_outlined,
                                          color: Color(0xFF015768)),
                                      labelText: "Class",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                    items: classOptions
                                        .map(
                                          (cls) => DropdownMenuItem(
                                            value: cls,
                                            child: Text(cls),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedClass = value;
                                        homeController.Class.text = value ?? "";
                                      });
                                    },
                                    validator: (value) => value == null
                                        ? "Please select a class"
                                        : null,
                                  ),
                                                        
                                  const SizedBox(height: 12),
                                                        
                                  /// Search Button
                                  InkWell(
                                    onTap: () {  if (homeController.From.text.isEmpty || homeController.To.text.isEmpty) {
                              Get.snackbar("Error", "Please select both cities");
                              return;
                            }
                                      Get.to(()=>SearchResult(  fromCity: homeController.From.text,
                                toCity: homeController.To.text,
                                date: homeController.Date.text,
                                classes: homeController.Class.text,
                                  type: homeController.selectedType.value,
                                  
                            ));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF015768),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Search Ticket",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                             
                          
                          
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

           
          ],
        ),
          bottomNavigationBar: CustomBottomBar(),
      );
    
  }
}
