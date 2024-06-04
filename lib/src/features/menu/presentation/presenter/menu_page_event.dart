import 'package:equatable/equatable.dart';

abstract class MenuPageEvent extends Equatable {
  const MenuPageEvent();
}

class LoadAllCompanies extends MenuPageEvent {
  const LoadAllCompanies();

  @override
  List<Object?> get props => [];
}

class PushToCompanyAssetsPage extends MenuPageEvent {
  final String companyId;

  const PushToCompanyAssetsPage(this.companyId);

  @override
  List<Object?> get props => [
        companyId,
      ];
}
