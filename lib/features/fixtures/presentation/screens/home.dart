import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time/date_time.dart';
import 'package:fixtures_app/core/constants/strings/failure_message.dart';
import 'package:fixtures_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:fixtures_app/features/fixtures/presentation/cubit/leagues_cubit.dart';
import 'package:fixtures_app/features/fixtures/presentation/themes/light.dart';
import 'package:fixtures_app/features/fixtures/presentation/widgets/fixture_card.dart';
import 'package:fixtures_app/features/fixtures/presentation/widgets/league_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = -2;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
//! i think the problem from this part

    String date = dateTime.format("y-MM-dd");
    
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: theme.brightness == Brightness.light
                ? Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.3,
                  )
                : Image.asset(
                    'assets/images/logoDarkMode.png',
                    width: size.width * 0.3,
                  ),
          ),
          body: Container(
              margin: EdgeInsets.only(top: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime(2009),
                              lastDate: DateTime(2024))
                          .then((value) async {
                        if (value != null) {
                          dateTime = value;
                          date = dateTime.format('y-MM-dd');

                          BlocProvider.of<FixturesBloc>(context).add(
                              GetFixturesByDayEvent(day: date, leagueId: -1));

                          BlocProvider.of<LeaguesCubit>(context)
                              .getleagues(date: date, leagueId: -1);
                          setState(() {});
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                                color: theme.shadowColor)
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(30))),
                      width: size.width * 0.3,
                      height: size.height * 0.045,
                      alignment: Alignment.center,
                      child: Text(
                        date,
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BlocBuilder<LeaguesCubit, LeaguesState>(
                        builder: (context, state) {
                          if (state is LoadedLeaguesState) {
                            if (state.leagues.isEmpty) {
                              return const SizedBox();
                            } else {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      selectedItem = -2;

                                      setState(() {});
                                      BlocProvider.of<FixturesBloc>(context)
                                          .add(GetFixturesByDayEvent(
                                              day: date, leagueId: -1));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 00.018),
                                      child: Container(
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                offset: const Offset(0, 0),
                                                color: selectedItem != -2
                                                    ? theme.primaryColorLight
                                                    : theme
                                                        .secondaryHeaderColor,
                                              )
                                            ],
                                            color: selectedItem != -2
                                                ? theme.primaryColorLight
                                                : theme.secondaryHeaderColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30))),
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.04),
                                        alignment: Alignment.center,
                                        child: AutoSizeText(
                                          "all",
                                          style: TextStyle(
                                              fontFamily: "myfont",
                                              color: theme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.018),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.leagues.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (index != selectedItem) {
                                            selectedItem = index;
                                          }
                                          setState(() {});
                                          BlocProvider.of<FixturesBloc>(context)
                                              .add(GetFixturesByDayEvent(
                                                  day: date,
                                                  leagueId: state.leagues[index]
                                                      .leagueId));
                                        },
                                        child: LeagueCard(
                                          taped: index == selectedItem
                                              ? true
                                              : false,
                                          leagueLogo:
                                              state.leagues[index].leagueLogo,
                                          leagueName:
                                              state.leagues[index].leagueName,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              );
                            }
                          } else if (state is LeaguesErrorState) {
                            return const SizedBox();
                          } else if (state is LeaguesGettingState) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/row_Loading.gif',
                                  color: colors.lightLeaguecardSecond,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<FixturesBloc, FixturesState>(
                    builder: (context, state) {
                      if (state is LoadedFixtures) {
                        if (state.fixtures.isEmpty) {
                          return Expanded(
                              flex: 10,
                              child: Container(
                                width: size.width,
                                height: size.height,
                                alignment: Alignment.center,
                                child: Text(
                                  "there are not important matches today.",
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.width * 0.05),
                                ),
                              ));
                        } else {
                          return Expanded(
                            flex: 7,
                            child: Container(
                              color: theme.scaffoldBackgroundColor,
                              child: ListView.builder(
                                padding:
                                    EdgeInsets.only(top: size.width * 0.05),
                                itemCount: state.fixtures.length,
                                itemBuilder: (context, index) {
                                  return FixtureCard(
                                    fixtureModel: state.fixtures[index],
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      } else if (state is ErrorFixtures) {
                        return Expanded(
                          flex: 7,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                state.error == serverMessage
                                    ? Image.asset(
                                        "assets/images/error.gif",
                                      )
                                    : Image.asset(
                                        "assets/images/internet_fail.gif"),
                                Text(
                                  state.error,
                                  style: TextStyle(
                                      color: theme.dialogBackgroundColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Expanded(
                            flex: 7,
                            child: Container(
                              color: theme.scaffoldBackgroundColor,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/loading.gif",
                                color: theme.secondaryHeaderColor,
                              ),
                            ));
                      }
                    },
                  )
                ],
              ))),
    );
  }
}
