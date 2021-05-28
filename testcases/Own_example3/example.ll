; ModuleID = 'testcases/Own_example3/example.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@encrypt.key = private unnamed_addr constant [10 x i8] c"key\00\00\00\00\00\00\00", align 1
@main.arr = private unnamed_addr constant [11 x i8] c"tobeencryp\00", align 1
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind uwtable
define void @encrypt(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %key = alloca [10 x i8], align 1
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %c = alloca [10 x i8], align 1
  %d = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8** %str.addr}, metadata !14), !dbg !15
  call void @llvm.dbg.declare(metadata !{[10 x i8]* %key}, metadata !16), !dbg !20
  %0 = bitcast [10 x i8]* %key to i8*, !dbg !20
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([10 x i8]* @encrypt.key, i32 0, i32 0), i64 10, i32 1, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !21), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %b}, metadata !23), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %e}, metadata !24), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %f}, metadata !25), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %g}, metadata !26), !dbg !22
  call void @llvm.dbg.declare(metadata !{[10 x i8]* %c}, metadata !27), !dbg !28
  call void @llvm.dbg.declare(metadata !{[10 x i8]* %d}, metadata !29), !dbg !28
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !30), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %1, 10, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !33
  %idxprom = sext i32 %2 to i64, !dbg !33
  %3 = load i8** %str.addr, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8* %3, i64 %idxprom, !dbg !33
  %4 = load i8* %arrayidx, align 1, !dbg !33
  %conv = sext i8 %4 to i32, !dbg !33
  store i32 %conv, i32* %a, align 4, !dbg !33
  %5 = load i32* %i, align 4, !dbg !35
  %rem = srem i32 %5, 3, !dbg !35
  %idxprom1 = sext i32 %rem to i64, !dbg !35
  %arrayidx2 = getelementptr inbounds [10 x i8]* %key, i32 0, i64 %idxprom1, !dbg !35
  %6 = load i8* %arrayidx2, align 1, !dbg !35
  %conv3 = sext i8 %6 to i32, !dbg !35
  store i32 %conv3, i32* %b, align 4, !dbg !35
  %7 = load i32* %a, align 4, !dbg !36
  %8 = load i32* %b, align 4, !dbg !36
  %xor = xor i32 %7, %8, !dbg !36
  %conv4 = trunc i32 %xor to i8, !dbg !36
  %9 = load i32* %i, align 4, !dbg !36
  %idxprom5 = sext i32 %9 to i64, !dbg !36
  %arrayidx6 = getelementptr inbounds [10 x i8]* %c, i32 0, i64 %idxprom5, !dbg !36
  store i8 %conv4, i8* %arrayidx6, align 1, !dbg !36
  %10 = load i32* %i, align 4, !dbg !37
  %idxprom7 = sext i32 %10 to i64, !dbg !37
  %arrayidx8 = getelementptr inbounds [10 x i8]* %c, i32 0, i64 %idxprom7, !dbg !37
  %11 = load i8* %arrayidx8, align 1, !dbg !37
  %12 = load i32* %i, align 4, !dbg !37
  %idxprom9 = sext i32 %12 to i64, !dbg !37
  %13 = load i8** %str.addr, align 8, !dbg !37
  %arrayidx10 = getelementptr inbounds i8* %13, i64 %idxprom9, !dbg !37
  store i8 %11, i8* %arrayidx10, align 1, !dbg !37
  %14 = load i32* %i, align 4, !dbg !38
  %idxprom11 = sext i32 %14 to i64, !dbg !38
  %arrayidx12 = getelementptr inbounds [10 x i8]* %c, i32 0, i64 %idxprom11, !dbg !38
  %15 = load i8* %arrayidx12, align 1, !dbg !38
  %16 = load i32* %i, align 4, !dbg !38
  %idxprom13 = sext i32 %16 to i64, !dbg !38
  %arrayidx14 = getelementptr inbounds [10 x i8]* %d, i32 0, i64 %idxprom13, !dbg !38
  store i8 %15, i8* %arrayidx14, align 1, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %17 = load i32* %i, align 4, !dbg !32
  %inc = add nsw i32 %17, 1, !dbg !32
  store i32 %inc, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !32

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %b, align 4, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %arr = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata !{[11 x i8]* %arr}, metadata !42), !dbg !46
  %0 = bitcast [11 x i8]* %arr to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([11 x i8]* @main.arr, i32 0, i32 0), i64 11, i32 1, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8]* %arr, i32 0, i32 0, !dbg !47
  call void @encrypt(i8* %arraydecay), !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8]* %arr, i32 0, i32 0, !dbg !48
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8* %arraydecay1), !dbg !48
  ret i32 0, !dbg !49
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.3 (tags/RELEASE_33/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shakti/SSE proj/testcases/Own_example3/example.c] [DW_LANG_C99]
!1 = metadata !{metadata !"testcases/Own_example3/example.c", metadata !"/home/shakti/SSE proj"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"encrypt", metadata !"encrypt", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @encrypt, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [encrypt]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/shakti/SSE proj/testcases/Own_example3/example.c]
!6 = metadata !{i32 786453, i32 0, i32 0, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 18] [def] [main]
!11 = metadata !{i32 786453, i32 0, i32 0, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786689, metadata !4, metadata !"str", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [str] [line 4]
!15 = metadata !{i32 4, i32 0, metadata !4, null}
!16 = metadata !{i32 786688, metadata !4, metadata !"key", metadata !5, i32 5, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [key] [line 5]
!17 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 80, i64 8, i32 0, i32 0, metadata !9, metadata !18, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 80, align 8, offset 0] [from char]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!20 = metadata !{i32 5, i32 0, metadata !4, null}
!21 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 6, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 6]
!22 = metadata !{i32 6, i32 0, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 6, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 6]
!24 = metadata !{i32 786688, metadata !4, metadata !"e", metadata !5, i32 6, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 6]
!25 = metadata !{i32 786688, metadata !4, metadata !"f", metadata !5, i32 6, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 6]
!26 = metadata !{i32 786688, metadata !4, metadata !"g", metadata !5, i32 6, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [g] [line 6]
!27 = metadata !{i32 786688, metadata !4, metadata !"c", metadata !5, i32 7, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 7]
!28 = metadata !{i32 7, i32 0, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"d", metadata !5, i32 7, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 7]
!30 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !5, i32 8, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 8]
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shakti/SSE proj/testcases/Own_example3/example.c]
!32 = metadata !{i32 8, i32 0, metadata !31, null}
!33 = metadata !{i32 9, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !31, i32 8, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shakti/SSE proj/testcases/Own_example3/example.c]
!35 = metadata !{i32 10, i32 0, metadata !34, null}
!36 = metadata !{i32 11, i32 0, metadata !34, null}
!37 = metadata !{i32 12, i32 0, metadata !34, null}
!38 = metadata !{i32 13, i32 0, metadata !34, null}
!39 = metadata !{i32 14, i32 0, metadata !34, null}
!40 = metadata !{i32 15, i32 0, metadata !4, null}
!41 = metadata !{i32 16, i32 0, metadata !4, null}
!42 = metadata !{i32 786688, metadata !10, metadata !"arr", metadata !5, i32 19, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arr] [line 19]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 88, i64 8, i32 0, i32 0, metadata !9, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 88, align 8, offset 0] [from char]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!46 = metadata !{i32 19, i32 0, metadata !10, null}
!47 = metadata !{i32 20, i32 0, metadata !10, null}
!48 = metadata !{i32 21, i32 0, metadata !10, null}
!49 = metadata !{i32 22, i32 0, metadata !10, null}
