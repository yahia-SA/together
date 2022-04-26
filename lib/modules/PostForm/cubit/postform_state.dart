part of 'postform_cubit.dart';

@immutable
abstract class PostformState {}

class PostformInitial extends PostformState {}
class PostformLoading extends PostformState {}
class PostformChange extends PostformState {}
