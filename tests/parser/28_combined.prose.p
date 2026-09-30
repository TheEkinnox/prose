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
|  |  |  |  |  (10:19) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'state'
|  |  |  |  Type:
|  |  |  |  |  Base: State
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (11:21) IDENTIFIER(State)
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
|  |  |  |  |  (14:49) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  Left: 
|  |  |  |  |  (15:5) IDENTIFIER(counter)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'value'
|  |  |  |  Right: 
|  |  |  |  |  (15:22) IDENTIFIER(amount)
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
|  |  |  |  |  (19:19) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  DeferStatement
|  |  |  |  (21:11) IDENTIFIER(cleanup)
|  |  |  |  |  Postfix:
|  |  |  |  |  |  Call
|  |  |  |  |  |  |  Arguments: None
|  |  |  ForStatement
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: true
|  |  |  |  Range:
|  |  |  |  |  (23:19) IDENTIFIER(values)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_LESS
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  (24:12) IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  (24:20) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Continue
|  |  |  |  |  |  Conditional branches:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_EQUAL
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  (26:17) IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  (26:26) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  |  |  Name: 'value'
|  |  |  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  |  |  (27:21) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Default branch:
|  |  |  |  |  |  |  (29:13) IDENTIFIER(value)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Increment
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  (32:9) IDENTIFIER(total)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  (32:18) IDENTIFIER(value)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_GREATER_EQUAL
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  (34:12) IDENTIFIER(total)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  (34:21) LIT_INTEGER(100)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Break
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  SwitchStatement
|  |  |  |  Expression:
|  |  |  |  |  (39:12) IDENTIFIER(total)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Case 0
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  (40:14) LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (41:13) IDENTIFIER(log)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  (41:17) LIT_STRING("empty")
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Case 1
|  |  |  |  |  Is Fallthrough: false
|  |  |  |  |  Condition:
|  |  |  |  |  |  (44:14) LIT_INTEGER(1)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (45:13) IDENTIFIER(log)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  (45:17) LIT_STRING("small")
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Default:
|  |  |  |  |  (48:13) IDENTIFIER(log)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (48:17) LIT_STRING("large")
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  Return
|  |  |  |  (51:12) IDENTIFIER(total)
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
|  |  |  |  |  |  |  (55:23) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (55:26) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (55:29) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (55:32) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'result'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (57:14) IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (57:22) IDENTIFIER(values)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ScopeStatement
|  |  |  |  VariableDeclaration
|  |  |  |  |  IsConst: false
|  |  |  |  |  Name: 'copy'
|  |  |  |  |  Type: None
|  |  |  |  |  Initializer:
|  |  |  |  |  |  (60:16) IDENTIFIER(result)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  VariableDeclaration
|  |  |  |  |  IsConst: false
|  |  |  |  |  Name: 'ptr'
|  |  |  |  |  Type: None
|  |  |  |  |  Initializer:
|  |  |  |  |  |  UnaryExpression
|  |  |  |  |  |  |  Operator: OP_ADDRESS_OF
|  |  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  |  (61:16) IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  WhileStatement
|  |  |  |  |  Condition:
|  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  Operator: OP_GREATER
|  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  (63:15) IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  (63:22) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (64:13) IDENTIFIER(copy)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Decrement