class BeritaModel {
  List<Countries> countries = [];
  BeritaModel({required this.countries});

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        countries: json["post"] != null
            ? List<Countries>.from(
                json["post"].map((x) => Countries.fromJson(x)))
            : [],
      );
  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Countries {
  String judul;
  String link;
  String poster;
  String tipe;
  Countries(
      {required this.judul,
      required this.link,
      required this.poster,
      required this.tipe});
  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        judul: json['judul'],
        link: json['link'],
        poster: json['poster'],
        tipe: json['tipe'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['judul'] = judul;
    data['link'] = link;
    data['poster'] = poster;
    data['tipe'] = tipe;
    return data;
  }
}
