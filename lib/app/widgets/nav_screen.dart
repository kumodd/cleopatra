import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/recents/views/recents_view.dart';
import '../modules/profile/views/profile_view.dart';

class NavScreen extends StatelessWidget {
   NavScreen({super.key});

  final List<Widget> _screens = [
    const HomeView(),
    BookingView(),
    const RecentsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find();

    return Obx(() => Scaffold(
          body: _screens[navController.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.selectedIndex.value,
            onTap: navController.changeTab,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: "Recents"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}