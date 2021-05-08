import 'package:flutter/material.dart';

/// COLOR

// Primary Color
const kPrimaryColor = Color(0xff6fbe44);
const kPrimaryDarkenColor = Color(0xff6fbe44);
// Background Color
const kBackgroundColor = Color(0xFFF5FAFF);
const kBackgroundLightColor = Color(0xFFFFFFFF);
// Box Color
const kDisabledButtonColor = Color(0xFFD2D2D2);
const kSizeBoxLightColor = Color(0xFFEBF3FF);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.15);
const kUnseletedColor = Color(0xFF91A2BA);
const kOutSideDateColor = Color(0xFFE9E9E9);
// Icon Color
const kIconFacebookColor = Color(0xff6fbe44);
const kIconGoogleColor = Color(0xFFEB4335);
const kIconStarColor = Color(0xFFFFCF23);
// Tag Color
const kTagHotelColor = Color(0xFF59B9FD);
const kTagRentColor = Color(0xFF1F87FE);
const kTagFlightColor = Color(0xFFFF9B90);
const kTagEventColor = Color(0xFFAF8EFF);
// Rating Color
const kDangerRatingColor = Color(0xFFFF5050);
const kWarningRatingColor = Color(0xFFEDA566);
const kMediumRatingColor = Color(0xFFA5BF5C);
// Orthers
const kSubTextColor = Color(0xFF95A0AF);
const popUpBackgroundColor = Color(0xff6fbe44);

const colorTest = Color(0xFFA501);

/// SIZE

const SIZED_BOX_W04 = SizedBox(width: 4);
const SIZED_BOX_W06 = SizedBox(width: 6);
const SIZED_BOX_W10 = SizedBox(width: 10);
const SIZED_BOX_W20 = SizedBox(width: 20);
const SIZED_BOX_W45 = SizedBox(width: 45);
const SIZED_BOX_W60 = SizedBox(width: 60);

const SIZED_BOX_H04 = SizedBox(height: 4);
const SIZED_BOX_H06 = SizedBox(height: 6);
const SIZED_BOX_H12 = SizedBox(height: 12);
const SIZED_BOX_H16 = SizedBox(height: 16);
const SIZED_BOX_H20 = SizedBox(height: 20);
const SIZED_BOX_H24 = SizedBox(height: 24);
const SIZED_BOX_H30 = SizedBox(height: 30);

///height & width
const BOX_HEIGHT = 200.0;

/// PADDING

const PAD_ONLY_T20 = EdgeInsets.only(top: 20);
const PAD_ONLY_R20 = EdgeInsets.only(right: 20);
const PAD_ALL_16 = EdgeInsets.all(16);
const PAD_ALL_8 = EdgeInsets.all(8);
const PAD_ALL_10 = EdgeInsets.all(10);
const PAD_ALL_4 = EdgeInsets.all(4);
const PAD_SYM_H10 = EdgeInsets.symmetric(horizontal: 10);
const PAD_SYM_H16 = EdgeInsets.symmetric(horizontal: 16);
const PAD_SYM_H20 = EdgeInsets.symmetric(horizontal: 20);
const PAD_SYM_H30 = EdgeInsets.symmetric(horizontal: 30);
const PAD_SYM_V20 = EdgeInsets.symmetric(vertical: 20);

/// STRING
const ALREADY_HAVE_ACCOUNT = 'Already have account?.';
const VIEW_HOTELS = 'View Hotels';
const FILTER = 'Filtter';
const FILTERS = 'Filtters';
// Sign In Screen String
const SGN_SIGNIN_TEXT = 'Sign In';
const SGN_NOACC_TEXT = 'Don\'t have an account?';
const SGN_SIGNUP_TEXT = ' Sign up';
const SGN_EMAIL_TEXT = 'Email';
const SGN_HINT_EMAIL_TEXT = 'johndoe@mymail.com';
const SGN_HINT_PASS_TEXT = '********';
const SGN_PASS_TEXT = 'Password';

// Sign Up Screen String
const SGP_VERIFY_NUMBER_TEXT = 'Verify your number';
const SGP_SEND_MESSAGE_TEXT = 'We\'ve sent a message to\n';
const SGP_RESEND_TEXT = 'Resend a code';
const SGP_CONFIRM_TEXT = 'Confirm';
const SGP_ADD_EMAIL_TEXT = 'Add your email';
const SGP_EMAIL_NOTICE_TEXT = 'Trust me, it\'t not spammy.\nJust an invoice';
const SGP_HINT_EMAIL_TEXT = 'youremail@email.com';
const SGP_SETUP_PASS_TEXT = 'Set up your\npassword';
const SGP_PASS_NOTICE_TEXT = 'Keep you safe';
const SGP_HINT_PASS_TEXT = 'Your Password';
const SGP_FINAL_NOTICE_TEXT =
    'Thanks for registering! Now let\'s\nfind the cozy places';
const SGP_FINAL_DONE_TEXT = 'You\'re all set';
const SGP_ADD_PHONE_TEXT = 'Start with your\nnumber';
const SGP_PHONE_NOTICE_TEXT = 'So we can reach you with it';
const SGP_HINT_PHONE_TEXT = 'Your Number';
const SGP_SEND_OTP_TEXT = 'Send Me OTP';

// Home Screen String
const HME_HINT_SEARCH_TEXT = 'Explore \"Bali\"';
const HME_NEARBY_TEXT = 'Nearby';
const HME_INSPIRATION_TEXT = 'Get Inspiration';

const Map<int, String> SGP_PASSWORD_HELPER = {
  0: 'Your password should have at least contain:\nA number, a special character, an uppercase :~',
  1: 'Your password is so weak! :((',
  2: 'Your password is medium protection! :||',
  3: 'Your password is ready to use :>',
  4: 'Your password is wonderful :D'
};

const Map<int, Color> SGP_PASSWORD_RATING_COLOR = {
  0: kDisabledButtonColor,
  1: kDangerRatingColor,
  2: kWarningRatingColor,
  3: kMediumRatingColor,
  4: kPrimaryColor
};

// Detail Screen String
const DTL_SAMPLE_DESCRIPT_TEXT =
    'We serve the best facilities for our best costumers. Relaxed room in an elegant property featuring a 24-hour restaurant, an outdoor pool & a gym.';
const DTL_BOOKING_TEXT = 'Book Now';
const DTL_AMENITY_TEXT = 'Amenities';

// Calender Screen String
const CLR_TITLE_TEXT = 'Book a Room';
const CLR_CALENDAR_TITLE_TEXT = 'Select Dates';
const CLR_ADDITION_TEXT = 'Additional';
const CLR_EXTRA_BED_TEXT = 'Extra bed';
const CLR_ADDMORE_TEXT = 'Add More';
const CLR_BOOKING_TEXT = 'Book My Room';

const APP_NAME = "Vromon Buzz";
const PROPERTY = ' properties';
const HOME = 'Home';
const HOTEL = 'Hotels';
const TOURS = 'Tours';
const FLIGHT = 'Flights';
const EXPLORE_BD = 'Explore BD';
const PROFILE = 'Profile';
const LOCATION_SEARCH = 'Location Search';
const LOCATION = 'Locations';
const TODAYS_TOP_HOTEL = 'Today Top Hotel';
const SEARCH = 'Search';
const ROOM = 'Room';
const ROOMS = 'Rooms';
const ADULTS = 'Adults';
const CHILDREN = 'Children';

const APPLY = 'Apply';
const WHERE_ARE_YOU_GOING = 'Where are you going?';
const NUMBER_OF_ROOMS = 'Number of Rooms';
const EXPLORE_TOUR = 'Explore Tours';
const EXPLORE_HOTEL = 'EXPLORE HOTELS ';
const LOCATION_NOT_FOUND = 'Location Not found';
const DESCRIPTION = 'Description';
const MOST_POPULAR_FACILITIES = 'MOST POPULAR FACILITIES';
const ALL_ROOMS_INCLUDE = 'ALL ROOMS INCLUDE';
const PHOTOS = 'Photos';
const VIEW_ALL = 'View All';
const RELATED_HOTEL = 'Related Hotels';
const RELATED_TOUR = 'Related Tours';
const REVIEW = 'Reviews';
const REVIEWED = 'Reviewed';
const MAIN_GUEST2 = 'I am the main gest';
const BOOKING_ELSE = 'Booking is for someone else';

const WRITE_REVIEWED = 'Write Review';
const BOOK_NOW = 'Book Now';
const SUBMIT = 'Submit';
const INCLUSIONS = 'Inclusions';
const EXCLUSIONS = 'Exclusions';
const TOUR_POLICY = 'Tour Policy';
const PAYMENT_OPTION = 'Payment Option';

// Write Review Details
const OVERALL = 'Overall';
const CLEAN = 'Clean';
const FACILITIES = 'Facilities';
const COMFORT = 'Comfort';
const DROPDOWN_TEXT = 'Give your mark';
const STUFF = 'Stuff';
const LOCATION_RD = 'Location';
const VALUE_FOR_MONEY = 'Value for money';
const DEFAULT_SCORE = 'By default Minimum score is 3(Out of 10)';
const DETAILS = 'Details';
const GEST_NAME = 'Gest Name';
const EMAIL = 'Email';
const PHONE = 'Phone Number';
const PHONES = 'Phone';
const COUNTRY_NAME = 'Country Name';
const COMMENTS_BOX = 'Write your comments';
const CHARACTERS = 'maximum 1000 characters';
const GUIDE =
    'Any adult person (Minimum 18 years old) who booked room for himself or someone else and completed the stay at the property can write a review. We want you to share the guest review, both the good and the bad. All we ask is that you follow a few simple guidelines.';

const AVERAGE_PRICE = 'Average Price';
const FROM = 'From';
const TO = 'to';
const DISTANCE_CITY = 'Distance from city center';
const POPULAR_FILTER = 'Popular Filters';
const AMENITIES = 'Amenities';
const STAR_GRADE = 'Star Grade';
const FUN_THINGS = 'Fun Things To Do';
const PROPERTY_TYPE = 'Property Types';
const PRICE_NIGHT = 'Price  (for 1 night)';
const CHOOSE_DATE = 'Choose date';
const HOTELTEXT1 =
    'Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum...';
const HOTELTEXT2 =
    'Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum';
const CHECK_IN = 'Check-In  ';
const CHECK_OUT = 'Check-Out ';

const MORE_DETAILS = 'More Details';
const OVERALL_RATING = 'Overall Rating';
const REVIEWS_20 = 'Reviews (20)';
const NO_ROOM = 'No Room Available!!';
const SELECT_ROOM = 'Select Rooms';
const PER_NIGHT = '/per night';
const LAST_CHARCH = 'Last searches';
const CLEAR_ALL = 'Clear all';
const NUM = 'Num';
const GIVE = 'Give';
const CURRENT_PASSWORD = 'Current Password';
const NEW_PASSWORD = 'New Password';
const CONFIRM_PASSWORD = 'Confirm Password';
const CHANGE_PASSWORD = 'Change Password ';
const UPCOMING = 'Upcoming';
const FINISHED = 'Finished';
const FAVORITE = 'Favorites';
const MY_TRIPS = 'My Trips';

const RESERVATION_NUMBER = 'Resevation Number';
const FREE_CANCELATION = 'Free Cancelation Before';
const VIEW_CONFIRMATION = 'View Confirmation';
const CANCEL_BOOKING = 'Cancel Booking';
const CHANGE_DATE = 'Change Date';
const BOOKING = 'Bookings';
const COUNTRY = 'Country';
const CURRENCY = 'Currency';
const EDIT_PROFILE = 'Edit Profile';
const NID = 'NID';
const PASSPORT = 'Passport';
const DRIVING_LICENSE = 'Driving License';
const MY_DOCUMENT = 'My Documents';
const VIEW_PROFILE = 'View and edit profile';
const SETTING = 'Settings';
const ADDRESS = 'Address';
const ADDRESS_CITY = 'Address, City';
const ADDRESS2 = 'Address2';
const CITY = 'City';
const STATE = 'State/Region';
const POST_CODE = 'Postal/Zip Code';
const FAILED_ERRORES = 'Failed to load User DashBoard';
const REMOVE = 'Remove';
const PREVIEW = 'Preview';
const WISHLIST = 'WishList';

const SIGN_UP_MASSAGE = 'SignUp_Successfully';
const SELECT_NAME = 'Please seletct your first name';
const SELECT_LAST_NAME = 'Please select your last_ame';
const SELECT_PHONE = 'Please seletct your phone number';
const SELECT_ADDRESS = 'Please seletct your address';
const TRAVEL = 'Purpose of Travel';
const LEISURE = 'Leisure';
const MAIN_GUEST = 'I am the main Guest';
const BOOKING_SOMEONE = 'Booking is for someone else';
const PRIORITY = 'Priority of Early Check in & Late Check out !';
const BOOKING_SUCESS = 'Complete This Booking';

const GUEST_NAME = 'Guest Name';
const BANGLADESH = 'Bangladesh';
const SMOKE = 'Smoking';
const FAILED_MASSAGE = 'Failed to load User DashBoard';
const INTERNET = 'Check your Internet Connection';
const DISTANCE = 'Distance from city center';
const TOUR_TYPE = 'Tour Types';
const PRICE_RANGE = 'Price Range  (for 1 night)';
const MODES = 'Text to announce in accessibility modes';
const DOCUMENT = 'Please enter your document';
const TRIP = 'Create Trip - Date';
const DATE = 'Select Dates';
const UPDATE_PROFILE = 'Profile Update';
const CREATE_ACCOUNT = 'create account';
const SIGN_IN = 'Sign In';
const SEARCH_COUNTRY_NAME = 'Search Country Name';

// Font Style of Project Name
const Vromon = 'Vromon';
const BUZZ = 'Buzz';
const vromonbuzz = 'vromonbuzz';
const CONTACT_ADDRESS = '89 Kakrail, Green City Edge (11th Floor) Dhaka – 1219';
const CONTACT_CONTACT = '+8801714879265, +8801777683123';
const CONTACT_EMAIL = 'vromonbuzzapp@gmail.com';

const IMAGE_URL = "https://vromonbuzz.com/uploads/images/locations/";
const TOUR_ITINERARY_IMAGE_URL =
    "https://vromonbuzz.com/uploads/images/tours/itinerary/";

const HOME_SEARCH = 123;
const HOTEL_LIST = 2;
const FILTER_SEARCH = 3;
const CUSTOM_SEARCH = 4;
const POPULAR_SEARCH = 5;
