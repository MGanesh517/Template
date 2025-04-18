// import 'package:template/Common%20Components/common_services.dart';
// import 'package:template/Screen/Community_Members/community_members_list.dart';
// import 'package:template/Screen/Profile%20Screen/profile_view_screen.dart';
// import 'package:template/Screen/dashboard_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DashboardView extends StatefulWidget {
//   const DashboardView({super.key});

//   @override
//   DashboardViewState createState() => DashboardViewState();
// }

// class DashboardViewState extends State<DashboardView> {
//   final controller = Get.put(DashBoardControlelr());

//   // int selectedIndex = 0;
//   var commonService = CommonService.instance;

//   void onItemTapped(int index) {
//     setState(() {
//       controller.selectedIndex = index;
//     });
//   }

//   final screens = [
//     MembersList(),
//     // AddMembers()
//     ProfileView()
//     ];

//   @override
//   Widget build(BuildContext context) {

//     return PopScope(
//       // onWillPop: () async => Navigator.of(context).userGestureInProgress,
//       canPop: false,
//       child: Scaffold(
//         body: screens[controller.selectedIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.grey[100],
//           elevation: 4,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.supervised_user_circle_outlined),
//               activeIcon: Icon(Icons.supervised_user_circle_outlined),
//               label: 'Members List',
//               // label: 'Delivery List'
//             ),
//             // BottomNavigationBarItem(
//             //   icon: Icon(Icons.person_add_alt_outlined),
//             //   activeIcon: Icon(Icons.person_add_alt_outlined),
//             //   label: 'Add Members',
//             // ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               activeIcon: Icon(Icons.person),
//               label: 'Account',
//             ),
//           ],
//           currentIndex: controller.selectedIndex,
//           selectedItemColor: Theme.of(context).colorScheme.primary,
//           onTap: onItemTapped,
//         ),
//       ),
//     );
//   }
// }
