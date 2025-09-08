void main() {
  String nama = "Diana Rahmawati";   
  String nim = "2341720162";    

  for (int n = 0; n <= 201; n++) {
    if (n > 1) {
      int faktor = 0;
      for (int i = 2; i <= n ~/ 2; i++) {
        if (n % i == 0) {
          faktor++;
          break; 
        }
      }
      if (faktor == 0) {
        print("Bilangan prima = $n, Nama: $nama, NIM: $nim");
      }
    }
  }
}