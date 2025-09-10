import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Booking")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Selection",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                ...controller.selectedRooms.map(
                  (room) => ListTile(
                    title: Text(room['name'] as String),
                    subtitle: Text("⏱ ${room['duration']} min"),
                    trailing: Text(
                      "\$${(room['price'] as double).toStringAsFixed(2)}",
                    ),
                  ),
                ),
                ...controller.selectedAddOns.map(
                  (addOn) => ListTile(
                    title: Text(addOn['name'] as String),
                    subtitle: Text("⏱ ${addOn['duration']} min"),
                    trailing: Text(
                      "\$${(addOn['price'] as double).toStringAsFixed(2)}",
                    ),
                  ),
                ),

                const Divider(),
                Text("Total Duration: ${controller.totalDuration} min"),
                Text(
                  "Total Price: \$${controller.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () => Get.snackbar(
                    "Booking Confirmed",
                    "Your cleaning service has been booked!",
                  ),
                  icon: const Icon(Icons.check),
                  label: const Text("Confirm & Book"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "✨ If you are not happy it is free. No questions asked.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
