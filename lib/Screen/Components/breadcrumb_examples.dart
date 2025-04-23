import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class BreadcrumbFucntion extends StatelessWidget {
  const BreadcrumbFucntion({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/seconsdPageScreen');
              },
              child: const Text("Go to Second Page"),
            ),
            const Text("This is First page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class SeconsdPageScreen extends StatelessWidget {
  const SeconsdPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {
                    Get.toNamed('/breadcrumbFucntion');
                  },
                ),
                BreadcrumbItem(
                  label: 'Second',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/thirdPageScreen');
              },
              child: const Text("Go to Third Page"),
            ),
            const Text("This is Second page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class ThirdPageScreen extends StatelessWidget {
  const ThirdPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {
                    Get.toNamed('/breadcrumbFucntion');
                  },
                ),
                BreadcrumbItem(
                  label: 'Second',
                  onTap: () {
                    Get.toNamed('/seconsdPageScreen');
                  },
                ),
                BreadcrumbItem(label: 'Third', onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("This is Third Page"),
            ),
            const Text("This is Third page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}




//////////   Function For the Breaadcrumb Order  //////////

class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;

  const Breadcrumb({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isEven) {
          final item = items[index ~/ 2];
          return GestureDetector(
            onTap: item.onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.icon != null) ...[
                  item.icon!,
                  const SizedBox(width: 4),
                ],
                Text(
                  item.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        } else {

////////  Seperator ::::   Chevron Right Icon ( Greater Than >)

          // return const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 4),
          //   child: Icon(Icons.chevron_right, size: 20),
          // );

////////  Seperator ::::   Slash ( / )
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text("/"),
          );
        }
      }),
    );
  }
}


class BreadcrumbItem {
  final String label;
  final VoidCallback onTap;
  final Icon? icon;

  BreadcrumbItem({required this.label, required this.onTap, this.icon});
}
