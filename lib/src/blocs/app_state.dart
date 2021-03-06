import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bots_app/src/models/models.dart';
import 'package:bots_app/src/models/users.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppError extends AppState {}

class AppEmpty extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final UsersResponse response;

  AppLoaded({@required this.response});
}
