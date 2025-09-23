void main(){
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  gifts['Nama'] = 'Diana Rahmawati';
  gifts['NIM'] = '2341720162';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  nobleGases[99] = 'Diana Rahmawati';
  nobleGases[100] = '2341720162';

  mhs1['Nama'] = 'Diana Rahmawati';
  mhs1['NIM'] = '2341720162';

  mhs2[1] = 'Diana Rahmawati';
  mhs2[2] = '2341720162';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}