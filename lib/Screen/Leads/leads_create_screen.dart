import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:template/App%20Constants/app_constants.dart';
import 'package:template/Common%20Components/BreakPoints/breakpoints.dart';
import 'package:template/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:template/Common%20Components/Common%20Widgets/dotted_border_common_component.dart';
import 'package:template/Common%20Components/Common%20Widgets/mini_common_model.dart';
import 'package:template/Common%20Components/common_input_fields.dart';
import 'package:template/Common%20Components/common_services.dart';
import 'package:template/Common%20Components/date_picker.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class LeadsCreateScreen extends StatefulWidget {
  const LeadsCreateScreen({super.key});

  @override
  State<LeadsCreateScreen> createState() => _LeadsCreateScreenState();
}

class _LeadsCreateScreenState extends State<LeadsCreateScreen> {
  final List<MiniCommonModel> namesList = [
    MiniCommonModel(id: 1, name: "Venkatesh"),
    MiniCommonModel(id: 2, name: "Suresh"),
    MiniCommonModel(id: 3, name: "Subhash"),
  ];

  final List<MiniCommonModel> companyNamesList = [
    MiniCommonModel(id: 1, name: "Absolin"),
    MiniCommonModel(id: 2, name: "Moon Technologies"),
    MiniCommonModel(id: 3, name: "Tech Solutions"),
  ];

  final List<MiniCommonModel> locationList = [
    MiniCommonModel(id: 1, name: "Gurudwara"),
    MiniCommonModel(id: 2, name: "Goa"),
    MiniCommonModel(id: 3, name: "Gokarna"),
  ];

  final List<MiniCommonModel> priorityLIst = [
    MiniCommonModel(id: 1, name: "Low"),
    MiniCommonModel(id: 2, name: "Medium"),
    MiniCommonModel(id: 3, name: "High"),
  ];

  final List<MiniCommonModel> selectItemList = [
    MiniCommonModel(id: 1, name: "Mac"),
    MiniCommonModel(id: 2, name: "Android"),
    MiniCommonModel(id: 3, name: "Desktop"),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        return isLargeScreen ? CommonScaffoldWithAppBar(
          // leadingChild: !isLargeScreen
          //     ? IconButton(
          //         onPressed: () {
          //           Get.back();
          //         },
          //         icon: Icon(Icons.chevron_left,
          //             color: Theme.of(context).colorScheme.onSurface),
          //       )
          //     : null,
              // titleChild: !isLargeScreen
              //     ? Text(
              //         'Add Lead',
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.onSurface,
              //         ),
              //       )
              //     : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: Get.height * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: leadsCreateScreenContent()
                ),
              ),
            ),
          ),
        )
        : Scaffold(
          appBar: CustomAppBar(
            titleChild: Text(
                      'Add Lead',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
            leadingChild: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
            leadingLink: () {
              Get.back();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: leadsCreateScreenContent(),
            ),
          ),
        );
      }
    );
  }

  Widget leadsCreateScreenContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
      final isLargeScreen = constraints.maxWidth >= 700;
        return Column(
                    children: [
                      if (isLargeScreen)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 18,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          Text(
                            'Add Lead',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        // height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          // borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.book_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Customer Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ResponsiveRow(
                        crossAxisAlignment: ResponsiveCrossAlignment.start,
                        alignment: ResponsiveAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        columns: [
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sampleRowRequiredText(title: "Lead Entry Date", required: true),
                              
                                const SizedBox(height: 6),
                                CommonDatePicker(
                                  pickerType: PickerType.date,
                                ),
                              ],
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sampleRowRequiredText(title: "Date Of Enquiry", required: true),
                                const SizedBox(height: 6),
                                CommonDatePicker(
                                  pickerType: PickerType.date,
                                  // selectedDate: selectedDate,
                                  // onDateSelected: (date) => setState(() => selectedDate = date),
                                ),
                              ],
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sampleRowRequiredText(title: "Date Of Due", required: true),
                      
                                const SizedBox(height: 6),
                                CommonDatePicker(
                                  pickerType: PickerType.date,
                                  // selectedDate: selectedDate,
                                  // onDateSelected: (date) => setState(() => selectedDate = date),
                                ),
                              ],
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.customizeTextField(
                              context,
                              title: "Lead Name",
                              hintText: "Enter Lead Name",
                              isRequired: true,
                              onTap: () {},
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.customizeTextField(
                              context,
                              title: " Mobile Number",
                              hintText: "Enter Mobile Number",
                              isRequired: true,
                              onTap: () {},
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.customizeTextField(
                              context,
                              title: " Email",
                              hintText: "Enter Email",
                              isRequired: true,
                              onTap: () {},
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultNewDropdownSearch< MiniCommonModel>(context,
                              title: "Customer",
                              isRequired: true,
                              hintText: 'Select Customer',
                              showBottomSheet:
                                  MediaQuery.of(context).size.width <= 600
                                      ? true
                                      : false,
                              items: (filter, infiniteScrollProps) async {
                                return namesList;
                              },
                              itemBuilder: (
                                context,
                                MiniCommonModel? item,
                                isSelected,
                                isTrue,
                              ) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration:
                                      !isSelected
                                          ? null
                                          : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondaryContainer,
                                          ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(
                                      item?.name ?? '',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                              itemAsString: (MiniCommonModel u) => u.name ?? '',
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 15),
                      
                      Container(
                        // height: 50,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.book_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Company Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ResponsiveRow(
                        spacing: 10,
                        runSpacing: 10,
                        columns: [
                        ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                              title: "Business Development Manager",
                              isRequired: true,
                              hintText: 'Select Business Development Manager',
                              showBottomSheet:
                                  MediaQuery.of(context).size.width <= 600
                                      ? true
                                      : false,
                              items: (filter, infiniteScrollProps) async {
                                return namesList;
                              },
                              itemBuilder: (
                                context,
                                MiniCommonModel? item,
                                isSelected,
                                isTrue,
                              ) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration:
                                      !isSelected
                                          ? null
                                          : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondaryContainer,
                                          ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(
                                      item?.name ?? '',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                              itemAsString: (MiniCommonModel u) => u.name ?? '',
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                              title: "Company",
                              isRequired: true,
                              hintText: 'Select Company',
                              showBottomSheet:
                                  MediaQuery.of(context).size.width <= 600
                                      ? true
                                      : false,
                              items: (filter, infiniteScrollProps) async {
                                return companyNamesList;
                              },
                              itemBuilder: (
                                context,
                                MiniCommonModel? item,
                                isSelected,
                                isTrue,
                              ) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration:
                                      !isSelected
                                          ? null
                                          : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondaryContainer,
                                          ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(
                                      item?.name ?? '',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                              itemAsString: (MiniCommonModel u) => u.name ?? '',
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                              title: "Location",
                              isRequired: true,
                              hintText: 'Select Location',
                              showBottomSheet:
                                  MediaQuery.of(context).size.width <= 600
                                      ? true
                                      : false,
                              items: (filter, infiniteScrollProps) async {
                                return locationList;
                              },
                              itemBuilder: (
                                context,
                                MiniCommonModel? item,
                                isSelected,
                                isTrue,
                              ) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration:
                                      !isSelected
                                          ? null
                                          : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondaryContainer,
                                          ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(
                                      item?.name ?? '',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                              itemAsString: (MiniCommonModel u) => u.name ?? '',
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                              title: "Priority",
                              isRequired: true,
                              hintText: 'Select Priority',
                              showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                              items: (filter, infiniteScrollProps) async {
                                return priorityLIst;
                              },
                              itemBuilder: (
                                context,
                                MiniCommonModel? item,
                                isSelected,
                                isTrue,
                              ) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration:
                                      !isSelected
                                          ? null
                                          : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondaryContainer,
                                          ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(
                                      item?.name ?? '',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                              itemAsString: (MiniCommonModel u) => u.name ?? '',
                            ),
                          ),
                          ResponsiveColumn(ResponsiveConstants().textFormField,child: Expanded(
                            child: Column(
                              children: [
                                sampleRowRequiredText(title: "Documents", required: true),
                                SizedBox(height: 6),
                                Container(
                                  width: Get.width,
                                  child: GestureDetector(
                                    onTap:
                                      // Get.defaultDialog(
                                      //   content: Container(
                                      //     height: 100,
                                      //     color: Colors.white,
                                      //   ),
                                      // );
                                      () async {
                                            await CommonService.documentPicker().then((value) {
                                              print("Printing the onTapDocument image Value ::: => $value");
                                              // controller.selectedImageFile = File(value!.files.single.path!);
                                              // controller.update();
                                            });
                                            Get.back();
                                          },
                                    // },
                                    child: CustomPaint(
                                      painter: DottedBorderPainter(borderRadius: BorderRadius.circular(15.0), color: Colors.grey,),
                                      child: Container(
                                        decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(15.0)
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.add, color: Colors.grey),
                                            SizedBox(height: 5),
                                            Text(
                                              "Select A file ...",
                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),)
                        ],
                      ),
                      
                      SizedBox(height: 15),
                      
                      Container(
                        // height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.book_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Item Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveRow(
                            spacing: 10,
                            runSpacing: 10,
                            columns: [
                            ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                                  title: "Item",
                                  isRequired: true,
                                  hintText: 'Select Item',
                                  showBottomSheet:
                                      MediaQuery.of(context).size.width <= 600
                                          ? true
                                          : false,
                                  items: (filter, infiniteScrollProps) async {
                                    return selectItemList;
                                  },
                                  itemBuilder: (
                                    context,
                                    MiniCommonModel? item,
                                    isSelected,
                                    isTrue,
                                  ) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration:
                                          !isSelected
                                              ? null
                                              : BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.secondaryContainer,
                                              ),
                                      child: ListTile(
                                        selected: isSelected,
                                        title: Text(
                                          item?.name ?? '',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                  itemAsString: (MiniCommonModel u) => u.name ?? '',
                                ),
                              ),
                              ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.customizeTextField(
                                  context,
                                  title: "Quantity",
                                  hintText: "Enter Quantity",
                                  isRequired: true,
                                  // controller: myController,
                                  onTap: () {},
                                ),
                              ),
                              ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(context,
                                  title: "Unit",
                                  isRequired: true,
                                  hintText: 'Select Unit',
                                  showBottomSheet:
                                      MediaQuery.of(context).size.width <= 600
                                          ? true
                                          : false,
                                  items: (filter, infiniteScrollProps) async {
                                    return companyNamesList;
                                  },
                                  itemBuilder: (
                                    context,
                                    MiniCommonModel? item,
                                    isSelected,
                                    isTrue,
                                  ) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration:
                                          !isSelected
                                              ? null
                                              : BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.secondaryContainer,
                                              ),
                                      child: ListTile(
                                        selected: isSelected,
                                        title: Text(
                                          item?.name ?? '',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                  itemAsString: (MiniCommonModel u) => u.name ?? '',
                                ),
                              ),
                              ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.defaultNewDropdownSearch< MiniCommonModel>(context,
                                  title: "Vendor",
                                  isRequired: true,
                                  hintText: 'Select Vendor',
                                  showBottomSheet:
                                      MediaQuery.of(context).size.width <= 600
                                          ? true
                                          : false,
                                  items: (filter, infiniteScrollProps) async {
                                    return locationList;
                                  },
                                  itemBuilder: (
                                    context,
                                    MiniCommonModel? item,
                                    isSelected,
                                    isTrue,
                                  ) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration:
                                          !isSelected
                                              ? null
                                              : BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.secondaryContainer,
                                              ),
                                      child: ListTile(
                                        selected: isSelected,
                                        title: Text(
                                          item?.name ?? '',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                  itemAsString: (MiniCommonModel u) => u.name ?? '',
                                ),
                              ),
                              ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.customizeTextField(
                                  context,
                                  maxLines: 5,
                                  title: "Item Specifications",
                                  hintText: "Write Item Specifications Here ...",
                                  isRequired: true,
                                  // controller: myController,
                                  onTap: () {},
                                ),
                              ),
                              ResponsiveColumn(ResponsiveConstants().lowToHigh, child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xff0056D2),
                                                foregroundColor: Colors.white,
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text("Add Item", overflow: TextOverflow.ellipsis,style: TextStyle(overflow: TextOverflow.ellipsis),)
                                            ),)
                            ],
                          ),
                      SizedBox(height: 10),
                          ResponsiveRow(
                            columns:[
                              ResponsiveColumn(
                                ResponsiveConstants().textFormField,
                                child: CommonComponents.customizeTextField(
                                  context,
                                  maxLines: 5,
                                  title: "Remarks",
                                  hintText: "Write Remarks Here ...",
                                  isRequired: true,
                                  // controller: myController,
                                  onTap: () {},
                                ),
                              ),]
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: CommonComponents.defaultOutlinedButton(
                          context,
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 32,
                            ),
                            // foregroundColor: Colors.red,
                            backgroundColor: Color.fromARGB(255, 24, 185, 85)
                          ),
                          text: 'Save Lead',
                        ),
                          )
                        ],
                      ),
                    ],
                  );
      }
    );
  }

  Widget sampleRowRequiredText( {bool? required = false ,String? title}) {
    return Row(
                              children: [
                                Text(
                                  title ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                Text(
                                required == true ? ' *' : '' ,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                  ),
                                )
                              ],
                            );
  }
}
