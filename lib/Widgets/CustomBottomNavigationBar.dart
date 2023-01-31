import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      required this.onTabSelected,
      required void Function(int index) onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 104, 209, 29),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      currentIndex: selectedIndex,
      elevation: 0,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
          ),
          label: 'Lembretes',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
          ),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Configurações',
        ),
      ],
    );
  }
}
