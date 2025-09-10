import 'package:cleopatra/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/recents/views/recents_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../controllers/nav_controller.dart';
import '../widgets/nav_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.NAV;

  static final routes = [
    GetPage(
      name: Routes.NAV,
      page: () =>  NavScreen(),
      binding: BindingsBuilder(() {
        Get.put(NavController());
        Get.lazyPut<HomeController>(() => HomeController()); // 👈 add this
      }),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BOOKING,
      page: () =>  BookingView(),
    ),
    GetPage(
      name: Routes.RECENTS,
      page: () => const RecentsView(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
    ),
  ];
}