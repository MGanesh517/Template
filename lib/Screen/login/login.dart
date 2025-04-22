import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:template/Common%20Components/common_input_fields.dart';
import 'package:template/Screen/login/Controller/controller.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNodes = Iterable<int>.generate(2).map((_) => FocusNode()).toList();
  
  var image1 = 'assets/Images/splash.svg';
  var image2 = '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive layout based on screen width
              bool isDesktop = constraints.maxWidth > 800;
              bool isTablet = constraints.maxWidth > 600 && constraints.maxWidth <= 800;
              bool isMobile = constraints.maxWidth <= 600;
      
              return SingleChildScrollView(
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: isDesktop
                      ? _buildDesktopLayout(constraints)
                      : isTablet
                          ? _buildTabletLayout(constraints)
                          : _buildMobileLayout(constraints),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Row(
      children: [
        // Left side - decorative area (1/2 of screen)
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     Theme.of(context).colorScheme.secondaryContainer,
              //     Theme.of(context).colorScheme.secondary,
              //   ],
              // ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SvgPicture.asset(image1, color: Colors.white , height: Get.height * 0.25, width: Get.width *0.25),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
                ],
              ),
            ),
          ),
        ),
        // Right side - login form (1/2 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return Column(
      children: [
        // Top section - banner (1/3 of screen)
        Container(
          // height: constraints.maxHeight * 0.3,
          height: constraints.maxHeight,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Theme.of(context).colorScheme.secondaryContainer,
            //     Theme.of(context).colorScheme.secondary,
            //   ],
            // ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(image1),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
              ],
            ),
          ),
        ),
        // Bottom section - login form (2/3 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450),
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return Column(
      children: [
        // Top section - banner (1/4 of screen)
        
        Container(
          height: constraints.maxHeight * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Theme.of(context).colorScheme.secondaryContainer,
            //     Theme.of(context).colorScheme.secondary,
            //   ],
            // ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(image1, color: Colors.white , height: Get.height * 0.25, width: Get.width *0.25),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
              ],
            ),
          ),
        ),
        // Bottom section - login form (3/4 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please sign in with your credentials',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 12),
          buildTextField(),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.loginServiceCall();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Username Field
      Text(
        'Username',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      SizedBox(height: 8),
      CommonComponents.defaultLoginTextFormField(
        context,
        hintText: 'Enter Username',
        controller: controller.userNameController,
        filled: false,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset('assets/Images/mail.svg'),
        ),
        validator: (String? val) {
          if (val == '') {
            return 'Username is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChange: (value) {},
      ),
      
      SizedBox(height: 20),
      
      // Password Field
      Text(
        'Password',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      SizedBox(height: 8),
      CommonComponents.defaultLoginTextFormField(
        context,
        hintText: 'Enter Password',
        filled: false,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset('assets/Images/lock.svg'),
        ),
        controller: controller.passwordController,
        obscureText: controller.obscureText,
        onFieldSubmitted: (val) {
                          if (formKey.currentState!.validate()) {
                            controller.loginServiceCall();
                          }
                        },
        suffixIcon: ExpandTapWidget(
          tapPadding: EdgeInsets.all(10.0),
          onTap: () {
            setState(() {
              controller.obscureText = !controller.obscureText;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              size: 20,
              color: Color.fromRGBO(153, 153, 169, 1),
            )
          ),
        ),
        validator: (String? val) {
          if (val == '') {
            return 'Password is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onChange: (value) {},
      ),
    ],
  );
}
}