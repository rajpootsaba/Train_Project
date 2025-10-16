import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/Model/TrainModel.dart';

class SearchCustomContainer2 extends StatefulWidget {
  final TrainModel train; 
  const SearchCustomContainer2({super.key, required this.train});

  @override
  State<SearchCustomContainer2> createState() => _SearchCustomContainer2State();
}

class _SearchCustomContainer2State extends State<SearchCustomContainer2> {
   final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
        color: Colors.white, 
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Train name + number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.train.trainName,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
               Obx(() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        homeController.selectedClass.value == "" 
          ? "Class |"
          : "Class: ${homeController.selectedClass.value}",
        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 12), // thodi gap
      Text(
        homeController.selectedSeats.isEmpty
          ? "Seats: -"
          : "${homeController.selectedSeats.join(", ")}",
        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  );
}),

              ],
            ),
          ),

          Divider(color: Colors.grey.shade200, thickness: 1),

          // From - To
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.train.fromCity,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  widget.train.toCity,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey.shade100, thickness: 1),

          // Departure - Icon - Arrival
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Departure
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.train.departure,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(widget.train.date,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),

                // Train icon
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF015768).withOpacity(0.1),
                  ),
                  child: const Icon(Icons.train, color: Color(0xFF015768)),
                ),

                // Arrival
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.train.arrival,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(widget.train.date,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 7),

          // Duration
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.train.getDuratin(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
