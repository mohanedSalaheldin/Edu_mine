// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "create_new_account":
            MessageLookupByLibrary.simpleMessage("Create new account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "have_an_account":
            MessageLookupByLibrary.simpleMessage("Have an account?"),
        "invaild_credential":
            MessageLookupByLibrary.simpleMessage("Invaild Credential"),
        "invaild_email": MessageLookupByLibrary.simpleMessage("Invaild Email"),
        "invaild_name_long": MessageLookupByLibrary.simpleMessage("Too long"),
        "invaild_name_short": MessageLookupByLibrary.simpleMessage("Too short"),
        "invaild_password":
            MessageLookupByLibrary.simpleMessage("Password < 8 characters"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "no_nternet":
            MessageLookupByLibrary.simpleMessage("No Internet Connection!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_again":
            MessageLookupByLibrary.simpleMessage("Password again"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Server Error, Please try later"),
        "sign_in_to_continue":
            MessageLookupByLibrary.simpleMessage("Sign in to continue"),
        "sign_up_to_join":
            MessageLookupByLibrary.simpleMessage("Sign up to join"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "welcome_back": MessageLookupByLibrary.simpleMessage("Welcome Back")
      };
}
