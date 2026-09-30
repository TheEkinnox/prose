Program
|  AliasDeclaration
|  |  Start: (1:1) KW_ALIAS(alias)
|  |  Name: 'Index'
|  |  Type:
|  |  |  Base: uptr
|  |  |  Modifiers: None
|  AliasDeclaration
|  |  Start: (2:1) KW_ALIAS(alias)
|  |  Name: 'BytePointer'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Pointer
|  AliasDeclaration
|  |  Start: (3:1) KW_ALIAS(alias)
|  |  Name: 'ByteArray'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  AliasDeclaration
|  |  Start: (4:1) KW_ALIAS(alias)
|  |  Name: 'Matrix'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers:
|  |  |  |  FixedArray
|  |  |  |  |  (4:20) LIT_INTEGER(4)
|  |  |  |  |  |  Postfix: None
|  |  |  |  FixedArray
|  |  |  |  |  (4:23) LIT_INTEGER(4)
|  |  |  |  |  |  Postfix: None
|  AliasDeclaration
|  |  Start: (5:1) KW_ALIAS(alias)
|  |  Name: 'View'
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Slice
|  AliasDeclaration
|  |  Start: (6:1) KW_ALIAS(alias)
|  |  Name: 'ObjectPointer'
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Pointer