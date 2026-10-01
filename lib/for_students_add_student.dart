import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';
import 'componenet/custom_text_field.dart';
import 'componenet/custom_button.dart';

class ForStudentAddStudent extends StatefulWidget {
  const ForStudentAddStudent({super.key});

  @override
  State<ForStudentAddStudent> createState() =>
      _ForStudentAddStudentState();
}

class _ForStudentAddStudentState extends State<ForStudentAddStudent> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController fatherNameController =
  TextEditingController();

  void saveStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    if (name.isNotEmpty && fatherName.isNotEmpty) {
      final newStudent = Student(
        id: Random().nextInt(10000000),
        name: name,
        fatherName: fatherName,
      );

      Navigator.pop(
        context,
        newStudent,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Name and Father name can't be empty",
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            componentController: nameController,
            hintText: "Enter name",
          ),

          const SizedBox(height: 50),

          CustomTextField(
            componentController: fatherNameController,
            hintText: "Enter father name",
          ),

          const SizedBox(height: 50),

          CustomButton(
            onTap: saveStudent,
            buttonText: "Add",
            buttonIcon: Icons.add,
          ),
        ],
      ),
    );
  }
}