void main(){
  var index;
  print("Langkah 1");
  for (index = 10; index < 27; index++) {
    print(index);
  }

  print("Langkah 3");
  for (index = 10; index < 27; index++) {
    if (index == 21) break;
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}