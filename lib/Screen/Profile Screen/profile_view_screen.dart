import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/App%20Constants/app_constants.dart';
import 'package:template/Common%20Components/Common%20Widgets/common_shadowed_container_widget.dart';
import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:template/Common%20Components/Common%20Widgets/logout_dialog.dart';
import 'package:template/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:template/Routes/app_pages.dart';
import 'package:template/Screen/Profile%20Screen/Controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        titleChild: Text("Profile Details"),
        // leadingChild: IconButton(onPressed: () {
        //   Get.back();
        // }, icon: Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<ProfileController>(
        initState: (_) => ProfileController.to.initState(),
        builder: (va) => SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: Theme.of(context).colorScheme.primaryContainer,
              height: Get.height * (310 - AppBar().preferredSize.height) / 896,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: PrimaryGradiantContainer(
                      onlyBottomRadius: true,
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.height * 20 / 896,
                            ),
                            Row(
                              children: [
                               Container(
                                height: Get.height * 74 / 896,
                                width: Get.width * 74 / 414,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    controller.userDetails.profilePicture ?? 'assets/profile.svg',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: SvgPicture.asset('assets/profile.svg'),
                                      );
                                    },
                                  ),
                                ),
                              ),
                                Container(
                                  width: Get.width * 20 / 414,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name : ${controller.userDetails.fullname}",
                                      style: TextStyle(
                                          fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).colorScheme.primaryContainer),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: Get.height * 10 / 896,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/phone.svg'),
                                Container(
                                  width: Get.width * 5 / 414,
                                ),
                                Text("Phone Number : ${controller.userDetails.phone}",
                                  style: TextStyle(
                                      fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Container(
                              height: Get.height * 10 / 896,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/mail.svg'),
                                Container(
                                  width: Get.width * 5 / 414,
                                ),
                                Text('Email : ${controller.userDetails.email}',
                                  style: TextStyle(
                                      fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Container(
                              height: Get.height * 10 / 896,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/user_outline.svg', color: Colors.white),
                                Container(
                                  width: Get.width * 5 / 414,
                                ),
                                Text('Gender : ${controller.userDetails.genderName}',
                                  style: TextStyle(
                                      fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Container(
                              height: Get.height * 10 / 896,
                            ),
                            Row(
                              children: [
                                // SvgPicture.asset('assets/icons/user_outline.svg', color: Colors.white),
                                Icon(Icons.supervised_user_circle_outlined, color: Colors.white,size: 14.0),
                                Container(
                                  width: Get.width * 5 / 414,
                                ),
                                Text('Community Name : ${controller.userDetails.community?.name}',
                                  style: TextStyle(
                                      fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   height: Get.height * 20 / 896,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.changePasswordView);
                    },
                    child: ShadowContainer(
                      defaultRadius: false,
                      radius: 8,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Change Password',
                            style: TextStyle(
                                fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primaryFixed),
                          ),
                          SvgPicture.asset(
                            'assets/icons/change_password.svg',
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 20 / 896,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        LogoutDialog(),
                      );
                    },
                    child: ShadowContainer(
                      defaultRadius: false,
                      radius: 8,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primaryFixed),
                          ),
                          SvgPicture.asset(
                            'assets/icons/check_out_icon.svg',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
