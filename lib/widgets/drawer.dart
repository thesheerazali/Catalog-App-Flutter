import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.licdn.com/dms/image/C4E03AQEiGkpUGF2Qfg/profile-displayphoto-shrink_800_800/0/1637930411441?e=1684972800&v=beta&t=qbdQ0_EVp2azehymTKcMXYwP7PlPoEZAmpHUOlguE54";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text('Sheeraz Ali'),
                accountEmail: Text('sheerazali7676@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            myListTile(
              'Home',
              const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
            ),
            myListTile(
              'Profile',
              const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
            ),
            myListTile(
              'Email me',
              const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
            ),
            myListTile(
              'Contact',
              const Icon(
                CupertinoIcons.text_aligncenter,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  myListTile(String name, Widget icon) {
    return ListTile(
      leading: icon,
      title: Text(
        name,
        textScaleFactor: 1.2,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
