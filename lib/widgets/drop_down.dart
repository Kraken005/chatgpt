import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../constants/constants.dart';
import '../services/services.dart';

class ModelsDropDown extends StatefulWidget {
  const ModelsDropDown({super.key});

  @override
  State<ModelsDropDown> createState() => _ModelsDropDownState();
}

class _ModelsDropDownState extends State<ModelsDropDown> {
  String currentModel = 'Model1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: scaffoldBackgroundColor,
        items: getModelsItem,
        value: currentModel,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        });
  }
}
