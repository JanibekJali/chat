import 'package:chat/app/data/local_data/countries_with_flags_data.dart';
import 'package:chat/app/models/global/country_with_flags.dart';
import 'package:flutter/material.dart';

class LocalDataRepo {
  static List<DropdownMenuItem<CountryWithFlags>> buildDropDownMenuItems() {
    return CountriesWithFlagsData.buildDropDownMenuItems();
  }
}

final LocalDataRepo localDataRepo = LocalDataRepo();
