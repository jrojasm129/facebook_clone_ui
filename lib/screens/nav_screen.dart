import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({ Key? key }) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>{

  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu,
  ];

  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(

        appBar: Responsive.isDesktop(context) 
         ? CustomAppBar(
          currentUser: currentUser,
          icons: _icons,
          selectedIndex: selectedIndex,
          onTap: (index) => setState((() => selectedIndex = index)))
         : null,

        body: TabBarView(
          children: _screens
        ),

        bottomNavigationBar: Responsive(
          mobile: CustomTabBar(
          icons: _icons,
          selectedIndex: selectedIndex,
          onTap: (index) => setState((() => selectedIndex = index))
          ), 
          desktop: const SizedBox.shrink()
        ),
      ),
    );
  }

}

