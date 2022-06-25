import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';
import '../services/theme_service.dart';

class AddNoteDetailView extends StatefulWidget {
  static const id = "/add_note_detail_view";

  const AddNoteDetailView({Key? key}) : super(key: key);

  @override
  State<AddNoteDetailView> createState() => _AddNoteDetailViewState();
}

class _AddNoteDetailViewState extends State<AddNoteDetailView> {
  bool isChecked = false;

  void _goDetailScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const DetailScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
          onPressed: () {},
          splashRadius: 25,
          color: Colors.black,
          icon: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: IconButton(
              splashRadius: 25,
              onPressed: _goDetailScreen,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: const Text(
          "Task List",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          /// #Task Name
          Row(
            children: [
              const SizedBox(width: 6),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              const SizedBox(width: 4),
              Text(
                "Task Name",
                style: ThemeService.textStyleHeader(),
              ),
              const SizedBox(width: 205),
              IconButton(
                splashRadius: 25,
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 1,
            width: 200,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 5),
          /// #Add Due Date
          Row(
            children: [
              const SizedBox(width: 7),
              IconButton(
                onPressed: () {},
                splashRadius: 25,
                icon: const Icon(
                  Icons.event_note,
                  color: Color.fromRGBO(28, 27, 31, 0.6),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                "Add Due Date",
                style: TextStyle(
                  color: Color.fromRGBO(28, 27, 31, 0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 1,
            width: 200,
            color: Colors.grey.shade300,
          ),
          /// #Add Note
          const ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            title: Text(
              "Add Note",
              style: TextStyle(
                color: Color.fromRGBO(28, 27, 31, 0.6),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
          const SizedBox(height: 575),
          /// #Created on Mon, 28 March
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25, right: 15),
            title: const Text(
              "Created on Mon, 28 March",
              style: TextStyle(
                color: Color.fromRGBO(28, 27, 31, 0.6),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
            trailing: IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

