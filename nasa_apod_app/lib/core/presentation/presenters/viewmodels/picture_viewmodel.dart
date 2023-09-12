class PictureViewModel {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  PictureViewModel({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  @override
  String toString() {
    return 'PictureViewModel(date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }
}
