import 'package:flutter/material.dart';
import 'package:web_orrery/models/planet.dart';

class PlanetDetailController extends ChangeNotifier {
  Planet? _selectedPlanet;

  Planet? get selectedPlanet => _selectedPlanet;

  void setPlanet(Planet planet) {
    _selectedPlanet = planet;
    notifyListeners();
  }
}
