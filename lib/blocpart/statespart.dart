import 'package:equatable/equatable.dart';
import 'package:tutorialflutterbloc/modelpart/photodart.dart';

abstract class StatesPart extends Equatable{}

class GettingPhotState extends StatesPart{
  @override
  List<Object?> get props => [];
}

class SuccessStateAllPhotos extends StatesPart{
  final List<PhotoDart> listphotos;
  SuccessStateAllPhotos(this.listphotos);
  @override
  List<Object?> get props => [listphotos];
}

class ErrorStateinGettingAllPhotos extends StatesPart{
  final String errormessage;
  ErrorStateinGettingAllPhotos(this.errormessage);
  @override
  List<Object?> get props => [errormessage];
}