import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/transaction_result_widget.dart';
import 'package:flutter/material.dart';

class MyBookingsView extends StatelessWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        toolbarHeight: context.height * 0.06,
        automaticallyImplyLeading: false,
        title: const AppBarWidget(),
        backgroundColor: Colors.transparent,
      ),
      body: const TransactionResultWidget(
        image: AppImages.errorIcon,
        title: 'Ödeme Başarısız!!',
        subTitle: 'Hata Kodu',
        code: 'xxxxxx',
        buttonText: 'Tekrar Dene',
      ),
    );
  }
}
