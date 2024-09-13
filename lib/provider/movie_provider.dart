import 'package:flutter/material.dart';
import 'package:learn_basic_flutter/api/api.dart';
import 'package:learn_basic_flutter/models/movies.dart';

class MovieProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  List<Movies> _movies = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Movies> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMovies() async {
    _errorMessage = null;
    try {
      final response = await _apiServices.get('http://192.168.69.89:8000/api/v1/movies');
      _movies = (response['results']['data'] as List)
            .map((movieJson) => Movies.fromJson(movieJson))
            .toList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
