import 'package:flutter/material.dart';

class CustomProfileContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> details;
  final bool isExpanded;
  final VoidCallback onTap;

  const CustomProfileContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
        children: [Row(
            children: [
              Icon(icon, color: const Color(0xFF196676), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF196676),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xFF196676),
                ),
                onPressed: onTap,
              ),
            ],
          ),
          if (isExpanded) ...[
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            ...details.map((d) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const SizedBox(width: 40), 
                      Expanded(
                        child: Text(
                          d,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )),
          ]
        ],
      ),
    );
  }
}
