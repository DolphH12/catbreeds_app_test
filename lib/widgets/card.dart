import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:catbreeds_app/models/cat_model.dart' as catmodel;

Widget makeItem({required catmodel.CatsModel cat, context}) {
  final size = MediaQuery.of(context).size;

  return Hero(
    tag: cat.id.toString(),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: cat);
      },
      child: Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(82, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
              child: cat.image.url.isEmpty
                  ? const Image(image: AssetImage('assets/icon.png'))
                  : FadeInImage(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: const AssetImage('assets/cat_loader.gif'),
                      image: NetworkImage(cat.image.url),
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: 130),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(108, 21, 82, 99),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 120),
                        child: Text(
                          cat.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.catching_pokemon,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: size.width - 120),
                            child: Text(
                              "Origin: ${cat.origin}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.menu_book_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: size.width - 120),
                            child: Text(
                              "Intelligence: ${cat.intelligence}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ),
  );
}
