import 'package:get/get.dart';
import 'package:jio_poc/features/home/view/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.homePage;

  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
    ),
  ];
}
