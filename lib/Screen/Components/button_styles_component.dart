
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:template/Common%20Components/BreakPoints/breakpoints.dart';
import 'package:template/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:template/Common%20Components/common_button_components.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class ButtonTypes extends StatefulWidget {
  const ButtonTypes({super.key});

  @override
  State<ButtonTypes> createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  bool isExpanded = false;

  void toggleFab() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final RxList<bool> isSelected = [true, false, false].obs;
    final RxBool isLoading = false.obs;

    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Variants',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Primary'),
                    ),
                    ButtonTypeCommonComponents.defaultOutlinedButton(
                      context,
                      onPressed: () {},
                      text: 'Outlined',
                    ),
                    TextButton(onPressed: () {}, child: const Text('Text')),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.grey),
                        foregroundColor: Colors.black,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text('Ghost'),
                    ),
                    TextButton(
                      onPressed: () => launchUrl('https://your-link.com'),
                      child: const Text(
                        'Link',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'States & Icons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      label: const Text('Download'),
                    ),
                    ElevatedButton(
                      onPressed:
                          isLoading.value
                              ? null
                              : () {
                                isLoading.value = true;
                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () => isLoading.value = false,
                                );
                              },
                      child:
                          isLoading.value
                              ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                              : const Text('Loading'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      tooltip: 'Like',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      tooltip: 'Search',
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Color Themes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  children: [
                    ButtonTypeCommonComponents.defaultElevatedButton(
                      context,
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      text: "Success",
                    ),
                    ButtonTypeCommonComponents.defaultElevatedButton(
                      context,
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      text: 'Danger',
                    ),
                    ButtonTypeCommonComponents.defaultOutlinedButton(
                      context,
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      text: 'Danger (Outlined)',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Toggle / Grouped',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ButtonTypeCommonComponents.defaultToggleButton(
                  context,
                  isSelected: isSelected,
                  onPressed: (index) {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  },
                  borderRadius: 8,
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('A'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('B'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('C'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const SizedBox(height: 24),
                const SizedBox(height: 24),

                Text("Responsive", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 24),
                const SizedBox(height: 24),


                ResponsiveRow(
                  runSpacing: 20.0,
                  spacing: 20.0,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultMaterialButton(
                        context,
                        onPressed: () {},
                        text: "MaterialButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultElevatedButton(
                        context,
                        onPressed: () {},
                        text: "ElevatedButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultTextButton(
                        context,
                        onPressed: () {},
                        text: "TextButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultOutlinedButton(
                        context,
                        onPressed: () {},
                        text: "OutlinedButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child:
                          ButtonTypeCommonComponents.defaultFloatingActionButton(
                            context,
                            onPressed: () {},
                            icon: Icons.add,
                            tooltip: "Button Can Extend Also",
                            isExtended: false,
                          ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultIconButton(
                        context,
                        onPressed: () {},
                        icon: Icons.thumb_up,
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultPopupMenuButton(
                        context,
                        onSelected: (value) {},
                        items: ["Item 1", "Item 2", "Item 3"],
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultDropdownButton(
                        context,
                        onChanged: (value) {},
                        items: ["Select 1", "Select 2", "Select 3"],
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultToggleButton(
                        context,
                        onPressed: (index) {},
                        isSelected: [true, false],
                        children: [Text("1"), Text("2")],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                Text("FloatingAction Buttons", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 24),
                const SizedBox(height: 24),


                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Column(
                      children: [
                        const Text("Basic Floating Button"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.add,
                          tooltip: "Basic FAB",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Extended Floating Button"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.send,
                          isExtended: true,
                          extendedLabel: "Send",
                          tooltip: "Extended FAB",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Success Styled FAB"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.check,
                          backgroundColor: Colors.green,
                          tooltip: "Success",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Danger Styled FAB"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          tooltip: "Danger",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("With Custom Tooltip"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.info,
                          tooltip: "Floating Button with Tooltip",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Rounded Square Shape"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.crop_square,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          tooltip: "Square FAB",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Extended + Custom Text Style"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.edit,
                          isExtended: true,
                          extendedLabel: "Edit",
                          extendedTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          backgroundColor: Colors.yellow[100],
                          foregroundColor: Colors.deepPurple,
                          tooltip: "Extended with Style",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Loading-style FAB (disabled)"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {
                            showLoadingDialog();
                          },
                          icon: Icons.hourglass_top,
                          backgroundColor: Colors.grey.shade400,
                          foregroundColor: Colors.white,
                          tooltip: "Loading",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonWidget: MouseRegion(
        onEnter: (_) => setState(() => isExpanded = true),
        onExit: (_) => setState(() => isExpanded = false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isExpanded) ...[
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {
                  launchUrl('https://your-link.com');
                },
                icon: Icons.chat,
                tooltip: "Chat",
              ),
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {},
                icon: Icons.mail,
                tooltip: "Mail",
              ),
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {},
                icon: Icons.phone,
                tooltip: "Call",
              ),
            ],
            SizedBox(height: 10.0),
            ButtonTypeCommonComponents.defaultFloatingActionButton(
              context,
              onPressed: toggleFab,
              icon: isExpanded ? Icons.close : Icons.menu,
              tooltip: "Toggle FAB Group",
            ),
          ],
        ),
      ),
    );
  }

  void launchUrl(String url) {
    // You can use `url_launcher` package for real implementation.
    debugPrint('Launching URL: $url');
  }
}






class DottedBorderPainter extends CustomPainter {
  final BorderRadius? borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedBorderPainter({
    this.borderRadius,
    this.color = Colors.blue,
    this.strokeWidth = 2,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: borderRadius!.topLeft,
      topRight: borderRadius!.topRight,
      bottomLeft: borderRadius!.bottomLeft,
      bottomRight: borderRadius!.bottomRight,
    );

    final borderPath = Path()..addRRect(rrect);
    final dashPath = Path();

    for (PathMetric pathMetric in borderPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}




