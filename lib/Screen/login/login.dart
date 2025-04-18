// // class LoginView extends StatefulWidget {
// //   const LoginView({super.key});

// //   @override
// //   State<LoginView> createState() => _LoginViewState();
// // }

// // class _LoginViewState extends State<LoginView> {
// //   final controller = Get.put(LoginController());
// //   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     final isTablet = MediaQuery.of(context).size.width > 600;
    
// //     return Scaffold(
// //       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
// //       body: SafeArea(
// //         child: Center(
// //           child: isTablet ? buildTabletLayout(context) : buildMobileLayout(context),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildMobileLayout(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           SvgPicture.asset('assets/svg_icons/Splash.svg', height: 120),
// //           const SizedBox(height: 20),
// //           Text(
// //             'Login',
// //             style: TextStyle(
// //               fontSize: 24,
// //               fontWeight: FontWeight.bold,
// //               color: Theme.of(context).primaryColor,
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           buildLoginForm(context),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildTabletLayout(BuildContext context) {
// //     return Container(
// //       height: Get.height * 0.5,
// //       width: Get.width * 0.5,
// //       padding: EdgeInsets.all(20.0),
// //       decoration: BoxDecoration(
// //          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
// //                   colors: [Theme.of(context).colorScheme.secondaryContainer, Theme.of(context).colorScheme.secondary]),
// //               borderRadius: BorderRadius.circular(12),
// //               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
// //       ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           SvgPicture.asset('assets/svg_icons/Splash.svg', height: 150),
// //           const SizedBox(height: 30),
// //           buildLoginForm(context),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildLoginForm(BuildContext context) {
// //     return Form(
// //       key: formKey,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           CommonComponents.defaultLoginTextFormField(
// //             context,
// //             title: 'Username',
// //             hintText: 'Enter Username',
// //             controller: controller.userNameController,
// //             filled: true,
// //             prefixIcon: Padding(
// //               padding: const EdgeInsets.all(5.0),
// //               child: SvgPicture.asset('assets/svg_icons/mail.svg'),
// //             ),
// //             validator: (String? val) => val!.isEmpty ? 'Username is required' : null,
// //           ),
// //           const SizedBox(height: 20),
// //           CommonComponents.defaultLoginTextFormField(
// //             context,
// //             hintText: 'Enter Password',
// //             title: 'Password',
// //             filled: true,
// //             prefixIcon: Padding(
// //               padding: const EdgeInsets.all(5.0),
// //               child: SvgPicture.asset('assets/svg_icons/lock.svg'),
// //             ),
// //             controller: controller.passwordController,
// //             obscureText: controller.obscureText,
// //             suffixIcon: IconButton(
// //               icon: Icon(controller.obscureText ? Icons.visibility_off : Icons.visibility),
// //               onPressed: () => setState(() => controller.obscureText = !controller.obscureText),
// //             ),
// //             validator: (String? val) => val!.isEmpty ? 'Password is required' : null,
// //           ),
// //           const SizedBox(height: 30),
// //           SizedBox(
// //             width: double.infinity,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 padding: const EdgeInsets.symmetric(vertical: 15),
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //               ),
// //               onPressed: () {
// //                 if (formKey.currentState!.validate()) {
// //                   controller.loginServiceCall();
// //                 }
// //               },
// //               child: const Text('Login', style: TextStyle(fontSize: 18)),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// import 'package:expand_tap_area/expand_tap_area.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:template/App%20Constants/app_constants.dart';
// import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
// import 'package:template/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
// import 'package:template/Common%20Components/common_input_fields.dart';
// import 'package:template/Screen/login/Controller/controller.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 600) {
//           return _buildTabletView(context);
//         } else {
//           return _buildMobileView(context);
//         }
//       },
//     );
//   }

//   Widget _buildMobileView(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Scaffold(
//       appBar: CustomAppBar(height: 0.0),
//       body: SafeArea(
//         bottom: false,
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: 0,
//               top: MediaQuery.of(context).size.height / 2 - 50,
//               child: PrimaryGradiantContainer(onlyBottomRadius: true),
//             ),
//             Positioned(
//               top: 0,
//               child: PrimaryGradiantContainer(
//                 radius: 18.0,
//                 onlyBottomRadius: true,
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: Get.width,
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: Get.height * 90 / 896),
//                 Container(
//                                   height: Get.height * 178.48 / 896,
//                                   width:  Get.width * 191 / 414,
//                                   child: SvgPicture.asset('assets/svg_icons/Splash.svg')),
//                 SizedBox(height: Get.height * 55 / 896),
//                 SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),
//                 Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     children: [
//                       SizedBox(height: Get.height * 90 / 896),
//                       Text(
//                         "Login",
//                         style: TextStyle(
//                           fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//                           fontWeight: FontWeight.w700,
//                           color: Theme.of(context).colorScheme.surface,
//                         ),
//                       ),
//                       SizedBox(height: Get.height * 5 / 896),
//                       _buildLoginForm(context, controller),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabletView(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Scaffold(
//       appBar: CustomAppBar(height: 0.0),
//       body: Center(
//         child: Container(
//           height: Get.height * 0.5,
//           width: Get.width * 0.6,
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Theme.of(context).colorScheme.primaryContainer,
//             boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//           ),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                  SvgPicture.asset('assets/svg_icons/Splash.svg'),
//                 SizedBox(height: Get.height * 10 / 896),
//                 SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),
//                 Column(
//                   children: [
//                     Container(
//                                 height: Get.height * 10 / 896,
//                               ),
//                               Text("Login", style: TextStyle(
//                             fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//                             fontWeight: FontWeight.w700,
//                             color: Theme.of(context).colorScheme.surface,
//                           ),),
//                     SizedBox(height: Get.height * 5 / 896),
//                     _buildLoginForm(context, controller),
//                   ],
//                 ),
//               ],
//             ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginForm(BuildContext context, LoginController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: Form(
//         key: controller.formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CommonComponents.defaultLoginTextFormField(
//               context,
//               title: 'Username',
//               hintText: 'Enter Username',
//               controller: controller.userNameController,
//               filled: true,
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: SvgPicture.asset('assets/svg_icons/mail.svg'),
//               ),
//               validator: (val) => val == '' ? 'Username is required' : null,
//             ),
//             SizedBox(height: 20),
//             CommonComponents.defaultLoginTextFormField(
//               context,
//               hintText: 'Enter Password',
//               title: 'Password',
//               filled: true,
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: SvgPicture.asset('assets/svg_icons/lock.svg'),
//               ),
//               controller: controller.passwordController,
//               obscureText: controller.obscureText,
//               suffixIcon: ExpandTapWidget(
//                 tapPadding: EdgeInsets.all(10.0),
//                 onTap: () {
//                   // controller.toggleObscureText();
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Icon(
//                     controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
//                     size: 18,
//                     color: Color.fromRGBO(153, 153, 169, 1),
//                   ),
//                 ),
//               ),
//               validator: (val) => val == '' ? 'Password is required' : null,
//             ),
//             SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: MaterialButton(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   minWidth: double.infinity,
//                   height: 45,
//                   color: Theme.of(context).colorScheme.secondary,
//                   onPressed: () {
//                     if (controller.formKey.currentState!.validate()) {
//                       controller.loginServiceCall();
//                     }
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
//                       fontWeight: FontWeight.w500,
//                       color: Theme.of(context).colorScheme.primaryContainer,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















// // class LoginView extends StatefulWidget {
// //   const LoginView({super.key});

// //   @override
// //   State<LoginView> createState() => _LoginViewState();
// // }

// // class _LoginViewState extends State<LoginView> {
// //   final controller = Get.put(LoginController());
// //   GlobalKey<FormState> formKey = GlobalKey<FormState>();
// //   final focusNodes = Iterable<int>.generate(2).map((_) => FocusNode()).toList();
// //   @override
// //   Widget build(BuildContext context) {
// //     return PopScope(
// //         canPop: false,
// //         child: Scaffold(
// //           appBar: CustomAppBar(
// //             height: 0.0,
// //           ),
// //             body: GetBuilder<LoginController>(
// //                 initState: (_) => LoginController.to.initState(),
// //                 builder: (value) =>  SafeArea(
// //                       bottom: false,
// //                       child: KeyboardActions(
// //                           tapOutsideBehavior: TapOutsideBehavior.none,
// //                           config: KeyboardActionsConfig(
// //                             nextFocus: true,
// //                             defaultDoneWidget: const DoneWidget(),
// //                             actions: focusNodes.map((focusNode) => KeyboardActionsItem(focusNode: focusNode)).toList(),
// //                           ),
// //                           child: Stack(children: [
// //                             Positioned(
// //                               bottom: 0,
// //                               top: MediaQuery.of(context).size.height / 2 - 50,
// //                               child: PrimaryGradiantContainer(
// //                                 onlyBottomRadius: true,
// //                                 // height: MediaQuery.of(context).size.height / 2,
// //                                 // width: MediaQuery.of(context).size.width,
// //                                 // child: Container(),
// //                               ),
// //                             ),
// //                             Positioned(
// //                               top: 0,
// //                               child: PrimaryGradiantContainer(
// //                                 radius: 18.0,
// //                                 onlyBottomRadius: true, height: MediaQuery.of(context).size.height / 2,width: Get.width,
// //                                 ),
// //                             ),
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.center, children: [
// //                               // Container(
// //                               //   height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
// //                               // ),
// //                               // RichText(
// //                               //     text: TextSpan(children: [
// //                               //   TextSpan(
// //                               //       text: "Hello, ",
// //                               //       style: TextStyle(
// //                               //           color: Theme.of(context).colorScheme.shadow,
// //                               //           fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
// //                               //           fontWeight: FontWeight.normal)),
// //                               //   TextSpan(
// //                               //       text: 'Login',
// //                               //       style: TextStyle(
// //                               //           color: Theme.of(context).colorScheme.primary,
// //                               //           fontWeight: FontWeight.w600,
// //                               //           fontSize: Get.height * AppConstants.themeConstants.fontsize_28)),
// //                               // ])),
// //                               // Container(
// //                               //   height: Get.height * 50 / 896,
// //                               // ),
// //                               Container(
// //                                 height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
// //                               ),
// //                               Container(
// //                                   height: Get.height * 178.48 / 896,
// //                                   width: Get.width * 191 / 414,
// //                                   child: SvgPicture.asset('assets/svg_icons/Splash.svg')),
// //                                   Container(
// //                                 height: Get.height * 45 / 896,
// //                               ),
// //                               Center(
// //                         // child: Text(
// //                         //   "Gowri Seva Sangam",
// //                         //   style: TextStyle(
// //                         //     fontSize: Get.height * AppConstants.themeConstants.fontsize_25,
// //                         //     fontWeight: FontWeight.w900,
// //                         //     color: Colors.white,
// //                         //     shadows: [
// //                         //       Shadow(
// //                         //         blurRadius: 3.0,
// //                         //         color: Color.fromRGBO(0, 0, 0, 1),
// //                         //         offset: Offset(0, 2),
// //                         //       ),
// //                         //     ],
// //                         //   ),
// //                         // ),
// //                         child:
// //                           // child: SvgPicture.asset('assets/svg_icons/gowrisevasangam1.svg'),
// //                            SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),
// //                       ),
// //                               Container(
// //                                 height: Get.height * 75 / 896,
// //                               ),
// //                               Text("Login", style: TextStyle(
// //                             fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
// //                             fontWeight: FontWeight.w700,
// //                             color: Theme.of(context).colorScheme.surface,
// //                           ),),
// //                               Container(
// //                                         height: Get.height * 5 / 896,
// //                                       ),
// //                               Padding(
// //                                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //                                 child: Form(
// //                                   key: formKey,
// //                                   child: Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       // Text(
// //                                       //   'Username',
// //                                       //   style: TextStyle(
// //                                       //       fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
// //                                       //       fontWeight: FontWeight.w500,
// //                                       //       color: Theme.of(context).colorScheme.primaryContainer),
// //                                       // ),
// //                                       Container(
// //                                         height: Get.height * 8 / 896,
// //                                       ),
// //                                       CommonComponents.defaultLoginTextFormField(
// //                                         context,
// //                                         title: 'Username',
// //                                         hintText: 'Enter Username',
// //                                         controller: controller.userNameController,
// //                                         filled: true,
// //                                         prefixIcon: Padding(
// //                                           padding: const EdgeInsets.all(5.0),
// //                                           child: SvgPicture.asset('assets/svg_icons/mail.svg'),
// //                                         ),
// //                                         // suffixIcon: Padding(
// //                                         //   padding: const EdgeInsets.only(right: 18.0),
// //                                         //   child: SvgPicture.asset('assets/icons/tick.svg'),
// //                                         // ),
// //                                         // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
// //                                         validator: (String? val) {
// //                                           if (val == '') {
// //                                             return 'Username is required';
// //                                           }
// //                                           // else if (val!.length < 10) {
// //                                           //   return 'Please enter a valid  username';
// //                                           // }
// //                                           else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         keyboardType: TextInputType.text,
// //                                         textInputAction: TextInputAction.next,
// //                                         onChange: (value) {},
// //                                       ),
// //                                       Container(
// //                                         height: Get.height * 20 / 896,
// //                                       ),
// //                                       CommonComponents.defaultLoginTextFormField(
// //                                         context,
// //                                         hintText: 'Enter Password',
// //                                         title: 'Password',
// //                                         filled: true,
// //                                         prefixIcon: Padding(
// //                                           padding: const EdgeInsets.all(5.0),
// //                                           child: SvgPicture.asset('assets/svg_icons/lock.svg'),
// //                                         ),
// //                                         controller: controller.passwordController,
// //                                         obscureText: controller.obscureText,
// //                                         suffixIcon: ExpandTapWidget(
// //                                           tapPadding: EdgeInsets.all(10.0),
// //                                           onTap: () {
// //                                             setState(() {
// //                                               controller.obscureText = !controller.obscureText;
// //                                             });
// //                                           },
// //                                           child: Padding(
// //                                               padding: EdgeInsets.symmetric(horizontal: 8),
// //                                               child: Icon(
// //                                                 controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
// //                                                 size: 18,
// //                                                 color: Color.fromRGBO(153, 153, 169, 1),
// //                                               )),
// //                                         ),
// //                                         // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
// //                                         validator: (String? val) {
// //                                           if (val == '') {
// //                                             return 'Password is required';
// //                                           }
// //                                           // else if (val!.length < 10) {
// //                                           //   return 'Please enter a valid  mobile number';
// //                                           // }
// //                                           else {
// //                                             return null;
// //                                           }
// //                                         },
// //                                         keyboardType: TextInputType.text,
// //                                         textInputAction: TextInputAction.done,
// //                                         onChange: (value) {},
// //                                       ),
// //                                       // Container(
// //                                       //   height: Get.height * 20 / 896,
// //                                       // ),
// //                                       // Row(
// //                                       //   mainAxisAlignment: MainAxisAlignment.end,
// //                                       //   children: [
// //                                       //     InkWell(
// //                                       //       onTap: () {},
// //                                       //       child: Text(
// //                                       //         'Need Help?',
// //                                       //         style: TextStyle(
// //                                       //             fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
// //                                       //             fontWeight: FontWeight.w500,
// //                                       //             color: Theme.of(context).colorScheme.primaryContainer),
// //                                       //       ),
// //                                       //     )
// //                                       //   ],
// //                                       // ),
// //                                       Container(
// //                                         height: Get.height * 40 / 896,
// //                                       ),
// //                                       Align(
// //                                         alignment: Alignment.center,
// //                                         child: MaterialButton(
// //                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //                                           minWidth: Get.width,
// //                                           height: Get.height * 45 / 896,
// //                                           color: Theme.of(context).colorScheme.secondary,
// //                                           onPressed: () {
// //                                             if (formKey.currentState!.validate()) {
// //                                               controller.loginServiceCall();
                                              
// //                                             }
// //                                           },
// //                                           child: Text(
// //                                             'Login',
// //                                             style: TextStyle(
// //                                                 fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
// //                                                 fontWeight: FontWeight.w500,
// //                                                 color: Theme.of(context).colorScheme.primaryContainer),
// //                                           ),
// //                                         ),
// //                                       )
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ]),
// //                           ])),
// //                     ))));
// //   }
// // }




import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:template/App%20Constants/app_constants.dart';
import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:template/Common%20Components/Common%20Widgets/done_widget.dart';
import 'package:template/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:template/Common%20Components/common_input_fields.dart';
import 'package:template/Screen/login/Controller/controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNodes = Iterable<int>.generate(2).map((_) => FocusNode()).toList();
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: CustomAppBar(
            height: 0.0,
          ),
            body: GetBuilder<LoginController>(
                initState: (_) => LoginController.to.initState(),
                builder: (value) =>  SafeArea(
                      bottom: false,
                      child: KeyboardActions(
                          tapOutsideBehavior: TapOutsideBehavior.none,
                          config: KeyboardActionsConfig(
                            nextFocus: true,
                            defaultDoneWidget: const DoneWidget(),
                            actions: focusNodes.map((focusNode) => KeyboardActionsItem(focusNode: focusNode)).toList(),
                          ),
                          child: Stack(children: [
                            Positioned(
                              bottom: 0,
                              top: MediaQuery.of(context).size.height / 2 - 50,
                              child: PrimaryGradiantContainer(
                                onlyBottomRadius: true,
                                // height: MediaQuery.of(context).size.height / 2,
                                // width: MediaQuery.of(context).size.width,
                                // child: Container(),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: PrimaryGradiantContainer(
                                radius: 18.0,
                                onlyBottomRadius: true, height: MediaQuery.of(context).size.height / 2,width: Get.width,
                                ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center, children: [
                              // Container(
                              //   height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
                              // ),
                              // RichText(
                              //     text: TextSpan(children: [
                              //   TextSpan(
                              //       text: "Hello, ",
                              //       style: TextStyle(
                              //           color: Theme.of(context).colorScheme.shadow,
                              //           fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
                              //           fontWeight: FontWeight.normal)),
                              //   TextSpan(
                              //       text: 'Login',
                              //       style: TextStyle(
                              //           color: Theme.of(context).colorScheme.primary,
                              //           fontWeight: FontWeight.w600,
                              //           fontSize: Get.height * AppConstants.themeConstants.fontsize_28)),
                              // ])),
                              // Container(
                              //   height: Get.height * 50 / 896,
                              // ),
                              Container(
                                height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
                              ),
                              Container(
                                  height: Get.height * 178.48 / 896,
                                  width: Get.width * 191 / 414,
                                  child: SvgPicture.asset('assets/svg_icons/Splash.svg')),
                                  Container(
                                height: Get.height * 45 / 896,
                              ),
                              Center(
                        // child: Text(
                        //   "Gowri Seva Sangam",
                        //   style: TextStyle(
                        //     fontSize: Get.height * AppConstants.themeConstants.fontsize_25,
                        //     fontWeight: FontWeight.w900,
                        //     color: Colors.white,
                        //     shadows: [
                        //       Shadow(
                        //         blurRadius: 3.0,
                        //         color: Color.fromRGBO(0, 0, 0, 1),
                        //         offset: Offset(0, 2),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        child:
                          // child: SvgPicture.asset('assets/svg_icons/gowrisevasangam1.svg'),
                           SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),
                      ),
                              Container(
                                height: Get.height * 75 / 896,
                              ),
                              Text("Login", style: TextStyle(
                            fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.surface,
                          ),),
                              Container(
                                        height: Get.height * 5 / 896,
                                      ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   'Username',
                                      //   style: TextStyle(
                                      //       fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                      //       fontWeight: FontWeight.w500,
                                      //       color: Theme.of(context).colorScheme.primaryContainer),
                                      // ),
                                      Container(
                                        height: Get.height * 8 / 896,
                                      ),
                                      CommonComponents.defaultLoginTextFormField(
                                        context,
                                        title: 'Username',
                                        hintText: 'Enter Username',
                                        controller: controller.userNameController,
                                        filled: true,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset('assets/svg_icons/mail.svg'),
                                        ),
                                        // suffixIcon: Padding(
                                        //   padding: const EdgeInsets.only(right: 18.0),
                                        //   child: SvgPicture.asset('assets/icons/tick.svg'),
                                        // ),
                                        // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                        validator: (String? val) {
                                          if (val == '') {
                                            return 'Username is required';
                                          }
                                          // else if (val!.length < 10) {
                                          //   return 'Please enter a valid  username';
                                          // }
                                          else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        onChange: (value) {},
                                      ),
                                      Container(
                                        height: Get.height * 20 / 896,
                                      ),
                                      CommonComponents.defaultLoginTextFormField(
                                        context,
                                        hintText: 'Enter Password',
                                        title: 'Password',
                                        filled: true,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset('assets/svg_icons/lock.svg'),
                                        ),
                                        controller: controller.passwordController,
                                        obscureText: controller.obscureText,
                                        suffixIcon: ExpandTapWidget(
                                          tapPadding: EdgeInsets.all(10.0),
                                          onTap: () {
                                            setState(() {
                                              controller.obscureText = !controller.obscureText;
                                            });
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8),
                                              child: Icon(
                                                controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                                size: 18,
                                                color: Color.fromRGBO(153, 153, 169, 1),
                                              )),
                                        ),
                                        // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                        validator: (String? val) {
                                          if (val == '') {
                                            return 'Password is required';
                                          }
                                          // else if (val!.length < 10) {
                                          //   return 'Please enter a valid  mobile number';
                                          // }
                                          else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        onChange: (value) {},
                                      ),
                                      // Container(
                                      //   height: Get.height * 20 / 896,
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     InkWell(
                                      //       onTap: () {},
                                      //       child: Text(
                                      //         'Need Help?',
                                      //         style: TextStyle(
                                      //             fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                                      //             fontWeight: FontWeight.w500,
                                      //             color: Theme.of(context).colorScheme.primaryContainer),
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                      Container(
                                        height: Get.height * 40 / 896,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          minWidth: Get.width,
                                          height: Get.height * 45 / 896,
                                          color: Theme.of(context).colorScheme.secondary,
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              controller.loginServiceCall();
                                              
                                            }
                                          },
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context).colorScheme.primaryContainer),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ])),
                    ))));
  }
}
