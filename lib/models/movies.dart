class Movies {
  final int id;
  final String title;
  final String imgPath;

  Movies({required this.id, required this.title, required this.imgPath});

  factory Movies.fromJson(Map<String, dynamic> json){
    return Movies(
      id: json['id'],
      title: json['title'],
      imgPath: json['img_path']
    );
  }
}