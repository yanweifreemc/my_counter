import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor Counter{
  stable var currentValue : Nat = 0;

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
    body : Blob;
    headers : [HeaderField];
  };
  type HttpResponse = {
    body : Blob;
    headers : [HeaderField];
    status_code : Nat16;
  };

  public query func http_request(arg : HttpRequest) : async HttpResponse{
    {
      body = Text.encodeUtf8(Nat.toText(currentValue));
      headers = [];
      status_code = 200;
    }
  };
}
