(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (import "wbg" "myimport" (func (;0;) (type 1)))
  (import "wbg" "memory" (memory (;0;) 256 256 shared))
  (func (;1;) (type 0)
    (local i32)
    i32.const 0
    i32.atomic.load
    local.tee 0
    call 0
    i32.const 0
    local.get 0
    i64.const 1000000000
    i32.atomic.wait
    drop
    i32.const 0
    local.get 0
    i32.const 1
    i32.add
    i32.atomic.store
    call 1)
  (export "startme" (func 1)))
