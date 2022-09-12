import Net8 "mo:base/Nat8";

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

  type HeaderField = (Text, Text);

  type HttpRequest = {
    url : Text;
    method : Text;
    body : [Nat8];
    headers : [HeaderField];
  };
  type HttpResponse = {
    body : [Nat8];
    headers : [HeaderField];
    status_code : Nat16;
  };

  public query func http_request(arg : HttpRequest) : async HttpResponse{
    {
      body = [Net8.fromNat(currentValue)];
      headers = [];
      status_code = 200;
    }
  };
}
