import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icard/src/models/info.dart';
import 'package:icard/src/widgets/info.dart';

import 'bottomIcon.dart';

class iCard extends StatelessWidget {
  final String? title;

  final Color? titleColor;

  final double? titleMaxFontSize;

  final Color? bodyTextColor;

  final List<info> mainData;

  final int dataMaxLines;

  final double mainData_maxFontSizeContent;

  final double mainData_maxFontSizeTitle;

  final double width;

  final double height;

  final String? backgroundImage;

  final Color? backgroundColor;

  final bool showDate;

  final Function? press;

  iCard({
    Key? key,
    required this.title,
    this.titleColor,
    this.titleMaxFontSize = 14,
    required this.mainData,
    this.dataMaxLines = 2,
    this.mainData_maxFontSizeTitle = 17,
    this.mainData_maxFontSizeContent = 14,
    this.bodyTextColor,
    this.width = 200,
    this.height = 300,
    required this.backgroundImage,
    this.backgroundColor,
    this.showDate = false,
    required this.press,
  }) : super(key: key);

  Color get colorTitle {
    Color textColor = titleColor ?? const Color(0xFF083e64);
    return textColor;
  }

  String getTitle() {
    String titre = title ?? "";
    return titre;
  }

  Color get ColorText {
    Color textColor = bodyTextColor ?? const Color(0xff61849c);
    return textColor;
  }

  Color get separatorColor {
    Color color = Color.fromARGB(255, 31, 50, 63);
    return color;
  }

  Color get backColor {
    Color color = backgroundColor ?? Colors.white;
    return color;
  }

  TextStyle get bodyTextStyle => TextStyle(color: bodyTextColor, fontSize: 13);

  _getBackgroundDecoration2(String imagePath) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
    );
  }

  _getBackgroundDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      color: backColor,
    );
  }

  _getBackground() {
    return backgroundImage != null
        ? _getBackgroundDecoration2(backgroundImage!)
        : _getBackgroundDecoration();
  }

  late DateTime dateTime = DateTime.now();
  String get date =>
      showDate ? '' : '${dateTime.day}-${dateTime.month}-${dateTime.year}';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press as void Function()?,
      child: Container(
        decoration: _getBackgroundDecoration(),
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Card(
            color: backColor,
            elevation: 4.0,
            shadowColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: _getBackground(),
                  width: MediaQuery.of(context).size.width > 600 ? 80 : 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: AutoSizeText(
                            date,
                            presetFontSizes: const [12, 11, 10],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorText,
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 2),
                          child: AutoSizeText(
                            getTitle(),
                            maxLines: 1,
                            minFontSize: 12,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: titleMaxFontSize,
                                color: titleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (info line in mainData)
                          Info(
                            titre: line.title,
                            contenu: line.content,
                            contenuMaxLines: dataMaxLines,
                            maxFontSizeTitre: mainData_maxFontSizeTitle,
                            maxFontSizeContenu: mainData_maxFontSizeContent,
                          ),
                        buildBottomIcon(ColorText)
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
