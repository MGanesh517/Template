import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Common%20Components/common_input_fields.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class LeadsListScreen extends StatelessWidget {
  const LeadsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        return CommonScaffoldWithAppBar(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLargeScreen
                ? Container(
                    height: Get.height * 0.9,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: leadsListScreenContent(context),
                  )
                : leadsListScreenContent(context),
          ),
        );
      },
    );
  }

  Widget leadsListScreenContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Back Button and Title
          Row(
            children: [
              const Text(
                'Add Lead',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
                    CommonComponents.defaultOutlinedButton(
                      context,
                      text: 'Add New',
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
                        foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      onPressed: () {
                        Get.toNamed('/leadsCreateScreen');
                      },
                    ),
            ],
          ),
      
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
