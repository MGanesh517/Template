import 'package:flutter/material.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class ScrollBarExamples extends StatelessWidget {
  const ScrollBarExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Item $index"),
              );
            },
          ),
          Row(
            children: [
              const Text(
                "Scroll Bar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                height: 1000,
                child: Scrollbar(
                  // thickness: 8,
                  scrollbarOrientation: ScrollbarOrientation.right,
                  radius: const Radius.circular(10.0),
                  thumbVisibility: true,
                  trackVisibility: true,
                child: Container(
                  color: Colors.grey))),
            ],
          ),
          
        ],
      ),
    );
  }
}
