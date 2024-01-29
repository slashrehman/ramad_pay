enum EndPoints {
  registerMobile('auth/registerMobile'),
  verifyOtp('auth/VerifyMobileOtp'),
  signUp('auth/register'),
  login('auth/login'),
  sendResetPasswordOTP('auth/ResetPasswordOTP'),
  resetPassword('auth/ResetPassOTP'),
  ;

  final String url;

  const EndPoints(this.url);
}