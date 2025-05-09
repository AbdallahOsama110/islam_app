part of 'layout_cubit.dart';

abstract class LayoutStates{}

class LayoutInitial extends LayoutStates {}
class LayoutButtomBarChanged extends LayoutStates {}
class TimeUpdatedState extends LayoutStates {}
class GetPrayerTimeState extends LayoutStates {}

class GetLocationLoading extends LayoutStates {}
class GetLocationSuccess extends LayoutStates {}
class GetLocationError extends LayoutStates {}
