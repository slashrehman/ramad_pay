enum EndPoints {
  registerMobile('auth/registerMobile'),
  verifyOtp('auth/VerifyMobileOtp'),
  signUp('auth/register'),
  login('auth/login'),
  ;

  final String url;

  const EndPoints(this.url);
}