import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoDetails extends StatelessWidget {
  final String name, imagepath, remedies, desc;
  const InfoDetails({
    super.key,
    required this.name,
    required this.imagepath,
    required this.desc,
    required this.remedies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              fit: BoxFit.scaleDown,
              imagepath,
              //width: MediaQuery.of(context).size.width / 0.5,
              //height: MediaQuery.of(context).size.height / 3,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        desc,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Remedies:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        remedies,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
