; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --filter-out "// kill:" --version 4
; RUN: llc -force-streaming < %s | FileCheck %s
target triple = "aarch64-linux"

define void @test_fvdot16_1x2_indexed(i32 %slice.0,
; CHECK-LABEL: test_fvdot16_1x2_indexed:
; CHECK:  // %bb.0:
; CHECK:    mov w8, w0
; CHECK:    fvdot za.h[w8, 7, vgx2], { z0.b, z1.b }, z2.b[3]
; CHECK:    ret
                                     <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                     <vscale x 16 x i8> %zm) #0 {
  %slice = add i32 %slice.0, 7
  call void @llvm.aarch64.sme.fp8.fvdot.lane.za16.vg1x2(i32 %slice,
                                                       <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                                       <vscale x 16 x i8> %zm, i32 3)
  ret void
}

define void @test_fvdot32_bottom_1x4_indexed(i32 %slice.0,
; CHECK-LABEL: test_fvdot32_bottom_1x4_indexed:
; CHECK:  // %bb.0:
; CHECK:    mov w8, w0
; CHECK:    fvdotb za.s[w8, 7, vgx4], { z0.b, z1.b }, z2.b[3]
; CHECK:    ret
                                             <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                             <vscale x 16 x i8> %zm) #0 {
  %slice = add i32 %slice.0, 7
  call void @llvm.aarch64.sme.fp8.fvdotb.lane.za32.vg1x4(i32 %slice,
                                                         <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                                         <vscale x 16 x i8> %zm, i32 3)
  ret void
}

define void @test_fvdot32_top_1x4_indexed(i32 %slice.0,
; CHECK-LABEL: test_fvdot32_top_1x4_indexed:
; CHECK:  // %bb.0:
; CHECK:    mov w8, w0
; CHECK:    fvdott za.s[w8, 7, vgx4], { z0.b, z1.b }, z2.b[3]
; CHECK:    ret
                                          <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                          <vscale x 16 x i8> %zm) #0 {
  %slice = add i32 %slice.0, 7
  call void @llvm.aarch64.sme.fp8.fvdott.lane.za32.vg1x4(i32 %slice,
                                                         <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2,
                                                         <vscale x 16 x i8> %zm, i32 3)
  ret void
}

attributes #0 = { "target-features" = "+sme-f8f32,+sme-f8f16" }
