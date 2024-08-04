import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final onBackArrowPressed;

  const LoginPage({
    super.key,
    required this.onBackArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final appBarTitleStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'LemonShakeShake',
    );

      return Scaffold(
        appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: onBackArrowPressed,),),
        body: Column(
          children: [
            Text("Eventer", style: appBarTitleStyle,),

        ],),
      );
  }
}