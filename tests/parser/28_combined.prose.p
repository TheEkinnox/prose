Program
|  AliasDeclaration
|  |  Name: Index
|  |  Type:
|  |  |  Base: uptr
|  |  |  Modifiers: None
|  EnumDeclaration
|  |  Name: State
|  |  Type:
|  |  |  Base: u8
|  |  |  Modifiers: None
|  |  Element 0
|  |  |  Name: Idle
|  |  |  Initializer: None
|  |  Element 1
|  |  |  Name: Running
|  |  |  Initializer: None
|  |  Element 2
|  |  |  Name: Stopped
|  |  |  Initializer: None
|  TypeDeclaration
|  |  Name: 'Counter'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'value'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'state'
|  |  |  |  Type:
|  |  |  |  |  Base: State
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  IDENTIFIER(State)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'Idle'
|  FunctionDeclaration
|  |  Name: 'increment'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'counter'
|  |  |  |  Type:
|  |  |  |  |  Base: Counter
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  Reference
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'amount'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(counter)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'value'
|  |  |  |  Right: 
|  |  |  |  |  IDENTIFIER(amount)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Name: 'process'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'values'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'total'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  DeferStatement
|  |  |  |  IDENTIFIER(cleanup)
|  |  |  |  |  Postfix:
|  |  |  |  |  |  Call
|  |  |  |  |  |  |  Arguments: None
|  |  |  ForStatement
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: true
|  |  |  |  Range:
|  |  |  |  |  IDENTIFIER(values)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_LESS
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Continue
|  |  |  |  |  |  Conditional branches:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_EQUAL
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  |  |  Name: 'value'
|  |  |  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Default branch:
|  |  |  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Increment
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  IDENTIFIER(total)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_GREATER_EQUAL
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(total)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  LIT_INTEGER(100)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Break
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  SwitchStatement
|  |  |  |  Expression:
|  |  |  |  |  IDENTIFIER(total)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Case 0
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(log)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  LIT_STRING("empty")
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Case 1
|  |  |  |  |  Is Fallthrough: false
|  |  |  |  |  Condition:
|  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(log)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  LIT_STRING("small")
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Default:
|  |  |  |  |  IDENTIFIER(log)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  LIT_STRING("large")
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  Return
|  |  |  |  IDENTIFIER(total)
|  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'values'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'result'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  IDENTIFIER(values)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ScopeStatement
|  |  |  |  VariableDeclaration
|  |  |  |  |  IsConst: false
|  |  |  |  |  Name: 'copy'
|  |  |  |  |  Type: None
|  |  |  |  |  Initializer:
|  |  |  |  |  |  IDENTIFIER(result)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  VariableDeclaration
|  |  |  |  |  IsConst: false
|  |  |  |  |  Name: 'ptr'
|  |  |  |  |  Type: None
|  |  |  |  |  Initializer:
|  |  |  |  |  |  UnaryExpression
|  |  |  |  |  |  |  Operator: OP_ADDRESS_OF
|  |  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  |  IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  WhileStatement
|  |  |  |  |  Condition:
|  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  Operator: OP_GREATER
|  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(copy)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Decrement