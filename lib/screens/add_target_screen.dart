import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddTargetScreen extends StatefulWidget {
  const AddTargetScreen({super.key});

  @override
  State<AddTargetScreen> createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
  final _titleController = TextEditingController();
  final _deadlineController = TextEditingController();

  String _locationText = "Mengambil lokasi...";
  String selectedCourse = "Mata Kuliah";
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        _locationText = "Izin lokasi ditolak";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks[0];

    setState(() {
      _locationText =
      "${place.street}, ${place.subLocality}, ${place.locality}";
    });
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _deadlineController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _saveTask() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama tugas wajib diisi")),
      );
      return;
    }

    Navigator.pop(context, {
      "title": _titleController.text,
      "percent": "${(_progress * 100).toInt()}%",
      "value": _progress,
      "isDone": _progress == 1,
      "subTasks": [
        {
          "name": selectedCourse,
          "date": _deadlineController.text,
          "time": "-",
        }
      ],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        centerTitle: true,
        title: const Text(
          "Edit Tugas Kuliah",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Nama Tugas",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Masukkan nama tugas",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Mata Kuliah",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: selectedCourse,
                isExpanded: true,
                underline: const SizedBox(),
                items: ["Mata Kuliah", "APB", "IoT", "AI"]
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCourse = val!;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text("Deadline",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            TextField(
              controller: _deadlineController,
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.calendar_today),
                hintText: "Pilih tanggal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Lokasi",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_locationText),
                  ),
                  const Icon(Icons.location_on, color: Colors.red),
                ],
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A0DAD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: _saveTask,
                      child: const Text("Simpan",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}