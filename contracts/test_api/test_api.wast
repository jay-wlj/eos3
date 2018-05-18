(module
 (type $FUNCSIG$j (func (result i64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vj (func (param i64)))
 (import "env" "action_size" (func $action_size (result i32)))
 (import "env" "assert" (func $assert (param i32 i32)))
 (import "env" "current_receiver" (func $current_receiver (result i64)))
 (import "env" "printi" (func $printi (param i64)))
 (import "env" "printi128" (func $printi128 (param i32)))
 (import "env" "printn" (func $printn (param i64)))
 (import "env" "prints" (func $prints (param i32)))
 (import "env" "read_action" (func $read_action (param i32 i32) (result i32)))
 (table 0 anyfunc)
 (memory $0 1)
 (data (i32.const 4) "`c\00\00")
 (data (i32.const 8416) "testapi\00")
 (data (i32.const 8432) "current_receiver() == N(testapi)\00")
 (data (i32.const 8480) "action_size() == sizeof(dummy_action)\00")
 (data (i32.const 8528) "read_action(30)\00")
 (data (i32.const 8544) "read_action(100)\00")
 (data (i32.const 8576) "read_action(5)\00")
 (data (i32.const 8592) "read_action(sizeof(dummy_action))\00")
 (data (i32.const 8640) "dummy13->a == DUMMY_MESSAGE_DEFAULT_A\00")
 (data (i32.const 8688) "dummy13->b == DUMMY_MESSAGE_DEFAULT_B\00")
 (data (i32.const 8736) "dummy13->c == DUMMY_MESSAGE_DEFAULT_C\00")
 (data (i32.const 8784) "test_action::assert_false\00")
 (data (i32.const 8816) "test_action::assert_true\00")
 (data (i32.const 8848) "ab\00")
 (data (i32.const 8864) "c\00test_prints\00")
 (data (i32.const 8880) "efg\00")
 (data (i32.const 8896) "abcde\00")
 (data (i32.const 8912) "abBde\00")
 (data (i32.const 8928) "1q1q1qAA\00")
 (data (i32.const 8944) "AAAAAA\00")
 (data (i32.const 8960) "abcdefghijk\00")
 (data (i32.const 8976) "abcdefghijkl\00")
 (data (i32.const 8992) "abcdefghijkl1\00")
 (data (i32.const 9008) "abcdefghijkl12\00")
 (data (i32.const 9024) "abcdefghijkl123\00")
 (data (i32.const 9040) "Unknown Test\00")
 (export "memory" (memory $0))
 (export "_ZN11test_action18read_action_normalEv" (func $_ZN11test_action18read_action_normalEv))
 (export "_ZN11test_action16read_action_to_0Ev" (func $_ZN11test_action16read_action_to_0Ev))
 (export "_ZN11test_action18read_action_to_64kEv" (func $_ZN11test_action18read_action_to_64kEv))
 (export "_ZN11test_action12assert_falseEv" (func $_ZN11test_action12assert_falseEv))
 (export "_ZN11test_action11assert_trueEv" (func $_ZN11test_action11assert_trueEv))
 (export "_ZN10test_print11test_printsEv" (func $_ZN10test_print11test_printsEv))
 (export "_ZN10test_print11test_printiEv" (func $_ZN10test_print11test_printiEv))
 (export "_ZN10test_print14test_printi128Ev" (func $_ZN10test_print14test_printi128Ev))
 (export "_ZN10test_print11test_printnEv" (func $_ZN10test_print11test_printnEv))
 (export "init" (func $init))
 (export "apply" (func $apply))
 (export "_GLOBAL__sub_I_test_api.cpp" (func $_GLOBAL__sub_I_test_api.cpp))
 (func $_GLOBAL__sub_I_test_api.cpp
  (i64.store offset=8204 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8212 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8220 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8228 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8236 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i32.store offset=8244
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8248
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8252
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8256
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8260
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8264
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8268
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8272
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8276
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8280
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8284
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8288
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8292
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8296
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8300
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8304
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8308
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8312
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8316
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8320
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8324
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8328
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8332
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8336
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8340
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8344
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8348
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8352
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8356
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8360
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8364
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8368
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8372
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8376
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8380
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8384
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8388
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8392
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8396
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8400
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8404
   (i32.const 0)
   (i32.const 0)
  )
 )
 (func $_ZN11test_action18read_action_normalEv
  (local $0 i64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 112)
    )
   )
  )
  (set_local $4
   (i64.const 0)
  )
  (set_local $3
   (i64.const 59)
  )
  (set_local $2
   (i32.const 8416)
  )
  (set_local $0
   (call $current_receiver)
  )
  (set_local $5
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $4)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $1
             (i32.load8_s
              (get_local $2)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $1
         (i32.add
          (get_local $1)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $6
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $4)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $1
       (select
        (i32.add
         (get_local $1)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $1)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $6
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $1)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $6
     (i64.shl
      (i64.and
       (get_local $6)
       (i64.const 31)
      )
      (i64.and
       (get_local $3)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $2
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
   )
   (set_local $4
    (i64.add
     (get_local $4)
     (i64.const 1)
    )
   )
   (set_local $5
    (i64.or
     (get_local $6)
     (get_local $5)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $3
      (i64.add
       (get_local $3)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $assert
   (i64.eq
    (get_local $0)
    (get_local $5)
   )
   (i32.const 8432)
  )
  (call $assert
   (i32.eq
    (call $action_size)
    (i32.const 13)
   )
   (i32.const 8480)
  )
  (call $assert
   (i32.eq
    (call $read_action
     (get_local $7)
     (i32.const 30)
    )
    (i32.const 13)
   )
   (i32.const 8528)
  )
  (call $assert
   (i32.eq
    (call $read_action
     (get_local $7)
     (i32.const 100)
    )
    (i32.const 13)
   )
   (i32.const 8544)
  )
  (call $assert
   (i32.eq
    (call $read_action
     (get_local $7)
     (i32.const 5)
    )
    (i32.const 5)
   )
   (i32.const 8576)
  )
  (call $assert
   (i32.eq
    (call $read_action
     (get_local $7)
     (i32.const 13)
    )
    (i32.const 13)
   )
   (i32.const 8592)
  )
  (call $assert
   (i32.eq
    (i32.load8_u
     (get_local $7)
    )
    (i32.const 69)
   )
   (i32.const 8640)
  )
  (call $assert
   (i64.eq
    (i64.load offset=1 align=1
     (get_local $7)
    )
    (i64.const -6119884940280240521)
   )
   (i32.const 8688)
  )
  (call $assert
   (i32.eq
    (i32.load offset=9 align=1
     (get_local $7)
    )
    (i32.const 1951510034)
   )
   (i32.const 8736)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 112)
   )
  )
 )
 (func $_ZN11test_action16read_action_to_0Ev
  (drop
   (call $read_action
    (i32.const 0)
    (i32.const 2147483647)
   )
  )
 )
 (func $_ZN11test_action18read_action_to_64kEv
  (drop
   (call $read_action
    (i32.const 65535)
    (i32.const 2147483647)
   )
  )
 )
 (func $_ZN11test_action12assert_falseEv
  (call $assert
   (i32.const 0)
   (i32.const 8784)
  )
 )
 (func $_ZN11test_action11assert_trueEv
  (call $assert
   (i32.const 1)
   (i32.const 8816)
  )
 )
 (func $_ZN10test_print11test_printsEv
  (call $prints
   (i32.const 8848)
  )
  (call $prints
   (i32.const 0)
  )
  (call $prints
   (i32.const 8864)
  )
  (call $prints
   (i32.const 0)
  )
  (call $prints
   (i32.const 8880)
  )
  (call $prints
   (i32.const 0)
  )
 )
 (func $_ZN10test_print11test_printiEv
  (call $printi
   (i64.const 0)
  )
  (call $printi
   (i64.const 556644)
  )
  (call $printi
   (i64.const -1)
  )
 )
 (func $_ZN10test_print14test_printi128Ev
  (local $0 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $0
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i64.store offset=40
   (get_local $0)
   (i64.const -1)
  )
  (i64.store offset=32
   (get_local $0)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $0)
   (i64.const 0)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $0)
   (i64.const 0)
  )
  (i64.store
   (get_local $0)
   (i64.const 87654323456)
  )
  (call $printi128
   (i32.add
    (get_local $0)
    (i32.const 32)
   )
  )
  (call $printi128
   (i32.add
    (get_local $0)
    (i32.const 16)
   )
  )
  (call $printi128
   (get_local $0)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
 )
 (func $_ZN10test_print11test_printnEv
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8896)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $3)
          (i64.const 4)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8912)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $3)
          (i64.const 4)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 165)
         )
        )
        (br $label$9)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8928)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$12
   (block $label$13
    (block $label$14
     (block $label$15
      (block $label$16
       (block $label$17
        (br_if $label$17
         (i64.gt_u
          (get_local $3)
          (i64.const 7)
         )
        )
        (br_if $label$16
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 165)
         )
        )
        (br $label$15)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$14
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$13)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$12
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (call $printn
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8944)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$18
   (block $label$19
    (block $label$20
     (block $label$21
      (block $label$22
       (block $label$23
        (br_if $label$23
         (i64.gt_u
          (get_local $3)
          (i64.const 5)
         )
        )
        (br_if $label$22
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 165)
         )
        )
        (br $label$21)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$20
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$19)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$18
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8960)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$24
   (block $label$25
    (block $label$26
     (block $label$27
      (block $label$28
       (block $label$29
        (br_if $label$29
         (i64.gt_u
          (get_local $3)
          (i64.const 10)
         )
        )
        (br_if $label$28
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 165)
         )
        )
        (br $label$27)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$26
        (i64.eq
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$25)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $2
    (i64.add
     (get_local $2)
     (i64.const -5)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$24
    (i64.ne
     (tee_local $3
      (i64.add
       (get_local $3)
       (i64.const 1)
      )
     )
     (i64.const 13)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $5
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8976)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$30
   (set_local $2
    (i64.const 0)
   )
   (block $label$31
    (br_if $label$31
     (i64.gt_u
      (get_local $3)
      (i64.const 11)
     )
    )
    (block $label$32
     (block $label$33
      (br_if $label$33
       (i32.gt_u
        (i32.and
         (i32.add
          (tee_local $0
           (i32.load8_s
            (get_local $1)
           )
          )
          (i32.const -97)
         )
         (i32.const 255)
        )
        (i32.const 25)
       )
      )
      (set_local $0
       (i32.add
        (get_local $0)
        (i32.const 165)
       )
      )
      (br $label$32)
     )
     (set_local $0
      (select
       (i32.add
        (get_local $0)
        (i32.const 208)
       )
       (i32.const 0)
       (i32.lt_u
        (i32.and
         (i32.add
          (get_local $0)
          (i32.const -49)
         )
         (i32.const 255)
        )
        (i32.const 5)
       )
      )
     )
    )
    (set_local $2
     (i64.shl
      (i64.extend_u/i32
       (i32.and
        (get_local $0)
        (i32.const 31)
       )
      )
      (i64.and
       (get_local $5)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $2)
     (get_local $4)
    )
   )
   (br_if $label$30
    (i64.ne
     (tee_local $5
      (i64.add
       (get_local $5)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 8992)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$34
   (set_local $5
    (i64.const 0)
   )
   (block $label$35
    (block $label$36
     (br_if $label$36
      (i64.gt_u
       (get_local $3)
       (i64.const 12)
      )
     )
     (block $label$37
      (block $label$38
       (br_if $label$38
        (i32.gt_u
         (i32.and
          (i32.add
           (tee_local $0
            (i32.load8_s
             (get_local $1)
            )
           )
           (i32.const -97)
          )
          (i32.const 255)
         )
         (i32.const 25)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 165)
        )
       )
       (br $label$37)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
     (br_if $label$36
      (i64.gt_u
       (get_local $3)
       (i64.const 11)
      )
     )
     (set_local $5
      (i64.shl
       (i64.and
        (get_local $5)
        (i64.const 31)
       )
       (i64.and
        (get_local $2)
        (i64.const 4294967295)
       )
      )
     )
     (br $label$35)
    )
    (set_local $5
     (i64.and
      (get_local $5)
      (i64.const 15)
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$34
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 9008)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$39
   (set_local $5
    (i64.const 0)
   )
   (block $label$40
    (block $label$41
     (br_if $label$41
      (i64.gt_u
       (get_local $3)
       (i64.const 13)
      )
     )
     (block $label$42
      (block $label$43
       (br_if $label$43
        (i32.gt_u
         (i32.and
          (i32.add
           (tee_local $0
            (i32.load8_s
             (get_local $1)
            )
           )
           (i32.const -97)
          )
          (i32.const 255)
         )
         (i32.const 25)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 165)
        )
       )
       (br $label$42)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
     (br_if $label$41
      (i64.gt_u
       (get_local $3)
       (i64.const 11)
      )
     )
     (set_local $5
      (i64.shl
       (i64.and
        (get_local $5)
        (i64.const 31)
       )
       (i64.and
        (get_local $2)
        (i64.const 4294967295)
       )
      )
     )
     (br $label$40)
    )
    (set_local $5
     (i64.and
      (get_local $5)
      (i64.const 15)
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$39
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 9024)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$44
   (set_local $5
    (i64.const 0)
   )
   (block $label$45
    (block $label$46
     (br_if $label$46
      (i64.gt_u
       (get_local $3)
       (i64.const 14)
      )
     )
     (block $label$47
      (block $label$48
       (br_if $label$48
        (i32.gt_u
         (i32.and
          (i32.add
           (tee_local $0
            (i32.load8_s
             (get_local $1)
            )
           )
           (i32.const -97)
          )
          (i32.const 255)
         )
         (i32.const 25)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 165)
        )
       )
       (br $label$47)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
     (br_if $label$46
      (i64.gt_u
       (get_local $3)
       (i64.const 11)
      )
     )
     (set_local $5
      (i64.shl
       (i64.and
        (get_local $5)
        (i64.const 31)
       )
       (i64.and
        (get_local $2)
        (i64.const 4294967295)
       )
      )
     )
     (br $label$45)
    )
    (set_local $5
     (i64.and
      (get_local $5)
      (i64.const 15)
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$44
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (call $printn
   (get_local $4)
  )
 )
 (func $init
 )
 (func $apply (param $0 i64) (param $1 i64)
  (local $2 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $2
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (block $label$6
         (block $label$7
          (block $label$8
           (block $label$9
            (br_if $label$9
             (i64.le_s
              (get_local $1)
              (i64.const -8665432477288202419)
             )
            )
            (br_if $label$8
             (i64.le_s
              (get_local $1)
              (i64.const -5767735918449313235)
             )
            )
            (br_if $label$6
             (i64.eq
              (get_local $1)
              (i64.const -5767735918449313234)
             )
            )
            (br_if $label$5
             (i64.eq
              (get_local $1)
              (i64.const -5767735918449313229)
             )
            )
            (br_if $label$1
             (i64.ne
              (get_local $1)
              (i64.const -5767735918449313228)
             )
            )
            (call $printi
             (i64.const 0)
            )
            (call $printi
             (i64.const 556644)
            )
            (call $printi
             (i64.const -1)
            )
            (br $label$0)
           )
           (br_if $label$7
            (i64.gt_s
             (get_local $1)
             (i64.const -8665432478272688455)
            )
           )
           (br_if $label$4
            (i64.eq
             (get_local $1)
             (i64.const -8665432478353100899)
            )
           )
           (br_if $label$1
            (i64.ne
             (get_local $1)
             (i64.const -8665432478290165179)
            )
           )
           (call $assert
            (i32.const 0)
            (i32.const 8784)
           )
           (br $label$0)
          )
          (br_if $label$3
           (i64.eq
            (get_local $1)
            (i64.const -8665432477288202418)
           )
          )
          (br_if $label$1
           (i64.ne
            (get_local $1)
            (i64.const -5767735918947814449)
           )
          )
          (i64.store offset=40
           (get_local $2)
           (i64.const -1)
          )
          (i64.store offset=32
           (get_local $2)
           (i64.const -1)
          )
          (i64.store offset=24
           (get_local $2)
           (i64.const 0)
          )
          (i64.store offset=16
           (get_local $2)
           (i64.const 0)
          )
          (i64.store offset=8
           (get_local $2)
           (i64.const 0)
          )
          (i64.store
           (get_local $2)
           (i64.const 87654323456)
          )
          (call $printi128
           (i32.add
            (get_local $2)
            (i32.const 32)
           )
          )
          (call $printi128
           (i32.add
            (get_local $2)
            (i32.const 16)
           )
          )
          (call $printi128
           (get_local $2)
          )
          (br $label$0)
         )
         (br_if $label$2
          (i64.eq
           (get_local $1)
           (i64.const -8665432478272688454)
          )
         )
         (br_if $label$1
          (i64.ne
           (get_local $1)
           (i64.const -8665432477579625276)
          )
         )
         (drop
          (call $read_action
           (i32.const 65535)
           (i32.const 2147483647)
          )
         )
         (br $label$0)
        )
        (call $prints
         (i32.const 8848)
        )
        (call $prints
         (i32.const 0)
        )
        (call $prints
         (i32.const 8864)
        )
        (call $prints
         (i32.const 0)
        )
        (call $prints
         (i32.const 8880)
        )
        (call $prints
         (i32.const 0)
        )
        (br $label$0)
       )
       (call $_ZN10test_print11test_printnEv)
       (br $label$0)
      )
      (drop
       (call $read_action
        (i32.const 0)
        (i32.const 2147483647)
       )
      )
      (br $label$0)
     )
     (call $assert
      (i32.const 1)
      (i32.const 8816)
     )
     (br $label$0)
    )
    (call $_ZN11test_action18read_action_normalEv)
    (br $label$0)
   )
   (call $assert
    (i32.const 0)
    (i32.const 9040)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $2)
    (i32.const 48)
   )
  )
 )
)
