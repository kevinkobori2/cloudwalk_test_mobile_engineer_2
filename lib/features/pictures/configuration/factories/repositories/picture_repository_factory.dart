import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

PictureRepository pictureRepositoryFactory() =>
    PictureRepository(pictureDatasourceFactory());
