import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';
import 'package:bamobile1/models/admin_email_model.dart';
import 'package:bamobile1/models/version.model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());

//adminList

  List<AdminEmailModel> adminEmailList = [];
  bool found = false;
  String versionAndroid = '';
  String versionIos = '';
  Future<void> getAdminEmailsData(BuildContext context) async {
    print('Fetching admin emails...');
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('adminList').get();

      if (snapshot.docs.isEmpty) {
        print('No documents found in adminList collection.');
        return;
      }

      for (var element in snapshot.docs) {
        print(element.data());
        adminEmailList.add(AdminEmailModel.fromJson(element.data()));
      }

      print('Fetched admin emails successfully! Admin list: $adminEmailList');
    } catch (e) {
      print('Error fetching admin emails: $e');
    }
  }

  Future<void> getVersionData() async {
    print('Fetching version data...');
    try {
      // جلب المستند المحدد
      final snapshot = await FirebaseFirestore.instance
          .collection('version')
          .doc('versions')
          .get();

      if (!snapshot.exists) {
        print('Document not found.');
        return;
      }

      final data = snapshot.data();
      if (data == null) {
        print('Document data is null.');
        return;
      }

      final version = VersionModel.fromJson(data);

      // استخدام القيم
      print('Android Version: ${version.android}, iOS Version: ${version.ios}');

      versionAndroid = version.android;
      versionIos = version.ios;
    } catch (e) {
      print('Error fetching version data: $e');
    }
  }
}
