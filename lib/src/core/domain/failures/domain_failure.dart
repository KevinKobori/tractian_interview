import 'package:equatable/equatable.dart';

class DomainFailure extends Equatable implements Exception {
  final String reasonPhrase;

  const DomainFailure._(this.reasonPhrase);

  const DomainFailure.unexpected() : this._('Unexpected error occurred.');

  @override
  String toString() => '''
    const DomainFailure(
      reasonPhrase: $reasonPhrase,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
      ];
}
