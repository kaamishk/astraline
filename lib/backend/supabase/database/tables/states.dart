import '../database.dart';

class StatesTable extends SupabaseTable<StatesRow> {
  @override
  String get tableName => 'states';

  @override
  StatesRow createRow(Map<String, dynamic> data) => StatesRow(data);
}

class StatesRow extends SupabaseDataRow {
  StatesRow(super.data);

  @override
  SupabaseTable get table => StatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get countryCode => getField<String>('countryCode')!;
  set countryCode(String value) => setField<String>('countryCode', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);
}
