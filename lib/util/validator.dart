import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';
import 'package:weathearapp/config/constants.dart';
import 'package:weathearapp/generated/l10n.dart';

abstract class Validator {
  static String? validate(String? inputValue, InputType type) {
    List<String?> errorMessages = [];

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
        final dateInMillis = DateFormat(Constants.birthDateFormat)
            .parse(inputValue!)
            .millisecondsSinceEpoch;
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
enum InputType { required, email, birthDate }

// define validations which need to be checked for certain InputType
extension InputTypeExtension on InputType {
  List<ValidationType> getValidationTypes() {
    List<ValidationType> validationTypes = [];
    if (this == InputType.required) {
      validationTypes = [Required()];
    } else if (this == InputType.email) {
      validationTypes = [Required(), ValidEmail()];
    } else if (this == InputType.birthDate) {
      validationTypes = [Required(), ValidDate()];
    }
    return validationTypes;
  }
}

// all validation types which are checked in validator
abstract class ValidationType {
  String? resolveToMessage() {
    final String? message;
    if (this is Required) {
      message = S.current.input_required;
    } else if (this is ValidEmail) {
      message = S.current.malformed_email;
    } else if (this is Length) {
      message = S.current.too_short;
    } else if (this is ValidDate) {
      message = S.current.at_least_eighteen;
    } else if (this is Regex) {
      message = S.current.invalid_pattern;
    } else {
      message = null;
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
