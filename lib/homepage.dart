import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glacuoma/screens/about.dart';
import 'package:glacuoma/screens/causes.dart';
import 'package:glacuoma/screens/symptoms.dart';
import 'package:glacuoma/screens/treatment.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'display.dart';
import 'models/customcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;

  Future<void> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayScreen(
              imagePath: imageFile!.path,
            ),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> pickImage() async {
    final pickimg = ImagePicker();
    final pickedimage = await pickimg.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedimage != null) {
        imageFile = File(pickedimage.path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayScreen(
              imagePath: imageFile!.path,
            ),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F1F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Glaucoma Vision Simulator",
            style: GoogleFonts.breeSerif(fontSize: 32),
          ),
          const SizedBox(height: 10),
          ActionCard(
            backgroundColor: const Color.fromARGB(255, 125, 21, 156),
            text: 'Pick from Gallery',
            icon: Icons.photo,
            onTap: pickImage,
          ),
          const SizedBox(height: 10),
          ActionCard(
            backgroundColor: const Color(0xff15889C),
            text: 'Capture Image',
            icon: Icons.camera_alt_outlined,
            onTap: captureImage,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                backgroundColor: Colors.white,
                imagePath: 'assets/eyeball.png',
                text: 'About',
                avatarBackgroundColor: Colors.indigo.shade100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                backgroundColor: Colors.white,
                imagePath: 'assets/symptoms.png',
                text: 'Symptoms',
                avatarBackgroundColor: Colors.lime.shade200,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SymptomsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                backgroundColor: Colors.white,
                imagePath: 'assets/treatment.png',
                text: 'Treatment',
                avatarBackgroundColor: Colors.teal.shade100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TreatmentScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                backgroundColor: Colors.white,
                imagePath: 'assets/causes.png',
                text: 'Causes',
                avatarBackgroundColor: Colors.pink.shade100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CausesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
