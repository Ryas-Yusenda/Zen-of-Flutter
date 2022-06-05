import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_info/constants.dart';
import 'package:news_info/models/google_sign_in.dart';
import 'package:news_info/screen/page_home.dart';
import 'package:news_info/services/page_bookmark_cek.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);
  final int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: kSecondaryColor,
              fontSize: 28.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            child: const Text('Keluar', style: TextStyle(color: kPrimaryColor)),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 32),
            Text(
              'Name: ' + user.displayName!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            Text(
              'Email: ' + user.email!,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ), // Column
      ),
      bottomNavigationBar: bottomNavMain(context),
    );
  }

  BottomNavigationBar bottomNavMain(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.home_outlined),
                iconSize: 30,
                highlightColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),
            label: '',
            backgroundColor: kSecondaryColor),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.bookmark_add_outlined),
                iconSize: 30,
                highlightColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const BookmarkPageLogin()),
                  );
                },
              ),
            ),
            label: '',
            backgroundColor: kSecondaryColor),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.person_outlined),
              highlightColor: Colors.white,
              iconSize: 30,
              onPressed: () {},
            ),
          ),
          label: '',
          backgroundColor: kSecondaryColor,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryColor,
      currentIndex: _selectedIndex,
      selectedItemColor: kWhite,
      unselectedItemColor: kSecondaryColor,
    );
  }
}
