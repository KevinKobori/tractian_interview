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

class PushToAssetPage extends HomePageEvent {
  final BuildContext context;
  final String companyId;

  const PushToAssetPage(
    this.context,
    this.companyId,
  );

  @override
  List<Object?> get props => [
        context,
        companyId,
      ];
}
