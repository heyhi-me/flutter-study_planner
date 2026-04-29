import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final Map<String, dynamic> task;

  const TaskDetailScreen({super.key, required this.task});

  /// 🔥 WIDGET UNTUK ALIGNMENT RAPI
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110, // 🔥 biar ":" sejajar
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Text(" : "),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),

      /// APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          ),
        title: const Text(
          "Detail Riwayat Belajar",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 TITLE
              const Text(
                "Detail Sesi Belajar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// 🔹 CONTAINER DETAIL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow("Mata Kuliah", task["title"]),
                    buildDetailRow("Materi", task["subtitle"]),
                    buildDetailRow("Tanggal", task["deadline"]),
                    buildDetailRow("Waktu", "14:00 - 17:00"),
                    buildDetailRow("Durasi", "3 jam"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 CATATAN LOKASI
              const Text(
                "Catatan Lokasi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pendopo, JL.Sukabirus, Kec DayeuhKolot,\n"
                      "samping Telkom Medika, Telkom University",
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lokasi tercatat secara otomatis via GPS",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}