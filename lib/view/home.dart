import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transaction_app/view/loginscreen.dart';
import 'package:transaction_app/view/transactionhome.dart';
import 'package:transaction_app/widgets/widgethome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
          child: Container(
            height: 4.5.h,
            width: 9.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 159, 47),
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
                child: Text(
              'JB',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        leadingWidth: 16.w,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: Colors.blue, size: 3.8.h),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
                icon:
                    Icon(Icons.logout_rounded, color: Colors.blue, size: 3.8.h),
                onPressed: () {
                  storage.delete(key: 'accessToken');
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                      (route) => false);
                }),
          )
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              child: Row(
                children: [
                  container1('15,256,486.00', 'British pound', 'assets/uk.png'),
                  container1('14,897,421.00', 'US dollar', 'assets/us.png'),
                  container1(
                      '18,526,734.00', 'Canadian dollar', 'assets/canada.png')
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 16, 0, 15),
            child: Text(
              'To do - 4',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 8,
              bottom: 15,
            ),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  todoContainer(
                      const Color.fromARGB(255, 245, 245, 245),
                      const Color.fromARGB(255, 230, 211, 252),
                      const Color.fromARGB(255, 198, 156, 247),
                      Icons.document_scanner_outlined,
                      'Verify your business documents'),
                  todoContainer(
                      const Color.fromARGB(255, 245, 245, 245),
                      const Color.fromARGB(255, 246, 233, 206),
                      const Color.fromARGB(255, 252, 213, 127),
                      Icons.person_pin_outlined,
                      'Verify your identity'),
                  todoContainer(
                      const Color.fromARGB(255, 245, 245, 245),
                      const Color.fromARGB(255, 199, 223, 244),
                      const Color.fromARGB(255, 113, 189, 255),
                      Icons.account_balance,
                      'Open a Marlo    business account'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All transactions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const TransactionHome()));
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ))
              ],
            ),
          ),
          listTileHome("-\$850", Icons.arrow_outward_rounded, Colors.black),
          listTileHome("-\$850", Icons.arrow_outward_rounded, Colors.black),
          listTileHome("+\$850", Icons.payments_outlined, Colors.green)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          fixedColor: Colors.blue,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 30,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar_circle), label: 'Loans'),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined), label: 'Contracts'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_outline,
                ),
                label: 'Teams'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined), label: 'Chat')
          ]),
    );
  }
}
