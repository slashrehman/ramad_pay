class FlavorConfig {
  final String apiBaseUrl;
  final String apiPublicBaseUrl;
  final String socketUrl;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required String apiBaseUrl,
    required String apiPublicBaseUrl,
    required String socketUrl
  }) {
    _instance ??= FlavorConfig._initialize(apiBaseUrl, apiPublicBaseUrl, socketUrl);
    return _instance!;
  }

  FlavorConfig._initialize(this.apiBaseUrl, this.apiPublicBaseUrl, this.socketUrl);

  static FlavorConfig? get instance => _instance;
}