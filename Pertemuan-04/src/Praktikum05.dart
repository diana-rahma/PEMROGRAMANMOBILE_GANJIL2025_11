void main(){
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Diana Rahmawati', 2341720162);
  print(mahasiswa);

  var angka = (10, 20);      
  print("Sebelum tukar: $angka");

  var hasil = tukar(angka);  
  print("Sesudah tukar: $hasil");

  var mahasiswa2 = ('Diana Rahmawati', a: 2241720010, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

