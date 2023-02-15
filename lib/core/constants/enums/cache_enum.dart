// ignore_for_file: constant_identifier_names

enum SharedPreferencesKeys {
  ID_KEY,
  EMAIL_KEY,
  PASSWORD_KEY,
  DEFAULT_PROFILE,
  HIDE_ID_KEY,
  HIDE_EMAIL_KEY,
  HIDE_PASSWORD_KEY,
  CACHE_AUTH,
  HIDE_CACHE_AUTH,
} 
//hide means = user if does not selected remember me we also cache for use later
//but if user selected remember me we will use default email id password for auth service.