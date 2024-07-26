
import javascript

class DeriveKeyCall extends DataFlow::MethodCallNode {
  DeriveKeyCall() {
    this.getMethodName() = "deriveKey"
  }

  ObjectExpr getOptions() {
    result = this.getArgument(0).asExpr()
  }

  string getName() {
    exists(ObjectExpr oe, Property nameProp |
      oe = this.getOptions() and
      nameProp.getName() = "name" and
      nameProp.getParent() = oe
    |
      result = nameProp.getAChildExpr().getStringValue().toLowerCase()
    )
  }

  string getHash() {
    exists(ObjectExpr oe, Property hashProp |
      oe = this.getOptions() and
      hashProp.getName() = "hash" and
      hashProp.getParent() = oe
    |
      result = hashProp.getAChildExpr().getStringValue().toLowerCase()
    )
  }

  int getIterations() {
    exists(ObjectExpr oe, Property iterationsProp |
      oe = this.getOptions() and
      iterationsProp.getName() = "iterations" and 
      iterationsProp.getParent() = oe
    |
      result = iterationsProp.getAChildExpr().getIntValue()
    )
  }
}
