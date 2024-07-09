import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferencesCard extends StatelessWidget {
  final List<Map<String, String>> references;

  const ReferencesCard({Key? key, required this.references}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "References",
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "For more information on glaucoma treatment, you can refer to the following resources:",
              textAlign: TextAlign.justify,
              style: GoogleFonts.breeSerif(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            ...references
                .map((reference) => buildReferenceItem(reference))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget buildReferenceItem(Map<String, String> reference) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          text: reference['title'],
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final url = reference['url'];
              if (url != null && await canLaunch(url)) {
                await launch(url);
              } else {
                // Handle if the URL can't be launched
                throw 'Could not launch $url';
              }
            },
        ),
      ),
    );
  }
}
