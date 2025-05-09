part of 'azkar_cubit.dart';

abstract class AzkarStates {}

final class AzkarInitial extends AzkarStates {}

final class GetAzkarCategoryLoading extends AzkarStates {}

final class GetAzkarCategorySuccess extends AzkarStates {}

final class GetAzkarCategoryError extends AzkarStates {}

final class GetAzkarLoading extends AzkarStates {}
final class GetAzkarSuccess extends AzkarStates {}
final class GetAzkarError extends AzkarStates {}
final class AzkarSearchState extends AzkarStates {}
