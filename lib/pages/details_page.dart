import 'package:catbreeds_app/models/cat_model.dart' as catmodel;
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catmodel.CatsModel cat =
        ModalRoute.of(context)!.settings.arguments as catmodel.CatsModel;

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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 25, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Text(
                cat.name.toUpperCase(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              _imageHero(cat),
              Expanded(
                  child: SingleChildScrollView(
                child: _informationCat(cat),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Padding _imageHero(catmodel.CatsModel cat) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Hero(
          tag: cat.id.toString(),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(cat.image.url), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
          )),
    );
  }

  Widget _informationCat(catmodel.CatsModel cat) {
    const styleT = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Text(cat.description, style: styleT),
          const Divider(
            color: Color(0xFF155263),
            thickness: 5,
            endIndent: 200,
            height: 20,
          ),
          Row(
            children: [
              const Icon(Icons.map_rounded),
              Text(
                'Origin: ${cat.origin}',
                style: styleT,
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.menu_book_rounded),
              Text(
                'Intelligence: ${cat.intelligence}',
                style: styleT,
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.local_fire_department_outlined),
              Text(
                'Adaptability: ${cat.adaptability}',
                style: styleT,
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.timer_sharp),
              Text(
                'Life Span: ${cat.lifeSpan}',
                style: styleT,
              )
            ],
          ),
          const Divider(
            color: Color(0xFF155263),
            thickness: 5,
            endIndent: 200,
            height: 20,
          ),
          Text(
            'Temperament: ${cat.temperament}',
            style: styleT,
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
