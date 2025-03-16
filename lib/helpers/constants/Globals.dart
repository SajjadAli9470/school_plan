class Globals {
  Globals._();

  static String URL = "";

  static String ROOT = "";

  static int maxUploadSize = 20;

  static String CHAT_URL = "";

  static String client_id = "";

  static String secret_key = "";
  static String plaid_link = "";

  static int SUCCESS_STATUS = 200;
  static int NOT_FOUND_STATUS = 404;
  static int BAD_REQUEST_STATUS = 400;
  static int UN_AUTHORIZE_STATUS = 401;
  static int INTERNAL_SERVER_STATUS = 400;
  static int UNPROCESSABLE_STATUS = 422;

  static int index = -1;
  static String CompanyName = "";
  static int companyId = 40;
  static int? myID = null;
  static int? otherID = null;
  static String? chatSlug;
  static String? plaidAccessToken;
  static String? myName;
  static String? otherName;
  static String? authToken;

  static resetValues() {
    index = -1;
    CompanyName = "";
    companyId = 40;
    myID = null;
    otherID = null;
    chatSlug = null;
    plaidAccessToken = null;
    authToken = null;
    myName = null;
    otherName = null;
  }
}
