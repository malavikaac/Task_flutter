import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Data/user_detail_provider.dart';
import 'package:task/Pages/add_user.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
void initState() { 
  super.initState();
  final provider = Provider.of<UserDetailsProvider>(context , listen: false);
 provider.fetchUserList();
}

  @override
  Widget build(BuildContext context) {
    final data = context.watch<UserDetailsProvider>();
    final dataList = data.userList;
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        Navigator.push(
context , MaterialPageRoute(builder: (context) {
          return const AddUser();
        },)
        );
      },) ,
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index].name),
            subtitle: Text(dataList[index].whatsapp),
          );
        },
      ),
    );
  }
}