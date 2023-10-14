// ignore_for_file: must_be_immutable

import 'package:crud/widgets/lists.dart';
import 'package:flutter/material.dart';

import '../screens/editUserScreen.dart';

class inf extends StatefulWidget {
  int id;
  String id1;
  // ignore: non_constant_identifier_names
  String Name;
  // ignore: non_constant_identifier_names
  String Email;
  String m;
  inf({
    super.key,
    required this.id,
    required this.id1,
    // ignore: non_constant_identifier_names
    required this.Name,
    // ignore: non_constant_identifier_names
    required this.Email,
    required this.m,
  });

  @override
  State<inf> createState() => _infState();
}

// ignore: camel_case_types
class _infState extends State<inf> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double x1 = mediaQuery.size.width * 0.05;
    double x2 = (mediaQuery.size.width - x1) * 0.13;
    double x3 = (mediaQuery.size.width - x2) * 0.33;
    double x4 = (mediaQuery.size.width - x3) * 0.28;
    double x5 = (mediaQuery.size.width - x4) * 0.1;
    double x6 = (mediaQuery.size.width - x5) * 0.12;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: x1,
                child: Text(
                  textAlign: TextAlign.center,
                  '${widget.id}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: x2,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.Name,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: x3,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.Email,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: x4,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.m,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditUserScreen(
                            id: widget.id,
                            id1: widget.id1,
                            Name: widget.Name,
                            Email: widget.Email,
                            Mobile: widget.m,
                          )));
                },
                child: Container(
                  height: 30,
                  color: Colors.blue,
                  width: x6,
                  child: const Center(
                    child: Text(
                      'Edit',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await deleteUser(widget.id1, context);
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Container(
                  height: 30,
                  color: Colors.red,
                  width: x6,
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Delete',
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
