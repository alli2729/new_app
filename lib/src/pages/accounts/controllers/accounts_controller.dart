import 'package:get/get.dart';
import '../../../infrastructure/common/database.dart';
import '../../../infrastructure/common/models/account.dart';

class AccountsController extends GetxController {
  final String name = 'Ali Karimi';

  List<Account> accounts = Database.accounts;

  void onAddAccount() {}
}
