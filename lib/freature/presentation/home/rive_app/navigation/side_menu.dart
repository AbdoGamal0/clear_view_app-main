import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../assets.dart';
import '../models/menu_item.dart';
import '../theme.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItems;
  final List<MenuItemModel> _historyMenuIcons = MenuItemModel.menuItems2;
  final List<MenuItemModel> _themeMenuIcon = MenuItemModel.menuItems3;
  String _selectedMenu = MenuItemModel.menuItems[0].title;
  bool _isDarkMode = false;
  SMIBool? _themeStatus;

  void onThemeRiveIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      _themeMenuIcon[0].riveIcon.stateMachine,
    );
    if (controller != null) {
      artboard.addController(controller);
      _themeStatus = controller.findInput<bool>("active") as SMIBool?;
    }
  }

  void onMenuPress(MenuItemModel menu) {
    setState(() {
      _selectedMenu = menu.title;
    });
    if (menu.targetPage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => menu.targetPage!),
      );
    }
  }

  void onThemeToggle(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    _themeStatus?.change(value);
    RiveAppTheme.isDarkMode = _isDarkMode; // تحديث الثيم العام
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom - 60,
      ),
      constraints: const BoxConstraints(maxWidth: 288),
      decoration: BoxDecoration(
        color: _isDarkMode
            ? RiveAppTheme.backgroundDark
            : RiveAppTheme.background2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.person, size: 24),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ashu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "Inter",
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "ashu@email.com",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                        fontFamily: "Inter",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuButtonSection(
                    title: "BROWSE",
                    selectedMenu: _selectedMenu,
                    menuIcons: _browseMenuIcons,
                    onMenuPress: onMenuPress,
                  ),
                  MenuButtonSection(
                    title: "HISTORY",
                    selectedMenu: _selectedMenu,
                    menuIcons: _historyMenuIcons,
                    onMenuPress: onMenuPress,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Opacity(
                    opacity: 0.6,
                    child: RiveAnimation.asset(
                      iconsRiv,
                      stateMachines: [_themeMenuIcon[0].riveIcon.stateMachine],
                      artboard: _themeMenuIcon[0].riveIcon.artboard,
                      onInit: onThemeRiveIconInit,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    _themeMenuIcon[0].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CupertinoSwitch(value: _isDarkMode, onChanged: onThemeToggle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({
    super.key,
    required this.title,
    required this.menuIcons,
    this.selectedMenu = "Home",
    required this.onMenuPress,
  });

  final String title;
  final String selectedMenu;
  final List<MenuItemModel> menuIcons;
  final Function(MenuItemModel menu) onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 15,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: menuIcons
                .map(
                  (menu) => Column(
                    children: [
                      Divider(
                        color: Colors.white.withOpacity(0.1),
                        thickness: 1,
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      MenuRow(
                        menu: menu,
                        selectedMenu: selectedMenu,
                        onMenuPress: onMenuPress(menu),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
