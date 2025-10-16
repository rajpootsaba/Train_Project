// CustomSeatContainer.dart
import 'package:flutter/material.dart';

class CustomSeatContainer extends StatefulWidget {
  final String seat;
  final bool isSelected;
  final bool isBooked;
  final VoidCallback onTap;

  const CustomSeatContainer({
    super.key,
    required this.seat,
    required this.isSelected,
    required this.isBooked,
    required this.onTap,
  });

  @override
  State<CustomSeatContainer> createState() => _CustomSeatContainerState();
}

class _CustomSeatContainerState extends State<CustomSeatContainer> {
  late bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.isSelected;
  }

  void toggleSelection() {
    if (!widget.isBooked) {
      setState(() {
        selected = !selected;
      });
      widget.onTap(); // call parent callback
    }
  }

  @override
  Widget build(BuildContext context) {
    Color seatColor = widget.isBooked
        ? const Color(0xFFFF8731) // Booked
        : selected
            ? const Color(0xFF015768) // Selected
            : Color(0xFFF3F6FF); // Available

    return InkWell(
      onTap: toggleSelection,
      child: Container(
        constraints: BoxConstraints(
    maxWidth: 50,   
    maxHeight: 70,  
  ),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: widget.isBooked
          //       ? const Color(0xFFFF8731)
          //       : selected
          //           ? const Color(0xFF015768)
          //           : Colors.grey,
          // ),
        ),
        child: Center(
          child: Text(
            widget.seat,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.isBooked || selected ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
