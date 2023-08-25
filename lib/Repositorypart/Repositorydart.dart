
import 'dart:convert';

import 'package:tutorialflutterbloc/modelpart/photodart.dart';
import 'package:dio/dio.dart';
class RepositoryDart{
  
  String urlforphotos="https://jsonplaceholder.typicode.com/photos";
  Future<List<PhotoDart>> gettingAllPhotos() async{
    final dio = Dio();
    Response responsing =await dio.get(urlforphotos, 
    options: Options( 
    responseType: ResponseType.plain,
  ));
    if(responsing.statusCode==200)
    { 
      
      
      final  result=jsonDecode(responsing.data);
     
      List<PhotoDart> listphotos=[];
     for(var singlephoto in result)
      {
        listphotos.add(PhotoDart(albumId:int.parse(singlephoto['albumId'].toString()) , 
        id: int.parse(singlephoto['id'].toString()),
         title: singlephoto['title'] ,
          url: singlephoto['url'] ,
           thumbnailUrl: singlephoto['thumbnailUrl']));
      }
     return listphotos;
     }
    else
    {
      throw Exception("Error in getting all photos");
    }
  }
}