import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(AmenaApp());
}

class AmenaApp extends StatelessWidget {
  const AmenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amena App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/amna_logo.png', // Adjust the path to your logo image
              height: 40,
            ),
            const SizedBox(width: 8),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffFBE4EC),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // First Widget: Welcome Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'WELCOME TO AMNA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC83869),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Take the test, be safe, be AMNA',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffC83869),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffC83869),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Why Choosing AMNA?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'AMNA is concerned with everything related to breast cancer and provides powerful prediction tools so one does not have to go through a million other sites to find information. Knowing the risk of developing breast cancer early on is proved by research to increase the chances of survival and early treatment The survey does not only determine the risk but also gives useful suggestions and if a breast ultrasound scan is available one can further increase their awareness of the risk.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Text(
                '"Breast Cancer Survival rate after 5 years"',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC83869),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PieChartWidget(percentage: 25, color: Color(0xffC83869)),
                      const SizedBox(height: 10),
                      Text(
                        'When caught at advanced stage.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC83869),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PieChartWidget(percentage: 98, color: Color(0xffC83869)),
                      const SizedBox(height: 10),
                      Text(
                        'When caught early.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffC83869),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                '-Our Tools-',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC83869),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),

          // Feature Cards (Chat Bot, Talking Support, Notifications)
          buildFeatureCard(
            context: context,
            icon: Icons.toll,
            title: 'Risk Assessment Tool',
            description:
                'Our risk assessment tool uses analysis techniques and machine learning algorithms to provide a risk prediction for those concerned with developing breast cancer.',
          ),
          const SizedBox(height: 16.0),
          buildFeatureCard(
            context: context,
            icon: Icons.image,
            title: 'Breast Ultrasound Classifier',
            description:
                'A powerful tool that helps those concerned to predict their risk of developing breast cancer through their ultrasound images.',
          ),
          const SizedBox(height: 16.0),
          buildFeatureCard(
            context: context,
            icon: Icons.chat,
            title: 'Chat Bot',
            description:
                'A powerful tool that helps those concerned to predict their risk of developing breast cancer through their ultrasound images.',
          ),
          const SizedBox(height: 16.0),
          buildFeatureCard(
            context: context,
            icon: Icons.mic,
            title: 'Talking Support',
            description:
                'A powerful tool that helps those concerned to predict their risk of developing breast cancer through their ultrasound images.',
          ),
        ],
      ),
    );
  }

  Widget buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ImageUploadScreen when the card is tapped
        if (title == 'Breast Ultrasound Classifier') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageUploadScreen()),
          );
        } else {
          // Navigate to another screen if needed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BlankScreen()),
          );
        }
      },
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 50.0, color: Color(0xffC83869)),
              const SizedBox(height: 12.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 1, 1),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New Image Upload Screen
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;

  Future<void> _uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _predict() {
    // Add your prediction logic here
    print("Predict button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Breast Ultrasound Classifier',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffC83869),
          ),
        ),
      ),
      backgroundColor: Color(0xffFBE4EC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffC83869),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to use?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '1) Upload your breast ultrasound scan securely.\n2) Al-powered analysis: Our advanced technology analyzes your scan and predicts the likelihood of a breast mass being:\n\n-Benign (non-cancerous): Providing peace of mind.\n-Malignant (cancerous): Helping you get the care you need quickly. \n-Normal tissue: Minimizing unnecessary follow-up procedures.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            GestureDetector(
              onTap: _uploadImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffC83869), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file,
                                size: 50, color: Color(0xffC83869)),
                            const SizedBox(height: 8),
                            const Text(
                              'Upload your image here',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffC83869)),
                            ),
                          ],
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predict,
              child: const Text(
                'Predict',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xffC83869)),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Screen'),
      ),
      body: Center(
        child: Text(
          'This is a blank screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PieChartWidget extends StatefulWidget {
  final double percentage;
  final Color color;

  PieChartWidget({required this.percentage, required this.color});

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Percentage": widget.percentage,
      "Remaining": 100 - widget.percentage,
    };

    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 4,
      colorList: [widget.color, Colors.grey[300]!],
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: const LegendOptions(showLegends: false),
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
        decimalPlaces: 0,
      ),
    );
  }
}
