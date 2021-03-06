import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/suggest_item.dart';
import 'package:hq_personal_library/screen/hq_detail_page.dart';
import 'package:hq_personal_library/utils/colors.dart';

class MainPage extends StatefulWidget {
  static String id = 'MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> bottomNavigationItens = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find')
  ];

  List<int> numberTeste = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.sort, color: kSecondaryColor),
          onPressed: () => null,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: kSecondaryColor),
            onPressed: () => null,
          )
        ],
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kSecondaryVariantColor,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          items: bottomNavigationItens),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Admin',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    Text(
                      'Book your favorites HQ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            Row(children: [SuggestItem(index: index,)]),
                        itemCount: numberTeste.length,
                        scrollDirection: Axis.horizontal),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular Creators',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(onPressed: () => null, child: Text('See more'))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            itemBuilder: (context, index) =>
                                Row(children: [CreatorCard()]),
                            itemCount: numberTeste.length,
                            scrollDirection: Axis.horizontal),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatorCard extends StatelessWidget {
  const CreatorCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Center(child: Text('Stan Lee', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('images/stan_lee.jpg'),
            fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        height: 100,
        width: 200,
      ),
    );
  }
}
