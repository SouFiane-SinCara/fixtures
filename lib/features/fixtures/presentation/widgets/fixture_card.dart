// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:intl/intl.dart';

class FixtureCard extends StatelessWidget {
  final FixtureModel fixtureModel;
  const FixtureCard({
    Key? key,
    required this.fixtureModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.parse(fixtureModel.eventTime);
    dateTime = dateTime.add(const Duration(hours: 1));
    String time = DateFormat('hh:mm').format(dateTime);
    String date = DateFormat('d MMM').format(dateTime);
    return Container(
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          bottom: size.height * 0.05,
          right: size.width * 0.02,
          left: size.width * 0.02),
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: theme.shadowColor,
              offset: const Offset(0, 10),
              blurRadius: 15,
            )
          ]),
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.1,
              width: size.width * 0.2,
              child: AutoSizeText(
                fixtureModel.homeNameClub,
                maxLines: 2,
                style: TextStyle(
                    color: theme.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            Image.network(
              fixtureModel.homeLogoClub,
              width: size.width * 0.08,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.05,
              child: AutoSizeText(
                fixtureModel.homeScore.toString(),
                maxLines: 2,
                style: TextStyle(
                    fontSize: 30,
                    color: theme.primaryColor,
                    fontFamily: "Myfont"),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Container(
              width: size.width * 0.15,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                        color: theme.focusColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    date,
                    style: TextStyle(color: theme.hintColor),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.05,
              child: AutoSizeText(
                fixtureModel.awayScore.toString(),
                maxLines: 2,
                style: TextStyle(
                    fontSize: 30,
                    color: theme.primaryColor,
                    fontFamily: "Myfont"),
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Image.network(
              fixtureModel.awayLogoClub,
              width: size.width * 0.08,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.1,
              width: size.width * 0.2,
              child: AutoSizeText(
                fixtureModel.awayNameClub,
                maxLines: 2,
                style: TextStyle(
                    color: theme.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
          ]),
    );
  }
}
