actor Counter{
  stable var currentValue = 0;

  public func increment() : async() {
    currentValue += 1;
  };

  public func get() : async Nat {
    return currentValue;
  };

  public func set(n : Nat) : async() {
    currentValue := n;
  };

}