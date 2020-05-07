(module
  (import "wbg" "memory" (memory 834 16384 shared))
  (func $print (import "wbg" "myimport") (param i32))

  (func $entry (export "startme")
    (local $res i32)
    (call $print (i32.const 0))
    (local.set $res (i32.atomic.wait
      (i32.const 0)
      (i32.const 0)
      (i64.const 5000000000)))
    (call $print (i32.const 1))
  )
)
