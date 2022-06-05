class UserData {
  String id;
  final String judul;
  final String link;
  final String poster;
  final String tipe;

  UserData({
    this.id = '',
    required this.judul,
    required this.link,
    required this.poster,
    required this.tipe,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'link': link,
        'poster': poster,
        'tipe': tipe,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        judul: json['judul'],
        link: json['link'],
        poster: json['poster'],
        tipe: json['tipe'],
      );
}
