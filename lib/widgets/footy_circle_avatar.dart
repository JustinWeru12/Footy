import 'package:flutter/material.dart';

/// Builds a [CircleAvatar] with a [FootballImage].
class FootballCircleAvatar extends StatelessWidget {
  const FootballCircleAvatar({
    required this.imageUrl,
    this.backgroundColor = Colors.transparent,
    this.radius,
    this.heroTag,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final Color backgroundColor;
  final double? radius;
  final Object? heroTag;

  Widget _errorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: theme.cardColor,
        child: FractionallySizedBox(
          widthFactor: .5,
          heightFactor: .5,
          child: FittedBox(
            child: Icon(
              Icons.broken_image_outlined,
              color: theme.iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).cardColor, width: 2),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(radius ?? 30),
            child: Image.network(
              imageUrl,
              errorBuilder: _errorBuilder,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
