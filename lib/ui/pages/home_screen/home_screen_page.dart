import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/di.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';
import 'package:wedspark_app/ui/pages/home_screen/home_screen_page_view.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (_) => getIt<HomeScreenBloc>(),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (_, state) => HomeScreenPageView(
          homeScreenState: state,
        ),
      ),
    );
  }
}
