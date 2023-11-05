import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String? _currentName = '';
  String? _currentSugars = '0';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Update your brew settings',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration,
              validator: (value) =>
                  value!.isNotEmpty ? 'Please enter a name' : null,
              onChanged: (value) {
                setState(() {
                  _currentName = value;
                });
              },
            ),
            SizedBox(height: 20),
            //dropdown
            DropdownButtonFormField<String>(
              decoration: textInputDecoration,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text("$sugar sugars"),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val),
            ),
            //slider
            Slider(
              min: 100,
              max: 900,
              divisions: 8,
              activeColor: Colors.brown[_currentStrength],
              inactiveColor: Colors.brown[_currentStrength],
              value:
                  _currentStrength == 100 ? 100 : _currentStrength.toDouble(),
              onChanged: (value) {
                setState(() {
                  _currentStrength = value.round();
                });
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
