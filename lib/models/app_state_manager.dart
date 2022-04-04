import 'dart:async';

import 'package:flutter/material.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loginIn = false;
  bool _onboardingCompleted = false;
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialized => _initialized;

  bool get isLogin => _loginIn;

  bool get isOnBoardingComplted => _onboardingCompleted;

  int get getSelectedTab => _selectedTab;

// TODO: Add initializeApp
  void initializedApp() {
    Timer(const Duration(seconds: 2), () {
      _initialized = true;
      notifyListeners();
    });
  }

// TODO: Add login
  void login(String username, String password) {
    _loginIn = true;
    notifyListeners();
  }
// TODO: Add completeOnboarding
  void completedOnBoarding() {
    _onboardingCompleted = true;
    notifyListeners();
  }
// TODO: Add goToTab
  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
// TODO: Add goToRecipes
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }
// TODO: Add logout
  void logout() {
    _loginIn = false;
    _initialized = true;
    _selectedTab = FooderlichTab.explore;
    
    initializedApp();
    notifyListeners();
  }
}
