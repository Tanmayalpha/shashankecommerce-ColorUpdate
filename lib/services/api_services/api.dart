import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shashankecommerce/models/advance_program_response.dart';
import 'package:shashankecommerce/models/advanced_program_video_response.dart';
import 'package:shashankecommerce/models/check_subscription_response.dart';
import 'package:shashankecommerce/models/disclaimer_response.dart';
import 'package:shashankecommerce/models/home_category_response.dart';
import 'package:shashankecommerce/models/inquiry_response.dart';
import 'package:shashankecommerce/models/login_response.dart';
import 'package:shashankecommerce/models/portfolio_response.dart';
import 'package:shashankecommerce/models/program_response.dart';
import 'package:shashankecommerce/models/purches_subscription_response.dart';
import 'package:shashankecommerce/models/referal_response.dart';
import 'package:shashankecommerce/models/register_user_response.dart';
import 'package:shashankecommerce/models/reset_password.dart';
import 'package:shashankecommerce/models/settings_response.dart';
import 'package:shashankecommerce/models/slider_response.dart';
import 'package:shashankecommerce/models/subscription_plan_resoponse.dart';
import 'package:shashankecommerce/models/update_profile_reponse.dart';
import 'package:shashankecommerce/models/wallet_response.dart';
import 'package:shashankecommerce/models/workshop_response.dart';

import 'api_client.dart';
import 'api_methods.dart';

class Api {
  final ApiMethods _apiMethods = ApiMethods();
  final ApiClient _apiClient = ApiClient();

  static final Api _api = Api._internal();

final Connectivity connectivity = Connectivity();

  //final Connectivity? connectivity;

  factory Api() {
    return _api;
  }

  Api._internal();

  Map<String, String> getHeader() {
    return {'Cookie': 'ci_session=c35fa031f74710f20bf26fea3b4ccd7bfe18332a'};
    // return {'Content-Type': 'application/json'};
  }

  Future<RegisterUserResponse> registerUserApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.registerUser, body: body);
      if (res.isNotEmpty) {
        try {
          return registerUserResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return RegisterUserResponse(error: true, message: e.toString());
        }
      } else {
        return RegisterUserResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return RegisterUserResponse(error: true, message: 'No Internet');
    }
  }

  Future<LoginUserResponse> loginUserApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.login, body: body);
      if (res.isNotEmpty) {
        try {
          return loginUserResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return LoginUserResponse(error: true, message: e.toString());
        }
      } else {
        return LoginUserResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return LoginUserResponse(error: true, message: 'No Internet');
    }
  }

  Future<SliderResponse> sliderApi() async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.getMethod(method: _apiMethods.sliderImages);
      if (res.isNotEmpty) {
        try {
          return sliderResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return SliderResponse(error: true);
        }
      } else {
        return SliderResponse(error: true);
      }
    } else {
      return SliderResponse(error: true);
    }
  }

  Future<ProgramResponse> homeCategoryApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.normalProgram, body: body);
      if (res.isNotEmpty) {
        try {
          return programResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return ProgramResponse(error: true, message: e.toString());
        }
      } else {
        return ProgramResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return ProgramResponse(error: true, message: 'No Internet');
    }
  }

    Future<PortfolioResponse> getPortfolioDataApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.getPortfolio, body: body);
      if (res.isNotEmpty) {
        try {
          return portfolioResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return PortfolioResponse(error: true );
        }
      } else {
        return PortfolioResponse(error: true,);
      }
    } else {
      return PortfolioResponse(error: true, );
    }
  }

  Future<WorkshopDataResponse> workShopApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.workShop, body: body);
      if (res.isNotEmpty) {
        try {
          return workshopDataResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return WorkshopDataResponse(error: true);
        }
      } else {
        return WorkshopDataResponse(error: true);
      }
    } else {
      return WorkshopDataResponse(error: true);
    }
  }

  Future<SubscriptionPlanResponse> getSubscriptionDataApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.membershipPlan, body: body);
      if (res.isNotEmpty) {
        try {
          return subscriptionPlanResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return SubscriptionPlanResponse(error: true, );
        }
      } else {
        return SubscriptionPlanResponse(error: true,);
      }
    } else {
      return SubscriptionPlanResponse(error: true, );
    }
  }

  Future<UpdateUserResponse> updateUserApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.updateProfile, body: body);
      if (res.isNotEmpty) {
        try {
          return updateUserResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return UpdateUserResponse(error: true, message: e.toString());
        }
      } else {
        return UpdateUserResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return UpdateUserResponse(error: true, message: 'No Internet');
    }
  }

  Future<ResetPasswordResponse> resetPasswordApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.resetPassword, body: body);
      if (res.isNotEmpty) {
        try {
          return resetPasswordResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return ResetPasswordResponse(error: true, message: e.toString());
        }
      } else {
        return ResetPasswordResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return ResetPasswordResponse(error: true, message: 'No Internet');
    }
  }

  Future<DisclaimerResponse> getDisclaimerDataApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.disclaimer, body: body);
      if (res.isNotEmpty) {
        try {
          return disclaimerResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return DisclaimerResponse(error: true, );
        }
      } else {
        return DisclaimerResponse(error: true,);
      }
    } else {
      return DisclaimerResponse(error: true, );
    }
  }

  Future<InquiryResponse> sendInquiryApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.userInquiry, body: body);
      if (res.isNotEmpty) {
        try {
          return inquiryResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return InquiryResponse(error: true, );
        }
      } else {
        return InquiryResponse(error: true,);
      }
    } else {
      return InquiryResponse(error: true, );
    }
  }

  Future<AdvanceProgramResponse> advanceProgramCategoryApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.advanceProgram, body: body);
      if (res.isNotEmpty) {
        try {
          return advanceProgramResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return AdvanceProgramResponse(error: true, message: e.toString());
        }
      } else {
        return AdvanceProgramResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return AdvanceProgramResponse(error: true, message: 'No Internet');
    }
  }

  Future<SubscribePlanResponse> getSubscriptionApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.subscribe, body: body);
      if (res.isNotEmpty) {
        try {
          return subscribePlanResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return SubscribePlanResponse(error: true, message: e.toString());
        }
      } else {
        return SubscribePlanResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return SubscribePlanResponse(error: true, message: 'No Internet');
    }
  }

  Future<CheckSubscriptionResponse> checkSubscriptionApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.subscribeStatus, body: body);
      if (res.isNotEmpty) {
        try {
          return checkSubscriptionResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return CheckSubscriptionResponse(error: true, message: e.toString());
        }
      } else {
        return CheckSubscriptionResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return CheckSubscriptionResponse(error: true, message: 'No Internet');
    }
  }

  Future<SettingsResponse> getSettingsApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.getSettings, body: body);
      if (res.isNotEmpty) {
        try {
          return settingsResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return SettingsResponse(error: true, message: e.toString());
        }
      } else {
        return SettingsResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return SettingsResponse(error: true, message: 'No Internet');
    }
  }

  Future<ReferalResponse> getReferalApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.referralCode, body: body);
      if (res.isNotEmpty) {
        try {
          return referalResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return ReferalResponse(error: true, message: e.toString());
        }
      } else {
        return ReferalResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return ReferalResponse(error: true, message: 'No Internet');
    }
  }

  Future<WallteResponse> getWalletApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.balance, body: body);
      if (res.isNotEmpty) {
        try {
          return wallteResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return WallteResponse(error: true, message: e.toString());
        }
      } else {
        return WallteResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return WallteResponse(error: true, message: 'No Internet');
    }
  }

  Future<AdvancedProgramVideoResponse> getAdvanceVideoApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
      await _apiClient.postMethod(method: _apiMethods.advanceVideos, body: body);
      if (res.isNotEmpty) {
        try {
          return advancedProgramVideoResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return AdvancedProgramVideoResponse(error: true, message: e.toString());
        }
      } else {
        return AdvancedProgramVideoResponse(error: true, message: 'Something went wrong');
      }
    } else {
      return AdvancedProgramVideoResponse(error: true, message: 'No Internet');
    }
  }








}