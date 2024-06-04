import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadAllCompaniesUnit extends HomePageEvent {
  const LoadAllCompaniesUnit();

  @override
  List<Object?> get props => [];
}

class PushToCompanyAssetPage extends HomePageEvent {
  final BuildContext context;
  final String companyId;

  const PushToCompanyAssetPage(
    this.context,
    this.companyId,
  );

  @override
  List<Object?> get props => [
        companyId,
      ];
}
