Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(a)
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(b)
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers: None
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(ptr)
|  |  IsConst: false
|  |  Name: 'ptr'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers:
|  |  |  |  Pointer
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (5:1) IDENTIFIER(ref)
|  |  IsConst: false
|  |  Name: 'ref'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers:
|  |  |  |  Reference
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (7:1) IDENTIFIER(dynamic)
|  |  IsConst: false
|  |  Name: 'dynamic'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (8:1) IDENTIFIER(fixed)
|  |  IsConst: false
|  |  Name: 'fixed'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  FixedArray
|  |  |  |  |  (8:14) LIT_INTEGER(16)
|  |  |  |  |  |  Postfix: None
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (9:1) IDENTIFIER(slice)
|  |  IsConst: false
|  |  Name: 'slice'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Slice
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (11:1) IDENTIFIER(complex)
|  |  IsConst: false
|  |  Name: 'complex'
|  |  Type:
|  |  |  Base: u8
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  |  |  |  Pointer
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (12:1) IDENTIFIER(other)
|  |  IsConst: false
|  |  Name: 'other'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Pointer
|  |  |  |  FixedArray
|  |  |  |  |  (12:17) LIT_INTEGER(4)
|  |  |  |  |  |  Postfix: None
|  |  Initializer: None
|  VariableDeclaration
|  |  Start: (13:1) IDENTIFIER(view)
|  |  IsConst: false
|  |  Name: 'view'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Reference
|  |  |  |  Slice
|  |  Initializer: None