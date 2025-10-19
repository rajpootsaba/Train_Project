import 'package:flutter/material.dart';

class TrainInfoCustomContainer extends StatefulWidget {
  final String name;
  final String fromCity;
  final String toCity;
  final String date;
  final String time;
  
  final String fare;

  const TrainInfoCustomContainer({
    super.key,
    required this.name,
    required this.fromCity,
    required this.toCity,
    required this.date,
    required this.time,
   
    required this.fare,
  });

  @override
  State<TrainInfoCustomContainer> createState() =>
      _TrainInfoCustomContainerState();
}

class _TrainInfoCustomContainerState extends State<TrainInfoCustomContainer> {
  bool showDetails = false; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF196676),
                ),
              ),
              IconButton(
                icon: Icon(
                  showDetails
                      ? Icons.keyboard_arrow_left  
        : Icons.keyboard_arrow_right,
                  color: const Color(0xFF196676),
                ),
                onPressed: () {
                  setState(() {
                    showDetails = !showDetails;
                  });
                },
              ),
            ],
          ),
          if (showDetails) ...[
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),

            _buildInfoRow("From", widget.fromCity),
            _buildInfoRow("To", widget.toCity),
            _buildInfoRow("Date", widget.date),
            _buildInfoRow("Time", widget.time),
       
            _buildInfoRow("Fare", widget.fare),
          ],
        ],
      ),
    );
  }
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title:",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
