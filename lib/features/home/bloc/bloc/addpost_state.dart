part of 'addpost_bloc.dart';

sealed class AddpostState extends Equatable {
  const AddpostState();
  
  @override
  List<Object> get props => [];
}

final class AddpostInitial extends AddpostState {}
