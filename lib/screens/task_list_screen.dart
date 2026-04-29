import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> tasks = [
    {
      "title": "Aplikasi Perangkat Bergerak",
      "subtitle": "Progres Tubes",
      "deadline": "18 April 2026",
    },
    {
      "title": "Sistem Cerdas IoT",
      "subtitle": "Tugas Kelompok",
      "deadline": "20 April 2026",
    },
  ];

  void _goToAddTask() async {
    final result = await Navigator.pushNamed(context, '/add-target');

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        tasks.add({
          "title": result["title"],
          "subtitle": result["subTasks"][0]["name"],
          "deadline": result["subTasks"][0]["date"],
        });
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _editTask(int index) async {
    final result = await Navigator.pushNamed(context, '/add-target');

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        tasks[index] = {
          "title": result["title"],
          "subtitle": result["subTasks"][0]["name"],
          "deadline": result["subTasks"][0]["date"],
        };
      });
    }
  }

  /// 👉 TAMBAHAN: VIEW DETAIL
  void _viewDetail(Map<String, dynamic> task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskDetailScreen(task: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Daftar Tugas Kuliah",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => _viewDetail(task), // 👈 klik card
              child: TaskCard(
                title: task["title"]!,
                subtitle: task["subtitle"]!,
                deadline: task["deadline"]!,
                onEdit: () => _editTask(index),
                onDelete: () => _deleteTask(index),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddTask,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}