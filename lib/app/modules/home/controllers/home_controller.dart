import 'package:cleopatra/app/controllers/nav_controller.dart';
import 'package:cleopatra/app/modules/booking/controllers/booking_controller.dart';
import 'package:cleopatra/app/modules/booking/views/booking_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // navigate to Booking screen with optional pre-selected type
  void goToBooking({String? type}) {
    final bookingController = Get.put(BookingController());
    if (type != null) {
      bookingController.setCleaningType(type);
    }
    Get.to(() => BookingView());
  }

  void goToBookingTab() {
    final navController = Get.put(NavController());
    navController.selectedIndex.value = 1;
  }
}
