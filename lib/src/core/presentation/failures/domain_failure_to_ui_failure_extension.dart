import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';

extension DomainFailureToUIFailureExtension on DomainFailure {
  String toUI() {
    switch (this) {
      case DomainFailure.unexpected:
        return 'Unexpected Failure!';
      default:
        return 'Unexpected Failure!';
    }
  }
}
