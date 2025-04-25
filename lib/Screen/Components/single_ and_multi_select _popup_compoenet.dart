import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:template/App%20Constants/app_constants.dart';
import 'package:template/Common%20Components/BreakPoints/breakpoints.dart';
import 'package:template/Common%20Components/common_button_components.dart';
import 'package:template/Screen/Components/checkBox_models.dart';
import 'package:template/Screen/Components/text_fields.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class SingleAndMultiSelectPopUp extends StatelessWidget {
  const SingleAndMultiSelectPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Column(
        children: [
          ResponsiveRow(columns: [
            ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child:  ButtonTypeCommonComponents.defaultMaterialButton(
            context,
            onPressed: () {
              Get.dialog(
                
                AlertDialogSingleSlectComponent());
            },
            text: "Single Select",
          ),),

          ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child:  ButtonTypeCommonComponents.defaultMaterialButton(
            context,
            onPressed: () {
              Get.dialog(
                
                AlertDialogMultiSlectComponent());
            },
            text: "Multi Select",
          ),),
          ])
        ],
      ),
    );
  }
}

class AlertDialogSingleSlectComponent extends StatefulWidget {
  const AlertDialogSingleSlectComponent({super.key});

  @override
  State<AlertDialogSingleSlectComponent> createState() => _AlertDialogSingleSlectComponentState();
}

class _AlertDialogSingleSlectComponentState extends State<AlertDialogSingleSlectComponent> {
  final List<String> allMembers = [
    "Sri. Gowri",
    "Sri. Srinivas",
    "Sri. Suresh",
    "Sri. Lakshmi",
    "Sri. Ramesh",
    "Sri. Priya",
  ];

  List<String> selectedMembers = [];

  // @override
@override
Widget build(BuildContext context) {
  List<String> unselected = allMembers
      .where((member) => !selectedMembers.contains(member))
      .toList();

  return AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
      ],
    ),
    actionsAlignment: MainAxisAlignment.start,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    content: SizedBox(
      height: Get.height * 0.6,
      width: Get.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items List (${unselected.length})",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Divider(),
          SizedBox(height: 10),
          CommonTextFormFields.defaultSearchTextFormField(
            context,
            hintText: 'Enter Search Field',
            controller: TextEditingController(),
            prefixIcon: Icon(Icons.search),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                Expanded(flex : 1, child: Text("Item Images")),
                Expanded(flex: 3, child: Text("Item Name")),
                Spacer(),
                Text("Action"),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Expanded(
          //     child: GridView.builder(
          //       itemCount: selectedMembers.length,
          //       shrinkWrap: true,
          //       physics: const ClampingScrollPhysics(),
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: MediaQuery.of(context).size.width <= 800
          //             ? 1
          //             : MediaQuery.of(context).size.width <= 1300
          //                 ? 2
          //                 : MediaQuery.of(context).size.width <= 1700
          //                     ? 3
          //                     : 4,
          //         childAspectRatio: 1,
          //         crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
          //         mainAxisExtent: MediaQuery.of(context).size.width <= 1300 ? 125 : 100,
          //       ),
          //       itemBuilder: (context, index) {
          //         final name = selectedMembers[index];
          //         return CommonListMemberCard(
          //           image: '',
          //           name: name,
          //           emailId: 'N/A',
          //           email: "N/A",
          //           onTap: () {},
          //         );
          //       },
          //     ),
          //   ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: unselected.length,
              itemBuilder: (context, index) {
                final member = unselected[index];
                return Card(
                  elevation: 0.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          children: [
                            // Expanded(child: Text("ID ${index + 1}")),
                            Expanded(child: Image.asset('')),
                            Expanded(flex: 3, child: Text(member)),
                            Spacer(),
                            ButtonTypeCommonComponents.defaultOutlinedButton(context,
                            onPressed: () {
                                selectedMembers.add(member);
                                Get.back();
                            },
                            text: "Add",
                            ),
                            // ElevatedButton.icon(
                            //   onPressed: () {
                            //     selectedMembers.add(member);
                            //     Get.back();
                            //   },
                            //   icon: const Icon(Icons.add_circle_outline),
                            //   label: const Text('Add'),
                            // ),
                            // IconButton(
                            //   icon: Icon(Icons.add_circle_outline),
                            //   onPressed: () {
                            //     selectedMembers.add(member);
                            //     Get.back();
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[100]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}




class AlertDialogMultiSlectComponent extends StatefulWidget {
  const AlertDialogMultiSlectComponent({super.key});

  @override
  State<AlertDialogMultiSlectComponent> createState() => _AlertDialogMultiSlectComponentState();
}

class _AlertDialogMultiSlectComponentState extends State<AlertDialogMultiSlectComponent> {
  final List<String> allMembers = [
    "Sri. Gowri",
    "Sri. Srinivas",
    "Sri. Suresh",
    "Sri. Lakshmi",
    "Sri. Ramesh",
    "Sri. Priya",
  ];

  List<String> selectedMembers = [];
    Set<String> tempSelected = {};

  // @override
@override
Widget build(BuildContext context) {
    final List<String> unselected = allMembers
        .where((member) => !selectedMembers.contains(member))
        .toList();


  return AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
      ],
    ),
    actions: [
      ButtonTypeCommonComponents.defaultMaterialButton(
        context,
        onPressed: () {
          setState(() {
            selectedMembers.addAll(tempSelected);
            Get.back();
          });
        },
        text: "Add",
      ),
    ],
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    content: SizedBox(
      height: Get.height * 0.6,
      width: Get.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items List (${unselected.length})",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Divider(),
          SizedBox(height: 10),
          CommonTextFormFields.defaultSearchTextFormField(
            context,
            hintText: 'Enter Search Field',
            controller: TextEditingController(),
            prefixIcon: Icon(Icons.search),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                Expanded(flex : 1, child: Text("Item Images")),
                Expanded(flex: 3, child: Text("Item Name")),
                Spacer(),
                Text("Action"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: unselected.length,
              itemBuilder: (context, index) {
                final member = unselected[index];
                return Card(
                  elevation: 0.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          children: [
                            // Expanded(child: Text("ID ${index + 1}")),
                            Expanded(child: Image.asset('')),
                            Expanded(flex: 3, child: Text(member)),
                            Spacer(),
                            CommonComponentForCheckBox.defaultCheckbox(
              context,
              value: tempSelected.contains(member),
              onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                tempSelected.add(member);
                              } else {
                                tempSelected.remove(member);
                              }
                            });
                          },
              // label: "Checkbox",
            ),
      
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[100]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}



class CommonListMemberCard extends StatefulWidget {
  final String image;
  final String name;
  final String email;
  final String emailId;
  final void Function() onTap;

  const CommonListMemberCard({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
    required this.email,
    required this.emailId,
  });

  @override
  State<CommonListMemberCard> createState() => _CommonListMemberCardState();
}

class _CommonListMemberCardState extends State<CommonListMemberCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfileImage(widget.image, widget.name),
              SizedBox(width: Get.width * 10 / 414),
              Flexible(child: buildUserInfo(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileImage(String imageUrl, String name) {
    return Container(
      width: 60,
      height: Get.height * 60 / 896,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, _, __) => fallbackProfileIcon(name),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget fallbackProfileIcon(String? fullname) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: generateLightColor(),
      ),
      child: Center(
        child: Text(
          (fullname != null && fullname.isNotEmpty) ? fullname[0].toUpperCase() : '?',
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Color generateLightColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(56),
      200 + random.nextInt(56),
      200 + random.nextInt(56),
    );
  }

  Widget buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
            color: Theme.of(context).colorScheme.surface,overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        buildInfoRow('Email Id : ', widget.emailId, context),
        const SizedBox(height: 3),
        buildInfoRow('Mobile Number : ', widget.email, context),
      ],
    );
  }

  Widget buildInfoRow(String label, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
