import '../database.dart';

class CountryTable extends SupabaseTable<CountryRow> {
  @override
  String get tableName => 'country';

  @override
  CountryRow createRow(Map<String, dynamic> data) => CountryRow(data);
}

class CountryRow extends SupabaseDataRow {
  CountryRow(super.data);

  @override
  SupabaseTable get table => CountryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get countryCode => getField<String>('countryCode')!;
  set countryCode(String value) => setField<String>('countryCode', value);
}
