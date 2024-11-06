late NameFlavor _flavor;

void setNameFlavor(NameFlavor flavor) {
  _flavor = flavor;
}

NameFlavor get nameFlavorValue {
  return _flavor;
}

abstract class NameFlavor {
  String get environtment;
  String get baseUrl;
  String get apikey;
}
