import 'package:dartz/dartz.dart';

abstract class authState {}

class authLodingState extends authState {}

class authInotioateState extends authState {}

class authResponeState extends authState {
  Either<String, String> respone;
  authResponeState(this.respone);
}
