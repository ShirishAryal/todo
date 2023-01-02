import 'package:flutter/material.dart';
import 'package:todo/todo/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Todo'),
        elevation: 0,
      ),
      body: const HomeView(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/settodo', arguments: null),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
