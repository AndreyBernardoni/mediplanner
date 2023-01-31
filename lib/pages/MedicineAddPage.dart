// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:mediplanner/pages/HomePage.dart';

import '../models/Medicine.dart';

class MedicineAddPage extends StatefulWidget {
  final Function(Medicine) onSave;
  const MedicineAddPage({super.key, required this.onSave});

  @override
  _MedicineAddPageState createState() => _MedicineAddPageState();
}

class _MedicineAddPageState extends State<MedicineAddPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(Medicine(
          name: _nameController.text,
          time: selectedTime.format(context),
          dosage: _doseController.text,
          notes: _notesController.text));
    }
  }

  bool canAdd = false;

  TimeOfDay selectedTime = TimeOfDay.now();

  void _showTimePicker() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Color.fromARGB(255, 118, 214, 9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Olá, Usuário!\nVocê tem ${medicines.length} medicamento(s) para tomar hoje.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: SizedBox(
                        height: 400,
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: "Nome",
                                hintText: "Insira o nome do medicamento",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.medication),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  canAdd = false;
                                  return "Por favor, insira o nome do medicamento";
                                } else {
                                  canAdd = true;
                                }
                                return null;
                              },
                            ),
                            InkWell(
                              onTap: _showTimePicker,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: "Horário",
                                  hintText: "Insira o horário do medicamento",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.access_time),
                                ),
                                child: Text(
                                  selectedTime.format(context),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _doseController,
                              decoration: const InputDecoration(
                                labelText: "Dose",
                                hintText: "Insira a dosage do medicamento",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.medication_liquid),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  canAdd = false;
                                  return "Por favor, insira a dosagem";
                                } else {
                                  canAdd = true;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _notesController,
                              decoration: const InputDecoration(
                                labelText: "Observações",
                                hintText:
                                    "Insira alguma observação sobre o medicamento",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.notes),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  canAdd = false;
                                  return "Por favor, insira alguma observação";
                                } else {
                                  canAdd = true;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () {
                                _save();
                                if (canAdd) {
                                  _doseController.clear();
                                  _nameController.clear();
                                  _notesController.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Medicamento adicionado com sucesso!"),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Adicionar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
