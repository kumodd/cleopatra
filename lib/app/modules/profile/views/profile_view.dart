import 'package:cleopatra/app/widgets/common/comming_soon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blue.shade200,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Kumod Yadav",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "kumod353@gmail.com",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),

          // Profile options
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("My Bookings"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => showComingSoon("My Bookings"),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Payment Methods"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => showComingSoon("Payment Methods"),
          ),

          const Divider(),

          // Dark mode switch
          Obx(
            () => SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: Text(
                themeController.isDarkMode.value ? "Dark Mode" : "Light Mode",
              ),
              value: themeController.isDarkMode.value,
              onChanged: (val) => themeController.toggleTheme(),
            ),
          ),

          const Divider(),

          // Logout button
          ElevatedButton.icon(
            onPressed: () {
              // Get.snackbar(
              //   "Logged Out",
              //   "You have been logged out successfully.",
              // );
              showComingSoon("Logged Out");
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
