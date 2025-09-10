import 'package:cleopatra/app/widgets/common/comming_soon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Cleaning"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showComingSoon("Notifications");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade200,
                  child: const Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Kumod Yadav",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Quick Actions
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              children: [
                _buildQuickAction(Icons.cleaning_services, "Book Cleaning", () {
                  // controller.goToBooking();
                }),
                _buildQuickAction(Icons.event_note, "My Bookings", () {
                  showComingSoon("My Bookings");
                }),
                _buildQuickAction(Icons.payment, "Payments", () {
                  showComingSoon("Payments");
                }),
                _buildQuickAction(Icons.support_agent, "Support", () {
                  Get.snackbar("Support", "Contact support@cleanapp.com");
                }),
              ],
            ),

            const SizedBox(height: 20),

            // Promo Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "✨ Special Offer: 20% OFF on Deep Cleaning this week!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 20),

            // Popular Services
            const Text(
              "Popular Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildServiceCard(
              "Standard Cleaning",
              "Starting from \$17.25",
              Icons.home,
              () {
                // controller.goToBooking(type: "Standard Cleaning");
              },
            ),
            _buildServiceCard(
              "Deep Cleaning",
              "Starting from \$23.50",
              Icons.apartment,
              () {
                // controller.goToBooking(type: "Deep Cleaning");
              },
            ),
          ],
        ),
      ),
    );
  }

  // Quick Action Builder
  Widget _buildQuickAction(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // Service Card Builder
  Widget _buildServiceCard(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
