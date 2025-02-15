; REQUIRES: x86
; RUN: mkdir -p %t.dir
; RUN: llvm-as -o %t.dir/lto-linker-opts.obj %s
; RUN: env LIB=%S/Inputs lld-link /out:%t.dir/lto-linker-opts.exe /entry:main /subsystem:console %t.dir/lto-linker-opts.obj

target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

!llvm.linker.options = !{!0}
!0 = !{!"/DEFAULTLIB:ret42.lib"}
