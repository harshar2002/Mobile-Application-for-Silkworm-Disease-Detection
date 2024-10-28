import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  List<String> _class = [];
  double _confidence = 0.0;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _predictImage() async {
    if (_image == null) return;

    String apiUrl = 'http://192.168.43.70:8000/predict';

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        _class = [responseData['class']];
        _confidence = responseData['confidence'] is double
            ? responseData['confidence']
            : double.parse(responseData['confidence'].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.pushNamed(context, '/info');
          }
          if (value == 2) {
            Navigator.pushNamed(context, '/monitor');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.spa_rounded), label: 'Info'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_rounded), label: 'Monitor')
        ],
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bitt Scott Manget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'bitt@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Welcome to Silkworm Disease app',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Take a Picture',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _getImage(ImageSource.camera),
                              icon: const Icon(Icons.camera_alt_rounded),
                              label: const Text('Camera'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _getImage(ImageSource.gallery),
                              icon: const Icon(Icons.photo),
                              label: const Text('Gallery'),
                            ),
                          ],
                        ),
                        _image != null
                            ? Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Image.file(
                                    _image!,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: _predictImage,
                                    child: const Text('Predict Disease'),
                                  ),
                                  const SizedBox(height: 20),
                                  _class.isNotEmpty
                                      ? Column(
                                          children: [
                                            Text('Class: ${_class.first}'),
                                            Text(
                                                'Confidence: ${(_confidence * 100).toStringAsFixed(2)}%'),
                                          ],
                                        )
                                      : const SizedBox(),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'This tool might give false positive answers for non silkworm images',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
