# This is a basic Nix file for experimenting with different Nix APIs

# Let's define some variables
let
  myString = "Hello, Nix!";
  myNumber = 42;
  myList = [ 1 2 3 4 5 ];
  addOne = x: x + 1;

# Now let's use some common Nix functions and APIs
in rec {
  # String manipulation
  uppercaseString = builtins.toUpper myString;

  # List operations
  listLength = builtins.length myList;
  listHead = builtins.head myList;

  # Function application
  incrementedNumber = addOne myNumber;

  # Force evaluation of all attributes
  result = {
    uppercaseString = uppercaseString;
    listLength = listLength;
    listHead = listHead;
    incrementedNumber = incrementedNumber;
  };
}
