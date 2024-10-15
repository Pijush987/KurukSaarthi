//
// import 'package:flutter/material.dart';
// import 'package:kuruk_saarthi/configs/color/color.dart';
// import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
//
// class Customdropdown extends StatelessWidget {
//   const Customdropdown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       fit: StackFit.loose,
//       children: [
//
//         Container(
//           width: context.mediaQueryWidth*0.9,
//           height: 55,
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.dropdownBorderColor),
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
//           ),
//         ),
//         Positioned(
//           bottom: -100,
//           child: Container(
//             width: context.mediaQueryWidth*0.79,
//             height: 100,
//             decoration: BoxDecoration(
//                 color: Colors.red,
//                 border: Border.all(color: AppColors.dropdownBorderColor),
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
