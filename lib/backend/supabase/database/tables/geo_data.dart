import '../database.dart';

class GeoDataTable extends SupabaseTable<GeoDataRow> {
  @override
  String get tableName => 'geoData';

  @override
  GeoDataRow createRow(Map<String, dynamic> data) => GeoDataRow(data);
}

class GeoDataRow extends SupabaseDataRow {
  GeoDataRow(super.data);

  @override
  SupabaseTable get table => GeoDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get city => getField<String>('city')!;
  set city(String value) => setField<String>('city', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lng => getField<double>('lng');
  set lng(double? value) => setField<double>('lng', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get iso2 => getField<String>('iso2');
  set iso2(String? value) => setField<String>('iso2', value);

  String? get iso3 => getField<String>('iso3');
  set iso3(String? value) => setField<String>('iso3', value);

  String? get adminName => getField<String>('admin_name');
  set adminName(String? value) => setField<String>('admin_name', value);
}
