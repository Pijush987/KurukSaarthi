import 'dart:developer' as log;
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_event.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

void showImageSourceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(AppLocalizations.of(context)!.selectImageSource,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.chooseAnOptionToSelectAnImageFromYourGalleryOrCaptureOneUsingYourCamera,
              style: TextStyle(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    getTextFromImage(false,context);
                  },
                  icon: Icon(Icons.photo_library, color: AppColors.primaryColor),
                  label: Text(AppLocalizations.of(context)!.gallery),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    getTextFromImage(true,context);
                  },
                  icon: Icon(Icons.camera_alt, color: AppColors.primaryColor),
                  label: Text(AppLocalizations.of(context)!.camera),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
//
// final picker = ImagePicker();
//
// after capture image I want's to crop this image
// how can i do that in flutter

Future<void> getTextFromImage(bool fromCamera, BuildContext context) async {
  final picker = ImagePicker();

  // Pick an image from the camera or gallery
  final pickedFile = await picker.pickImage(
    source: fromCamera ? ImageSource.camera : ImageSource.gallery,
  );
  log.log("Error:1");
  if (pickedFile == null) return; // User canceled the picker
  log.log("Error:1  $pickedFile");

  if (pickedFile != null) {
    // Crop the image
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPresetCustom(),
            ],
          ),
        ],
    );

    if (croppedFile != null) {
      // Use the cropped image file
      log.log('Cropped file path: ${croppedFile.path}');
      final inputImage = InputImage.fromFile(File(croppedFile.path));
      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

      try {
        log.log("Error: 2");
        final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

        String text = recognizedText.text;
        for (TextBlock block in recognizedText.blocks) {
          final Rect rect = block.boundingBox;

          final List<Point<int>> cornerPoints = block.cornerPoints;
          final String text = block.text;
          log.log("element  43434$text");

          if(text.isNotEmpty){

            log.log("element  43434$text");
            context.read<ListsBloc>().add(FetchLists(searchQuery: text,refresh: true));
            Navigator.pop(context);
          }
          // final List<String> languages = block.recognizedLanguages;
          //
          // for (TextLine line in block.lines) {
          //   // Same getters as TextBlock
          //   for (TextElement element in line.elements) {
          //     // Same getters as TextBlock
          //     log.log("element  777$text");
          //   }
          // }
        }
      } catch (e) {
        log.log("Error: $e");
      } finally {
        // Release resources
        textRecognizer.close();
      }
    }


  }
}
class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
