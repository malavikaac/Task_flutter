import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Data/user_detail_provider.dart';
import 'package:task/pages/home_Screen.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailsProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Leafy",
          ),
          backgroundColor: const Color.fromARGB(255, 100, 208, 104),
        ),
        body: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text("")),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Name")),
                    controller: value.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Whatsapp")),
                    controller: value.whatsapp,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Address")),
                    controller: value.address,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Requirement")),
                    controller: value.requirement,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 100, 208, 104),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                    onPressed: () => value.userDetailsApi().then((value) {
                      print(value);
                      if (value["success"] == true) {
                         Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>   const HomeScreen(),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value["message"])));
                      } else {
                       
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value["message"])));
                      }
                    }),
                    child: const Text("Submit" ,style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text("")),
          ],
        ),
      );
    });
  }
}
