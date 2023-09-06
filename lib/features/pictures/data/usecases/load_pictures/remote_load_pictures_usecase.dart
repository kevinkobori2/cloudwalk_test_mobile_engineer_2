import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteLoadPicturesUseCase implements IRemoteLoadPicturesUseCase {
  final IPictureRepository picturesRepository;
  final String url;

  RemoteLoadPicturesUseCase({
    required this.picturesRepository,
    required this.url,
  });

  /// Example illustrating the use of the "package:multiple_result" library.
  @override
  Future<Result<List<ApodObjectEntity>, DomainException>>
      loadLastTenDaysData() async =>
          await picturesRepository.getLastTenDaysData(url);
}