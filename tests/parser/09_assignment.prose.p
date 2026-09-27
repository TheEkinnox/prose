Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'member'
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_SUB
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_MUL
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_DIV
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_MOD
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_AND
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_OR
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_XOR
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_LSHIFT
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_RSHIFT
|  |  |  |  Left: 
|  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right: 
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  IDENTIFIER(b)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_ASSIGN
|  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  IDENTIFIER(c)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  LIT_INTEGER(42)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'd'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  IDENTIFIER(a)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None