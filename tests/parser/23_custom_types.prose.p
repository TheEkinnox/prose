Program
|  TypeDeclaration
|  |  Start: (1:1) KW_TYPE(type)
|  |  Name: 'Empty'
|  |  Members: None
|  TypeDeclaration
|  |  Start: (4:1) KW_TYPE(type)
|  |  Name: 'ExplicitTypes'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  Start: (5:5) IDENTIFIER(x)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (6:5) IDENTIFIER(y)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'y'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer: None
|  TypeDeclaration
|  |  Start: (9:1) KW_TYPE(type)
|  |  Name: 'ImplicitTypes'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  Start: (10:5) IDENTIFIER(x)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (10:9) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (11:5) IDENTIFIER(y)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'y'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Start: (11:9) LBRACKET([)
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (11:11) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (11:14) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (11:17) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  TypeDeclaration
|  |  Start: (14:1) KW_TYPE(type)
|  |  Name: 'ConstMembers'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  Start: (15:5) KW_CONST(const)
|  |  |  |  IsConst: true
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (15:15) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (16:5) KW_CONST(const)
|  |  |  |  IsConst: true
|  |  |  |  Name: 'y'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (16:21) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None