import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _bgColor,
        child: Center(
          child: Text("Selected Page: $selectedIndex"),
        ),
      ),
      bottomNavigationBar: AwesomeBottomNav(
        menuItems: _getMenuItems(),
        highlightedIcons: _getHighlightedIcons(),
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color(0xFFFF9944),
        navFgColor: Colors.grey.withOpacity(0.5),
        navBgColor: Colors.white,
      ),
    );
  }

  List<Widget> _getHighlightedIcons() {
    final List<Widget> _items = List<Widget>.empty(growable: true);
    _items.add(
      SvgPicture.asset(
        ImageConstants.IC_BOTTOM_NAV_HOME,
      ),
    );
    _items.add(
      SvgPicture.asset(
        ImageConstants.IC_BOTTOM_NAV_ZNOW,
      ),
    );
    _items.add(
      SvgPicture.asset(
        ImageConstants.IC_BOTTOM_NAV_ZEXPLORE,
      ),
    );
    _items.add(
      SvgPicture.asset(
        ImageConstants.IC_BOTTOM_NAV_LEDGER,
      ),
    );
    return _items;
  }

  List<Widget> _getMenuItems() {
    final List<Widget> items = List<Widget>.empty(growable: true);
    items.add(
      _getMenu(ImageConstants.IC_BOTTOM_NAV_HOME, "HOME"),
    );
    items.add(
      _getMenu(ImageConstants.IC_BOTTOM_NAV_ZNOW, "ZNOW"),
    );
    items.add(
      _getMenu(ImageConstants.IC_BOTTOM_NAV_ZEXPLORE, "ZEXPLORE"),
    );
    items.add(
      _getMenu(ImageConstants.IC_BOTTOM_NAV_LEDGER, "LEDGER"),
    );
    return items;
  }

  Widget _getMenu(final String icon, final String text) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        Text(
          text,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
