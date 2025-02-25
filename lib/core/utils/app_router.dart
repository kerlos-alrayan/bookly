import 'package:bookly/features/home/data/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/presentation/views/book_details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {

  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/', // Entry Point
        builder: (BuildContext context, GoRouterState state) =>
            const BookDetailsView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) =>
            const BookDetailsView(),
      ),
    ],
  );
}
