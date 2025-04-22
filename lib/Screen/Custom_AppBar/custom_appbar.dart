
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Common%20Components/Common%20Widgets/logout_dialog.dart';
import 'package:template/Screen/Custom_AppBar/bottomNavigation_and_appbar_for_web.dart';
import 'package:template/Screen/Custom_AppBar/drawer_code.dart';
import 'package:template/Screen/Custom_AppBar/drawer_controller.dart';
import 'package:template/Screen/login/Controller/controller.dart';
import 'package:template/Theme/app_theme.dart';


//////************************************** CommonComponent for the EveryPage **************************************//////

enum Menu { preview, share, getLink, remove, download, masters}

class CommonScaffoldWithAppBar extends StatelessWidget {
  final Widget body;
  final Color? appBarBGColor, iconColor;
  final VoidCallback? leadingLink;
  final Widget? leadingChild;
  final Widget? titleChild;
  final List<Widget>? actionsWidget;
  final bool? centerTitle;
  final Widget? floatingActionButtonWidget;
  final bool showLeadingDrawer;
  final bool showEndDrawer;


  CommonScaffoldWithAppBar({
    super.key,
    required this.body,
    this.appBarBGColor,
    this.leadingLink,
    this.iconColor,
    this.leadingChild,
    this.titleChild,
    this.actionsWidget,
    this.centerTitle,
    this.floatingActionButtonWidget,
    this.showLeadingDrawer = true,
    this.showEndDrawer = false
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final loginController = Get.put(LoginController());
  final controller = Get.put(DrawerControllerX());
  
  void showTopDialog(BuildContext context) {
    Get.dialog(
      LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        if (MediaQuery.of(context).size.width < 700 &&
            !Get.find<DrawerControllerX>().isTextNotVisible) {
          Get.find<DrawerControllerX>().toggleShowText();
        }

        Widget drawer = AdaptiveDrawer(
          title: '',
          currentScreen: body,
          onScreenSelected: (screen) {
            if (!isLargeScreen) {
              Navigator.of(context).pop();
            }
          },
        );
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          key: scaffoldKey,
          appBar: AppBar(
            toolbarHeight: 64,
            elevation: 1.0,
            backgroundColor: appBarBGColor ?? Theme.of(context).colorScheme.primaryContainer,
            // toolbarHeight: 64,
            // automaticallyImplyLeading: false,
            // elevation: 0.0,
            // backgroundColor: appBarBGColor ?? Colors.transparent,
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
            //       colors: [Theme.of(context).colorScheme.secondaryContainer, Theme.of(context).colorScheme.secondary]),
            //   ),
            // ),
            // leadingChild: isLargeScreen ? leadingChild != null
            //     ? Align(
            //         alignment: Alignment.center,
            //         child: InkWell(
            //           highlightColor: Colors.transparent,
            //           onTap: leadingLink,
            //           child: leadingChild,
            //         ),
            //       )
            //     : IconButton(
            //         icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
            //         onPressed: () {
            //           if (!isLargeScreen) {
            //             scaffoldKey.currentState?.openDrawer();
            //           } else {
            //             Get.find<DrawerControllerX>().toggleShowText();
            //           }
            //         },
            //       ) : null,

            leading: isLargeScreen ? IconButton(
                    icon: Icon(Icons.menu, color: iconColor ?? Colors.black),
                    onPressed: () {
                      if (!isLargeScreen) {
                        scaffoldKey.currentState?.openDrawer();
                      } else {
                        Get.find<DrawerControllerX>().toggleShowText();
                      }
                    },  
                  ) : Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: leadingLink,
                      child: leadingChild,
                    ),
                  ),

            // titleChild: isLargeScreen ? buildWebNavigation() : null,
            title: titleChild != null ? titleChild! : Image.asset('assets/Images/Logo.png'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_rounded, color: iconColor ?? Colors.black)),
              // NotificationPopup(),
              SizedBox(width: 10.0),
              IconButton(onPressed: () {
                // AppTheme.lightTheme(context: context);
                print('Theme changed');
                Get.find<DrawerControllerX>().darkAnLightTheme() == true ? AppTheme.lightTheme(context: context) : AppTheme.darkTheme(context: context);
              }, icon: Icon(Icons.star_half_outlined, color: iconColor ?? Colors.black)),
              // NotificationPopup(),
              SizedBox(width: 10.0),
              PopupMenuButton<Menu>(
                offset: Offset(-25, 40),
                      // popUpAnimationStyle: _animationStyle,
                      icon: const Icon(Icons.account_circle_sharp, color: Colors.black),
                      onSelected: (Menu item) {},
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                        PopupMenuItem<Menu>(
                          value: Menu.preview,
                          child: ListTile(
                            leading: Icon(Icons.visibility_outlined),
                            title: Text('My Account'),
                            onTap: () {
                              Get.toNamed('/responsiveProfileScreen');
                            },
                          ),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.share,
                          child: ListTile(
                            leading: Icon(Icons.share_outlined),
                            title: Text('Settings'),
                            
                          ),
                        ),
                        PopupMenuItem<Menu>(
                          value: Menu.masters,
                          child: ListTile(
                            leading: Icon(Icons.supervisor_account_outlined),
                            title: Text('Masters'),
                            onTap: () {
                              Get.toNamed('/mastersListScreen');
                            },
                          ),
                        ),
                        PopupMenuItem<Menu>(
                          value: Menu.getLink,
                          child: ListTile(
                            leading: Icon(Icons.link_outlined),
                            title: Text('Logout'),
                            onTap: () {
                              showTopDialog(context);
                            },
                          ),
                        ),
                        // const PopupMenuDivider(),
                        // const PopupMenuItem<Menu>(
                        //   value: Menu.remove,
                        //   child: ListTile(
                        //     leading: Icon(Icons.delete_outline),
                        //     title: Text('Remove'),
                        //   ),
                        // ),
                        // const PopupMenuItem<Menu>(
                        //   value: Menu.download,
                        //   child: ListTile(
                        //     leading: Icon(Icons.download_outlined),
                        //     title: Text('Download'),
                        //   ),
                        // ),
                      ],
                    ),
              SizedBox(width: 10),

              /////   Code for the Right side drawer Already given the bool value if we giv ethe bool value is enough

              // isLargeScreen ? IconButton(
              //       icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
              //       onPressed: () {
              //         if (!isLargeScreen) {
              //           scaffoldKey.currentState?.openDrawer();
              //         } else {
              //           Get.find<DrawerControllerX>().toggleShowText();
              //         }
              //       },
              //     ) : Align(
              //       alignment: Alignment.center,
              //       child: InkWell(
              //         highlightColor: Colors.transparent,
              //         onTap: leadingLink,
              //         child: leadingChild,
              //       ),
              //     ),

              SizedBox(width: isLargeScreen ? 30 : 10),
            ],
            centerTitle: centerTitle,
          ),
          drawer: !isLargeScreen && showLeadingDrawer ? drawer : null,
          endDrawer: !isLargeScreen && showEndDrawer ? drawer : null,
          body: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (isLargeScreen && showLeadingDrawer)
                  Obx(() => SizedBox(
                    width: Get.find<DrawerControllerX>().isTextNotVisible ? 250 : 70,
                    child: drawer,
                  )),
                // VerticalDivider(thickness: 0.5, width: 0.5,),

                Expanded(child: body),

                if (isLargeScreen && showEndDrawer)
                  VerticalDivider(thickness: 0.5, width: 0.5,),
                if (isLargeScreen && showEndDrawer)
                  Obx(() => SizedBox(
                    width: Get.find<DrawerControllerX>().isTextNotVisible ? 250 : 70,
                    child: drawer,
                  )),
              ],
            ),
          ),
          bottomNavigationBar: !isLargeScreen ? buildMobileNavigation() : null,
          floatingActionButton: floatingActionButtonWidget,
        );
      },
    );
  }
}

/////////////////////         Main        //////////////////////

// class AdaptiveDrawer extends StatefulWidget {
//   final String title;
//   final Widget currentScreen;
//   final Function(Widget) onScreenSelected;

//   const AdaptiveDrawer({
//     super.key,
//     required this.title,
//     required this.currentScreen,
//     required this.onScreenSelected,
//   });

//   @override
//   _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
// }

// class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
//   final drawerController = Get.find<DrawerControllerX>();

//   void onItemTapped(int index, String route) {
//     drawerController.selectedIndex = index;
//     Get.toNamed(route);
//   }

// //////************************************** Drawer & it's SubItems **************************************//////


//   @override
//   Widget build(BuildContext context) {
//     final drawerController = Get.find<DrawerControllerX>();
//     return Drawer(
//       elevation: 0,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           MediaQuery.of(context).size.width <= 700
//               ? Container(height: 70)
//               : Container(height: 0),
//            Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Members')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 0,
//                 onTapNavigation: () => onItemTapped(0, '/membersListScreen'),
//               )),
//            Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Add Members')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 1,
//                 onTapNavigation: () => onItemTapped(1, '/addMembers'),
//               )),
//           Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Profile')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 2,
//                 onTapNavigation: () => onItemTapped(2, '/profileScreen'),
//               )),
//         ],
//       ),
//     );
//   }
// }

////////////////////       Secondary List Dynamically Created       //////////////////////

class AdaptiveDrawer extends StatefulWidget {
  final String title;
  final Widget currentScreen;
  final Function(Widget) onScreenSelected;

  const AdaptiveDrawer({
    super.key,
    required this.title,
    required this.currentScreen,
    required this.onScreenSelected,
  });

  @override
  _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
}

class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
  final drawerController = Get.find<DrawerControllerX>();

  void onItemTapped(int index, String route) {
    drawerController.selectedIndex = index;
    Get.toNamed(route);
  }

  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'Masters List',
      'icon': Icons.list_alt_outlined,
      'route': '/mastersListScreen',
    },
    {
      'title': 'Leads',
      'icon': Icons.leaderboard_outlined,
      'route': '/leadsListScreen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 0,
      child: Column(
        children: [
          MediaQuery.of(context).size.width <= 700
              ? const SizedBox(height: 70)
              : const SizedBox.shrink(),

          Expanded(
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: Column(
            //     children: [
            //       Text('Strategic Management', style: TextStyle(color: Colors.grey[300], fontSize: 16)),
            //         Obx(() => CommonCardForDrawer(
            //       title: drawerController.isTextNotVisible
            //           ? const Text('Leads')
            //           : const SizedBox.shrink(),
            //       icon: const Icon(Icons.supervisor_account_outlined),
            //       isSelected: drawerController.selectedIndex == 0,
            //       onTapNavigation: () => onItemTapped(0, '/mastersListScreen'),
            //     )),
            //     ],
            //   ),
            // ),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  final item = drawerItems[index];
                  return Obx(() => CommonCardForDrawer(
                                      // title: drawerController.isTextNotVisible
                                      //     ? Text(item['title'])
                                      //     : const SizedBox.shrink(),
                                      title : drawerController.isTextNotVisible
                                      ? Text(item['title'])
                                      : const SizedBox.shrink(),
                                      icon: Icon(item['icon']),
                                      isSelected: drawerController.selectedIndex == index,
                                      onTapNavigation: () => onItemTapped(index, item['route']),
                                    ));
                },
              ),
          ),
        ],
      ),
    );
  }
}
