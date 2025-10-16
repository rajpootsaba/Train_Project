import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String trainName;
  final String trainNo;
  final String fromCity;
  final String toCity;
  final String departure;
  final String arrival;
  final String duration;
  final String date;
  final String image;

  const CustomContainer({
    super.key,
    required this.trainName,
    required this.trainNo,
    required this.fromCity,
    required this.toCity,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.date,
    required this.image,
  });


  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, ),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)
        ),
        child: Row(
        children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.trainName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(widget.date, style: TextStyle(color: Color(0xFF015768))),
          ],
        ),
      ),
        ],
      )
      
      
      ),
    );
  }
}