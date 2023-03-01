import 'package:flutter/material.dart';
import 'package:authentest_632021101/services/auth_services.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}
String groupName = "";
class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _uname = TextEditingController();
   final TextEditingController _telephone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(padding:
       EdgeInsets.all(10),
       child: ListView(
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(labelText: "Email"),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name cannot be empty';
              }else
                return  null;
            },
          ),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          TextFormField(
            controller: _uname,
            decoration: const InputDecoration(labelText: "User name"),
            obscureText: true,
          ),
          TextFormField(
            controller: _telephone,
            decoration: const InputDecoration(labelText: "Telephone"),
            obscureText: true,
          ),
      Text('User Type'),
        RadioListTile(
                title: Text('อาจารย์'),
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.platform,
                value: 'title 1',
              groupValue: groupName, 
              onChanged:(value) {
                setState(() {
                    groupName = value!;
                  });
              }
          ),

        RadioListTile(
                title: Text('เจ้าหน้าที่'),
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.platform,
                value: 'title 2',
              groupValue: groupName, 
              onChanged:(value) {
                setState(() {
                    groupName = value!;
                  });
              }
          ),
        RadioListTile(
                title: Text('นิสิต'),
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.platform,
                value: 'title 3',
              groupValue: groupName, 
              onChanged:(value) {
                setState(() {
                    groupName = value!;
                  });
              }
          ),



          ElevatedButton(onPressed: () {
            
            AuthService.registerUser(_email.text, _password.text).then((value){
              Navigator.pop(context);
            });
          }, child: const Text("Login")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const register()));
          }, child: const Text("Register"))
        ],
       ),
       ),
    );
  }
}