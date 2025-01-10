import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/views/main_views/banners_view.dart';
import 'package:bamobile1/views/main_views/my_bookings_view.dart';
import 'package:bamobile1/views/main_views/reservation_search_view.dart';
import 'package:bamobile1/views/main_views/user_view.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/views/other-views/flight-other-views/get_reservations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/main_views/home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static String id = 'BottomNavBar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int? initialIndex =
        ModalRoute.of(context)?.settings.arguments as int?;
    if (initialIndex != null) {
      setState(() {
        selectedIndex = initialIndex;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    final firebaseCubit = BlocProvider.of<FirebaseCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);

    firebaseCubit.found = firebaseCubit.adminEmailList.any(
      (adminEmailModel) => adminEmailModel.email == authCubit.email,
    );

    // print('found is ${firebaseCubit.found}');
    //  print(authCubit.email);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CurrencyCodeCubit>(context).saveTimeAndStartTimer();
    final firebaseCubit = BlocProvider.of<FirebaseCubit>(context);

    List<Widget> pages = [
      const HomeView(),
      const ReservationSearchView(),
      const UserView(),
    ];

    if (firebaseCubit.found) {
      pages.add(const BannersView());
    }

    List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        label: S.of(context).Home,
        icon: const Icon(Icons.apps),
      ),
      BottomNavigationBarItem(
        label: S.of(context).ReservationSearch,
        icon: const Icon(Icons.search),
      ),
      BottomNavigationBarItem(
        label: S.of(context).Account,
        icon: const Icon(Icons.person),
      ),
    ];

    if (firebaseCubit.found) {
      bottomNavItems.add(
        const BottomNavigationBarItem(
          label: 'Banners View',
          icon: Icon(Icons.image),
        ),
      );
    }
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.kSecondColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          items: bottomNavItems),
    );
  }
}


  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //     BlocProvider.of<CurrencyCodeCubit>(context).saveTimeAndStartTimer();
  //   });