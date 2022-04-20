import 'package:flutter/material.dart';

class CheckBoxMock extends StatefulWidget {
  const CheckBoxMock({Key? key}) : super(key: key);

  @override
  _CheckBoxMockState createState() => _CheckBoxMockState();
}

class _CheckBoxMockState extends State<CheckBoxMock> {
  final checkBoxValores = [
    'Gases',
    'Medicamentos',
    'Materiais',
    'Taxas',
    'Diárias'
  ];

  List<int> itensSelecionados = [];

  _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Contas"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 5),
                  SizedBox(height: 20),
                  SizedBox(
                      height: 280,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: checkBoxValores.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                                title: Text(checkBoxValores[index]),
                                value: itensSelecionados.contains(index),
                                onChanged: (bool? value) {
                                  if (value != null) {
                                    setState(() {
                                      if (value) {
                                        itensSelecionados.add(index);
                                      } else {
                                        itensSelecionados.remove(index);
                                      }
                                    });
                                  }
                                });
                          })),
                  Divider(height: 5),
                ],
              ),
              actions: [
                ElevatedButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    itensSelecionados.clear();
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: Text("Continue"),
                  onPressed: () {
                    itensSelecionados.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _showAlertDialog(context);
            },
            child: Text('Mostrar Dialog'),
          ),
        ));
  }
}
