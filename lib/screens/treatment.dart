import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/references.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Treatment",
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
              "The damage caused by glaucoma can't be reversed. But treatment and regular checkups can help slow or prevent vision loss, especially if you catch the disease in its early stages.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            buildTreatmentSection(
              "Eyedrops",
              "Glaucoma treatment often starts with prescription eye drops. Some may decrease eye pressure by improving how fluid drains from your eye. Others decrease the amount of fluid your eye makes. Depending on how low your eye pressure needs to be, you may be prescribed more than one eye drop.",
              [
                "Prostaglandins. These increase the outflow of the fluid in your eye, helping to reduce eye pressure. Medicines in this category include latanoprost (Xalatan), travoprost (Travatan Z), tafluprost (Zioptan), bimatoprost (Lumigan) and latanoprostene bunod (Vyzulta).",
                "Beta blockers. These reduce the production of fluid in your eye, helping to lower eye pressure. Examples include timolol (Betimol, Istalol, Timoptic) and betaxolol (Betoptic S).",
                "Alpha-adrenergic agonists. These reduce the production of the fluid that flows throughout the inside of your eye. They also increase the outflow of fluid in your eye. Examples include apraclonidine (Iopidine) and brimonidine (Alphagan P, Qoliana).",
                "Carbonic anhydrase inhibitors. These medicines reduce the production of fluid in your eye. Examples include dorzolamide and brinzolamide (Azopt).",
                "Rho kinase inhibitor. This medicine lowers eye pressure by suppressing the rho kinase enzymes responsible for fluid increase. It is available as netarsudil (Rhopressa).",
                "Miotic or cholinergic agents. These increase the outflow of fluid from your eye. An example is pilocarpine (Isopto Carpine)."
              ],
            ),
            const SizedBox(height: 15),
            buildTreatmentSection(
              "Oral medications",
              "Eye drops alone may not bring your eye pressure down to the desired level. So your eye doctor may also prescribe oral medicine. This medicine is usually a carbonic anhydrase inhibitor.",
              [
                "Possible side effects include frequent urination, tingling in the fingers and toes, depression, stomach upset, and kidney stones."
              ],
            ),
            const SizedBox(height: 15),
            buildTreatmentSection(
              "Surgery and other therapies",
              "Other treatment options include laser therapy and surgery.",
              [
                "Laser therapy. Laser trabeculoplasty (truh-BEK-u-low-plas-tee) is an option if you can't tolerate eye drops.",
                "Filtering surgery. This is a surgical procedure called a trabeculectomy (truh-bek-u-LEK-tuh-me).",
                "Drainage tubes. In this procedure, the eye surgeon inserts a small tube in your eye to drain excess fluid to lower eye pressure.",
                "Minimally invasive glaucoma surgery (MIGS). Your eye doctor may suggest a MIGS procedure to lower your eye pressure."
              ],
            ),
            const SizedBox(height: 15),
            buildTreatmentSection(
              "Treating acute angle-closure glaucoma",
              "Acute angle-closure glaucoma is a medical emergency.",
              ["You may have a procedure called a laser peripheral iridotomy."],
            ),
            const SizedBox(height: 20),
            ReferencesCard(references: references), // Add ReferencesCard here
          ],
        ),
      ),
    );
  }

  Widget buildTreatmentSection(
      String title, String description, List<String> bullets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.breeSerif(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: GoogleFonts.breeSerif(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bullets.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.arrow_right_alt),
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
        ),
      ],
    );
  }
}
