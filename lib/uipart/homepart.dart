import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tutorialflutterbloc/blocpart/blocdart.dart';
import 'package:tutorialflutterbloc/blocpart/statespart.dart';
import 'package:tutorialflutterbloc/modelpart/photodart.dart';
import '../repositorypart/repositorydart.dart';

class HomePart extends StatelessWidget {
  const HomePart({super.key});

  @override
 Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>BlocDart(RepositoryDart()))
      ],
       child:  Scaffold(
      appBar: AppBar(
        title: const Text("photos"),
        backgroundColor:Colors.pink ,
      ),
      body: BlocBuilder<BlocDart,StatesPart>(
        builder:(context,state)
        {
          if(state is GettingPhotState)
          {
            return _showCircularProgressIndicator();
          }
        if(state is SuccessStateAllPhotos)
        {
          List<PhotoDart>listofphotos=state.listphotos;
          return _showListView(listofphotos);
        }else if(state is ErrorStateinGettingAllPhotos)
        {
          return Text(state.errormessage);
        }
        
        return Container(
              color: Colors.pink.shade100,
              padding: const EdgeInsets.all(50),
            
            );
      
        }
        ),
      )
    );
    }


  Widget _showCircularProgressIndicator() =>Container(
              color: Colors.pink.shade100,
              padding: const EdgeInsets.all(50),
              child: const CircularProgressIndicator(
                color:Colors.blue,
                strokeWidth:5.0
              ),
            );


  Widget _showListView(List<PhotoDart> listphotos)=>
  ListView.builder(
    itemCount: listphotos.length,
    itemBuilder: ((context, index) {
      return Container(
        color: Colors.pink.shade100,
        padding: const EdgeInsets.all(10),
        child:Row(
          children: [
            Text("albumId ${listphotos[index].albumId}"),
            Text("id ${listphotos[index].id}"),
            Text("title ${listphotos[index].title}"),
            Image.network(listphotos[index].url),
            
          ],
        ),
      );
    }));          
}

