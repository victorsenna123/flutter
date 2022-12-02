
import 'package:layout_inicial/pages/PageViews/one_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("victor"),
              accountEmail: Text("Victor@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text("D"),
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context); // fecha o drawer
                setState(() { // para que ao ser clicado, haja a animacao de mudanca de item no meu BottomNavigationBar(irei remove-lo dps)
                  indexBottomNavigationBar = 0;
                });
              },
            ),
            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context); // fecha o drawer
                setState(() { // para que ao ser clicado, haja a animacao de mudanca de item no meu BottomNavigationBar(irei remove-lo dps)
                  indexBottomNavigationBar = 1;
                });
              },
            ),
            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context); // fecha o drawer
                setState(() { // para que ao ser clicado, haja a animacao de mudanca de item no meu BottomNavigationBar(irei remove-lo dps)
                  indexBottomNavigationBar = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigationBar,
          onTap: (int page) {
            setState(() {
              indexBottomNavigationBar = page;
            });
            _pageController.animateToPage(
              page,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: "Item 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: "Item 2",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: "Item 3",
            ),
          ]),
    );
  }
}

//When using stateless class, the widgets state inside can not be changed so we need to add 'const' as good pratice
//if your parent widget is stateless you gonna get that warning("Prefer const literals as parameters of constructors"). simply do by adding a const before each widget that displays the warning.
//You can avoid this error going to analysis_options.yaml file and in the section(linter -> rules) write "prefer_const_constructors: false".
//You can also disable this error adding a comment line at the top of your code "// ignore_for_file: prefer_const_constructors". This will disable the warning on the file. " //ignore: prefer_const_constructors": this will disable in the place that you specified

// By making the list const the list and everything within the list will become compile-time constants. This can only be done if everything inside the list is able to be const. The benefit is that the list will only be created once at compile time rather than every time the surrounding build method is called.
