

import 'package:flutter/material.dart';
import 'candidat.dart';
import 'add_candidat_page.dart';
import'detail_candidat_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}
// candidat.dart



class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidat> candidates = [

    Candidat(

      name: 'YERIMA ZIME',
      firstName: 'TALATA',

      party: "L'union progressiste",
      description: 'YERIMA ZIME Talata, né Zinsou-Derlin le 23 octobre 1954 à Paris, est un économiste franco-béninois, ayant fait carrière notamment comme banquier d\'affaires puis comme PDG du fonds d\'investissement européen PAI Partners. Il a été Premier ministre du Bénin de juin 2015 à avril 2016.',
      photo: "",
    ), Candidat(
      name: 'YERIMA ZIME',
      firstName: 'TALATA',

      party: "L'union progressiste",
      description: 'YERIMA ZIME Talata, né Zinsou-Derlin le 23 octobre 1954 à Paris, est un économiste franco-béninois, ayant fait carrière notamment comme banquier d\'affaires puis comme PDG du fonds d\'investissement européen PAI Partners. Il a été Premier ministre du Bénin de juin 2015 à avril 2016.',
      photo: "",
    ), Candidat(
      name: 'YERIMA ZIME',
      firstName: 'TALATA',

      party: "L'union progressiste",
      description: 'YERIMA ZIME Talata, né Zinsou-Derlin le 23 octobre 1954 à Paris, est un économiste franco-béninois, ayant fait carrière notamment comme banquier d\'affaires puis comme PDG du fonds d\'investissement européen PAI Partners. Il a été Premier ministre du Bénin de juin 2015 à avril 2016.',
      photo: "",
    ),


  ];

  bool hasNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(

          child: Text('Élections 🇧🇯🇧🇯',
            style: TextStyle(color: Colors.black),
          ),


          /*  Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.notifications, color: Colors.black),
                if (hasNotification)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(

                        minWidth: 12,
                        minHeight: 12,
                      ),
                    ),
                  ),
              ],
            ), */

        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:Row(

                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(
                                  image:
                                      FileImage(File(candidates[index].photo)
    ),

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),


                        SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${candidates[index].firstName} ${candidates[index].name}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    candidates[index].description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                 // if (candidates[index].description.length > 200)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(

                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) => DetailCandidat(),

                                                settings: RouteSettings(arguments:candidates[index] )),);
                                          },
                                          child: Text('Read More', style: TextStyle(fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
    ],
    ),
    ),
    );
    },
                ),
              ),

                          ],
                        ),
                      ),
                    ),

                  floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCandidatPage(),
                        ),
                      ).then((newCandidat) {
                        if (newCandidat != null) {
                          setState(() {
                            candidates.add(newCandidat);
                          });
                        }
                      });
                    },
                  ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people_alt ), label: 'candidats'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote ), label: "vote"),
          BottomNavigationBarItem(icon: Icon(Icons.settings ), label: "Paramètres"),
        ],
      ),
                );


  }
}