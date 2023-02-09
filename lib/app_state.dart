import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _userproductsref =
        prefs.getString('ff_userproductsref')?.ref ?? _userproductsref;
    _addressReference =
        prefs.getString('ff_addressReference')?.ref ?? _addressReference;
    _selectedCategory =
        prefs.getString('ff_selectedCategory') ?? _selectedCategory;
    _isSellerSelected =
        prefs.getBool('ff_isSellerSelected') ?? _isSellerSelected;
    _userEmail = prefs.getString('ff_userEmail') ?? _userEmail;
    _paymentAmount = prefs.getInt('ff_paymentAmount') ?? _paymentAmount;
    _paymentStatus = prefs.getBool('ff_paymentStatus') ?? _paymentStatus;
    _cartTotal = prefs.getDouble('ff_cartTotal') ?? _cartTotal;
    _newSellerList = prefs.getString('ff_newSellerList')?.ref ?? _newSellerList;
    _count = prefs.getInt('ff_count') ?? _count;
    _orderNo = prefs.getString('ff_orderNo') ?? _orderNo;
    _categoryRef = prefs.getString('ff_categoryRef')?.ref ?? _categoryRef;
    _subCategoriesRef =
        prefs.getString('ff_subCategoriesRef')?.ref ?? _subCategoriesRef;
    _productsRef = prefs.getString('ff_productsRef')?.ref ?? _productsRef;
    _orderNoRef = prefs.getString('ff_orderNoRef')?.ref ?? _orderNoRef;
    _isProduct = prefs.getBool('ff_isProduct') ?? _isProduct;
    _isShop = prefs.getBool('ff_isShop') ?? _isShop;
    _addressNav = prefs.getString('ff_addressNav') ?? _addressNav;
    _isCatSelected = prefs.getBool('ff_isCatSelected') ?? _isCatSelected;
    _isAddress = prefs.getBool('ff_isAddress') ?? _isAddress;
    _isSellerPreview = prefs.getBool('ff_isSellerPreview') ?? _isSellerPreview;
    _cartAddress = prefs.getStringList('ff_cartAddress') ?? _cartAddress;
    _isCartAddress = prefs.getBool('ff_isCartAddress') ?? _isCartAddress;
    _cartName = prefs.getString('ff_cartName') ?? _cartName;
    _cartPhone = prefs.getString('ff_cartPhone') ?? _cartPhone;
    _listEarnings = prefs
            .getStringList('ff_listEarnings')
            ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
            .toList() ??
        _listEarnings;
    _BroadcastName = prefs.getString('ff_BroadcastName') ?? _BroadcastName;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _userproductsref;
  DocumentReference? get userproductsref => _userproductsref;
  set userproductsref(DocumentReference? _value) {
    _userproductsref = _value;
    _value != null
        ? prefs.setString('ff_userproductsref', _value.path)
        : prefs.remove('ff_userproductsref');
  }

  DocumentReference? _addressReference;
  DocumentReference? get addressReference => _addressReference;
  set addressReference(DocumentReference? _value) {
    _addressReference = _value;
    _value != null
        ? prefs.setString('ff_addressReference', _value.path)
        : prefs.remove('ff_addressReference');
  }

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String _value) {
    _selectedCategory = _value;
    prefs.setString('ff_selectedCategory', _value);
  }

  bool _isSellerSelected = false;
  bool get isSellerSelected => _isSellerSelected;
  set isSellerSelected(bool _value) {
    _isSellerSelected = _value;
    prefs.setBool('ff_isSellerSelected', _value);
  }

  String _userEmail = 'bryan1234@gmail.com';
  String get userEmail => _userEmail;
  set userEmail(String _value) {
    _userEmail = _value;
    prefs.setString('ff_userEmail', _value);
  }

  int _paymentAmount = 0;
  int get paymentAmount => _paymentAmount;
  set paymentAmount(int _value) {
    _paymentAmount = _value;
    prefs.setInt('ff_paymentAmount', _value);
  }

  bool _paymentStatus = false;
  bool get paymentStatus => _paymentStatus;
  set paymentStatus(bool _value) {
    _paymentStatus = _value;
    prefs.setBool('ff_paymentStatus', _value);
  }

  double _cartTotal = 0.0;
  double get cartTotal => _cartTotal;
  set cartTotal(double _value) {
    _cartTotal = _value;
    prefs.setDouble('ff_cartTotal', _value);
  }

  DocumentReference? _newSellerList;
  DocumentReference? get newSellerList => _newSellerList;
  set newSellerList(DocumentReference? _value) {
    _newSellerList = _value;
    _value != null
        ? prefs.setString('ff_newSellerList', _value.path)
        : prefs.remove('ff_newSellerList');
  }

  int _count = 0;
  int get count => _count;
  set count(int _value) {
    _count = _value;
    prefs.setInt('ff_count', _value);
  }

  String _orderNo = '';
  String get orderNo => _orderNo;
  set orderNo(String _value) {
    _orderNo = _value;
    prefs.setString('ff_orderNo', _value);
  }

  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  set categoryRef(DocumentReference? _value) {
    _categoryRef = _value;
    _value != null
        ? prefs.setString('ff_categoryRef', _value.path)
        : prefs.remove('ff_categoryRef');
  }

  DocumentReference? _subCategoriesRef;
  DocumentReference? get subCategoriesRef => _subCategoriesRef;
  set subCategoriesRef(DocumentReference? _value) {
    _subCategoriesRef = _value;
    _value != null
        ? prefs.setString('ff_subCategoriesRef', _value.path)
        : prefs.remove('ff_subCategoriesRef');
  }

  DocumentReference? _productsRef;
  DocumentReference? get productsRef => _productsRef;
  set productsRef(DocumentReference? _value) {
    _productsRef = _value;
    _value != null
        ? prefs.setString('ff_productsRef', _value.path)
        : prefs.remove('ff_productsRef');
  }

  DocumentReference? _orderNoRef;
  DocumentReference? get orderNoRef => _orderNoRef;
  set orderNoRef(DocumentReference? _value) {
    _orderNoRef = _value;
    _value != null
        ? prefs.setString('ff_orderNoRef', _value.path)
        : prefs.remove('ff_orderNoRef');
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  bool _shopActive = false;
  bool get shopActive => _shopActive;
  set shopActive(bool _value) {
    _shopActive = _value;
  }

  bool _isProduct = false;
  bool get isProduct => _isProduct;
  set isProduct(bool _value) {
    _isProduct = _value;
    prefs.setBool('ff_isProduct', _value);
  }

  bool _isShop = false;
  bool get isShop => _isShop;
  set isShop(bool _value) {
    _isShop = _value;
    prefs.setBool('ff_isShop', _value);
  }

  String _addressNav = '';
  String get addressNav => _addressNav;
  set addressNav(String _value) {
    _addressNav = _value;
    prefs.setString('ff_addressNav', _value);
  }

  bool _isCatSelected = false;
  bool get isCatSelected => _isCatSelected;
  set isCatSelected(bool _value) {
    _isCatSelected = _value;
    prefs.setBool('ff_isCatSelected', _value);
  }

  bool _gridSearchActive = false;
  bool get gridSearchActive => _gridSearchActive;
  set gridSearchActive(bool _value) {
    _gridSearchActive = _value;
  }

  String _catSearchValue = '';
  String get catSearchValue => _catSearchValue;
  set catSearchValue(String _value) {
    _catSearchValue = _value;
  }

  bool _isAddress = false;
  bool get isAddress => _isAddress;
  set isAddress(bool _value) {
    _isAddress = _value;
    prefs.setBool('ff_isAddress', _value);
  }

  bool _isSellerPreview = false;
  bool get isSellerPreview => _isSellerPreview;
  set isSellerPreview(bool _value) {
    _isSellerPreview = _value;
    prefs.setBool('ff_isSellerPreview', _value);
  }

  List<String> _cartAddress = [];
  List<String> get cartAddress => _cartAddress;
  set cartAddress(List<String> _value) {
    _cartAddress = _value;
    prefs.setStringList('ff_cartAddress', _value);
  }

  void addToCartAddress(String _value) {
    _cartAddress.add(_value);
    prefs.setStringList('ff_cartAddress', _cartAddress);
  }

  void removeFromCartAddress(String _value) {
    _cartAddress.remove(_value);
    prefs.setStringList('ff_cartAddress', _cartAddress);
  }

  bool _isCartAddress = false;
  bool get isCartAddress => _isCartAddress;
  set isCartAddress(bool _value) {
    _isCartAddress = _value;
    prefs.setBool('ff_isCartAddress', _value);
  }

  String _cartName = '';
  String get cartName => _cartName;
  set cartName(String _value) {
    _cartName = _value;
    prefs.setString('ff_cartName', _value);
  }

  String _cartPhone = '';
  String get cartPhone => _cartPhone;
  set cartPhone(String _value) {
    _cartPhone = _value;
    prefs.setString('ff_cartPhone', _value);
  }

  List<DateTime> _listEarnings = [];
  List<DateTime> get listEarnings => _listEarnings;
  set listEarnings(List<DateTime> _value) {
    _listEarnings = _value;
    prefs.setStringList('ff_listEarnings',
        _value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToListEarnings(DateTime _value) {
    _listEarnings.add(_value);
    prefs.setStringList('ff_listEarnings',
        _listEarnings.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeFromListEarnings(DateTime _value) {
    _listEarnings.remove(_value);
    prefs.setStringList('ff_listEarnings',
        _listEarnings.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  String _BroadcastName = '';
  String get BroadcastName => _BroadcastName;
  set BroadcastName(String _value) {
    _BroadcastName = _value;
    prefs.setString('ff_BroadcastName', _value);
  }

  DocumentReference? _selectedChannel;
  DocumentReference? get selectedChannel => _selectedChannel;
  set selectedChannel(DocumentReference? _value) {
    _selectedChannel = _value;
  }

  String _userType = '';
  String get userType => _userType;
  set userType(String _value) {
    _userType = _value;
  }

  int _channelIndex = 0;
  int get channelIndex => _channelIndex;
  set channelIndex(int _value) {
    _channelIndex = _value;
  }

  DocumentReference? _channelRef;
  DocumentReference? get channelRef => _channelRef;
  set channelRef(DocumentReference? _value) {
    _channelRef = _value;
  }

  String _selectedChannelUrl = '';
  String get selectedChannelUrl => _selectedChannelUrl;
  set selectedChannelUrl(String _value) {
    _selectedChannelUrl = _value;
  }

  String _verifyNumber = '';
  String get verifyNumber => _verifyNumber;
  set verifyNumber(String _value) {
    _verifyNumber = _value;
  }

  bool _chatOpen = false;
  bool get chatOpen => _chatOpen;
  set chatOpen(bool _value) {
    _chatOpen = _value;
  }

  DocumentReference? _isOrderOpen;
  DocumentReference? get isOrderOpen => _isOrderOpen;
  set isOrderOpen(DocumentReference? _value) {
    _isOrderOpen = _value;
  }

  List<DocumentReference> _ChatUser = [];
  List<DocumentReference> get ChatUser => _ChatUser;
  set ChatUser(List<DocumentReference> _value) {
    _ChatUser = _value;
  }

  void addToChatUser(DocumentReference _value) {
    _ChatUser.add(_value);
  }

  void removeFromChatUser(DocumentReference _value) {
    _ChatUser.remove(_value);
  }

  List<DocumentReference> _ProductListCart = [];
  List<DocumentReference> get ProductListCart => _ProductListCart;
  set ProductListCart(List<DocumentReference> _value) {
    _ProductListCart = _value;
  }

  void addToProductListCart(DocumentReference _value) {
    _ProductListCart.add(_value);
  }

  void removeFromProductListCart(DocumentReference _value) {
    _ProductListCart.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
