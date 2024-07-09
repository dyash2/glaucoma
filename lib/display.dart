import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class DisplayScreen extends StatefulWidget {
  final String imagePath;
  const DisplayScreen({super.key, required this.imagePath});
  @override
  DisplayScreenState createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayScreen> {
  double sliderValue = 4;
  final List<String> labels = [
    '| ',
    '08 years',
    '| ',
    '16 years',
    '| ',
    '24 years',
    '| ',
    '32 years',
    '| ',
    '40 years'
  ];

  final picker = ImagePicker();
  final GlobalKey globalKey = GlobalKey();

  Future<void> handleCameraButtonPressed() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: double.infinity,
        maxWidth: double.infinity,
        requestFullMetadata: true,
        preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayScreen(imagePath: pickedFile.path),
        ),
      );
    }
  }

  Future<void> handleSaveButtonPressed() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(
          pixelRatio: 3.0); // Higher pixel ratio for better quality
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final Directory directory =
          await getTemporaryDirectory(); // Using temporary directory
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final String filePath = '${directory.path}/$fileName.png';
      final File imgFile = File(filePath);
      await imgFile.writeAsBytes(pngBytes);

      final result = await ImageGallerySaver.saveFile(filePath);
      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved to ${result["filePath"]}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save image')),
        );
      }
    } catch (e) {
      log('Error saving image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F1F2),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 32,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                icon: const Icon(Icons.camera_alt_rounded),
                iconSize: 32,
                onPressed: () async {
                  handleCameraButtonPressed();
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white24.withOpacity(0.1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: LayoutBuilder(builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = constraints.maxHeight;
                      return Stack(
                        fit: StackFit.loose,
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: width,
                              height: height,
                              child: Image.file(
                                File(widget.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (sliderValue >= 8)
                            Positioned(
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 12)
                            Positioned(
                              left: width / 3,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 16)
                            Positioned(
                              left: width / 3 * 2,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 20)
                            Positioned(
                              left: width / 3 * 2,
                              top: height / 3,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 24)
                            Positioned(
                              left: width / 3 * 2,
                              top: height / 3 * 2,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 28)
                            Positioned(
                              right: width / 3,
                              top: height / 3 * 2,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 32)
                            Positioned(
                              right: width / 3 * 2,
                              top: height / 3 * 2,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 36)
                            Positioned(
                              right: width / 3 * 2,
                              top: height / 3,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                          if (sliderValue >= 40)
                            Positioned(
                              right: width / 3,
                              top: height / 3,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: width / 3,
                                    height: height / 3 * 0.5,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Colors.white,
              activeTrackColor: Colors.teal,
              inactiveTrackColor: Colors.grey.shade500,
              trackHeight: 25.0,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 14.0,
              ),
              overlayColor: Colors.red.withOpacity(0.3),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 24.0,
              ),
              valueIndicatorColor: Colors.transparent,
              valueIndicatorTextStyle:
                  const TextStyle(color: Colors.transparent),
              tickMarkShape: const RoundSliderTickMarkShape(
                tickMarkRadius: 4.0,
              ),
            ),
            child: Slider(
              divisions: 9,
              label: labels[
                  ((sliderValue - 4) / (40 / (labels.length - 1))).round()],
              value: sliderValue,
              min: 4,
              max: 40,
              onChanged: (value) {
                log("Slider value: $value");
                setState(() {
                  sliderValue = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: labels.map((label) {
                // Split label into number and "years"
                List<String> parts = label.split(' ');
                return Column(
                  children: [
                    Text(
                      parts[0],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      parts[1], // Display "years"
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            color: Colors.teal.shade100,
            height: 20,
          ),
        ],
      ),
    );
  }
}
