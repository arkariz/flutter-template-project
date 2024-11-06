class DartDefineConfig {
  static const String environment = String.fromEnvironment("ENVIRONTMENT", defaultValue: "dev");
  static const bool hasConfig = bool.hasEnvironment("ENVIRONTMENT");
}