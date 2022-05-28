import 'package:animate_do/animate_do.dart';
import 'package:catbreeds_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds_app/models/cat_model.dart' as catmodel;
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  final List<catmodel.CatsModel> cats;
  const HomePage({Key? key, required this.cats}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String raza = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFFFC93C), Color(0xFFBD8800)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              const Text(
                'CATBREEDS',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              _searchMetod(widget.cats),
              Expanded(child: _creatList(widget.cats))
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchMetod(List<catmodel.CatsModel> cats) {
    bool ban = false;
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                  color: Colors.white),
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[300]!))),
                child: TextField(
                  onChanged: (value) => raza = value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Raza de Gato"),
                ),
              ),
            ),
            Center(
              child: GFIconButton(
                onPressed: () {
                  for (var item in cats) {
                    if (item.name.toLowerCase() == raza.toLowerCase()) {
                      ban = true;
                      Navigator.pushNamed(context, 'details', arguments: item);
                    }
                  }
                  if (ban == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "No encontrado",
                      style: TextStyle(color: Colors.red),
                    )));
                  }
                  ban = false;
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                shape: GFIconButtonShape.pills,
                size: GFSize.MEDIUM,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: const Color(0xFF155263),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _creatList(List<catmodel.CatsModel> cats) {
    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (context, i) => makeItem(cat: cats[i], context: context),
    );
  }
}
