import 'package:get/get.dart';
import '../controllers/forgot_controller.dart';

class ForgotBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotController());
    // TODO: implement dependencies
  }
}
