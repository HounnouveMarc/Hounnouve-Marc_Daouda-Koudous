import 'package:flutter/material.dart';
import 'candidat.dart';
import 'package:flutter/material.dart';

class DetailCandidat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recevoir les données du candidat passées en argument
    final Candidat candidat = ModalRoute.of(context)!.settings.arguments as Candidat;

    return Scaffold(
      appBar: AppBar(
        title: Text( '${candidat.party}',
        style: TextStyle(
          color: Colors.green,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              '${candidat.firstName} ${candidat.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            Text(
              'Candidat',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Image.asset(
              candidat.photo,
              width: 100, // Modifier la largeur selon vos besoins
              height: 100, // Modifier la hauteur selon vos besoins
            ),


            SizedBox(height: 8),
            Text(
              '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              candidat.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
