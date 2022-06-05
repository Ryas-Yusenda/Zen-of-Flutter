import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF6861);
const kSecondaryColor = Color(0xFF2F2E41);
const kThirdColor = Color(0xFFAFA8A2);
const kWhite = Colors.white;

const kPrimaryGradient = LinearGradient(
  colors: [Color.fromRGBO(174, 125, 70, 1), Color.fromRGBO(140, 0, 255, 1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

bool warnaListNews(String data1, String data2) {
  if (data1.toLowerCase() == data2.toLowerCase()) {
    return true;
  }
  return false;
}

List<String> listNews = [
  "top-news",
  "politik",
  "hukum",
  "ekonomi",
  "metro",
  "sepakbola",
  "olahraga",
  "humaniora",
  "lifestyle",
  "hiburan",
  "dunia",
  "tekno",
  "warta-bumi"
];

// Metro
// Nusantara
// Infografik
// Foto
// Video
// Warta Bumi

List<String> listSource = [
  "Antara",
  "CNBC",
  "CNN",
  "JPNN",
  "Kumparan",
  "Merdeka",
  "Okezone",
  "Republika",
  "Sindonews",
  "Suara",
  "Tempo",
  "Tribun",
];

List<String> listThumbnail = [
  "https://www.antaranews.com/img/favicon/android-icon-192x192.png",
  "https://cdn.cnbcindonesia.com/cnbc/images/logo_hitam.png",
  "https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png",
  "https://yt3.ggpht.com/ytc/AKedOLRuPnj2tV_Y2vN5k_AFH-rdAIaYNzWuROMCSteE9w=s900-c-k-c0x00ffffff-no-rj",
  "https://blue.kumparan.com/kumpar/image/upload/w_600,h_600,f_jpg/main2_rqo7a5.jpg",
  "https://cdns.klimg.com/merdeka.com/media/i/a/apple/apple-touch-icon-precomposed.png",
  "https://cdn.okezone.com/underwood/revamp/2017/home/img/favicon/favicon-196x196.png",
  "https://static.republika.co.id/files/images/favicon-rol.png?v=ROL-71",
  "https://sd.sindonews.net/wp/2017/images/icon/favicon-192x192.png",
  "https://assets.suara.com/mobile/images/new-images/img-suara.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4kbpPQUUoFMlC0AteOccCcS6jDtPquRg8YWqVVrXTYUev68VE1cYLqMftJMCUOXPAWw0&usqp=CAU",
  "https://cdn-1.tstatic.net/img/icon/tribun-icon_32.png",
];
