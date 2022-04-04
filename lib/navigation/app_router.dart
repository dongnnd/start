import 'package:flutter/material.dart';

import '../models/app_state_manager.dart';
import '../models/grocery_manager.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // TODO: Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLogin)
          LoginScreen.page(),
        if (!appStateManager.isOnBoardingComplted && appStateManager.isLogin)
          OnboardingScreen.page(),
        if (appStateManager.isLogin && appStateManager.isOnBoardingComplted)
          Home.page(appStateManager.getSelectedTab),
        if(groceryManager.isCreatingNewItem) {


        }
// TODO: Add LoginScreen
// TODO: Add OnboardingScreen
// TODO: Add Home
// TODO: Create new item
// TODO: Select GroceryItemScreen
// TODO: Add Profile Screen
// TODO: Add WebView Screen
      ],
      onPopPage: _handlePopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter(
      {required this.appStateManager,
      required this.groceryManager,
      required this.profileManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    return true;
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }
}
