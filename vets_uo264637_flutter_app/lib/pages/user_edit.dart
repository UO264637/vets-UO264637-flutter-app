import 'package:flutter/material.dart';
import 'package:vets_uo264637_flutter_app/src/user.dart';

class UserEdit extends StatefulWidget {
  final User user;
  const UserEdit({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => StateUserEdit();
}

class StateUserEdit extends State<UserEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  @override
  void initState(){
    User user =widget.user;
    nameController.text = user.name;
    surnameController.text = user.surname;
    emailController.text = user.email;
    phoneController.text = user.phone;
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Modificar datos usuario"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Introduce tu nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por Favor digite el nombre';
                  }
                  else if (value.length < 2 || value.length > 24) {
                    return 'El nombre debe tener entre 2 y 24 caracteres';
                  }
                  return null;
                },
                 onSaved: (value) => nameController.text = value ?? '',
              ),
              TextFormField(
                controller: surnameController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  hintText: 'Introduce tu apellidos',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite los apellidos';
                  }
                  else if (value.length < 6 || value.length > 48) {
                    return 'Los apellidos deben tener entre 6 y 48 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  surnameController.text = value ?? '';
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Introduce tu email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el  email';
                  }
                  else if (!regex.hasMatch(value)) {
                    return 'El email debe seguir el formato "nombre@dominio.com"';
                  }
                  return null;
                },
                onSaved: (value) {
                  emailController.text = value ?? '';
                },
              ),
              TextFormField(
                controller:phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefóno',
                  hintText: 'Introduce tu teléfono',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final RegExp regex = RegExp(r'^\d{3}-\d{3}-\d{3}-\d{3}$');
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el telefono ';
                  }
                  else if (!regex.hasMatch(value)) {
                    return 'El teléfono debe seguir el formato "999-999-999-999"';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneController.text = value ?? '';
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _formKey.currentState!.save();
                      User user = User(nameController.text, surnameController.text, emailController.text, phoneController.text);
                      Navigator.pop(context, user);
                      Navigator.pop(context, user);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
