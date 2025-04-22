import 'package:flutter/material.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:template/Common%20Components/BreakPoints/breakpoints.dart';
import 'package:template/Common%20Components/common_input_fields.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class MastersListScreen extends StatelessWidget {
  const MastersListScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      bool isLargeScreen = constraints.maxWidth >= 700;

        return CommonScaffoldWithAppBar(
        // leadingChild: !isLargeScreen ? IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(Icons.chevron_left, color: Theme.of(context).colorScheme.onSurface),
        //   ) : null,
          // titleChild: !isLargeScreen ? Text(
          //   'Masters',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Theme.of(context).colorScheme.onSurface,
          //   ),
          // ) : null,
        body: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Masters',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
      
              SizedBox(height: 16),
      
              ResponsiveRow(columns: [
                          ResponsiveColumn(
                            ResponsiveConstants().fullScreen,
                            child: CommonComponents.defaultSearchTextFormField(
                              context,
                              // controller: controller.searchController,
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              onChange: (value) {},
                              onFieldSubmitted: (val) {},
                            ),
                          ),
                        ]),
      
              SizedBox(height: 16),
      
              Expanded(
                  child: GridView.builder(
                              itemCount: 20,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: MediaQuery.of(context).size.width <= 800
                                    ? 2
                                    : MediaQuery.of(context).size.width <= 1300
                                        ? 3
                                        : MediaQuery.of(context).size.width <= 1700
                                            ? 5
                                            : 6,
                                childAspectRatio: 1,
                                crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
                                mainAxisExtent: 100,
                              ),
                              itemBuilder: (context, index) {
                                return CardWidgetSingle(
                                  modelName: "Master ${index + 1}",
                                  onTap: () {},
                                );
                                // return Res?
                              },
                            )
                  ),
                
            ],
          ),
        ),
      );
      },
    );
  }
}

class CardWidgetSingle extends StatelessWidget {
  final String modelName;
  final VoidCallback? onTap;

  const CardWidgetSingle({super.key, required this.modelName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.model_training,color: Theme.of(context).colorScheme.onSurface ),SizedBox(width: 5.0),
                        Text(modelName,overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(context).colorScheme.onSurface),),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.add , color: Theme.of(context).colorScheme.onSurface),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}