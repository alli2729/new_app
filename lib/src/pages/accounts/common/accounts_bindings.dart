import 'package:get/get.dart';
import '../controllers/accounts_controller.dart';

class AccountsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountsController());
  }
}
