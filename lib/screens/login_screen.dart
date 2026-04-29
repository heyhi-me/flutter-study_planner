import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 40),

              // Logo & Title
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
                "SELAMAT DATANG KEMBALI",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Text("Login Untuk Melanjutkan"),

              SizedBox(height: 30),

              // Username
              TextField(
                decoration: InputDecoration(
                  hintText: "Nama Pengguna",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Kata sandi",
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

              // Button Login
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text("Masuk"),
                ),
              ),

              SizedBox(height: 20),

              Text("Or continue with"),

              SizedBox(height: 15),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialIcon("G"),
                  SizedBox(width: 15),
                  socialIcon(""),
                  SizedBox(width: 15),
                  socialIcon("f"),
                ],
              ),

              Spacer(),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Daftar di sini",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialIcon(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}