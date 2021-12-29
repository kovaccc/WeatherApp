import 'package:email_validator/email_validator.dart';
import 'package:weathearapp/config/constants.dart';
import 'package:weathearapp/generated/l10n.dart';
import 'package:intl/intl.dart';

abstract class Validator {
  static String? validate(String? inputValue, InputType type) {
    List<String> errorMessages = [];

    for (var validationType in type.getValidationTypes()) {
      if (validationType is Required) {
        if (inputValue == null || inputValue.isEmpty) {
          errorMessages.add(validationType.resolveToMessage());
          return errorMessages.first;
        }
      } else if (validationType is ValidEmail) {
        if (!EmailValidator.validate(inputValue!)) {
          errorMessages.add(validationType.resolveToMessage());
        }
      } else if (validationType is Length) {
        if (inputValue!.length < validationType.length) {
          errorMessages.add(validationType.resolveToMessage());
        }
      } else if (validationType is ValidDate) {
        final dateInMillis =
            DateFormat('dd/mm/yyyy').parse(inputValue!).millisecondsSinceEpoch;
        final currentTime = DateTime.now().millisecondsSinceEpoch;
        if (currentTime - dateInMillis < Constants.eighteenYearsInMs) {
          errorMessages.add(validationType.resolveToMessage());
        }
      } else if (validationType is Regex) {
        if (!RegExp(validationType.value).hasMatch(inputValue!)) {
          errorMessages.add(validationType.resolveToMessage());
        }
      }
    }
    return errorMessages.isEmpty ? null : errorMessages.first;
  }
}

// input type to hand over to text field validator
enum InputType { email, required, birthDate }

// define validations which need to be checked for certain InputType
extension InputTypeExtension on InputType {
  List<ValidationType> getValidationTypes() {
    List<ValidationType> validationTypes = [];
    if (this == InputType.required) {
      validationTypes = [Required()];
    } else if (this == InputType.email) {
      validationTypes = [Required(), ValidEmail(), Length(6)];
    } else if (this == InputType.birthDate) {
      validationTypes = [Required(), ValidDate()];
    } else {
      validationTypes = [Required()];
    }
    return validationTypes;
  }
}

// all validation types which are checked in validator
abstract class ValidationType {
  String resolveToMessage() {
    final String message;
    if (this is Required) {
      message = S.current.inputRequired;
    } else if (this is ValidEmail) {
      message = S.current.malformedEmail;
    } else if (this is Length) {
      message = S.current.too_short;
    } else if (this is ValidDate) {
      message = S.current.at_least_eighteen;
    } else if (this is Regex) {
      message = S.current.invalid_pattern;
    } else {
      message = S.current.unknown_validation;
    }
    return message;
  }
}

class Required extends ValidationType {}

class ValidEmail extends ValidationType {}

class Length extends ValidationType {
  final int length;

  Length(this.length);
}

class ValidDate extends ValidationType {}

class Regex extends ValidationType {
  final String value;

  Regex(this.value);
}
