Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers: None
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'ptr'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers:
|  |  |  |  Pointer
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'ref'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers:
|  |  |  |  Reference
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'dynamic'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'fixed'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  FixedArray
|  |  |  |  |  LIT_INTEGER(16)
|  |  |  |  |  |  Postfix: None
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'slice'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Slice
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'complex'
|  |  Type:
|  |  |  Base: u8
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  |  |  |  Pointer
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'other'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Pointer
|  |  |  |  FixedArray
|  |  |  |  |  LIT_INTEGER(4)
|  |  |  |  |  |  Postfix: None
|  |  Initializer: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'view'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Reference
|  |  |  |  Slice
|  |  Initializer: None