part of 'connection_bloc.dart';

abstract class ConnectionState extends Equatable {
  const ConnectionState();
  
  @override
  List<Object> get props => [];
}

class ConnectionInitial extends ConnectionState {}
