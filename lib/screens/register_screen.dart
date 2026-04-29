import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              SizedBox(height: 40),

              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("📖", style: TextStyle(fontSize: 28)),
                  SizedBox(width: 10),
                  Text(
                    "STUDY PLANNER",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Text(
                "Daftar Akun Baru",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              Text(
                "Mulai atur tugas mu hari ini",
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              inputField("Nama Lengkap"),
              inputField("Nama Pengguna"),
              inputField("Email"),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Kata Sandi",
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
