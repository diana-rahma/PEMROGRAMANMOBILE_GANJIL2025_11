void main() {
  var counter = 25;
  print("Langkah 1");
  while (counter < 33) {
    print(counter);
    counter++;
  }

  print("Langkah 3");
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}