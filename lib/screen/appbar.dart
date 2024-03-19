import 'package:adminweb/screen/login_screen.dart';
import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.grey.shade100,
    elevation: 0,
    toolbarHeight: 40,
    actions: [
      MyCircleAvatar(),
    ],
  );
}

class MyCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ];
      },
      onSelected: (value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
        switch (value) {
          case 1:
            break;
        }
      },
    );
  }
}
