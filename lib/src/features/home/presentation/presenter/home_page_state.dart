import 'package:tractian_interview/src/core/data/models/company_model.dart';

abstract class HomePageState {}

class HomePageIdle extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoadedSuccess extends HomePageState {
  final List<CompanyUnitModel> companies;

  HomePageLoadedSuccess(this.companies);
}

class HomePageLoadedFailure extends HomePageState {
  final String message;

  HomePageLoadedFailure(this.message);
}
