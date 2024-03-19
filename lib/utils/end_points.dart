enum EndPoints {
  registerMobile('auth/registerMobile'),
  verifyOtp('auth/VerifyMobileOtp'),
  signUp('auth/register'),
  login('auth/login'),
  sendResetPasswordOTP('auth/ResetPasswordOTP'),
  resetPassword('auth/ResetPassOTP'),
  //USER
  getUserProfile('user/getUserProfile'),
  getCountries('user/getCustCountries'),
  getStates('user/getCustStates'),
  getOccupation('user/getCustOccupations'),
  getNationalities('user/getNationalities'),
  addEditCustomer('user/addEditCustomer'),
  getDocumentsType('user/getDocTypes'),
  uploadUserDocuments('user/UploadFile'),
  //Beneficiaries
  getBeneficiariesList('ben/getBeneficiaries'),
  addEditBeneficiaries('ben/addEditBeneficiary'),
  getBenCountries('ben/getbenCountries'),
  getBenCities('ben/getbenCities'),
  getBenStates('ben/getbenStates'),

  //Remittance
  getBenKeyValue('remitt/getBenKeyvalue'),
  getRemittanceLookupValues('remitt/getlookupValues'),
  getRemittanceList('remitt/getRemittanceList'),
  getAgencyCode('remitt/getAgent?'),
  getPayModeCurrency('remitt/getAgentPayModeCurrency?'),
  postRemittance('remitt/PostRemitance'),

  //Juba
  getBenSendingCity('juba/getBenCities?'),
  ;

  final String url;

  const EndPoints(this.url);
}