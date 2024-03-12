import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_event.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';

class HomeScreenPageView extends StatelessWidget {
  final HomeScreenState homeScreenState;

  const HomeScreenPageView({super.key, required this.homeScreenState});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: _getHeader(),
      body: _Body(textController: textController),
      backgroundColor: const Color(0xFFFFF7F2),
    );
  }

  AppBar _getHeader() {
    return AppBar(
      title: const Text(
        "Home Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF6B8E47),
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.3),
    );
  }
}

class _Body extends StatelessWidget {
  final TextEditingController textController;

  const _Body({required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Set Valid API base URL in order to continue",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black87.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 12),
          _TextField(textController: textController),
          const Spacer(),
          Center(child: _BottomBar(textController: textController)),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController textController;

  const _TextField({required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFF6B8E47),
        ),
      ),
      child: Theme(
        data: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black87.withOpacity(0.8),
            selectionColor: Colors.black87.withOpacity(0.8),
            selectionHandleColor: Colors.black87.withOpacity(0.8),
          ),
        ),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter URL",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final TextEditingController textController;

  const _BottomBar({required this.textController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final String url = textController.text;
        context.read<HomeScreenBloc>().add(
              OnCountingButtonTapHomeScreenEvent(
                value: url,
              ),
            );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF6B8E47),
        elevation: 4,
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 12,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start Counting Process",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
