Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZAotOGm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03uTkXRk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=; b=eZAotOGm9w70fu
	vHmUOT1vtnEZSLma7hOz0eJFWJv8AsulWiBdupcVCScwedemtJplQO0pqDsWieY0e/uxLRBoCm93V
	KMgzo1MBmZO7EOf+o06daCu5MUUY79tbbbOmOQWVWTUJUwV6/RFfnt9CB16fhwxZ3bjf19tfl4yeZ
	TjtrssHzyI2StB0z7qe6Dx/Kpb09IMx8zYNhC4Qxkng/ykKVMLK1q+vUF6q3IINjUOBJNV4LPcMOa
	Cw7MWGCAoGW5W5ifMLXU9avyKyaNB57rM2IoMXql4K4NWu/RLiTZIa/VDqT4sW7EB1op1K8opnTld
	7zzGUYcH64G6EkSrd5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfOE-00000000MFP-3h5Q;
	Sun, 15 Nov 2026 18:55:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfOD-00000000MF3-00WX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:55:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso6368005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794768942; x=1795373742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=;
        b=03uTkXRkjRXrN8vZFc9RhMxDNhEFqdI/CdMTx+Fs2b9Z/lc60tigFTmYyFdVVWn9vQ
         CJuzff8j+aTm6X94Itn+CXH7AsfLVyPugPcwCHdKieM9Wo2HRR46vOd+BKFD14tD31oJ
         21YttA7zzJf1djxNSurqRU3Ii1r20tWZj8GE2g8Tc2V4zz+BvWFo/gT1R6aRB8jEC9lc
         ucmESMS8ZU9hS7aWCcb0fImEYcwBz2X+bbNeMo4d8y/osqB0fzsooxMZSPsmwvY6fft0
         W3Lf2Y6qoCj348A2vcHNR3oRAl9/h4+20NAsKWpSisnPTqKBXOxARd67BCCqmlQackv4
         H3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768942; x=1795373742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=;
        b=QovoY1dgVHeYgUiNTWxzvuAKIL8TBjAUaMTfyCx2aO9I95CAFBk7fXK0DdZ/9pmM/l
         KpNSsvwmCsvYVyt+S5RZ/mjPyUv7qdFU9EzqG/gJ2ZZWeu50WdChaJ+XKhj9Q1WqxoOS
         5gX+BgBXCTKKGtBtl/ruvd0+z5VhNh6wHbvIgQJjvi02+zkmfrkl3iZ5C5QsJyO3Oyr/
         oNEqDM4RoYvE88b8aA0LG5edfFq9H5ESfP+rOUzA3SFyMQG9I1QmAOa5YFPqKIKhKdK4
         cIaQCiJCSjD/jMw+y3DzZDUciCSKQ7yz+xYdG/N9L4H9gK8gQjt0y2sxhJMRdijmZdKr
         CWaA==
X-Forwarded-Encrypted: i=1; AL+hErGbAQRSTcnK6YFIDaAnNvVPYFjnNA5r+Np5Sq9CitAQA/vuS4uRH9UdRAt5yWLHyfU02t8Snsd5sCXlT1VN013q@lists.infradead.org
X-Gm-Message-State: APuU4Z87Fvtj6fWXeH80n2dirJAk6TNywE/LS5a5A6Xu8SDnLW1cl2mM
	lRMBWTSfzRwpKLGVuoKqOSq/vBcnlvoIw8AKzd3nEpjg7MSNj+uAPbjv
X-Gm-Gg: AYBFou0ummTwSIalUM5IAcQypowIsihIuqngm0+AVo2j2q6iT1A8y+hBqZfG/uputsY
	WMsRCSxxnJ0ID1S1u0T6guRZ00a+J07jazz0baI0jdWxBlivk+9umjq/ntgC+yRRyGqGLfa1T/A
	jwrnwmhynRFgh+vX/pbo5ukBUsHqDZXb3amTV17gNcexsart7pK8vA2jZrFbSxxnjDYjkuLD5lG
	2X07FBPaVPhgY2u6mN/idzLe6ovr2zV/xJqnQMWQNRxboKTmY6CNhCE1zvdtTeCboQhCnHcAP0T
	vleTcNYNcTFNtREkzAu4Y8YRVSwz8E63pLyflcuEhXp9WUWDsVtcj1pUfqlObsuzc9E7sfzd/fQ
	wb/ZTDYXIewctCJ3Pxox8aR+oMv83Scq6ABwu2j/QMnINyqW0oIWRRBx7/GSwckzA3LQVz/7oVr
	umJqlC6tqoAswXl7JlKbSkD2NQCDUtz57lEw4AhGFQY4n+DDuDASkCjmbu4WQCtN5Vq78EmndU7
	M6ODtQ6GX0Xq+1ODTYd+1wbJafHzOEf/SZuIziPbqubeIkai4BAx316MiigWmVHukruaSyhJbjB
	izlLn7IUTK2M6c53CDHc6nUUQV8AdnUUWD/pgCIccSegXo31h59YYYQ6mgLpo0B/eg==
X-Received: by 2002:a05:600c:b86:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb55a61183mr189212495e9.6.1794768942083;
        Sun, 15 Nov 2026 10:55:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571df488sm125695475e9.4.2026.11.15.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:55:41 -0800 (PST)
Date: Sun, 15 Nov 2026 18:55:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski
 <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Saeed Bishara
 <saeed.bishara.os@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Andrew
 Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, David
 Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet
 checksum
Message-ID: <20261115185539.41402600@pumpkin>
In-Reply-To: <CAOLeWCvsxDZyhYdSOz7hpSbc6x++2UuP4ZzUUagJWq1f+-ro8g@mail.gmail.com>
References: <20261114040943.219870-1-demyansh@gmail.com>
	<20261114040943.219870-2-demyansh@gmail.com>
	<20261114142631.7352b895@pumpkin>
	<CAOLeWCvsxDZyhYdSOz7hpSbc6x++2UuP4ZzUUagJWq1f+-ro8g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_105545_090367_9CB0A277 
X-CRM114-Status: GOOD (  45.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 15 Nov 2026 19:25:24 +0200
Demian Shulhan <demyansh@gmail.com> wrote:

> Hi David,
> 
> > Is that right?
> > I thought ldp/stp required aligned addresses.
> > The code below is using get_unaligned().
> > I think the timings below are for ldp/stp?  
> 
> Unlike 32-bit ARM (ldrd/strd), AArch64 GPR ldp/stp support unaligned
> addresses in hardware on Normal memory. Both GCC 15 and Clang 21 merge
> the adjacent get_unaligned()/put_unaligned() pairs into ldp/stp, and
> the timings are from that code. Unaligned (src+1, dst+3) is only ~5%
> slower due to cache-line splits (~28.8-29.1 GB/s vs ~30.3-31.1 GB/s).

Ok, I knew there was a problem - but it is 32-bit only.

> > That is topping out at 10 bytes/clock.
> > Each loop iteration copies 32 bytes - so must take 3 clocks.
> > Which means it must be doing 16 byte read/write in a single clock.
> > So rather begs the question of why it is limited by the loop control
> > and checksum instructions rather than the memory accesses.
> > The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
> > can execute more than that then there is half a chance of getting the
> > loop down to 2 clocks.  
> 
> For 32 bytes, the loop is 16 instructions (4x ldp/stp, 8x adds/cinc,
> 2x add, cmp, b.ne). On Neoverse-V2 (6 ALU pipes, 8-wide dispatch) 12
> ALU/branch ops plus 4 paired memory ops put the floor right around ~3
> clocks/iteration (~5.2 IPC).

The floor would be nearer 2.
There are 11 ALU and a branch to fit in two clocks.

> > Just moving one (or both) the pointer updates into the middle may help.
> > Otherwise you try using negative offsets from the end of the buffer
> 
> Moving the pointer updates into the middle does help, it shaves up to
> ~5% off across sizes.

Thought it might - you were trying to do to many alu ops at the end.

> > and 'reg + reg' addressing (will need more pointers since I don't think
> > arm has 'reg + reg + offset' addressing. 
> For 'reg + reg', ldp/stp only support immediate offsets, so indexed
> addressing would force single-register ldr/str and double the memory
> instructions.

I didn't think that was possible.
x86 can do 'reg + reg + offset' but I have a feeling it ends up using
an alu u-op for one of the adds (on intel and/or amd). Nothing else
explains why we can't get move that 12 bytes/clock for ip cksum.

> 
> 
> > > + if (unlikely(len <= 0))
> > > + return 0;  
> >
> > Hmmm...
> > Does zero actually happen often enough for that to be a gain?
> > Even with the unlikely() it is likely to slow down the normal path.
> > And that assumes that the branch isn't mispredicted and that gcc
> > doesn't ignore the unlikely().  
> 
> len == 0 would fall through fine, but since len is a signed int in the
> csum_partial_copy_nocheck() prototype, this guards against negative len
> wrapping (unsigned int)len >> 5 (matching do_csum() right above it).
> Both compilers place the return 0 block out-of-line at the end of the
> function.

You've still got a branch that can (plausibly) get predicted taken.
 
> > > + sum2 += v0;
> > > + sum3 += v1;  
> >
> > Is using sum0/1 here actually slower?
> > My 'gut feel' is that it won't be - and saves the adds below.  
> 
> For 64-128B your gut feel is right - 2 accumulators is 2-10% faster from
> saving the post-loop fold, and on GCC 15 it matches 4 accumulators on
> larger buffers too (GCC folds v0 + v2 first, keeping a 1-cycle chain in
> 18 insns). The catch is Clang 21: with 2 accumulators it chains both
> adds/cinc updates onto the same accumulator and drops ~12% for >= 512B
> (27.0 vs 30.5-31.2 GB/s).

I hate that - why can't the compilers do what they are told :-)
gcc always compiles (a + b) + (c + d) as (((a + b) + c) + d) making
the register dependency chain (which matters far more then the number
of instructions) one clock longer.

Sometimes an OPTIMIZER_HIDE_VAR() can help - but it tends to add
a register-register move.

> > It is also worth checking that gcc doesn't zero extend v0 into a
> > register and then do a full 128bit add.
> > I'm sure I looked at the code using only 64bit variables for:
> > sum0 += v0;
> > carry0 += sum0 < v0;
> > both gcc and clang used 'add 0 with carry' for the second line.  
> 
> Checked - neither compiler zero-extends v0, both emit adds + cinc
> directly on the 64-bit registers.

This week :-)
clang tends to get it right, gcc has a habit of allocating a register
for the high part.
For u64 on 32bit (effectively the same) I've seen it spill constant
zeros to stack and do multiplies by registers that are zero. 

> 
> 
> > > + s += 32;
> > > + d += 32;
> > > + } while (--n);  
> >
> > It is a shame to have to update 3 variables here.
> > They may be taking the 3rd clock.  
> 
> Switching --n to an end pointer (s != end) and moving s += 32 / d += 32
> between the loads and stores drops the 3rd update on Clang (80 -> 76
> insns total) and cleans up GCC's loop setup (88 -> 81 insns), gaining
> +0.4% to +4.9% across sizes.
> 
> Here is the resulting 16-instruction loop with an end pointer and 4
> accumulators:
> 
>   GCC 15.2:                        Clang 21.1:
>     ldp  x10, x9, [x0]               ldp  x17, x18, [x0]
>     add  x11, x11, #0x20             ldp  x3, x4, [x0, #0x10]
>     ldp  x8, x7, [x0, #16]           add  x0, x0, #0x20
>     add  x0, x0, #0x20               adds x15, x15, x17
>     stp  x10, x9, [x11, #-32]        stp  x17, x18, [x1]
>     adds x3, x10, x3                 cinc x16, x16, hs
>     stp  x8, x7, [x11, #-16]         adds x13, x13, x18
>     cinc x12, x12, cs                stp  x3, x4, [x1, #0x10]
>     adds x4, x9, x4                  cinc x14, x14, hs
>     cinc x13, x13, cs                adds x8, x8, x3
>     adds x6, x8, x6                  add  x1, x1, #0x20
>     cinc x16, x16, cs                cinc x9, x9, hs
>     adds x5, x7, x5                  adds x10, x10, x4
>     cinc x15, x15, cs                cinc x11, x11, hs
>     cmp  x14, x0                     cmp  x0, x12
>     b.ne .Loop                       b.ne .Loop

Both those manage to get the ldp early (probably good)
but there are a lot of alu instructions at the end.
If moving the 's/d += 32' moved those instructions to before
the stp, then trying to persuade the compiler to move the
sum0/1/2/3 earlier might help as well.
I was thinking on the lines of:
	v0 = get_unaligned((const u64 *)s);
	v1 = get_unaligned((const u64 *)s + 8);
	sum0 += v0;
	sum1 += v1;
	put_unaligned(v0, (u64 *)d);
	put_unaligned(v1, (u64 *)d + 8);
	s += 32;
	d += 32;
	v0 = get_unaligned((const u64 *)s + 16 - 32);
	v1 = get_unaligned((const u64 *)s + 24 - 32);
	sum2 += v0;
	sum3 += v1;
	put_unaligned(v0, (u64 *)d + 16 - 32);
	put_unaligned(v1, (u64 *)d + 24 - 32);

but it might make things worse
(and the compiler might just ignore you).

I always try to do tests in userspace.
Makes it much quicker to see the effect of changes and you can
test just the inner part of the loop separately from the tail code.

As it stands this code it reasonably generic.
Although cpu without ldp/stp probably don't need the extra unroll.

David

> 
> I'll switch to the end-pointer loop with interleaved pointer updates in
> v3.
> 
> Thanks!
> Demian

