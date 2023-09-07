import 'package:cached_network_image/cached_network_image.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class PictureDetailsPage extends StatefulWidget {
  final PictureViewModel? pictureViewModel;
  final String pictureDate;

  const PictureDetailsPage(this.pictureDate,
      {super.key, required this.pictureViewModel});

  @override
  State<PictureDetailsPage> createState() => _PictureDetailsPageState();
}

class _PictureDetailsPageState extends State<PictureDetailsPage> {
  final ValueNotifier<PictureViewModel?> rxPictureViewModel =
      ValueNotifier<PictureViewModel?>(null);

  Future<PictureViewModel> getPictureViewModelFromLocalStorage() async {
    final pictureMapList =
        await LocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadPicturesUseCaseFactory().itemKey);

    int pictureMapIndex = pictureMapList
        .indexWhere((dynamic pictureMap) => pictureMap['date'] == widget.pictureDate);
    final pictureMap = pictureMapList[pictureMapIndex];

    final pictureViewModel =
        await PictureMapper().fromMapToViewModel(pictureMap);
    return pictureViewModel;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.pictureViewModel == null) {
        rxPictureViewModel.value = await getPictureViewModelFromLocalStorage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: rxPictureViewModel,
        builder: (_, viewModel, __) {
          final picture = widget.pictureViewModel ?? viewModel;
          return ListView(
            children: [
              CachedNetworkImage(
                imageUrl: picture!.url,
                placeholder: (_, __) => Container(
                  color: Colors.black,
                  height: 240,
                  width: double.infinity,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: Colors.deepOrange,
                  height: 240,
                  width: double.infinity,
                  child: const Icon(Icons.error),
                ),
                fadeOutDuration: const Duration(milliseconds: 1),
                fadeInDuration: const Duration(milliseconds: 1),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      picture.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Secular_One',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      picture.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Secular_One',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      picture.explanation,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Secular_One',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}