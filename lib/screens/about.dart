import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/references.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> references = [
      {
        'title':
            '1. American Academy of Ophthalmology - Glaucoma Treatment Guidelines\n',
        'url':
            'https://my.clevelandclinic.org/health/diseases/4212-glaucoma#symptoms-and-causes'
      },
      {
        'title':
            '2. Indian Association of Medical Science - Treatment for Glaucoma\n',
        'url': 'https://pubmed.ncbi.nlm.nih.gov/20711029/'
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xffF4F1F2),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F1F2),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 20,
              clipBehavior: Clip.hardEdge,
              child: Container(
                padding: EdgeInsets.only(left: 9.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  textAlign: TextAlign.left,
                  "Overview",
                  style: GoogleFonts.breeSerif(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Image.asset(
                  'assets/about1.png', // Replace with your image asset path
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Glaucoma is a group of eye conditions that damage the optic nerve. The optic nerve sends visual information from your eye to your brain and is vital for good vision. Damage to the optic nerve is often related to high pressure in your eye. But glaucoma can happen even with normal eye pressure.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Glaucoma can occur at any age but is more common in older adults. It is one of the leading causes of blindness for people over the age of 60.\n\n"
              "Many forms of glaucoma have no warning signs. The effect is so gradual that you may not notice a change in vision until the condition is in its later stages.\n\n"
              "It's important to have regular eye exams that include measurements of your eye pressure. If glaucoma is recognized early, vision loss can be slowed or prevented. If you have glaucoma, you'll need treatment or monitoring for the rest of your life.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ReferencesCard(references: references),
          ],
        ),
      ),
    );
  }
}
