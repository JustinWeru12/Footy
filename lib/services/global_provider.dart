import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/system_brightness_observer.dart';
import 'package:football/services/theme/bloc/theme_bloc.dart';

/// The [GlobalProvider] is built above the root [MaterialApp] to provide
/// every descendant with globally available blocs & state.
class GlobalProvider extends StatelessWidget {
  const GlobalProvider({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SystemBrightnessObserver(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ConfigCubit()),
          BlocProvider(
            create: (context) => ThemeBloc(
              configCubit: context.read(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
