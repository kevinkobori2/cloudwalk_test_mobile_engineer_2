import 'package:multiple_result/multiple_result.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureRepository implements IPictureRepository {
  final IPictureDatasource pictureDatasource;

  PictureRepository(this.pictureDatasource);

  @override
  Future<Result<List<PictureEntity>, DomainException>> getLastTenDaysData(
      String url) async {
    final resultDataSource = await pictureDatasource.fetchLastTenDaysData(url);

    return resultDataSource.when((modelList) {
      return PictureMapper().fromModelListToEntityList(modelList);
    }, (dataException) {
      return Error(DomainException(dataException.errorType.domainError));
    });
  }
}