// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Not found`
  String get notFound {
    return Intl.message(
      'Not found',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Server Error {message}`
  String serverError(Object message) {
    return Intl.message(
      'Server Error $message',
      name: 'serverError',
      desc: '',
      args: [message],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Bad request`
  String get badRequest {
    return Intl.message(
      'Bad request',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `Input required`
  String get input_required {
    return Intl.message(
      'Input required',
      name: 'input_required',
      desc: '',
      args: [],
    );
  }

  /// `Malformed email`
  String get malformed_email {
    return Intl.message(
      'Malformed email',
      name: 'malformed_email',
      desc: '',
      args: [],
    );
  }

  /// `Too short`
  String get too_short {
    return Intl.message(
      'Too short',
      name: 'too_short',
      desc: '',
      args: [],
    );
  }

  /// `Unknown validation`
  String get unknown_validation {
    return Intl.message(
      'Unknown validation',
      name: 'unknown_validation',
      desc: '',
      args: [],
    );
  }

  /// `You need to be at least eighteen`
  String get at_least_eighteen {
    return Intl.message(
      'You need to be at least eighteen',
      name: 'at_least_eighteen',
      desc: '',
      args: [],
    );
  }

  /// `Invalid pattern`
  String get invalid_pattern {
    return Intl.message(
      'Invalid pattern',
      name: 'invalid_pattern',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Weather app`
  String get weather_app {
    return Intl.message(
      'Weather app',
      name: 'weather_app',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get no_data {
    return Intl.message(
      'No data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Enter city`
  String get enter_city {
    return Intl.message(
      'Enter city',
      name: 'enter_city',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
