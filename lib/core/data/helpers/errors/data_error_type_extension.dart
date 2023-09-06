import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension DataErrorTypeExtension on DataErrorType {
  DomainErrorType get domainError {
    switch (this) {
      case DataErrorType.unexpected:
        return DomainErrorType.unexpected;
      case DataErrorType.invalidData:
        return DomainErrorType.unexpected;
      case DataErrorType.notFound:
        return DomainErrorType.unexpected;
    }
  }
}