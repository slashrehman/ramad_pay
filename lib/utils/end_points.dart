enum EndPoints {
  registerMobile('auth/registerMobile'),
  verifyOtp('auth/VerifyMobileOtp'),
  signUp('auth/register'),
  login('auth/login'),
  sendResetPasswordOTP('auth/ResetPasswordOTP'),
  resetPassword('auth/ResetPassOTP'),
  //user
  getUserProfile('user/getUserProfile'),
  getCountries('user/getCustCountries'),
  getStates('user/getCustStates'),
  getOccupation('user/getCustOccupations'),
  getNationalities('user/getNationalities'),
  addEditCustomer('user/addEditCustomer'),
  ;

  final String url;

  const EndPoints(this.url);
}