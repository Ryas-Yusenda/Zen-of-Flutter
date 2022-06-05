import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_info/constants.dart';
import 'package:news_info/models/firebase_cloud.dart';
import 'package:news_info/screen/page_home.dart';
import 'package:news_info/screen/web_view.dart';
import 'package:news_info/services/page_profil_cek.dart';

class BookmarkIn extends StatelessWidget {
  final int _selectedIndex = 1;

  final BuildContext context;
  final userGoogle = FirebaseAuth.instance.currentUser!;

  BookmarkIn({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark',
          style: TextStyle(
              color: kSecondaryColor,
              fontSize: 28.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600),
        ),
      ),
      body: StreamBuilder<List<UserData>>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(children: users.map(buildUser).toList());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
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
                highlightColor: Colors.white,
                onPressed: () {},
                iconSize: 30,
              ),
            ),
            label: '',
            backgroundColor: kSecondaryColor),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.person_outlined),
              iconSize: 30,
              highlightColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const HomePageLogin()),
                );
              },
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

  Stream<List<UserData>> readUser() => FirebaseFirestore.instance
      .collection(userGoogle.uid)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserData.fromJson(doc.data())).toList());

  Widget buildUser(UserData user) => Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          final docUser =
              FirebaseFirestore.instance.collection(userGoogle.uid).doc(user.id);

          docUser.delete();
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(user.poster),
            backgroundColor: Colors.transparent,
          ),
          title: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => WebViewModul(links: user.link)),
              );
            }, // Respon ketika button ditekan
            child: Column(
              children: <Widget>[
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  user.judul,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text(
            "   " + user.tipe,
            style: const TextStyle(color: kPrimaryColor),
          ),
        ),
      );
}
