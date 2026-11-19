Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDc6zE7w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd8YeS1p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EWi8bkR9h3tHXm8j7DxgMM6UdzZIdJvfItB6nSFm4tY=; b=ZDc6zE7wbyQW5O
	Oj8CQOmZi3TgVQjwedNhPnfYxaMzdfaAW5MbIVYOkZzUGVzji4noPtC+NhS2NL6e7ImpFroHmJUhF
	vP3TLpU4V/Or7fTxftmMSdMMxab7f+ApSAA0ob0E0zkKtKM8Mp9JHSVYWFQnS7HOegYYVx15PBOWQ
	1Px6m3LUStMmpXa5Bx10Sci/sMAXnNhdXufH/iCRyOQjpqoiypgiaMjid++zW/qBCq79LNtSpxMZQ
	P71C932GOgfI6D4pFIDz4OWdWtlAWSj8cfaMUWFE/IWsI5nTRWnrMEYy8CIIJVQr4i2/W9DvXzDeK
	IuswRtu8aGHQz2EPkA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpgF-0000000AYLn-0e6j;
	Thu, 19 Nov 2026 00:07:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpgC-0000000AYL6-2La5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:07:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491846221ffso1329586f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795046826; cv=none;
        d=google.com; s=arc-20260327;
        b=gdO0enk8ii0nNc55xURR07Cf44WzcLbeZvqdZrYBL4nkxLhno0SCzW/5/u/J1qBcfQ
         FF0h43kbyXfV+9jamjZSJ1O3B0kaT4xsT9SjUvffNy6tk4h9Q35WY5C0piNUDF01c19F
         ZcFt+azScPKDy73nOF8NRaMLz/Keadw7XSKEn0qMAEXV5/gfeEzePXp8b7r3y91JD6Tf
         87ux/prRlPC12Ey9ZNDjH5fctQKpRfyshPYNr1nvLR+LVqnnTypPgHo1Sz8CNmzr9SSM
         tbETYf8onQt1MJpq/U0DCh6ehS0X5WXryZu2OAVcy9edSL69VhW5EYUfLHNRlfuZpuz0
         KVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWi8bkR9h3tHXm8j7DxgMM6UdzZIdJvfItB6nSFm4tY=;
        fh=HWiHgd5f5+h7xOlK/WqjTzmBP2zC5vArGSr4YEythXA=;
        b=KUKanyZBROwX+Zwysgj+70+0ELUTUGcqfbiDIKr37UKp8X6zzpBIa27SNkdkdl7i4x
         rIMehfaJW21NWXZL+OKaYjwoiJU+lmF12RW7Xfi/Xyl8zS9a3kwlfAa4Ett1YCLPfdLW
         R8r6BolhNsbLkyA3pNOafPx7PjKrHGTXBE3zDkEe+Sn48vFNuuqMVpW/BHv/ggiyC46E
         4vx464fEm143EKkBPFlPpTVd4UTJNyDNcHtsH/IuSThsMK0nliW0Ebv2jMkvLhO2g4by
         NT483voFpKAtdjUjR1AH6jTOusjMcu6371AL09+oJ9a2k+LgGymjhAQdBmZaD+NjZeFy
         7hsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046826; x=1795651626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWi8bkR9h3tHXm8j7DxgMM6UdzZIdJvfItB6nSFm4tY=;
        b=gd8YeS1pEc7KmUXcXAoyzbwtBGWHXiADk+CPDpB9CDyJQF6MrYEl+3l81phhNUAlML
         vH6/5QzMMJPkZBnT7a4fSwgX3zZP6m+vx+AB7+NMolZliZTWg8q9DcAaiSaXxdwnIPIY
         8rzJ8xUngFk0eGeRDMCp3eUkV0QvP6LHXNuGYJm7zZybhqxr1SwhApz16CEQV2NBazYX
         1t1cyZC87P5Bo4bKDNgTJLmw7QkAnwxk5iEAi1+rQ095YOuvY66KOy4HVONXrF0iy9X2
         Kcqlg3DrzncyDsJCyRXEtWzvXyXOrQd+yGm/JS5Db8eF1UEKO+JVM0q68JUbI0ZgAAyc
         SU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046826; x=1795651626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWi8bkR9h3tHXm8j7DxgMM6UdzZIdJvfItB6nSFm4tY=;
        b=fC48KfJTGACVFfrmnNyljQJP/dX9L0G9Ca3ED/NDeGmIPro/+vSxurY3kwQA8jO5e+
         0p5vKSgQjpRu9w//QnxUhyIVRX7ypzwnb/qi4OaoqhtlRTuMoqkoCYRHQItVoi24xzmC
         uw01+sK1B8d8y/dkkeYrRu/Sk7A6VpYrZ8+HiAZzRumD8FzuHdt6nVfZhb4O2MTPIIwF
         F/gyRBFv5gy0Ng947eNPUDcjG+p6ZVCw1/BDvAncpdVk9/wJHPbd0PQGurUzd0vxtC0o
         cj2GhXRQ4n3JhW808J4siD+5FYMmp0W2pXOiZ6o1nK4rwkBTL9JqSifesaKpqRvK1vhb
         TbBA==
X-Forwarded-Encrypted: i=1; AL+hErFF9x4fa5GNnkiFZgYAsKLW8kIH7HXzfCOs50wlbmZyMgzGQvnSIAvip2/2cOEoii8h+ibJF+1PzPVIthKk3Dfi@lists.infradead.org
X-Gm-Message-State: APuU4Z+AGolIXNAoVyo7xBa3aUdzCh4nGt8Ck6V0oQo2cUeQU47XDajb
	jURsYDawCC/zR/MYnDvPhGHNPsz6exWIracuxybIFJLz9yyp+CCTlBhNz2TaquByUEk8ZeMlNyP
	ZBojmeXFTrLCq7yfRFeeUU67Annx6W40=
X-Gm-Gg: AZFdTZc7GXQBhZxpsN0nDrWL8Y9bjkjzQwa75TFsKefOSgaxPKXHvd9AeXXeGoYVB+W
	aqpL8vlLB14cl19pxJcwjzQoiApw85EUcxjzxo61eqiulC9dDSwg1YwYH5/BzL+9sPJQbyPlT2z
	HhAv6QmbQSwbaVeZwknMZ07z/l2DE197Fo7P2xbPLeP2Op67ay08melPJWPCPaMf6Va1knAaw/B
	nb7yKE5PWWTt64rgtgeucnd2PxnSatSGecWB6ShWQegGP24VIvCj6kJM3JIfajcVYpb17BdhhAp
	QzAooOxVWVSwhygkduJedVEi10jb88DoNz5iAImMxOAljiuTLvAGzXEeaHrec8VhTR5Dly9uDY7
	ANQbat2A0NsqoA4QnsmuLqzHoRXwseoNOOUIChMBAf0jTwX4RyeghF6rsk7od/jNyj/REgczu3n
	kYV8zyMgp0MADEwN8T5S4=
X-Received: by 2002:a05:6000:26c4:b0:4a4:1267:350a with SMTP id
 ffacd0b85a97d-4a6331c6d5fmr10036299f8f.5.1795046826107; Wed, 18 Nov 2026
 16:07:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114001846.873499-1-andrii@kernel.org> <20261114001846.873499-2-andrii@kernel.org>
 <avxJjTWOp250aDYC@willie-the-truck>
In-Reply-To: <avxJjTWOp250aDYC@willie-the-truck>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 18 Nov 2026 16:06:55 -0800
X-Gm-Features: Aa3M54ohy-eIhH22eDuxovMjFXOGOFVwvlzmEgw11hhd4u67Vz7wgMvDgsfWW0g
Message-ID: <CAEf4BzY7bs2y70tb7cSFrWiTZuhNkfqqVOiTL2WnawMxCFnn3A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] arm64: perf: Don't report the caller twice
 in caller-regs callchains
To: Will Deacon <will@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, linux-perf-users@vger.kernel.org, peterz@infradead.org, 
	jolsa@kernel.org, rostedt@goodmis.org, ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_160708_623601_2DA2FC85 
X-CRM114-Status: GOOD (  30.20  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 4:33=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Nov 13, 2026 at 04:18:44PM -0800, Andrii Nakryiko wrote:
> > perf_arch_fetch_caller_regs() sets regs->pc to the return address of
> > the function it is used in (CALLER_ADDR0), but points regs->regs[29]
> > at that function's own frame record, whose saved LR is that same
> > return address. perf_callchain_kernel() reports regs->pc and then
> > unwinds from the frame record at x29, so the caller shows up twice at
> > the top of every kernel callchain built from perf_fetch_caller_regs():
> > tracepoint events, software events emitted by __perf_sw_event_sched()
> > (context-switches, cgroup-switches, cpu-migrations), and
> > bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
> > tp_btf and fentry/fexit programs. E.g., for a tracepoint program
> > attached to sched_process_fork:
> >
> >   __traceiter_sched_process_fork+0x44
> >   __traceiter_sched_process_fork+0x44
> >   kernel_clone+0x250
> >   ...
> >
> > Use __builtin_frame_address(1), the caller's frame record, the same
> > way kunwind_init_from_caller() does, so that pc and x29 describe the
> > same frame.
> >
> > x86 had the same duplicate entry, fixed by commit 6d08340d1e35
> > ("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"")=
.
> >
> > Fixes: 5b09a094f2fb ("arm64: perf: Fix callchain parse error with kerne=
l tracepoint events")
> > Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
> > ---
> >  arch/arm64/include/asm/perf_event.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/a=
sm/perf_event.h
> > index ee45b4e77347..13efb46f0fe8 100644
> > --- a/arch/arm64/include/asm/perf_event.h
> > +++ b/arch/arm64/include/asm/perf_event.h
> > @@ -15,7 +15,7 @@
> >
> >  #define perf_arch_fetch_caller_regs(regs, __ip) { \
> >       (regs)->pc =3D (__ip);    \
> > -     (regs)->regs[29] =3D (unsigned long) __builtin_frame_address(0); =
\
> > +     (regs)->regs[29] =3D (unsigned long) __builtin_frame_address(1); =
\
> >       (regs)->sp =3D current_stack_pointer; \
> >       (regs)->pstate =3D PSR_MODE_EL1h; \
>
> This doesn't look right to me. Presumably, the compiler is now going to
> emit the first step of the unwind, but it has no idea about the different
> stacks that we have, the meta frames or the invariants that the walker
> in arch/arm64/kernel/stacktrace.c takes care of.
>
> So we should continue to unwind from the current frame, but then perf
> can discard the duplicate leaf entry if we don't want it. After all,
> it's perf that's passing in CALLER_ADDR0 for __ip.

Thanks for feedback! I just sent v2 which follows (conceptually) what
x86-64 does, please take a look when you get a chance. I'm not sure
about PSR_MODE_EL1h vs PSR_MODE_EL1t hackery, but that's what my AI
suggested and it promised it's fine :)

>
> Will

