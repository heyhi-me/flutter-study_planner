import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool deadline = true;
  bool harian = true;
  bool bunyikan = true;

  Widget buildSwitch(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: SwitchListTile(
        activeColor: const Color(0xFF8B5CF6),
        title: Text(title),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5CF6),
        elevation: 0,
        centerTitle: true,
        title: const Text("Setting",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildSwitch("Peringatan Deadline", deadline,
                    (val) => setState(() => deadline = val)),
            buildSwitch("Harian", harian,
                    (val) => setState(() => harian = val)),
            buildSwitch("Bunyikan", bunyikan,
                    (val) => setState(() => bunyikan = val)),
          ],
        ),
      ),
    );
  }
}