import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chem/widgets/localization.dart';

// ignore: camel_case_types
class minimalView extends StatelessWidget {
  final bool cb1;
  final bool cb2;
  final bool cb3;
  final bool cb4;
  final bool cb5;
  final bool cb6;
  final bool cb7;
  final bool cb8;
  final bool cb9;
  final bool cb0;

  final double en1;
  final double en2;
  final bool en3;

  const minimalView({
    Key key,
    this.cb1,
    this.cb2,
    this.cb3,
    this.cb4,
    this.cb5,
    this.cb6,
    this.cb7,
    this.cb8,
    this.cb9,
    this.cb0,
    this.en1,
    this.en2,
    this.en3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('lib/elements.json'),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              var elementList = json.decode(snapshot.data.toString());
              final listElements = <Widget>[];
              for (var index = 0; index < elementList.length; index++) {
                if (en3 == true &&
                    elementList[index]['electronnegativity'] == 'unknown' ||
                    elementList[index]['electronnegativity'] != 'unknown' &&
                        en1 <=
                            num.parse(
                                elementList[index]['electronnegativity']) &&
                        en2 >=
                            num.parse(
                                elementList[index]['electronnegativity'])) {
                  if (cb1 == true &&
                      elementList[index]['type'] == 'otherNonmetal' ||
                      cb2 == true && elementList[index]['type'] == 'nobleGas' ||
                      cb3 == true &&
                          elementList[index]['type'] == 'alkaliMetal' ||
                      cb4 == true &&
                          elementList[index]['type'] == 'alkaliEarthMetal' ||
                      cb5 == true &&
                          elementList[index]['type'] == 'metalloid' ||
                      cb6 == true &&
                          elementList[index]['type'] ==
                              'post-transitionMetal' ||
                      cb7 == true &&
                          elementList[index]['type'] == 'transitionMetal' ||
                      cb8 == true &&
                          elementList[index]['type'] == 'lanthanoid' ||
                      cb9 == true && elementList[index]['type'] == 'actinoid' ||
                      cb0 == true && elementList[index]['type'] == 'unknown') {
                    listElements.add(
                      GestureDetector(
                        onTap: () {
                          // ignore: non_constant_identifier_names
                          String Capitalizate(input) {
                            return input[0].toUpperCase() + input.substring(1);
                          }

                          // ignore: non_constant_identifier_names
                          String ElectronnegativityText(input) {
                            if (input == 'unknown') {
                              return Capitalizate(
                                  AppLocalizations.of(context).translate(
                                      'unknown'));
                            } else {
                              return input;
                            }
                          }

                          String consistencyIcon() {
                            if (elementList[index]["consistency"] == "gas") {
                              return "lib/icons/gas_white_500.png";
                            } else if (elementList[index]["consistency"] ==
                                "fluid") {
                              return "lib/icons/fluid_white_500.png";
                            } else if (elementList[index]["consistency"] ==
                                "solid") {
                              return "lib/icons/solid_white_500.png";
                            } else {
                              return "lib/icons/questionmark_white_500.png";
                            }
                          }

                          String consistencyText() {
                            if (elementList[index]["consistency"] == "gas") {
                              return " " +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("gas"));
                            } else if (elementList[index]["consistency"] ==
                                "fluid") {
                              return " " +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("fluid"));
                            } else if (elementList[index]["consistency"] ==
                                "solid") {
                              return " " +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("solid"));
                            } else {
                              return " " +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("unknown"));
                            }
                          }

                          String discoveryText() {
                            if (elementList[index]["discovery"] == "ancient") {
                              return ' ' +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("ancient"));
                            } else {
                              return ' ' + elementList[index]["discovery"];
                            }
                          }

                          String radioactivityString() {
                            if (elementList[index]["radioactivity"] ==
                                "stable") {
                              return " " +
                                  Capitalizate(AppLocalizations.of(context)
                                      .translate("stable"));
                            } else {
                              String list = " ";
                              if (elementList[index]["gamma"] == true) {
                                list +=
                                    Capitalizate(AppLocalizations.of(context)
                                        .translate("gamma")) +
                                        " ";
                              } else if (elementList[index]["beta"] == true) {
                                list +=
                                    Capitalizate(AppLocalizations.of(context)
                                        .translate("beta")) +
                                        " ";
                              } else if (elementList[index]["alpha"] == true) {
                                list +=
                                    Capitalizate(AppLocalizations.of(context)
                                        .translate("alpha")) +
                                        " ";
                              } else if (elementList[index]
                              ["multipleRadiationEmitters"] ==
                                  true) {
                                list +=
                                    Capitalizate(AppLocalizations.of(context)
                                        .translate(
                                        "multipleRadiationEmitters") +
                                        " ");
                              } else {
                                list = " " +
                                    Capitalizate(AppLocalizations.of(context)
                                        .translate("radioactive"));
                              }
                              return list;
                            }
                          }

                          String typeText() {
                            return Capitalizate(AppLocalizations.of(context)
                                .translate(elementList[index]["type"]));
                          }

                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: .56,
                                    maxChildSize: 1,
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return SingleChildScrollView(
                                        controller: scrollController,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  (MediaQuery
                                                      .of(context)
                                                      .size
                                                      .height +
                                                      MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width) /
                                                      2 *
                                                      .1),
                                              topRight: Radius.circular(
                                                  (MediaQuery
                                                      .of(context)
                                                      .size
                                                      .height +
                                                      MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width) /
                                                      2 *
                                                      .1)),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: (MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height +
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width) /
                                                    2 *
                                                    .05,
                                                sigmaY: (MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height +
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width) /
                                                    2 *
                                                    .05),
                                            child: Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: (MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height +
                                                        MediaQuery
                                                            .of(
                                                            context)
                                                            .size
                                                            .width) /
                                                        2 *
                                                        .03 +
                                                        30,
                                                    top: 30,
                                                    bottom: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate("symbol"),
                                                      child: Text(
                                                        elementList[index]
                                                        ["element"],
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .10,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom:
                                                        (MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height +
                                                            MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .width) /
                                                            2 *
                                                            .05,
                                                      ),
                                                      child: Tooltip(
                                                        message:
                                                        AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            "elementName"),
                                                        child: Text(
                                                          elementList[index][
                                                          AppLocalizations.of(
                                                              context)
                                                              .translate(
                                                              "key")],
                                                          style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.white,
                                                            height: 1.2,
                                                            fontSize: (MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height +
                                                                MediaQuery
                                                                    .of(
                                                                    context)
                                                                    .size
                                                                    .width) /
                                                                2 *
                                                                .08,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate(
                                                          "consistency"),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Image(
                                                              image: AssetImage(
                                                                  consistencyIcon()),
                                                              height: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .055,
                                                              width: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .055),
                                                          Text(
                                                            consistencyText(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate(
                                                          "discovery"),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Image(
                                                              image: AssetImage(
                                                                  "lib/icons/discovery_white_500.png"),
                                                              height: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06,
                                                              width: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06),
                                                          Text(
                                                            discoveryText(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate(
                                                          "radioactivity"),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Image(
                                                              image: AssetImage(
                                                                  "lib/icons/radioactive_white_500.png"),
                                                              height: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .05,
                                                              width: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .05),
                                                          Text(
                                                            " " +
                                                                radioactivityString(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width *
                                                          .7,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .only(
                                                            top: 3,
                                                            bottom: (MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height +
                                                                MediaQuery
                                                                    .of(
                                                                    context)
                                                                    .size
                                                                    .width) /
                                                                2 *
                                                                .05),
                                                        child: Text(
                                                          AppLocalizations.of(
                                                              context)
                                                              .translate(
                                                              'radioactivityInfo'),
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white70,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: (MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height +
                                                                MediaQuery
                                                                    .of(
                                                                    context)
                                                                    .size
                                                                    .width) /
                                                                2 *
                                                                .04,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate("type"),
                                                      child: Text(
                                                        typeText(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .06,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: (MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height +
                                                            MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .width) /
                                                            2 *
                                                            .05,
                                                      ),
                                                      child: Tooltip(
                                                        message: AppLocalizations
                                                            .of(context)
                                                            .translate(
                                                            "electronnegativity"),
                                                        child: Text(
                                                          AppLocalizations.of(
                                                              context)
                                                              .translate(
                                                              "electronnegativityPre") +
                                                              ": " +
                                                              ElectronnegativityText(
                                                                  elementList[
                                                                  index][
                                                                  "electronnegativity"]),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: (MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height +
                                                                MediaQuery
                                                                    .of(
                                                                    context)
                                                                    .size
                                                                    .width) /
                                                                2 *
                                                                .06,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate("block"),
                                                      child: Text(
                                                        Capitalizate(
                                                            AppLocalizations
                                                                .of(context)
                                                                .translate(
                                                                "blockPre")) +
                                                            ": " +
                                                            Capitalizate(
                                                                elementList[index]
                                                                ["block"]),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .06,
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate("weight"),
                                                      child: Text(
                                                        Capitalizate(
                                                            AppLocalizations
                                                                .of(context)
                                                                .translate(
                                                                "weightPre")) +
                                                            ": " +
                                                            Capitalizate(
                                                                elementList[index]
                                                                ["weight"]),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .06,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width *
                                                          .7,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(top: 3),
                                                        child: Text(
                                                          AppLocalizations.of(
                                                              context)
                                                              .translate(
                                                              'molarmass'),
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white70,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: (MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height +
                                                                MediaQuery
                                                                    .of(
                                                                    context)
                                                                    .size
                                                                    .width) /
                                                                2 *
                                                                .04,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .only(
                                                          top: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .05,
                                                        ),
                                                        child: Tooltip(
                                                          message: AppLocalizations
                                                              .of(context)
                                                              .translate(
                                                              'protonnumber'),
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                context)
                                                                .translate(
                                                                'protons') +
                                                                ': ' +
                                                                elementList[index][
                                                                'chargedComponent'],
                                                            style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors
                                                                  .white,
                                                              fontSize: (MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .height +
                                                                  MediaQuery
                                                                      .of(
                                                                      context)
                                                                      .size
                                                                      .width) /
                                                                  2 *
                                                                  .06,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate(
                                                          'electronnumber'),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            'electrons') +
                                                            ': ' +
                                                            elementList[index][
                                                            'chargedComponent'],
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .06,
                                                        ),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: AppLocalizations
                                                          .of(
                                                          context)
                                                          .translate(
                                                          'neutronnumber'),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            'neutrons') +
                                                            ': ' +
                                                            elementList[index]
                                                            ['neutron'],
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: (MediaQuery
                                                              .of(
                                                              context)
                                                              .size
                                                              .height +
                                                              MediaQuery
                                                                  .of(
                                                                  context)
                                                                  .size
                                                                  .width) /
                                                              2 *
                                                              .06,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: (MediaQuery
                                  .of(context)
                                  .size
                                  .height +
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width) /
                                  2 *
                                  .025,
                              right: (MediaQuery
                                  .of(context)
                                  .size
                                  .height +
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width) /
                                  2 *
                                  .025,
                              bottom: (MediaQuery
                                  .of(context)
                                  .size
                                  .height +
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width) /
                                  2 *
                                  .05),
                          decoration: new BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(
                                  (MediaQuery
                                      .of(context)
                                      .size
                                      .height +
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width) /
                                      2 *
                                      .02)),
                          height: (MediaQuery
                              .of(context)
                              .size
                              .height +
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width) /
                              2 *
                              .15,
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width +
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height) /
                              2 *
                              .15,
                          child: new Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Align(
                                alignment: Alignment.center,
                                child: new Text(
                                  elementList[index]["element"].toString(),
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: (MediaQuery
                                        .of(context)
                                        .size
                                        .height +
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width) /
                                        2 *
                                        .065,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
              }

              return new Tooltip(
                message: AppLocalizations.of(context).translate(
                    "moreAboutElement"),
                child: SizedBox.expand(
                  child: Padding(
                    padding: EdgeInsets.only(left: (MediaQuery
                        .of(context)
                        .size
                        .height +
                        MediaQuery
                            .of(context)
                            .size
                            .width) /
                        2 *
                        .05, right: (MediaQuery
                        .of(context)
                        .size
                        .height +
                        MediaQuery
                            .of(context)
                            .size
                            .width) /
                        2 *
                        .05),
                    child: ListView(
                      children: <Widget>[new Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 5,
                        runSpacing: 0,
                        children: listElements,
                      ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),);
        },
    );
  }
}
