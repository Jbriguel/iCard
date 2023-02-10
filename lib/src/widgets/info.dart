import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Info extends StatelessWidget {
  Info({
    Key? key,
    required this.titre,
    required this.contenu,
    this.contenuMaxLines = 2,
    this.maxFontSizeContenu = 14.0,
    this.maxFontSizeTitre = 17.0,
  }) : super(key: key);

  /*
  * String titre 
  */
  final String? titre;

  /*
  * String contenu ou data  
  */
  final String? contenu;

  /*
  * Le nombre de lignes pour le contenu
  */
  final int contenuMaxLines;

  /*
  * max fontSize du Contenu
  */
  final double maxFontSizeContenu;

  /*
  * max fontSize du Titre
  */
  final double maxFontSizeTitre;

  String get title => titre ?? "";

  String get data => contenu ?? "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            maxLines: 1,
            minFontSize: 10,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: maxFontSizeTitre,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: AutoSizeText(
              data,
              minFontSize: 10,
              maxLines: contenuMaxLines,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: maxFontSizeContenu,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
