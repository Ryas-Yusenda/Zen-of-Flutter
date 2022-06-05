import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_info/screen/page_bookmark_in.dart';
import 'package:news_info/screen/page_bookmark_out.dart';

class BookmarkPageLogin extends StatelessWidget {
  const BookmarkPageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return BookmarkIn(
                context: context,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text(' Something Went Wrong ! '));
            } else {
              return const Bookmark(
                kataKunci: '  Bookmark Kosong\nSilahkan Login dahulu',
              );
            }
          },
        ),
      );
}
