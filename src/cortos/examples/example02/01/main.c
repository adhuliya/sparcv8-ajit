int main() {
  // Do nothing here.
  return 0;
}

// any function starting with `ajit_entry_` will be invoked.
// If multiple functions start with `ajit_entry_` then,
// in presence of cortos all will be called in lexicographic order.
void ajit_entry_func_00() {
  int x = 4;
  x = x + 4;
  return;
}