import 'package:flutter/material.dart';
import 'package:news_info/constants.dart';
import 'package:news_info/models/cari_berita.dart';
import 'package:news_info/screen/web_view.dart';
import 'package:news_info/services/api_seach.dart';
import 'package:news_info/services/string_extension.dart';

class Seacher extends StatelessWidget {
  final String kataKunci;

  const Seacher({Key? key, required this.kataKunci}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          kataKunci,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600),
        ),
      ),
      body: _main(),
    );
  }

  Widget _main() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _listBeritaBuild(kataKunci.toLowerCase()),
        ]);
  }

  Widget _listBeritaBuild(String namaBerita) {
    return Expanded(
      child: FutureBuilder(
        future: BeritaDataSource.loadCountries("search/?q=" + namaBerita),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasData) {
            BeritaModel countriesModel = BeritaModel.fromJson(snapshot.data);
            return _listBeritaBuildSuccess(countriesModel);
          }
          return _listBeritaBuildLoading();
        },
      ),
    );
  }

  Widget _listBeritaBuildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _listBeritaBuildSuccess(BeritaModel data) {
    return ListView.builder(
      itemCount: data.countries.length,
      itemBuilder: (BuildContext context, int index) {
        return _listBeritaBuildSuccessDetail(
          context,
          data.countries[index].judul,
          data.countries[index].link,
          data.countries[index].poster,
          data.countries[index].tipe,
        );
      },
    );
  }

  Widget _listBeritaBuildSuccessDetail(BuildContext context, String? title,
      String? link, String? image, String? tipe) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(0),
            ),
            child: Image.network(
              image!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 15, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => WebViewModul(links: link!)),
                  );
                }, // Respon ketika button ditekan
                child: Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 20),
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        title!,
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 1),
                        ],
                      ),
                      child: Image.network(
                        listThumbnail[2],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        listSource[2],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: kSecondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: SizedBox(
                        height: 25.0,
                        child: ElevatedButton(
                          child: Text(
                            tipe!.capitalize(),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: kSecondaryColor,
                            side: const BorderSide(
                              color: kPrimaryColor,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
