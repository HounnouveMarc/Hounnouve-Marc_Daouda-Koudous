import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'candidat.dart';

class AddCandidatPage extends StatefulWidget {
  @override
  _AddCandidatPageState createState() => _AddCandidatPageState();
}

class _AddCandidatPageState extends State<AddCandidatPage> {
  final _formKey = GlobalKey<FormState>();
  final _candidat = Candidat(
    name: '',
    firstName: '',

    party: '',
    description: '',
    photo: '',
  );

  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _partyController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  File? _selectedPhoto;

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _dateController.dispose();
    _partyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectPhotoFromGallery() async {
   final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
       _selectedPhoto = File(pickedImage.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un candidat'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

            GestureDetector(
              onTap: () {
                _selectPhotoFromGallery();
              },
              child: Container(
                margin: EdgeInsets.all(16),
                height: 200,
                width: 150,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                ),
                child: _selectedPhoto != null
                    ? Image.file(_selectedPhoto!)
                    : Icon(Icons.camera,semanticLabel: "Appuyer pour ajoutez une image",),
                alignment: Alignment.center,

              ),
            ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _partyController,
                decoration: InputDecoration(labelText: 'Parti'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un parti';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _candidat.name = _nameController.text;
                    _candidat.firstName = _firstNameController.text;
                   _candidat.party = _partyController.text;
                    _candidat.description = _descriptionController.text;
                    _candidat.photo = _selectedPhoto?.path ?? '';
                    Navigator.pop(context, _candidat);
                  }
                },

                child: Text('Sauvegarder',
                selectionColor: Colors.white,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],

                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}