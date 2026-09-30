Program
|  TypeDeclaration
|  |  Name: 'Empty'
|  |  Members: None
|  TypeDeclaration
|  |  Name: 'ExplicitTypes'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'y'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Initializer: None
|  TypeDeclaration
|  |  Name: 'ImplicitTypes'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (10:9) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'y'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (11:11) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (11:14) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (11:17) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  TypeDeclaration
|  |  Name: 'ConstMembers'
|  |  Members:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: true
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (15:15) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: true
|  |  |  |  Name: 'y'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (16:21) LIT_INTEGER(0)
|  |  |  |  |  |  Postfix: None