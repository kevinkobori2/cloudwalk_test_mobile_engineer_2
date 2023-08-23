import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension InfraErrorTypeExtension on InfraErrorType {
  DataErrorType get dataError {
    switch (this) {
      case InfraErrorType.unexpected:
        return DataErrorType.unexpected;
      case InfraErrorType.invalidData:
        return DataErrorType.invalidData;
      case InfraErrorType.notFound:
        return DataErrorType.notFound;
    }
  }
}
