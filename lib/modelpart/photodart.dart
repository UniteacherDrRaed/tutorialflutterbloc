class PhotoDart{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  PhotoDart({required this.albumId,required this.id, required this. title,required this.url,required this.thumbnailUrl});
  factory PhotoDart.fromJsonData(Map<String,dynamic> jsondata){
       int albumIdfromjson=jsondata['albumId'];
       int idfromjson=jsondata['id'];
       String titlefromjson=jsondata['title'];
       String urlfromjson=jsondata['url'];
       String thumbnailUrlfromjson=jsondata['thumbnailUrl'];
       return PhotoDart(albumId: albumIdfromjson, id: idfromjson, title: titlefromjson, url: urlfromjson,thumbnailUrl:thumbnailUrlfromjson);
  }
  
}


