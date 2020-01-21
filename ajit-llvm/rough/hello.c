
// To generate sparc assembly:
// clang -target sparc-unknown-linux-gnu -S hello.c
int main() {
  int a, b;
  b = 20;
  a = a + b;
  return a;
}
