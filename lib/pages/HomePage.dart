// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:mediplanner/Widgets/CustomBottomNavigationBar.dart';
import 'package:mediplanner/pages/MedicineListPage.dart';

import '../models/Medicine.dart';
import 'MedicineAddPage.dart';

List<Medicine> medicines = [
  Medicine(
      name: "Paracetamol",
      time: "10:00",
      dosage: "1 comprimido",
      notes: "Tomar com água"),
  Medicine(
      name: "Dipirona",
      time: "14:00",
      dosage: "2 comprimidos",
      notes: "Tomar com água"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    MedicineListPage(),
    MedicineAddPage(
      onSave: (medicine) {
        medicines.add(medicine);
      },
    ),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addMedicine(Medicine medicine) {
    setState(() {
      medicines.add(medicine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lembretes'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
        onTap: (int index) {},
      ),
    );
  }
}
