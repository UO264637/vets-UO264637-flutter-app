import 'package:flutter/material.dart';
import 'package:vets_uo264637_flutter_app/src/user.dart';

class UserDetails extends StatefulWidget {
  final User user;
  const UserDetails({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => StateUserDetails();
}

class StateUserDetails extends State<UserDetails> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.user.name} ${widget.user.surname}"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text("Nombre: ${widget.user.name}"),
              Text("Apellidos: ${widget.user.surname}"),
              Text("Email: ${widget.user.email}"),
              Text("Teléfono: ${widget.user.phone}")
            ],
          ),
        )
    );
  }
}
