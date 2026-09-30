Program
|  AliasDeclaration
|  |  Start: (1:1) KW_ALIAS(alias)
|  |  Name: 'Index'
|  |  Type:
|  |  |  Base: uptr
|  |  |  Modifiers: None
|  EnumDeclaration
|  |  Start: (3:1) KW_ENUM(enum)
|  |  Name: 'State'
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
|  |  Start: (9:1) KW_TYPE(type)
|  |  Name: 'Counter'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  Start: (10:5) IDENTIFIER(value)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'value'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (10:19) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (11:5) IDENTIFIER(state)
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
|  |  Start: (14:1) KW_FN(fn)
|  |  Name: 'increment'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (14:14) IDENTIFIER(counter)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'counter'
|  |  |  |  Type:
|  |  |  |  |  Base: Counter
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  Reference
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (14:34) IDENTIFIER(amount)
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
|  |  Start: (18:1) KW_FN(fn)
|  |  Name: 'process'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (18:12) IDENTIFIER(values)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'values'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (19:5) IDENTIFIER(total)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'total'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (19:19) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  DeferStatement
|  |  |  |  Start: (21:5) KW_DEFER(defer)
|  |  |  |  Call:
|  |  |  |  |  (21:11) IDENTIFIER(cleanup)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  ForStatement
|  |  |  |  Start: (23:5) KW_FOR(for)
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: true
|  |  |  |  Range:
|  |  |  |  |  (23:19) IDENTIFIER(values)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Start: (24:9) KW_IF(if)
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
|  |  |  |  |  |  |  |  ControlStatement
|  |  |  |  |  |  |  |  |  Type: (25:13) KW_CONTINUE(continue)
|  |  |  |  |  |  Conditional branches:
|  |  |  |  |  |  |  Start: (26:14) KW_IF(if)
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
|  |  |  |  |  |  |  |  |  Start: (27:13) IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  |  |  Name: 'value'
|  |  |  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  |  |  (27:21) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Default branch:
|  |  |  |  |  |  |  Start: (28:9) KW_ELSE(else)
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  (29:13) IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  Increment
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
|  |  |  |  |  |  |  Start: (34:9) KW_IF(if)
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
|  |  |  |  |  |  |  |  ControlStatement
|  |  |  |  |  |  |  |  |  Type: (35:13) KW_BREAK(break)
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  SwitchStatement
|  |  |  |  Start: (39:5) KW_SWITCH(switch)
|  |  |  |  Expression:
|  |  |  |  |  (39:12) IDENTIFIER(total)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Case 0
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Start: (40:9) KW_CASE(case)
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
|  |  |  |  |  Start: (44:9) KW_CASE(case)
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
|  |  |  |  |  Start: (47:9) KW_DEFAULT(default)
|  |  |  |  |  Body:
|  |  |  |  |  |  (48:13) IDENTIFIER(log)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  (48:17) LIT_STRING("large")
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ControlStatement
|  |  |  |  Type: (51:5) KW_RETURN(return)
|  |  |  |  Value:
|  |  |  |  |  (51:12) IDENTIFIER(total)
|  |  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Start: (54:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (55:5) IDENTIFIER(values)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'values'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Start: (55:22) LBRACKET([)
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
|  |  |  |  Start: (57:5) IDENTIFIER(result)
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
|  |  |  |  Start: (59:5) KW_SCOPE(scope)
|  |  |  |  Body:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  Start: (60:9) IDENTIFIER(copy)
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'copy'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  (60:16) IDENTIFIER(result)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  Start: (61:9) IDENTIFIER(ptr)
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'ptr'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  UnaryExpression
|  |  |  |  |  |  |  |  Operator: (61:15) OP_ADDRESS_OF(@)
|  |  |  |  |  |  |  |  Operand:
|  |  |  |  |  |  |  |  |  (61:16) IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  WhileStatement
|  |  |  |  |  |  Start: (63:9) KW_WHILE(while)
|  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_GREATER
|  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  (63:15) IDENTIFIER(copy)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  (63:22) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Body:
|  |  |  |  |  |  |  (64:13) IDENTIFIER(copy)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Decrement