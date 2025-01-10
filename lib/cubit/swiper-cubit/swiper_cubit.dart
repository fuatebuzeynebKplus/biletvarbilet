import 'dart:io';
import 'dart:math';

import 'package:bamobile1/models/city_codes_and_airport_codes_model.dart';
import 'package:bamobile1/models/swiper_images_model.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'swiper_state.dart';

class SwiperCubit extends Cubit<SwiperState> {
  SwiperCubit() : super(SwiperInitial());

  List<SwiperModel> swiperModelList = [];

  XFile? pickImage;
  String? imageUrl;

  String? imagefinishUrl;
  String bannerUrl = '';
  String? newBannerUrl;

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function galleryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: TextWidget(
                text: "Choose option",
              ),
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text(
                    "Gallery",
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text(
                    "sil",
                  ),
                ),
              ],
            )),
          );
        });
  }

  void makeBannerImageNull() {
    swiperModelList[saveIndexVale!].image = null;
    emit(MakeBannerImageNullState());
  }

  Future<void> localImagePicker(
    BuildContext context,
  ) async {
    final ImagePicker picker = ImagePicker();
    await imagePickerDialog(
      galleryFCT: () async {
        pickImage = await picker.pickImage(source: ImageSource.gallery);
        emit(LocalImagePickerState());
      },
      removeFCT: () {
        pickImage = null;
      },
      context: context,
    );
    emit(LocalImagePickerState());
  }

  Future<void> addImage() async {
    emit(AddImageLoading());
    try {
      String bannerImageId = "${const Uuid().v4()}.jpg";

      final ref =
          FirebaseStorage.instance.ref().child("slider").child(bannerImageId);

      await ref.putFile(File(pickImage!.path));

      imagefinishUrl = await ref.getDownloadURL();

      print("File uploaded successfully: ");

      await FirebaseFirestore.instance.collection('swiperImages').add({
        'image': imagefinishUrl,
        'url': bannerUrl,
      });

      emit(AddImageSuccess());
      pickImage = null;
    } catch (e) {
      emit(AddImageFailure(massError: e.toString()));
      print('------------------------------------------------------------');
      print("Failed to upload file: $e");
      print('------------------------------------------------------------');
    }
    pickImage = null;
  }

  int? saveIndexVale;
  void saveIndex({required int index}) {
    saveIndexVale = null;
    saveIndexVale = index;
  }

  getImagesData() async {
    swiperModelList = [];
    try {
      emit(SwiperLoading());
      await FirebaseFirestore.instance.collection('swiperImages').get().then(
            (value) => value.docs.forEach(
              (element) {
                swiperModelList.add(
                  SwiperModel.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      swiperModelList.shuffle(Random());
      emit(SwiperSuccess());
    } on Exception catch (e) {
      emit(SwiperFailure(massError: e.toString()));
    }
  }

  Future<void> updateBannerImages(
      {String? bannerUrl, XFile? bannerImage}) async {
    emit(UpdateOrDeleteImageLoading());
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('swiperImages')
          .where('url', isEqualTo: swiperModelList[saveIndexVale!].url)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;

        String bannerImageId = "${const Uuid().v4()}.jpg";

        final ref =
            FirebaseStorage.instance.ref().child("banner").child(bannerImageId);

        await ref.putFile(File(bannerImage!.path));

        imagefinishUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('swiperImages')
            .doc(docId)
            .update({
          'image': imagefinishUrl,
          'url': bannerUrl,
        });
        emit(UpdateOrDeleteImageSuccess());
        print("Document successfully updated!");
      } else {
        emit(UpdateOrDeleteImageFailure(
          massError: 'No document found with the specified URL',
        ));
        print("No document found with the specified URL");
      }
    } catch (e) {
      emit(UpdateOrDeleteImageFailure(
        massError: 'Error updating document: $e',
      ));
      print("Error updating document: $e");
    }
    pickImage = null;
  }

  Future<void> deleteBannerImage(String bannerUrl) async {
    emit(UpdateOrDeleteImageLoading());
    try {
      // البحث عن الوثيقة في Firestore باستخدام عنوان URL
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('swiperImages')
          .where('url', isEqualTo: bannerUrl)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        if (saveIndexVale != null &&
            saveIndexVale! < querySnapshot.docs.length) {
          final docId = querySnapshot.docs[saveIndexVale!].id;

          // حذف الوثيقة من Firestore فقط
          await FirebaseFirestore.instance
              .collection('swiperImages')
              .doc(docId)
              .delete();

          emit(UpdateOrDeleteImageSuccess());
          pickImage = null;
          print("Document successfully deleted!");
        } else {
          emit(UpdateOrDeleteImageFailure(
            massError: 'Invalid saveIndexVale',
          ));
          print("Invalid saveIndexVale");
        }
      } else {
        emit(UpdateOrDeleteImageFailure(
          massError: 'No document found with the specified URL',
        ));
        print("No document found with the specified URL");
      }
    } catch (e) {
      emit(UpdateOrDeleteImageFailure(
        massError: 'Error deleting document: ${e.toString()}',
      ));
      print("Error deleting document: ${e.toString()}");
    }
  }

  //---------------------------------------------------
//LAvBY4lNWF3eGOxXKANI
}
