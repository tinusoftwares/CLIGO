/*
   All Url here
 */

class ApiURL {
  /// url
  static String globalUrl = "http://159.223.61.171/";

  /// api url
  static String baseApiUrl = "http://159.223.61.171/backend/modules/api/v1/";

  /// folderPath;
  static String folder01 = "passangers/";
  static String folder02 = "paymethods/";
  static String folder03 = "";
  static String folder04 = "";

  ///------------------- App Setting  url path -----------------------
  static String busDynamicAppSettingsGetUrl = baseApiUrl + "website/seetings";
  static String busDynamicAppTaxGetUrl = baseApiUrl + "taxs";

  ///------------------- Authentication url path ---------------------

  static String loginPostUrl = baseApiUrl + folder01 + "login";
  static String registerPostUrl = baseApiUrl + folder01 + "signup";
  static String forgetPassPostUrl =
      baseApiUrl + "/website/emails/check/email/pass";
  static String forgetPassRestPostUrl =
      baseApiUrl + "website/emails/reset/pass";

  ///------------------- user profile url path ----------------------
  static String userProfileInfoGetUrl = baseApiUrl + folder01 + "info";
  static String userProfileUpdateUrl = baseApiUrl + folder01 + "profileinfo";
  static String userChangePassPostUrl = baseApiUrl + folder01 + "password";

  /// not work url userProfilePicUploadPostUrl
  static String userProfilePicUploadPostUrl =
      baseApiUrl + folder01 + "picupload";

  ///------------------- Ticket booking  url path ---------------------
  static String ticketBookingPostUrl = baseApiUrl + "tickets/booking";
  static String ticketBookingUnpaidPostUrl =
      baseApiUrl + "tickets/unpaid/booking";
  static String bookingPickLocationGetUrl = baseApiUrl + "";
  static String bookingHistoryPostUrl = baseApiUrl + "";
  static String bookingFindTicketsTripListPostUrl = baseApiUrl + "triplist";
  static String bookingFindTicketsSeatGetUrlByTripIdWithDate =
      baseApiUrl + "tickets/seat/23/2022-08-17";

  /// Booking History
  static String bookingTicketsHistoryGetUrl = baseApiUrl + folder01 + "tickets";

  /// ------------------------ Country url path -----------------------

  static String countryListGetUrl = baseApiUrl + "countries";
  static String countryWiseAreaLocationGetUrl = baseApiUrl + "locations";

  static String droppingStandByTripIdGetUrl =
      baseApiUrl + "triplist/droppings/"; // tripId=22
  static String boardingStandByTripIdGetUrl =
      baseApiUrl + "triplist/boardings/"; // tripId=22

  /// ----------------------- Review Section url path -----------------
  static String createReviewPostUrl = baseApiUrl + "ratings/create";
  static String reviewGetUrlById =
      baseApiUrl + "ratings/getall/review/19"; // uid


///------------------- Online Payment System -----------------------

  static String onlinePaymentOptionsGetUrl = baseApiUrl +"paymethods";
  static String onlinePaymentPaypalGetUrl = baseApiUrl + folder02+"paypal";
  static String onlinePaymentPayStackGetUrl = baseApiUrl + folder02+"paystack";
  static String onlinePaymentPayStripeGetUrl = baseApiUrl + folder02+"stripe";
  static String onlinePaymentRazorGetUrl = baseApiUrl + folder02+"razor";


}
