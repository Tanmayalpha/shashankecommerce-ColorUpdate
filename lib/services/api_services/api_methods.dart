class ApiMethods {
  static final ApiMethods _apiMethods = ApiMethods._internal();

  factory ApiMethods() {
    return _apiMethods;
  }

  ApiMethods._internal();

  String login = 'login';
  String updateProfile = 'update_user';
  String registerUser = 'register_user';
  String sliderImages = 'get_slider_images';
  String getCategories = 'get_categories';
  String normalProgram = 'normal_program';
  String advanceProgram = 'advane_program';
  String workShop = 'work_shop';
  String getPortfolio = 'get_portfolio';
  String disclaimer = 'disclaimer';
  String userInquiry = 'user_inquiry';
  String membershipPlan = 'membership_plan';
  String executiveDropDown = 'ExecutiveReportPerson/ExecutiveReportPersonList';
  String mobileOtpVerify = 'MobileVerify/mobileOtpVerify';
  String updateToken = 'updatetoken/usercurrenttoken';
  String resetPassword = 'reset_password';
  String subscribe = 'subscribe';
  String subscribeStatus = 'subscribe_status';
  String getSettings = 'get_settings';
  String referralCode = 'referral_code';
  String balance = 'balance';
  String advanceVideos = 'advance_videos';



}