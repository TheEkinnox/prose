Program
|  FunctionDeclaration
|  |  Name: 'outer'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (2:9) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  AliasDeclaration
|  |  |  |  Name: LocalInt
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  TypeDeclaration
|  |  |  |  Name: 'LocalType'
|  |  |  |  Members:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'value'
|  |  |  |  |  |  Type:
|  |  |  |  |  |  |  Base: LocalInt
|  |  |  |  |  |  |  Modifiers: None
|  |  |  |  |  |  Initializer: None
|  |  |  EnumDeclaration
|  |  |  |  Name: LocalEnum
|  |  |  |  Type: None
|  |  |  |  Element 0
|  |  |  |  |  Name: A
|  |  |  |  |  Initializer: None
|  |  |  |  Element 1
|  |  |  |  |  Name: B
|  |  |  |  |  Initializer: None
|  |  |  FunctionDeclaration
|  |  |  |  Name: 'inner'
|  |  |  |  Type: None
|  |  |  |  Parameters: None
|  |  |  |  Body:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'y'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  (16:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None