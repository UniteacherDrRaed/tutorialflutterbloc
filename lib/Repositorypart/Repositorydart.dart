import 'dart:convert';

import 'package:tutorialflutterbloc/modelpart/photodart.dart';
import 'package:http/http.dart' as http;
class RepositoryDart{
  String urlforphotos="https://jsonplaceholder.typicode.com/photos";
  Future<List<PhotoDart>> gettingAllPhotos() async{
     http.Response responsing=await http.get(Uri.parse(urlforphotos));
    if(responsing.statusCode==200)
    {
      final List result=jsonDecode(responsing.body);
      return result.map((e) => PhotoDart.fromJsonData(e)).toList();
    }
    else
    {
      throw Exception("Error in getting all photos");
    }
  }
}