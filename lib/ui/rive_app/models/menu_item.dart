import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/rive_app/models/tab_item.dart';

import '../../../freature/presentation/find_doctor/ListOfDoctor.dart';
import '../../../freature/presentation/home/home_screen.dart';
import '../navigation/main page.dart';
import 'help.dart';

class MenuItemModel {
  MenuItemModel({
    this.id,
    this.title = "",
    required this.riveIcon,
    this.targetPage,
  });

  UniqueKey? id = UniqueKey();
  String title;
  TabItem riveIcon;
  Widget? targetPage;

  // قائمة العناصر مع الصفحات المرفقة
  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Home",
      riveIcon: TabItem(stateMachine: "HOME_interactivity", artboard: "HOME"),
      targetPage: HomeScreen(),
    ),
    MenuItemModel(
      title: "Search",
      riveIcon:
      TabItem(stateMachine: "SEARCH_Interactivity", artboard: "SEARCH"),
      targetPage: DoctorsListingPage(),
    ),
    MenuItemModel(
      title: "My Favorite Doctors",
      riveIcon:
      TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
      targetPage: ChatbotPage(),
    ),
    MenuItemModel(
      title: "Help",
      riveIcon: TabItem(stateMachine: "CHAT_Interactivity", artboard: "CHAT"),
      targetPage: HelpCenterApp(),
    ),
  ];

  static List<MenuItemModel> menuItems2 = [
    MenuItemModel(
      title: "My Bookings",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
      targetPage: ChatbotPage(),
    ),
    MenuItemModel(
      title: "Notification",
      riveIcon: TabItem(stateMachine: "BELL_Interactivity", artboard: "BELL"),
      targetPage: ChatbotPage(),
    ),
  ];

  static List<MenuItemModel> menuItems3 = [
    MenuItemModel(
      title: "Dark Mode",
      riveIcon: TabItem(stateMachine: "SETTINGS_Interactivity", artboard: "SETTINGS"),
      targetPage: null, // لا يوجد صفحة مرتبطة
    ),
  ];
}

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Center(child: Text('This is the Chatbot Page.')),
    );
  }
}

class MenuRow extends StatelessWidget {
  const MenuRow({
    Key? key,
    required this.menu,
    required this.selectedMenu,
    required this.onMenuPress,
  }) : super(key: key);

  final MenuItemModel menu;
  final String selectedMenu;
  final Function(MenuItemModel menu) onMenuPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menu.title),
      selected: menu.title == selectedMenu,
      onTap: () => onMenuPress(menu), // عند الضغط، يستدعي onMenuPress
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({
    Key? key,
    required this.title,
    required this.menuIcons,
    this.selectedMenu = "Home",
    required this.onMenuPress,
  }) : super(key: key);

  final String title;
  final String selectedMenu;
  final List<MenuItemModel> menuIcons;
  final Function(MenuItemModel menu) onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var menu in menuIcons)
          MenuRow(
            menu: menu,
            selectedMenu: selectedMenu,
            onMenuPress: onMenuPress,
          ),
      ],
    );
  }
}

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItems;
  String _selectedMenu = MenuItemModel.menuItems[0].title;

  void onMenuPress(MenuItemModel menu) {
    if (menu.targetPage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => menu.targetPage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MenuButtonSection(
              title: "Menu",
              selectedMenu: _selectedMenu,
              menuIcons: _browseMenuIcons,
              onMenuPress: (menu) {
                setState(() {
                  _selectedMenu = menu.title;
                });
                onMenuPress(menu); // يتم استدعاء التنقل
              },
            ),
          ),
        ],
      ),
    );
  }
}
