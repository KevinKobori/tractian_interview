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

class SearchItem extends AssetPageEvent {
  final String value;

  const SearchItem(this.value);

  @override
  List<Object?> get props => [
        value,
      ];
}
