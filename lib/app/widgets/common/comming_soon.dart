    import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showComingSoon(String feature) {
      Get.snackbar(
        "Coming Soon 🚀",
        "$feature feature will be available soon!",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        backgroundColor: Colors.blue.shade100,
        colorText: Colors.black87,
        duration: const Duration(seconds: 2),
      );
    }