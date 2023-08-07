import 'package:date_time/date_time.dart';
import 'package:fixtures_app/core/routes/routes.dart';
import 'package:fixtures_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:fixtures_app/features/fixtures/presentation/cubit/leagues_cubit.dart';
import 'package:fixtures_app/features/fixtures/presentation/themes/dark.dart';
import 'package:fixtures_app/features/fixtures/presentation/themes/light.dart';
import 'package:fixtures_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedDate = dateTime.format('y-MM-dd');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return sl<FixturesBloc>()
              ..add(GetFixturesByDayEvent(day: formattedDate, leagueId: -1));
          },
        ),
        BlocProvider(
          create: (context) {
            return sl<LeaguesCubit>()
              ..getleagues(date: formattedDate, leagueId: -1);
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: LightTheme().lightTheme,
        darkTheme: DarkTheme().darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Myroutes().generateRoutes,
      ),
    );
  }
}
