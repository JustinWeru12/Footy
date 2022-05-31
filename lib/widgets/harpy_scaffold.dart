import 'package:flutter/material.dart';
import 'package:football/services/theme/harpy_background.dart';
import 'package:football/widgets/widgets.dart';

/// A convenience Widget that wraps a [Scaffold] to build a transparent [AppBar]
/// on top of a [FootballBackground].
///
/// If [showIcon] is `true`, the [FlareIcon.FootballLogo] is built next to the
/// [title] in the [AppBar].
class FootballScaffold extends StatelessWidget {
  const FootballScaffold(
      {required this.body,
      this.title,
      this.showIcon = false,
      this.actions,
      this.drawer,
      this.endDrawer,
      this.backgroundColors,
      this.appBarBottom,
      this.floatingActionButton,
      this.buildSafeArea = false,
      this.centerTitle,
      Key? key})
      : super(key: key);

  final String? title;
  final Widget body;
  final bool showIcon;
  final List<Widget>? actions;
  final Widget? drawer;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBarBottom;
  final Widget? floatingActionButton;
  final bool buildSafeArea;
  final bool? centerTitle;

  /// The colors used by the [FootballBackground].
  ///
  /// Uses the colors of the current theme if `null`.
  final List<Color>? backgroundColors;

  bool get _hasAppBar => title != null || showIcon;

  Widget _buildTitle(ThemeData theme) {
    return FittedBox(
      child: Text(
        title!,
        style: theme.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget? _leading(BuildContext context) {
    if (Scaffold.of(context).hasDrawer) {
      return const DrawerButton();
    } else if (Navigator.of(context).canPop()) {
      return const FootballBackButton();
    } else {
      return null;
    }
  }

  Widget _buildAppBar(
    BuildContext context,
    ThemeData theme,
    MediaQueryData mediaQuery,
  ) {
    final appBar = AppBar(
      centerTitle: centerTitle ?? true,
      backgroundColor: Colors.transparent,
      elevation: 4.0,
      actions: actions,
      leading: _leading(context),
      title: title != null && title!.isNotEmpty ? _buildTitle(theme) : null,
      bottom: appBarBottom,
    );

    final topPadding = mediaQuery.padding.top;
    final extent = appBar.preferredSize.height + topPadding;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: extent),
      child: appBar,
    );
  }

  Widget? _buildFloatingActionButton(MediaQueryData mediaQuery) {
    if (floatingActionButton == null) {
      return null;
    } else {
      return Padding(
        // add padding if a bottom nav bar exists
        // Some devices won't draw a bot nav bar, in which case the fab will
        // have the correct padding of 16dp.
        // If a bot nav bar exists we add a padding of 16dp because it will
        // otherwise sit on the bot nav bar without padding.
        padding: EdgeInsets.only(
          bottom: mediaQuery.padding.bottom > 0 ? 16 : 0,
        ),
        child: floatingActionButton,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      drawer: drawer,
      endDrawer: endDrawer,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      floatingActionButton: _buildFloatingActionButton(mediaQuery),
      body: FootballBackground(
        colors: backgroundColors,
        child: Column(
          children: [
            if (_hasAppBar) _buildAppBar(context, theme, mediaQuery),
            Expanded(
              child: buildSafeArea ? SafeArea(top: false, child: body) : body,
            ),
          ],
        ),
      ),
    );
  }
}
