Program
|  AliasDeclaration
|  |  Name: Index
|  |  Type:
|  |  |  Base: uptr
|  |  |  Modifiers: None
|  AliasDeclaration
|  |  Name: BytePointer
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Pointer
|  AliasDeclaration
|  |  Name: ByteArray
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  DynamicArray
|  AliasDeclaration
|  |  Name: Matrix
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
|  |  Name: View
|  |  Type:
|  |  |  Base: byte
|  |  |  Modifiers:
|  |  |  |  Slice
|  AliasDeclaration
|  |  Name: ObjectPointer
|  |  Type:
|  |  |  Base: MyType
|  |  |  Modifiers:
|  |  |  |  Pointer