// import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
// import 'package:bamobile1/utils/app_colors.dart';
// import 'package:bamobile1/utils/app_sizes.dart';
// import 'package:bamobile1/views/other-views/sign_in_view.dart';
// import 'package:bamobile1/widgets/text_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
//     return Drawer(
//       surfaceTintColor: Colors.amber,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: AppColors.kSecondColor,
//             ),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: context.height * 0.04,
//                   child: Image.network(
//                     authCubit.agentUrlImage ?? 'assets/images/user.png',
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Image.asset(
//                         'assets/images/user.png',
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 6),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(
//                         textAlign: TextAlign.start,
//                         isHaveOverflow: true,
//                         text:
//                             '${authCubit.agentFirstName ?? '-------------'} ${authCubit.agentLastName ?? '-------------'}',
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                       TextWidget(
//                         textAlign: TextAlign.start,
//                         isHaveOverflow: true,
//                         text: authCubit.agentEmail ?? '-------------',
//                         fontSize: 12,
//                         color: Colors.black45,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.help),
//             title: const Text('iletişim'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: const Text('Çıkış Yap'),
//             onTap: () {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 SignInView.id,
//                 (Route<dynamic> route) => false,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
