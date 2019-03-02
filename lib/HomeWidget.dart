import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    controller.addListener(() {
      print("Mudou pagina ${controller.page}");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> pages = [
      "Home",
      "Favorito",
      "Conta",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack);
            },
          ),
          IconButton(
            icon: Icon(Icons.layers),
            onPressed: () {
              controller.jumpToPage(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack);
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text(pages[index]));
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return BottomNavigationBar(
            onTap: (index) {
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack);
            },
            currentIndex: controller.page.round(),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text("Home"), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Text("Favoritos"), icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  title: Text("Conta"), icon: Icon(Icons.account_box)),
            ],
          );
        },
      ),
    );
  }
}

//Center(child: Text("Page 1")),
