import 'package:flutter/material.dart';
import '../services/theme_service.dart';
import '../views/add_note_detail_view.dart';
import '../views/completed_detail_view.dart';
import '../views/to_do_detail_view.dart';
import 'home_screen.dart';

class DetailScreen extends StatefulWidget {
  static const id = "/detail_screen";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _goBack() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }

  void _goAddNoteDetailView() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const AddNoteDetailView();
    }));
  }

  /// #this function showed delete dialog
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          title: const Text(
            "Are you sure ?",
            style: TextStyle(fontSize: 22),
          ),
          content: Container(
            color: Colors.transparent,
            child: const Text(
              "List will be permanently deleted",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xFF5946D2),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF85977),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// #this function showed edit dialog
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title: const Text("Rename list"),
          content: Container(
            color: ThemeService.colorTextFieldBack,
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Rename list",
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Color(
                    0xFF5946D2,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF5946D2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Rename",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// #appBar
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: ThemeService.colorBackgroundLight,
        title: Text(
          "Folder Name",
          style: ThemeService.textStyleHeader(),
        ),
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(
            Icons.arrow_back,
            color: ThemeService.colorBlack,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: _showEditDialog,
            icon: const Icon(
              Icons.mode_edit_outline_outlined,
              color: ThemeService.colorBlack,
            ),
          ),
          IconButton(
            splashRadius: 25,
            onPressed: _showDeleteDialog,
            icon: const Icon(
              Icons.delete_outline,
              color: ThemeService.colorBlack,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: ThemeService.colorBlack,
          tabs: const [
            Tab(
              text: "To Do",
            ),
            Tab(
              text: "Completed",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ToDoDetailView(),
          CompletedDetailView(),
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: 395,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Add a task",
            hintStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            prefixIcon: IconButton(
              onPressed: _goAddNoteDetailView,
              icon: const Icon(Icons.add, color: Colors.white, size: 30,),
            ),
          ),
        ),
      ),
    );
  }
}
