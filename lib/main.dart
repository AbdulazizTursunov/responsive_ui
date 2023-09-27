import 'package:flutter/material.dart';
import 'package:responsive_ui/for_desktop.dart';
import 'package:responsive_ui/for_mobile.dart';
import 'package:responsive_ui/responsive.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Responsive(mobileBody: MobileBody(), desktopBody: DesktopBody(),));
  }
}

class ResponsiveUi extends StatefulWidget {
  const ResponsiveUi({Key? key}) : super(key: key);

  @override
  State<ResponsiveUi> createState() => _ResponsiveUiState();
}

class _ResponsiveUiState extends State<ResponsiveUi> {
  bool isDesktop(context) => MediaQuery.of(context).size.width >= 600;

  bool isMobile(context) => MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: isDesktop(context) ? Colors.red : Colors.teal,
        appBar: AppBar(
          title: const Text('responsive ui'),
        ),
        body: Row(
          children: [
            if (isDesktop(context))
              Container(
                color: Colors.blue,
                width: 200,
                height: double.infinity,
                child: Text('width: ${MediaQuery.of(context).size.width}'),
              ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                width: 200,
                height: double.infinity,
                child: Text('height: ${MediaQuery.of(context).size.width}'),
              ),
            ),
          ],
        ),
      );
}
