import 'package:flutter/material.dart';
import '../models/portfolio_model.dart';

class PortfolioProvider extends ChangeNotifier {
  List<PortfolioModel> _portfolios = [];
  bool _isLoading = false;

  List<PortfolioModel> get portfolios => _portfolios;
  bool get isLoading => _isLoading;

  void addPortfolio(PortfolioModel portfolio) {
    _portfolios.add(portfolio);
    notifyListeners();
  }

  void removePortfolio(String id) {
    _portfolios.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  void updatePortfolio(PortfolioModel portfolio) {
    final index = _portfolios.indexWhere((p) => p.id == portfolio.id);
    if (index != -1) {
      _portfolios[index] = portfolio;
      notifyListeners();
    }
  }
}
