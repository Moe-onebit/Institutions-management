import 'package:auto_route/auto_route.dart';
import 'Pages/Profile.dart';
import 'Pages/Subjects.dart';
import 'Pages/HomePage.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'Institution',
          name: 'InstitutionRouter',
          page:  EmptyRouterPage,
          children: [
            AutoRoute(path:'', page: HomePage),
            AutoRoute(path: ':homeId', page: HomePage)
          ]
        ),
        AutoRoute(
          path: 'subjects',
          name: 'SubjectsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: Subjects),
            AutoRoute(path: ':subjectsId', page: Subjects)
          ]
        ),
        AutoRoute(
          path: 'profile',
          name: 'profileRouter',
          page: Profile
        )
      ]
    )
  ],
)
class $AppRouter{}