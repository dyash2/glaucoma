import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/references.dart';

class CausesScreen extends StatelessWidget {
  const CausesScreen({Key? key}) : super(key: key);

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
                  "Causes",
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
              "Glaucoma occurs due to increased intraocular eye pressure, which damages the optic nerve over time.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            buildCausesSection(
              "Factors contributing to glaucoma include:",
              [
                "Resistance increase in drainage canals of the eye.",
                "Build-up of aqueous humor fluid due to impaired drainage.",
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Risk Factors of Glaucoma",
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Certain factors increase the likelihood of developing glaucoma.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            buildCausesSection(
              "Common risk factors include:",
              [
                "Age, especially over 60 years old.",
                "Ethnicity, with higher risks for Black, Hispanic, Asian, and Inuit populations.",
                "Diabetes, which doubles the risk.",
                "Family history of glaucoma.",
                "Long-term use of corticosteroids.",
                "Previous eye injury or surgery.",
              ],
            ),
            const SizedBox(height: 20),
            ReferencesCard(references: references),
          ],
        ),
      ),
    );
  }

  Widget buildCausesSection(String title, List<String> bullets) {
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
            itemCount: bullets.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(
                  bullets[index],
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
