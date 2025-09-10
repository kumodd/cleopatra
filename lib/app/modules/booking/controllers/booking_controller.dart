import 'package:get/get.dart';

class BookingController extends GetxController {
  var cleaningType = "".obs; // Standard or Deep
  var selectedRooms = <Map<String, dynamic>>[].obs;
  var selectedAddOns = <Map<String, dynamic>>[].obs;

  void setCleaningType(String type) {
    cleaningType.value = type;
    selectedRooms.clear();
  }

  void toggleRoom(Map<String, dynamic> room) {
    if (selectedRooms.contains(room)) {
      selectedRooms.remove(room);
    } else {
      selectedRooms.add(room);
    }
  }

  void toggleAddOn(Map<String, dynamic> addOn) {
    if (selectedAddOns.contains(addOn)) {
      selectedAddOns.remove(addOn);
    } else {
      selectedAddOns.add(addOn);
    }
  }

  double get totalPrice {
    double rooms = selectedRooms.fold(0, (sum, r) => sum + (r['price'] as double));
    double addOns = selectedAddOns.fold(0, (sum, a) => sum + (a['price'] as double));
    return rooms + addOns;
  }

  int get totalDuration {
    int rooms = selectedRooms.fold(0, (sum, r) => sum + (r['duration'] as int));
    int addOns = selectedAddOns.fold(0, (sum, a) => sum + (a['duration'] as int));
    return rooms + addOns;
  }
}