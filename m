Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE988606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=woPM+IcL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pwgX+gmz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=; b=woPM+IcLykbKgNmH13qp2NKQJe
	D0nJTwsMAPc5fztrrNMgIa+raYUc0O6ZJxV7yEqXaerrqTDu9ioNnZ3wJZeXBUIK/q0DfMmKnig+W
	SruOavT4Ujmz9YDkJ3mkdSl9yhtxBiSOvRBRpQqHj0zPsB9nmIdi3MO0ls8O0u1qmOLvQfGhLBecQ
	d16JfTX9mTjyYSCbG3Evaqx+5gg7mcpECfwnAgzr5i+gwUsAJTJLByU+yxPTFHjIIt3OMiJRCT48n
	hkaIl9BGiqhJPbEnjx/OIASiE+u2+NBimRswjBBUyshD9Eom0pacSZh86vvRMGlUQzHquF3m5rLdp
	U+G94QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIbR-0000000B7o0-2PIb;
	Wed, 25 Nov 2026 19:24:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIbF-0000000B7iG-2USg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:24:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so38996045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795634643; x=1796239443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=;
        b=pwgX+gmzS6MBfUYw24+54P3fIk/8nbok6pjWOYBUBR4s1bRCy3dtYcyrmSUMgI2THg
         ShGDktWDUqIyMo1FCE3md9b4qYMuMo+gwft/nIbF4mY0JBflQDhoyxKcKNSnIcQjGqL2
         pZvpZ6xl7BKX5jdrB72c77fg+hX5sDDlJx3XYww7oVMJlA3pWlpSnwgkZ5s2au6JB53E
         iKpTt+aOfNN5w/XPhq+G2dirut3f/CDNuaAc+dtK1ZcOGadLZSopmBkaLS54rN/O2DfM
         b2gdpRdL2BuO2W0qsNYIvxux5XJ6Bolpo3Fs4Ls5UKa9+R5xSy51kx6luJeafnBas20k
         Oq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634643; x=1796239443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=;
        b=gp+k9mAnGNZqTJDinEldO2JOlYPolESd+Cl3D9u2xBh0PTjZuCj6lslAkwMlAmSrTd
         EReveNGnF2Zc064vUTUKb2GRdWOmHWxDHfE7Keut/E4TjpltpFyp4Qga5cxufCo133j3
         E4TchJ4xK1x78Zy8aNwA5gKQ5tdDwBzFV10WPrvTJgh4LzfIu+ezi1Hl3XrPbvzBTWny
         moIQE4q7YXxUtGujqiskKJmU2kOyjskud/GQWPcW9NzmCrKUUyot/prBE7pfwRT1B8Yv
         enKTWD0Y1vlZcV+odJeP3nGBSJnfU6723k7eOeGbBtSTZkOUQqgL7xFfkexs+S1/oeoS
         pGjA==
X-Forwarded-Encrypted: i=1; AL+hErGcHrh1GC+HmzTLJKUY8G8a+HDB2c7Xln399IRf3OjFrLOsCCupkzCbxGzyl8ZYzJvpmQD+pYaBqBB09UkTDQMp@lists.infradead.org
X-Gm-Message-State: APuU4Z9So57lkFDrOPwz5bcefTqGi/ghhv/GpwZI+wnj7QrIaY/oMdRG
	bkCscjEo76asm/c4xS2XfWOr9Wz50fyjGoNG6PGMKDOmuGIYTOCPRlAu
X-Gm-Gg: AZFdTZfjwCzVZxYuTqxMoNTGxPTevMY0E4AgGoH4VBwOmI/5jZOv0MMFbgVOiOQFc+g
	1EZ+wWsHOs34X+5t0oS/S/hPl/8rJ3rsmoYT32JnTxCECMCwqgLaday52z9gyoh7yja2Iy9ccXm
	7raR+TyA+3iG7j5pbhoMstV6ENPoLCunCsxDQuFgFn4Z7S+SFiA52sbPw8z29W4ufOz+sXOgPIJ
	wGgNfaima0IBDNd0xxP6v/T3NAwHf7i+CocQ5WopaLCH36E796Hc1SOqHNl2GcchM3dPKE3bzF4
	hMVvdLHX8nSWV6zCOkp1poJvOefyP/Umr3WdVle5EZqDvPjT3OJKyfdmVId8Odj9snAFN6WNThb
	aUm9coI8K289VwZG9kw+nvgMBvCgbKXJyHQc1osdZ+0YPaRGwNKpu3MEkCwllhFy7b4apBnpp2f
	N+NH2IDi4b3xDYJNyfB6p/wl47iip/jaP2UkffAHFP09tKcS5xHmwD4a2Y8WPThpiU8gtX7wQ3t
	vG0X0yGj9PT4sMa94kf8cLzrHGaW7CB1JkjS+pfNo/4/p46/oOgYAUBTAmqirJ9IAc5M5H3KfYB
	4sbYqCBgLNiGEb3v5vR5z3ij6e0apUemGsAxNqZMUo5LEMeiRcbJUmr3Xh/S9lF4osuz3RuXJJW
	EB3ZeTqUP88gzKcBSaPWeK/jZQKmor4iXFHtnx/btwL0v7e2ZO5a0HlLBlf5PlC7LPg4yaf3YG7
	dtji4l7Q==
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr329102905e9.7.1795634643163;
        Wed, 25 Nov 2026 11:24:03 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-079-170.95.114.pool.telefonica.de. [95.114.79.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm34180072f8f.18.2026.11.25.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:24:02 -0800 (PST)
Date: Wed, 25 Nov 2026 20:23:30 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] sched/preempt: Check preempt counts in notrace
 helpers
Message-ID: <awcwI1imHpWk8QFE@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
 <446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
 <c9b1e3a8-bb25-4808-bcf0-f2d5ba72a58f@transsion.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9b1e3a8-bb25-4808-bcf0-f2d5ba72a58f@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_112413_653433_BFF5AF3C 
X-CRM114-Status: GOOD (  17.68  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 01:26:28PM +0100, Hongyan Xia wrote:
> > CONFIG_DEBUG_PREEMPT enabled. They therefore skip the bounds checks
> > which ordinary preemption operations provide.
> 
> Nit: Somehow my brain cannot parse 'bounds checks' before reading the 
> whole patch. Hopefully it's just me.

I'll reword that to 'underflow and near-overflow checks'.

> >   #define preempt_check_resched() do { } while (0)
> 
> No need for this hunk as you are in !CONFIG_PREEMPTION without any 
> checks anyway, but for symmetry I guess it doesn't hurt.
> 
> But if you decide to keep this change, then we can always use your new 
> macros and remove __preempt_count_{inc/dec}(). They no longer have any 
> users anyway?

Agreed, I'll remove those two macros.

> > +CFLAGS_core.o += -DDISABLE_BRANCH_PROFILING
> > +endif
> >   CFLAGS_build_policy.o += -DDISABLE_BRANCH_PROFILING
> >   CFLAGS_build_utility.o += -DDISABLE_BRANCH_PROFILING
> >   endif
> 
> This exclusion looks massive for a whole core.c file. When someone 
> profiles branches, does he or she really care about branch statistics in 
> DEBUG_LOCKS_WARN_ON()? Can we just switch to unlikely_notrace() in that 
> macro globally?

unlikely_notrace() does not solve the PROFILE_ALL_BRANCHES case, which
instruments if statements directly, including those in the notrace
helpers.

I will follow Steven's suggestion and make the Branch Profiling choice
depend on !DEBUG_PREEMPT instead.

Thanks,
Karl

