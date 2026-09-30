Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (2:5) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (2:9) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN
|  |  |  |  Left:
|  |  |  |  |  (3:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'member'
|  |  |  |  Right:
|  |  |  |  |  (3:16) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  Left:
|  |  |  |  |  (5:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (5:10) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_SUB
|  |  |  |  Left:
|  |  |  |  |  (6:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (6:10) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_MUL
|  |  |  |  Left:
|  |  |  |  |  (7:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (7:10) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_DIV
|  |  |  |  Left:
|  |  |  |  |  (8:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (8:10) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_MOD
|  |  |  |  Left:
|  |  |  |  |  (9:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (9:10) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_AND
|  |  |  |  Left:
|  |  |  |  |  (11:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (11:10) IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_OR
|  |  |  |  Left:
|  |  |  |  |  (12:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (12:10) IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_XOR
|  |  |  |  Left:
|  |  |  |  |  (13:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (13:10) IDENTIFIER(mask)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_LSHIFT
|  |  |  |  Left:
|  |  |  |  |  (15:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (15:11) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  BinaryExpression
|  |  |  |  Operator: OP_ASSIGN_RSHIFT
|  |  |  |  Left:
|  |  |  |  |  (16:5) IDENTIFIER(a)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Right:
|  |  |  |  |  (16:11) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (18:5) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (18:9) IDENTIFIER(b)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_ASSIGN
|  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  (18:13) IDENTIFIER(c)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  (18:17) LIT_INTEGER(42)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (19:5) IDENTIFIER(d)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'd'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_ASSIGN_ADD
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (19:15) IDENTIFIER(a)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (19:20) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None