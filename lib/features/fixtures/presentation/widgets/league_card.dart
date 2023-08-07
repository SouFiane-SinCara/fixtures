// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LeagueCard extends StatelessWidget {
final  String leagueName;
 final String leagueLogo;
  final bool taped;
  const LeagueCard({
    Key? key,
    required this.leagueName,
    required this.leagueLogo,
    required this.taped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                offset: const Offset(0, 0),
                color: taped
                    ? theme.secondaryHeaderColor
                    : theme.primaryColorLight)
          ],
          color: taped ? theme.secondaryHeaderColor : theme.primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      margin: EdgeInsets.only(left: size.width * 0.04),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.007, horizontal: size.width * 0.01),
      child: Row(
        children: [
          Image.network(
            leagueLogo,
            width: size.width * 0.1,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              alignment: Alignment.center,
              child: AutoSizeText(
                leagueName,
                style: TextStyle(
                    fontFamily: "myfont",
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
