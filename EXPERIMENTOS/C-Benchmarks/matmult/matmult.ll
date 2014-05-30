; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ArrayA = common global [40 x [40 x i32]] zeroinitializer, align 16
@ArrayB = common global [40 x [40 x i32]] zeroinitializer, align 16
@ResultArray = common global [40 x [40 x i32]] zeroinitializer, align 16
@Seed = common global i32 0, align 4

define void @main() nounwind uwtable {
entry:
  call void @InitSeed()
  call void @Test([40 x i32]* getelementptr inbounds ([40 x [40 x i32]]* @ArrayA, i64 0, i64 0), [40 x i32]* getelementptr inbounds ([40 x [40 x i32]]* @ArrayB, i64 0, i64 0), [40 x i32]* getelementptr inbounds ([40 x [40 x i32]]* @ResultArray, i64 0, i64 0))
  ret void
}

define void @InitSeed() nounwind uwtable {
entry:
  store i32 0, i32* @Seed, align 4
  ret void
}

define void @Test([40 x i32]* %A, [40 x i32]* %B, [40 x i32]* %Res) nounwind uwtable {
entry:
  call void @Initialize([40 x i32]* %A)
  call void @Initialize([40 x i32]* %B)
  call void @Multiply([40 x i32]* %A, [40 x i32]* %B, [40 x i32]* %Res)
  ret void
}

define void @Initialize([40 x i32]* %Array) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %OuterIndex.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc6 ]
  %cmp = icmp slt i32 %OuterIndex.0, 40
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %InnerIndex.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %InnerIndex.0, 40
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @RandomInteger()
  %idxprom = sext i32 %InnerIndex.0 to i64
  %idxprom4 = sext i32 %OuterIndex.0 to i64
  %arrayidx5 = getelementptr inbounds [40 x i32]* %Array, i64 %idxprom4, i64 %idxprom
  store i32 %call, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %InnerIndex.0, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nsw i32 %OuterIndex.0, 1
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  ret void
}

define void @Multiply([40 x i32]* %A, [40 x i32]* %B, [40 x i32]* %Res) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %Outer.0 = phi i32 [ 0, %entry ], [ %inc25, %for.inc24 ]
  %cmp = icmp slt i32 %Outer.0, 40
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc21, %for.body
  %Inner.0 = phi i32 [ 0, %for.body ], [ %inc22, %for.inc21 ]
  %cmp2 = icmp slt i32 %Inner.0, 40
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  %idxprom = sext i32 %Inner.0 to i64
  %idxprom4 = sext i32 %Outer.0 to i64
  %arrayidx5 = getelementptr inbounds [40 x i32]* %Res, i64 %idxprom4, i64 %idxprom
  store i32 0, i32* %arrayidx5, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %Index.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ]
  %cmp7 = icmp slt i32 %Index.0, 40
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %idxprom9 = sext i32 %Index.0 to i64
  %idxprom10 = sext i32 %Outer.0 to i64
  %arrayidx12 = getelementptr inbounds [40 x i32]* %A, i64 %idxprom10, i64 %idxprom9
  %tmp = load i32* %arrayidx12, align 4
  %idxprom13 = sext i32 %Inner.0 to i64
  %idxprom14 = sext i32 %Index.0 to i64
  %arrayidx16 = getelementptr inbounds [40 x i32]* %B, i64 %idxprom14, i64 %idxprom13
  %tmp1 = load i32* %arrayidx16, align 4
  %mul = mul nsw i32 %tmp, %tmp1
  %idxprom17 = sext i32 %Inner.0 to i64
  %idxprom18 = sext i32 %Outer.0 to i64
  %arrayidx20 = getelementptr inbounds [40 x i32]* %Res, i64 %idxprom18, i64 %idxprom17
  %tmp2 = load i32* %arrayidx20, align 4
  %add = add nsw i32 %tmp2, %mul
  store i32 %add, i32* %arrayidx20, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %inc = add nsw i32 %Index.0, 1
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %Inner.0, 1
  br label %for.cond1

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %inc25 = add nsw i32 %Outer.0, 1
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  ret void
}

define i32 @RandomInteger() nounwind uwtable {
entry:
  %tmp = load i32* @Seed, align 4
  %mul = mul nsw i32 %tmp, 133
  %add = add nsw i32 %mul, 81
  %rem = srem i32 %add, 8095
  store i32 %rem, i32* @Seed, align 4
  ret i32 %rem
}
