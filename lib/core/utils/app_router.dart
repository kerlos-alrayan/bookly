import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/', // Entry Point
        builder: (BuildContext context, GoRouterState state) =>
            const SplashView(),
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
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchView(),
      ),
    ],
  );
}
