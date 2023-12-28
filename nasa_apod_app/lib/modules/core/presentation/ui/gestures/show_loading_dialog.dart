import 'package:flutter/scheduler.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

Future<void> showLoadingDialog(
    {required BuildContext context, required String description}) async {
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    await showDialog<Widget>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(color: Colors.white),
              AppGapsSizes.small,
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  });
}

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}