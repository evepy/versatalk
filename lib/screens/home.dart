import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final conferenceId = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    conferenceId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: conferenceId,
                  decoration: const InputDecoration(
                      labelText: "join a conference by id"),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var status = await Permission.camera.request();

                    if (status == PermissionStatus.granted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoConferencePage(
                                    conferenceID: conferenceId.text,
                                  )));
                    } else {
                      print('Estado del permiso: $status');
                    }
                  },
                  child: const Text("join"))
            ],
          ),
        ),
      ),
    );
  }
}
