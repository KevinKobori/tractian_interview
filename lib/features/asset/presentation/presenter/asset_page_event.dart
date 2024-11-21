import 'package:equatable/equatable.dart';

abstract class AssetPageEvent extends Equatable {
  const AssetPageEvent();
}

class LoadTree extends AssetPageEvent {
  final String companyId;
  const LoadTree(this.companyId);

  @override
  List<Object?> get props => [
        companyId,
      ];
}

class SearchByName extends AssetPageEvent {
  final String name;

  const SearchByName(this.name);

  @override
  List<Object?> get props => [
        name,
      ];
}

class SearchByEnergySensor extends AssetPageEvent {
  const SearchByEnergySensor();

  @override
  List<Object?> get props => [];
}

class SearchByAlertStatus extends AssetPageEvent {
  const SearchByAlertStatus();

  @override
  List<Object?> get props => [];
}
