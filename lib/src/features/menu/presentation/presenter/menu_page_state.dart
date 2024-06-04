import 'package:tractian_interview/src/core/data/models/company_model.dart';

abstract class MenuPageState {}

class MenuPageIdle extends MenuPageState {}

class MenuPageLoading extends MenuPageState {}

class MenuPageLoadedSuccess extends MenuPageState {
  final List<CompanyModel> companies;

  MenuPageLoadedSuccess(this.companies);
}

class MenuPageLoadedFailure extends MenuPageState {
  final String message;

  MenuPageLoadedFailure(this.message);
}
