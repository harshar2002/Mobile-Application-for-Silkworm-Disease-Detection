import 'package:flutter/material.dart';
import 'package:silkworm/infoDetails.dart';

class SilkwormDisease {
  final String name;
  final String description;
  final String remedies;
  final String imagePath;

  SilkwormDisease({
    required this.name,
    required this.description,
    required this.remedies,
    required this.imagePath,
  });
}

class SilkwormDiseasePage extends StatelessWidget {
  final List<SilkwormDisease> diseases = [
    SilkwormDisease(
      name: "Nuclear Polyhedrosis Virus (NPV)",
      description:
          "Nuclear Polyhedrosis Virus (NPV) is a common viral disease in silkworms. It causes the infected larvae to appear dull, flaccid, and often covered with white powder.",
      remedies:
          "The infected larvae should be immediately isolated to prevent the spread of the virus. Maintaining proper hygiene and reducing overcrowding in rearing facilities can help prevent NPV outbreaks.",
      imagePath: "assets/images/diseases1.jpg",
    ),
    SilkwormDisease(
      name: "Pebrine Disease",
      description:
          "Pebrine is a protozoan disease caused by the parasite Nosema bombycis. Infected silkworms show symptoms such as slow growth, poor appetite, and irregular spinning.",
      remedies:
          "Infected silkworms should be removed from the rearing environment and destroyed to prevent the spread of the disease. Disinfecting rearing equipment and practicing strict hygiene measures can help control Pebrine.",
      imagePath: "assets/images/disease2.png",
    ),
    SilkwormDisease(
      name: "Grasserie Disease",
      description:
          "Grasserie disease is caused by a bacterial infection, primarily Bacillus bombysepticus. Infected silkworms display symptoms such as darkening of the body, loss of appetite, and eventually death.",
      remedies:
          "Affected larvae should be separated from healthy ones, and infected silkworms should be treated with appropriate antibiotics. Implementing proper sanitation practices and maintaining a clean rearing environment can help prevent Grasserie outbreaks.",
      imagePath: "assets/images/disease3.jpeg",
    ),
    SilkwormDisease(
      name: "Flacherie Disease",
      description:
          "Flacherie disease is caused by various factors, including bacterial infection, improper feeding, and unsanitary conditions. Infected silkworms become weak, lose their appetite, and show signs of paralysis.",
      remedies:
          "To control Flacherie, infected larvae should be isolated and provided with a clean and well-ventilated environment. Additionally, adjusting feeding practices and ensuring proper nutrition can help boost the silkworms' immune system against the disease.",
      imagePath: "assets/images/disease4.png",
    ),
  ];

  SilkwormDiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Silkworm Diseases"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        shrinkWrap: true,
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 5, 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoDetails(
                      name: diseases[index].name,
                      imagepath: diseases[index].imagePath,
                      desc: diseases[index].description,
                      remedies: diseases[index].remedies,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  horizontalTitleGap: 15,
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.asset(diseases[index].imagePath),
                  title: Text(diseases[index].name),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
