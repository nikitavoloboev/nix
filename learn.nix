let
  myString = "Hello, Nix!";
  myNumber = 42;
  myList = [ 1 2 3 4 5 ];
  addOne = x: x + 1;

in rec {
  # List operations
  listLength = builtins.length myList;
  listHead = builtins.head myList;

  # Function application
  incrementedNumber = addOne myNumber;

  # Force evaluation of all attributes
  result = {
    listLength = listLength;
    listHead = listHead;
    incrementedNumber = incrementedNumber;
  };
}
