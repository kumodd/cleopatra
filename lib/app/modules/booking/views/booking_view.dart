import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import 'confirmation_view.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});

  final cleaningData = {
    "Standard Cleaning": [
      {"name": "Bedroom", "price": 17.25, "duration": 30},
      {"name": "Bathroom", "price": 21.00, "duration": 40},
      {"name": "Half Bathroom", "price": 10.50, "duration": 20},
      {"name": "Other Room", "price": 26.00, "duration": 45},
    ],
    "Deep Cleaning": [
      {"name": "Bedroom", "price": 23.50, "duration": 45},
      {"name": "Bathroom", "price": 38.50, "duration": 60},
      {"name": "Half Bathroom", "price": 17.00, "duration": 30},
      {"name": "Other Room", "price": 38.50, "duration": 60},
    ],
    "Add-Ons": [
      {"name": "Refrigerator (inside)", "price": 17.00, "duration": 30},
      {"name": "Microwave (inside)", "price": 4.25, "duration": 10},
      {"name": "Oven (inside)", "price": 19.25, "duration": 30},
      {"name": "Stovetop (scrub)", "price": 8.50, "duration": 15},
      {"name": "Dishwasher (inside)", "price": 6.50, "duration": 15},
      {"name": "Toaster (crumbs)", "price": 2.25, "duration": 5},
      {"name": "Coffee Maker (descale)", "price": 2.25, "duration": 10},
      {"name": "Blender (inside)", "price": 2.25, "duration": 10},
      {"name": "Washer (inside)", "price": 6.50, "duration": 20},
      {"name": "Dryer (inside)", "price": 6.50, "duration": 20},
      {"name": "Air Fryer (inside)", "price": 4.25, "duration": 15},
      {"name": "Electric Kettle (descale)", "price": 2.25, "duration": 10},
      {"name": "Dishes (wash)", "price": 8.50, "duration": 30},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Scaffold(
      appBar: AppBar(title: const Text("Book Cleaning")),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            // Cleaning type selection
            const Text(
              "Select Cleaning Type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: const Text("Standard"),
                    selected:
                        controller.cleaningType.value == "Standard Cleaning",
                    onSelected: (_) =>
                        controller.setCleaningType("Standard Cleaning"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ChoiceChip(
                    label: const Text("Deep"),
                    selected: controller.cleaningType.value == "Deep Cleaning",
                    onSelected: (_) =>
                        controller.setCleaningType("Deep Cleaning"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Rooms list (based on selected type)
            if (controller.cleaningType.isNotEmpty) ...[
              Text(
                "${controller.cleaningType.value} Services",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...cleaningData[controller.cleaningType.value]!.map((room) {
                final isSelected = controller.selectedRooms.contains(room);
                return Card(
                  child: ListTile(
                    title: Text(room['name'] as String), // 👈 cast to String
                    subtitle: Text(
                      "⏱ ${room['duration']} min • 💲 ${(room['price'] as double).toStringAsFixed(2)}",
                    ),
                    trailing: Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.add_circle_outline,
                      color: isSelected ? Colors.green : null,
                    ),
                    onTap: () => controller.toggleRoom(room),
                  ),
                );
              }),
            ],

            const SizedBox(height: 16),

            // Add-ons
            if (controller.cleaningType.isNotEmpty) ...[
              const Text(
                "Add-Ons (Optional)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...cleaningData["Add-Ons"]!.map((addOn) {
                final isSelected = controller.selectedAddOns.contains(addOn);
                return Card(
                  child: ListTile(
                    title: Text(addOn['name'] as String),
                    subtitle: Text(
                      "⏱ ${addOn['duration']} min • 💲 ${(addOn['price'] as double).toStringAsFixed(2)}",
                    ),
                    trailing: Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.add_circle_outline,
                      color: isSelected ? Colors.green : null,
                    ),
                    onTap: () => controller.toggleAddOn(addOn),
                  ),
                );
              }),
            ],
          ],
        );
      }),
      floatingActionButton: Obx(() {
        return (controller.cleaningType.isEmpty ||
                controller.selectedRooms.isEmpty)
            ? const SizedBox.shrink()
            : FloatingActionButton.extended(
                onPressed: () => Get.to(() => const ConfirmationView()),
                label: const Text("Review Booking"),
                icon: const Icon(Icons.arrow_forward),
              );
      }),
    );
  }
}
