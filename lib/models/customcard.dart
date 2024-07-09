import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String text;
  final Color avatarBackgroundColor;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.backgroundColor,
    required this.imagePath,
    required this.text,
    required this.avatarBackgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        child: SizedBox(
          height: 140,
          width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: avatarBackgroundColor,
                radius: 42,
                child: Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                text,
                style: GoogleFonts.breeSerif(color: Colors.black, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const ActionCard({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style:
                      GoogleFonts.breeSerif(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(icon, size: 120, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
