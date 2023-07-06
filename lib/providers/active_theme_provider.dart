import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Themes { dark, light }

final activeThemeProvider = StateProvider<Themes>((ref) => Themes.dark);
