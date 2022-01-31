// Wine Class
// Each wine is uniquely defined based on key combination of name, brand, and vintage
// sample use: Wine mywine = Wine.withNamedArguments(name: 'Free Range Red', brand: '99 Crimes', vintage: 1997);


class Wine {

  final String _name;
  final String _brand;
  final int _vintage;
  String _country;
  String _type;
  String _color;
  String _sweetness;
  String _body;

  //default constructor with empty fields except where required to identify
  Wine(this._name, this._brand, this._vintage) :
        _country = '', _type = '', _color = '', _sweetness = '', _body = '';

  //overloaded constructor with all fields provided
  Wine.fullConstructor(this._name, this._brand, this._vintage, this._country,
      this._type, this._color, this._sweetness, this._body);

  //overloaded constructor allowing named arguments
  Wine.withNamedArguments({required String name, required String brand, required int vintage}) :
        _name = name, _brand = brand, _vintage = vintage,
        _country = '', _type = '', _color = '', _sweetness = '', _body = '';

  //setter functions
  set setCountry(String value) {
    _country = value;
  }
  set setType(String value) {
    _type = value;
  }
  set setColor(String value) {
    _color = value;
  }
  set setSweetness(String value) {
    _sweetness = value;
  }
  set setBody(String value) {
    _body = value;
  }

  //getter functions
  String get getName {
    return _name;
  }
  String get getBrand {
    return _brand;
  }
  int get getVintage {
    return _vintage;
  }
  String get getCountry {
    return _country;
  }
  String get getType {
    return _type;
  }
  String get getColor {
    return _color;
  }
  String get getSweetness {
    return _sweetness;
  }
  String get getBody {
    return _body;
  }
  @override
  String toString() {
    return 'Wine [name=$_name,brand=$_brand,vintage=$_vintage]';
  }
}
