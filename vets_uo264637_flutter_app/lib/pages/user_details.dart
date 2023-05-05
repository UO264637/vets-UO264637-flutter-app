import 'package:flutter/material.dart';
import 'package:vets_uo264637_flutter_app/src/user.dart';

class UserDetails extends StatefulWidget {
  final User user;
  final Function updateUser;
  final int index;
  const UserDetails({super.key, required this.user, required this.updateUser, required this.index});
  @override
  State<StatefulWidget> createState() => StateUserDetails();
}

class StateUserDetails extends State<UserDetails> {
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
          title: Text("${widget.user.name} ${widget.user.surname}"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                enabled: false,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                enabled: false,
                controller: surnameController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                enabled: false,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                enabled: false,
                controller:phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefóno',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            widget.updateUser(context, widget.user, widget.index)},
        tooltip: "Editar usuario",
        child: const Icon(Icons.edit),
        )
    );
  }
}