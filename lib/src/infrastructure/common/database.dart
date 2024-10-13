import 'models/account.dart';

class Database {
  static List<String> countiresCode = [
    '98',
    '1',
    '34',
    '62',
  ];

  static List<Account> accounts = [
    Account(
      name: 'Ali Karimi',
      email: 'a.karimi2729@gmail.com',
      number: '09170502729',
      imageUrl: '',
      messeges: [],
    ),
    Account(
      name: 'Sina Rezaei',
      email: 'sinarezaei@gmail.com',
      number: '09010816961',
      imageUrl: '',
      messeges: ['hello', 'sup dude'],
    ),
    Account(
      name: 'Mmd Karimi',
      email: 'mmdkarimi@gmail.com',
      number: '09383529714',
      imageUrl: '',
      messeges: ['hello', 'sup dude', 'bro', 'heyyyy'],
    ),
  ];
}
