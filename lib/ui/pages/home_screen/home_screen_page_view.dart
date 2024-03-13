import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_event.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';
import 'package:wedspark_app/widgets/bottom_bar.dart';

class HomeScreenPageView extends StatefulWidget {
  final HomeScreenState state;

  const HomeScreenPageView({super.key, required this.state});

  @override
  State<HomeScreenPageView> createState() => _HomeScreenPageViewState();
}

class _HomeScreenPageViewState extends State<HomeScreenPageView> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    if (kDebugMode) {
      _textController.text = "https://flutter.webspark.dev/flutter/api";
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _Header(),
      body: _Body(
        textController: _textController,
        state: widget.state,
      ),
      backgroundColor: const Color(0xFFFFF7F2),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final HomeScreenState state;
  final TextEditingController textController;

  const _Body({required this.textController, required this.state});

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
          const SizedBox(height: 12),
          if (state case ErrorHomeScreenState(:final error))
            Text(
              "Error: $error",
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          const Spacer(),
          Center(
            child: BottomBar(
              onPressed: () => _onButtonPressed(context),
              title: "Start Counting Process",
              isActive: true,
            ),
          ),
        ],
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    final url = textController.text;
    final event = OnCountingButtonTapHomeScreenEvent(url: url);
    context.read<HomeScreenBloc>().add(event);
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
