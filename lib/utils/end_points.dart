enum EndPoints {
  registerMobile('auth/registerMobile'),
  verifyOtp('auth/VerifyMobileOtp'),
  signUp('auth/register'),
  login('auth/login'),
  sendResetPasswordOTP('auth/ResetPasswordOTP'),
  resetPassword('auth/ResetPassOTP'),
  //user
  getCountries('user/getCustCountries'),
  getStates('user/getCustStates'),
  getOccupation('user/getCustOccupations'),
  getNationalities('user/getNationalities'),
  ;

  final String url;

  const EndPoints(this.url);
}