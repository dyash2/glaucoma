import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/references.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

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
        'url': 'https://pubmed.ncbi.nlm.nih.gov/20711029'
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
                // height: 150,
                padding: EdgeInsets.only(left: 9.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  textAlign: TextAlign.left,
                  "Symptoms",
                  style: GoogleFonts.breeSerif(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "The symptoms of glaucoma depend on the type and stage of your condition.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            buildSymptomsList("Open-angle glaucoma", [
              "No symptoms in early stages",
              "Gradually, patchy blind spots in your side vision. Side vision also is known as peripheral vision",
              "In later stages, difficulty seeing things in your central vision"
            ]),
            const SizedBox(height: 15),
            buildSymptomsList("Acute angle-closure glaucoma", [
              "Severe headache",
              "Severe eye pain",
              "Nausea or vomiting",
              "Blurred vision",
              "Halos or colored rings around lights",
              "Eye redness"
            ]),
            const SizedBox(height: 15),
            buildSymptomsList("Normal-tension glaucoma", [
              "No symptoms in early stages",
              "Gradually, blurred vision",
              "In later stages, loss of side vision"
            ]),
            const SizedBox(height: 15),
            buildSymptomsList("Glaucoma in children", [
              "A dull or cloudy eye (infants)",
              "Increased blinking (infants)",
              "Tears without crying (infants)",
              "Blurred vision",
              "Nearsightedness that gets worse",
              "Headache"
            ]),
            const SizedBox(height: 15),
            buildSymptomsList("Pigmentary glaucoma", [
              "Halos around lights",
              "Blurred vision with exercise",
              "Gradual loss of side vision"
            ]),
            const SizedBox(height: 20),
            ReferencesCard(references: references),
          ],
        ),
      ),
    );
  }

  Widget buildSymptomsList(String title, List<String> symptoms) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Text(
              title,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.arrow_right_alt_sharp),
                title: Text(
                  symptoms[index],
                  style: GoogleFonts.breeSerif(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
