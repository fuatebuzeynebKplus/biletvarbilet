import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/flight-other-views/get_reservations_view.dart';
import 'package:bamobile1/views/other-views/sign_in_view.dart';
import 'package:bamobile1/views/other-views/sign_up_view.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/drawer_widget.dart';
import 'package:bamobile1/widgets/list_title_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/user_view_widgets/currency_code_alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CurrencyCodeCubit currencyCodeCubit =
        BlocProvider.of<CurrencyCodeCubit>(context);

    return BlocConsumer<SettingsAppCubit, SettingsAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        SettingsAppCubit settingsAppCubit =
            BlocProvider.of<SettingsAppCubit>(context);
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                      isHaveBorder: false,
                      heightTest: 0.13,
                      widthTest: 1,
                      widget: Column(
                        children: [
                          TextWidget(
                            textAlign: TextAlign.left,
                            text: S.of(context).AppCloseMessage,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: TextWidget(
                                  color: AppColors.kSecondColor,
                                  text: S.of(context).No,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  SystemNavigator.pop();
                                },
                                child: TextWidget(
                                  color: AppColors.kSecondColor,
                                  text: S.of(context).Yes,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                });
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.skewX(-0.15),
                    child: const TextWidget(
                      text: 'bilet',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  Transform(
                    transform: Matrix4.skewX(-0.2),
                    child: TextWidget(
                      text: 'Var',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  Transform(
                    transform: Matrix4.skewX(-0.15),
                    child: const TextWidget(
                      text: 'bilet',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            //   drawer: const DrawerWidget(),
            backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 12,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Merhaba',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kAppBarColor,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                TextWidget(
                                  text: getIt<CacheHelper>()
                                          .getDataString(key: 'firstName') ??
                                      'User Name,',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kSecondColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Stack(
                        //   children: [
                        //     Container(
                        //       height: context.height * 0.2,
                        //       width: context.width * 1,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(16),
                        //           color: Colors.white),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(4.0),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             CircleAvatar(
                        //               backgroundColor: Colors.transparent,
                        //               radius: context.height * 0.055,
                        //               child: Image.network(
                        //                 'https://my.kplus.com.tr${authCubit.agentUrlImage}',
                        //                 fit: BoxFit.cover,
                        //                 errorBuilder:
                        //                     (context, error, stackTrace) {
                        //                   return Image.asset(
                        //                     'assets/images/user.png',
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               height: 8,
                        //             ),
                        //             TextWidget(
                        //               text:
                        //                   '${authCubit.agentFirstName ?? '-------------'} ${authCubit.agentLastName ?? '-------------'}',
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black,
                        //             ),
                        //             TextWidget(
                        //               text: authCubit.agentEmail ??
                        //                   '-------------',
                        //               fontSize: 12,
                        //               color: Colors.black45,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: S.of(context).USerInformation,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        ListTitleWidget(
                          icon: Icons.person,
                          text: getIt<CacheHelper>()
                                      .getDataString(key: 'firstName') ==
                                  null
                              ? '${S.of(context).Name} ${S.of(context).LastName}'
                              : '${getIt<CacheHelper>().getDataString(key: 'firstName')} ${getIt<CacheHelper>().getDataString(key: 'lastName')}',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTitleWidget(
                          icon: Icons.calendar_month,
                          text: getIt<CacheHelper>()
                                  .getDataString(key: 'birthday') ??
                              S.of(context).BirthDay,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTitleWidget(
                          icon: Icons.phone,
                          text: getIt<CacheHelper>()
                                  .getDataString(key: 'phone') ??
                              S.of(context).PhoneNumber,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTitleWidget(
                          icon: Icons.mail,
                          text: getIt<CacheHelper>()
                                  .getDataString(key: 'email') ??
                              S.of(context).EMail,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTitleWidget(
                            icon: Icons.phone,
                            text: getIt<CacheHelper>()
                                    .getDataString(key: 'password') ??
                                S.of(context).Password),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: S.of(context).Language,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonWidget(
                                  title: S.of(context).Turkish,
                                  height: 0.04,
                                  width: 0.3,
                                  fontSize: 12,
                                  textColor: settingsAppCubit.locale == 'tr'
                                      ? AppColors.kSecondColor
                                      : Colors.black54,
                                  border: settingsAppCubit.locale == 'tr'
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    settingsAppCubit.selectLanguageFunction(
                                        value: 'tr');
                                  },
                                ),
                                ButtonWidget(
                                  title: S.of(context).English,
                                  height: 0.04,
                                  width: 0.3,
                                  fontSize: 12,
                                  textColor: settingsAppCubit.locale == 'en'
                                      ? AppColors.kSecondColor
                                      : Colors.black54,
                                  border: settingsAppCubit.locale == 'en'
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    settingsAppCubit.selectLanguageFunction(
                                        value: 'en');
                                  },
                                ),
                                ButtonWidget(
                                  title: S.of(context).Arabic,
                                  height: 0.04,
                                  width: 0.3,
                                  fontSize: 12,
                                  textColor: settingsAppCubit.locale == 'ar'
                                      ? AppColors.kSecondColor
                                      : Colors.black54,
                                  border: settingsAppCubit.locale == 'ar'
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    settingsAppCubit.selectLanguageFunction(
                                        value: 'ar');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          children: [
                            // const Row(
                            //   children: [
                            //     TextWidget(
                            //       text: 'Currency Code',
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.black54,
                            //     ),
                            //   ],
                            // ),

                            Row(
                              children: [
                                TextWidget(
                                  text: S.of(context).Currency,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            BlocConsumer<CurrencyCodeCubit, CurrencyCodeState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return ButtonWidget(
                                  title:
                                      ' ${currencyCodeCubit.currencyNameValue} - ${currencyCodeCubit.currencyCodeValue} ',
                                  height: 0.05,
                                  width: 1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  color: AppColors.kSecondColor,
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialogWidget(
                                            isHaveBorder: true,
                                            heightTest: 0.5,
                                            widthTest: 0.9,
                                            widget:
                                                CurrencyCodeAlertDialogWidget(),
                                          );
                                        });
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: context.height * 0.01,
                            ),
                            ButtonWidget(
                              title: getIt<CacheHelper>()
                                          .getDataString(key: 'email') !=
                                      null
                                  ? 'LogOut'
                                  : S.of(context).Login,
                              height: 0.05,
                              width: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                              color: AppColors.kSecondColor,
                              onTap: () {
                                Navigator.pushNamed(context, SignInView.id);
                              },
                            )
                          ],
                        ),

                        // authCubit.thisUserIsAgent == false
                        //     ? const SizedBox()
                        //     : const SizedBox(
                        //         height: 6,
                        //       ),
                        // authCubit.thisUserIsAgent == false
                        //     ? const SizedBox()
                        //     : ButtonWidget(
                        //         title: S.of(context).MyReservation,
                        //         onTap: () {
                        //           Navigator.pushNamed(
                        //               context, GetReservationsView.id);
                        //           BlocProvider.of<FlightTicketCubit>(context)
                        //               .getReservations(context);
                        //         },
                        //         height: 0.05,
                        //         width: 1,
                        //         fontSize: 16,
                        //         textColor: Colors.white,
                        //         color: AppColors.kSecondColor,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // ButtonWidget(
                        //   title: 'Logout',
                        //   onTap: () {},
                        //   height: 0.06,
                        //   width: 1,
                        //   fontSize: 20,
                        //   textColor: Colors.white,
                        //   color: AppColors.kSecondColor,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
