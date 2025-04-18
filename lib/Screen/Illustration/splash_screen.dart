import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:template/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:template/Common%20Components/common_services.dart';
import 'package:template/Common%20Components/session_manager.dart';
import 'package:template/Utils/web_device_id.dart';

import '../../Routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //   // if (Platform.isAndroid) {
  //   //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //   // } else {
  //   await Firebase.initializeApp();
  //   // }
  //   print('Handling a background message ${message.messageId}');
  // }

  // late AndroidNotificationChannel channel;
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // initFirebase() async {
  //   // await Firebase.initializeApp(
  //   //     // options: DefaultFirebaseOptions.currentPlatform,
  //   //     );

  //   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     commonService.deviceId = androidInfo.id;
  //     commonService.deviceName = androidInfo.model;
  //   } else {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     commonService.deviceId = iosInfo.identifierForVendor!;
  //     commonService.deviceName = iosInfo.name;
  //   }

  //   commonService.deviceType = Platform.operatingSystem;
  //   print("Print id:${commonService.deviceId}");
  //   print("Print Type:${commonService.deviceType}");
  //   print('android brand ${commonService.deviceName}');

  //   // if (!kIsWeb) {
  //   // channel = const AndroidNotificationChannel(
  //   //   'high_importance_channel', // id
  //   //   'High Importance Notifications', // title
  //   //   description: 'This channel is used for important notifications.', // description
  //   //   importance: Importance.high,
  //   // );

  //   // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //   // await flutterLocalNotificationsPlugin
  //   //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //   //     ?.createNotificationChannel(channel);

  //   // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   //   alert: true,
  //   //   badge: true,
  //   //   sound: true,
  //   // );
  //   // }
  // }

  @override
  void initState() {
    super.initState();

    // initFirebase();
    // LocalNotificationServices.initialize(context);

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   print("Printing Notification message in onmessage: ${message.data}");

    //   if (notification != null && android != null && !kIsWeb) {
    //     // flutterLocalNotificationsPlugin.show(
    //     //   notification.hashCode,
    //     //   notification.title,
    //     //   notification.body,
    //     //     android: AndroidNotificationDetails(
    //     //       channel.id,
    //     //       channel.name,
    //     //       channelDescription: channel.description,
    //     //       // TODO add a proper drawable resource to android, for now using
    //     //       //      one that already exists in example app.
    //     //       icon: 'launch_background',
    //     //     ),
    //     //   ),
    //     // );
    //   } //   NotificationDetails(

    //   LocalNotificationServices.display(message);
    // });
    // if (Platform.isIOS) {
    //   FirebaseMessaging.instance.getAPNSToken().then((value) {
    //     commonService.apnsToken = value;
    //   });
    // }
    // FirebaseMessaging.instance.getToken().then((value) {
    //   commonService.pushToken = value;
    //   print("common android token: ${commonService.pushToken}");
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   print("Printing Notification message in open: ${message.data}");
    // });
    _initPackageInfo();

    _getId().then((id) {
      commonService.deviceId = id;
      commonService.deviceType = Platform.operatingSystem;
    });
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 5), () => isFirstUserOrNot());
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    commonService.packageInfo = info;
  }

  // Future<String> _getId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor!; // unique ID on iOS
  //   } else {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id; // unique ID on Android
  //   }
  // }
  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    debugPrint("deviceInfo :::: ${deviceInfo}");
    print('kisweb  :::: ${kIsWeb}');
    if (kIsWeb) {
      var webDeviceInfo = await deviceInfo.webBrowserInfo;
      debugPrint(
        "browserName :::: ${webDeviceInfo.browserName.name}",
      );
      debugPrint(
        "appCodeName :::: ${webDeviceInfo.appCodeName}",
      );
      debugPrint(
        "appName :::: ${webDeviceInfo.appName}",
      );
      debugPrint(
        "appVersion :::: ${webDeviceInfo.appVersion}",
      );
      debugPrint(
        "deviceMemory :::: ${webDeviceInfo.deviceMemory}",
      );
      debugPrint(
        "language :::: ${webDeviceInfo.language}",
      );
      debugPrint(
        "platform :::: ${webDeviceInfo.platform}",
      );
      debugPrint(
        "product :::: ${webDeviceInfo.product}",
      );
      debugPrint(
        "productSub :::: ${webDeviceInfo.productSub}",
      );
      debugPrint(
        "userAgent :::: ${webDeviceInfo.userAgent}",
      );
      debugPrint(
        "vendor :::: ${webDeviceInfo.vendor}",
      );
      debugPrint(
        "vendorSub :::: ${webDeviceInfo.vendorSub}",
      );
      debugPrint(
        "hardwareConcurrency :::: ${webDeviceInfo.hardwareConcurrency}",
      );
      debugPrint(
        "maxTouchPoints :::: ${webDeviceInfo.maxTouchPoints}",
      );

      final deviceId = DeviceId.getDeviceId();
      debugPrint('Device ID: $deviceId ');
      return deviceId;
    } else if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor!; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    } else {
      final deviceId = DeviceId.getDeviceId();
      debugPrint('Device ID: $deviceId ');
      return deviceId;
    }
  }

  var commonService = CommonService.instance;

  isFirstUserOrNot() async {
    commonService.accessToken = await SessionManager.getAccessToken();
    commonService.refreshToken = await SessionManager.getRefreshToken();
    commonService.username = await SessionManager.getUsername();
    commonService.userEmail = await SessionManager.getUserEmail();
    commonService.userMobile = await SessionManager.getUserMobile();
    commonService.userProfile = await SessionManager.getUserProfile();
    commonService.userId = await SessionManager.getUserId();
    commonService.permissions = await SessionManager.getPermissions();
    commonService.rememberMe = await SessionManager.getRememberMe();
    // commonService.retailerId = await SessionManager.getRetailerId();
    SessionManager.setIsFirstTime(true);
    commonService.isFirstTime = await SessionManager.getIsFirstTime();
    debugPrint("Access Token::::::${commonService.accessToken}");
    debugPrint("Refresh Token::::::${commonService.refreshToken}");

    if (commonService.accessToken != '') {
      // Get.toNamed(Routes.home);
      Get.toNamed(Routes.dashBoardView);
    } else {
      Get.toNamed(Routes.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 0.0),
    //     body: PrimaryGradiantContainer(
    //   onlyBottomRadius: false,
    //   child: Center(
    //     // child: SvgPicture.asset(
    //     //   'assets/images/splash_logo.svg',
    //     // ),
    //     // child: FlutterLogo(),
    //     // child: Image.asset("assets/app_logo.jpeg"),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //                               height: Get.height * 178.48 / 896,
    //                               width: Get.width * 191 / 414,
    //                               // child: SvgPicture.asset('assets/images/login.svg')),
    //                               child: Image.asset("assets/app_logo.jpeg")),
    //                               Container(
    //                             height: Get.height * 50 / 896,
    //                           ),
    //         Text("Gowri Seva Sangam",style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primaryContainer, 
    //               fontFamily: 'Inter',
    //         )),
    //       ],
    //     ),
    //   ),
    // )
    body: Center(
      child: PrimaryGradiantContainer(
                  onlyBottomRadius: false,
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg_icons/Splash.svg'),
                      SizedBox(height: Get.height * 20 / 896),

                      // Center(
                      //   child: Text(
                      //     "Gowri Seva Sangam",
                      //     style: TextStyle(
                      //       fontSize: Get.height * AppConstants.themeConstants.fontsize_25,
                      //       fontWeight: FontWeight.w900,
                      //       color: Colors.white,
                      //       shadows: [
                      //         Shadow(
                      //           blurRadius: 3.0,
                      //           color: Color.fromRGBO(0, 0, 0, 1),
                      //           offset: Offset(0, 2),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                      SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),
                      // SvgPicture.asset('assets/svg_icons/gowrisevasangam1.svg')

                    ],
                  )
                ),
    ),
    );
  }
}
