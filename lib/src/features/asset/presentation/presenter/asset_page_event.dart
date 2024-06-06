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
  final String value;

  const SearchByName(this.value);

  @override
  List<Object?> get props => [
        value,
      ];
}
