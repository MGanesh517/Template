import 'package:flutter/material.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:template/Common%20Components/BreakPoints/breakpoints.dart';
import 'package:template/Screen/Custom_AppBar/custom_appbar.dart';

class GridRealTimeExample extends StatelessWidget {
  const GridRealTimeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
              SizedBox(
                width: double.infinity,
                child: ResponsiveRow(
                  alignment: ResponsiveAlignment.spaceBetween,
                  columns: [
                    ResponsiveColumn(
                        ResponsiveConstants().textFormField,
                        child: Container(
                          color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Col 3",textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveColumn(
                        ResponsiveConstants().textFormField,
                        child: Container(
                          color: Colors.blue[300],
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Col 3",textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveColumn(
                        ResponsiveConstants().textFormField,
                        child: Container(
                          color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Col 3",textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveColumn(
                        ResponsiveConstants().textFormField,
                        child: Container(
                          color: Colors.blue[300],
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Col 3",textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]),
              ),
          ],
        ),
      ),
    );
  }
}