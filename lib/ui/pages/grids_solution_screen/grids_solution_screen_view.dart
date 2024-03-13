import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_bloc.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_event.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_state.dart';
import 'package:wedspark_app/widgets/bottom_bar.dart';

class GridsSolutionScreenView extends StatelessWidget {
  final GridsSolutionState state;

  const GridsSolutionScreenView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      InitialGridsSolutionState() => const _InitialState(),
      ResolvingGridsSolutionState(gridSolutions: final gridTasks) =>
        _LoadingState(gridTasks: gridTasks),
      ResolvedGridsSolutionState(:final gridSolutions) =>
        _SuccessScreen(gridSolutions: gridSolutions),
      ErrorVerificationGridsSolutionState(:final error) =>
        _SuccessScreen(gridSolutions: const [], error: error),
      VerifyingGridsSolutionState() => const _SendingState(),
      SuccessVerificationGridsSolutionState() => const _SendingState(),
    };
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Process Screen",
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

class _InitialState extends StatelessWidget {
  const _InitialState();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _Header(),
    );
  }
}

class _LoadingState extends StatelessWidget {
  final List<GridSolution> gridTasks;

  const _LoadingState({required this.gridTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _Header(),
      body: _LoadingBody(gridSolutions: gridTasks),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  final List<GridSolution> gridSolutions;
  final Object? error;

  const _SuccessScreen({required this.gridSolutions, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _Header(),
      body: _SuccessBody(
        gridSolutions: gridSolutions,
        error: error,
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  final List<GridSolution> gridSolutions;
  final Object? error;

  const _SuccessBody({required this.gridSolutions, this.error});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      child: Column(
        children: [
          const Spacer(),
          const _ProgressContent(
            title: "All Calculations Has Finished",
            subTitle: "You can send your results to the server",
          ),
          const Spacer(flex: 2),
          if (error != null)
            Text(
              error.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.red.withOpacity(0.8),
              ),
            ),
          if (error != null) const SizedBox(height: 22),
          BottomBar(
            onPressed: () => _onPressed(context),
            title: "Send Result To Server",
            isActive: true,
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context
        .read<GridsSolutionBloc>()
        .add(OnSendResultsToServerGridsSolutionEvent());
  }
}

class _LoadingBody extends StatelessWidget {
  final List<GridSolution> gridSolutions;

  const _LoadingBody({required this.gridSolutions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      child: Column(
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                _ProgressContent(
                  title: "Please, Wait",
                  subTitle: "Already Done ${gridSolutions.length} grids",
                ),
                const SizedBox(height: 22),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF6B8E47)),
                    strokeWidth: 6,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          BottomBar(
            onPressed: () {},
            title: "Send Result To Server",
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class _ProgressContent extends StatelessWidget {
  final String title;
  final String subTitle;

  const _ProgressContent({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black87.withOpacity(0.8),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black87.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _SendingState extends StatelessWidget {
  const _SendingState();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _Header(),
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B8E47)),
          strokeWidth: 6,
        ),
      ),
    );
  }
}
