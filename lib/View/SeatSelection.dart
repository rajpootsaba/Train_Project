import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/CustomSeatContainer.dart';
import 'package:trainticketapp/View/PassengerDetails.dart';
import 'package:trainticketapp/View/SearchCustom.dart';

class SeatSelection extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String date;
  final String classes;
  final String type;

  SeatSelection({
    super.key,
    required this.fromCity,
    required this.toCity,
    required this.date,
    required this.classes,
    required this.type,
  });

  final HomeController homeController = Get.find<HomeController>();

  /// Legend item widget
  Widget buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black12),
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
                              "Select Your Seat",
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
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 175), // stack container ke neeche space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(() {
                          if (homeController.selectedTrain.value == null) {
                            return const SizedBox();
                          }
                          Color availableColor = Color(0xFFF3F6FF);
                          Color selectedColor = Color(0xFF015768);
                          Color bookedColor = Color(0xFFFF8731);

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildLegendItem(availableColor, "Available"),
                                buildLegendItem(selectedColor, "Selected"),
                                buildLegendItem(bookedColor, "Booked"),
                              ],
                            ),
                          );
                        }),
SizedBox(height: 5,),
Obx(() {
  if (homeController.selectedTrain.value == null) return SizedBox();

  return Container(
    height: 40,
    margin: EdgeInsets.symmetric(vertical: 8),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: homeController.selectedTrain.value!.classes.length,
      itemBuilder: (context, index) {
        String cls = homeController.selectedTrain.value!.classes[index];
        bool isSelected = homeController.selectedClass.value == cls;

        return GestureDetector(
          onTap: () => homeController.setClass(cls),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF015768) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200)
            ),
            child: Center(
              child: Text(
                cls,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}),


                        Expanded(
                          child: Obx(() {
                            if (homeController.selectedTrain.value == null) {
                              return const Center(child: Text("No train selected"));
                            }

                            return GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 12,
                                childAspectRatio: 1.7,
                              ),
                              itemCount: homeController.selectedTrain.value!.seats.length,
                              itemBuilder: (context, index) {
                                var seat = homeController.selectedTrain.value!.seats[index];
                                bool isSelected = homeController.selectedSeats.contains(seat);
                                bool isBooked = homeController.bookedSeats.contains(seat);

                                return CustomSeatContainer(
                                  seat: seat,
                                  isSelected: isSelected,
                                  isBooked: isBooked,
                                  onTap: () {
                                    if (!isBooked) homeController.toggleSeat(seat);
                                  },
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,   // 👈 ripple color hat gaya
  highlightColor: Colors.transparent, // 👈 press effect hat gaya
  hoverColor: Colors.transparent, 
                onTap: () {
                  Get.to(()=>PassengerDetails());
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
                      "Select Your Seat",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Stack container (train info) overlapping blue+white
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: Obx(() {
              if (homeController.selectedTrain.value == null) {
                return const SizedBox();
              }
              return SearchCustomContainer(train: homeController.selectedTrain.value!);
            }),
          ),
        ],
      ),
    );
  }
}
