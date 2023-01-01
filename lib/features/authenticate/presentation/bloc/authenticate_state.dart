
import 'dart:io';

abstract class AuthenticateState {}

class AuthenticateInitial extends AuthenticateState {}
class ImagePickedSuccessfully extends AuthenticateState {
  final File? imageFile;
  ImagePickedSuccessfully({required this.imageFile});
}