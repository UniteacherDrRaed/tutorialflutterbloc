import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorialflutterbloc/Repositorypart/Repositorydart.dart';
import 'package:tutorialflutterbloc/blocpart/eventpart.dart';
import 'package:tutorialflutterbloc/blocpart/statespart.dart';

class BlocDart extends Bloc<EventPart,StatesPart>{
  final RepositoryDart repositoryDart;
  BlocDart(this.repositoryDart):super(GettingPhotState()){
    on<GetPhotosEvent>((event, emit) async {
      emit(GettingPhotState());
      try{
        final allphotos=await repositoryDart.gettingAllPhotos();
        emit(SuccessStateAllPhotos(allphotos));
      }catch(e){
        emit(ErrorStateinGettingAllPhotos(e.toString()));
      }
    },);
  }
}