
import 'package:go_router/go_router.dart';
import 'package:roadmap_generator_website/pages/home_page.dart';

final router = GoRouter(routes: [GoRoute(path: '/', builder: (context, state) => HomePage())]);