mixin ApodObjectFactory {
  Map<String, String> generateValidApodObjectMap() => {
        'date': '2023-08-20',
        'explanation':
            'What kind of cloud is this?  A type of arcus cloud called a roll cloud.  These rare long clouds may form near advancing cold fronts.   In particular, a downdraft from an advancing storm front can cause moist warm air to rise, cool below its dew point, and so form a cloud.  When this happens uniformly along an extended front, a roll cloud may form.  Roll clouds may actually have air circulating along the long horizontal axis of the cloud.  A roll cloud is not thought to be able to morph into a tornado.  Unlike a similar shelf cloud, a roll cloud is completely detached from their parent  cumulonimbus cloud.  Pictured here, a roll cloud extends far into the distance as a storm approaches in 2007 in Racine, Wisconsin, USA.',
        'hdurl':
            'https://apod.nasa.gov/apod/image/2308/rollcloud_hanrahan_3072.jpg',
        'media_type': 'image',
        'service_version': 'v1',
        'title': 'A Roll Cloud Over Wisconsin',
        'url':
            'https://apod.nasa.gov/apod/image/2308/rollcloud_hanrahan_960.jpg'
      };

  Map<String, String> generateInvalidApodObjectMap() => {
        'invalid_key': 'invalid_value',
      };

  List<Map<String, String>> generateValidApodObjectMapList() => [
        generateValidApodObjectMap(),
        generateValidApodObjectMap(),
      ];

  List<Map<String, String>> generateInvalidApodObjectMapList() => [
        generateInvalidApodObjectMap(),
        generateInvalidApodObjectMap(),
      ];
}