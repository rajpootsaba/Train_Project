import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/HomeScreen.dart';
import 'package:trainticketapp/View/MyProfile.dart';
import 'package:trainticketapp/View/MyTicket.dart';
import 'package:trainticketapp/View/TrainInfo.dart';


class CustomBottomBar extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined), label: "My Ticket"),
    BottomNavigationBarItem(icon: Icon(Icons.train_rounded), label: "Train Info"),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: homeController.selectedIndex.value,
        selectedItemColor: const Color(0xFF015768),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          homeController.selectedIndex.value = index;

          switch (index) {
            case 0:
              Get.to(() => const HomeScreen());
              break;
            case 1:
              Get.to(() => const MyTicket());
              break;
            case 2:
              Get.to(() => const TrainInfo());
              break;
            case 3:
              Get.off(() => const MyProfile()); 
              break;
          }
        },
        items: items,
      );
    });
  }
}
