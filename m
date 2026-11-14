Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62E606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9ZWsBYW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc1/SSPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WDQ393osPw2BrYahUhOGo4g2UUQtrhZG2XU5v+nepPg=; b=t9ZWsBYWmuyaKYE1/wLjKftasR
	z1PpxwmnqqR1Gp8IX0RXl15HxLEjCzGQuNiPXPnozN/ROxQ3cczDXmIS0wY26y4OAsyQbe0Xq9VAl
	0ydZexC6P94dXOuAIfMnz2BGEypm7aW87ZP8lQNhfZq7B3QVL3DLTSp+A8JZHm1noS/egl8hGU7xY
	CuD/xrvrgdjFNXvDSthciQWMvck4id8R3Si/VkvoBfEWTZFgOjIhsxbcZjbUbNBHmSCYPD5obcJ8g
	GWKUnFC7Dik+SqTicCMlRqilMQoBgcwR2j/0aHrapl1MoMi72RsVTVYXBL2yiu5Kr7UOLGAr/yyqa
	iV03waZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2Y4-0000000F0y8-41hR;
	Sat, 14 Nov 2026 01:27:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2Y2-0000000F0xY-2aY1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 01:27:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ede7cb02daso19148205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794619637; x=1795224437; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDQ393osPw2BrYahUhOGo4g2UUQtrhZG2XU5v+nepPg=;
        b=vc1/SSPhimjUS1Ql9itUK474kVBveJSBcLDBHp+wGCyTYH83WityZqf6nb664JxfMi
         cuic97wDeEIXYS550hXBHw9TmbKxOqsd5/EwpHRxKKjIn9F1cZZTdmWbNPDe2HdXXSfI
         gUrMqOuwNC+LnNqnlVBOShSiWEp4yGfCoLHJ0fmAHw0aTcLuhMxZSxyc8x9xZq7WezlS
         IwOlZ10peeESNB9/r80hnlv54KETyVVGAqoN06g0OXVI/sQeYQW0whCmd6e6HR8SMMaf
         e/hmgA9v5BUbUZuufzdnJY5KyzK+U+5bR7XfZglkyHgcB1/HQhAxclMqBS824gXuFmm9
         fneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794619637; x=1795224437;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDQ393osPw2BrYahUhOGo4g2UUQtrhZG2XU5v+nepPg=;
        b=MbOKHxC5rlcEFmJ0hRb0PpucZT8bKFVUBuqy/6UYB/Gr8J4fuJwqjJ6TbmzEpvKQ/z
         otr8xWIYIFlKdK4HOtlM7M29mF5jGKg87DkpJ92ttfTB3ip+53WLI+zXh+a284HzYl5Q
         AFblph8PyYQpQ4rhwig7xbB3kf8xeSe5zofe/WJ4ZbgrljQE22bg23oOPDOD5i5hlAr6
         /UlJgUoCxRbFN1R2+EYxAgPYu4TctRMXc0Fco2WZxMlOeHtws7mqvcHKQclWPOGvqo7T
         MEfe+aetNaKLgF7z8bxtDam+uZuQ6J/DIxhfdqHVR4bJDRbwVGoRl76gyKX9VwwvnPMq
         veJg==
X-Forwarded-Encrypted: i=1; AL+hErEjHJPjefliM1jkmLjAH2tsy8z4/OkH6OrpMKYHPjJPZ3pkVWKVTzSdoujuxuXMnShweHad97WtFdvKoo1DY1Q/@lists.infradead.org
X-Gm-Message-State: APuU4Z8PK8h04453ipoIS3rq1s77iALwjssp0Y7TKEeB00nEDs63mRNc
	q3HtS2wRkhW52MuvidLGl5lB+GL3eKQ/VfIy94TorIkTFglUtt02Jkbp
X-Gm-Gg: AYBFou0iezhJ2Qye6SOSfpD3shqjOC1jtRYKy9FCCeYTeEwNXSzPNLKagI9ZHyUQDy6
	RKrfkGm/3/G1eyX5kKaNZcQbaSl/ga7xObFg0e1iUtDHjrZPBOvmCmSzCksYdRt5b87c111vyFq
	Wcaa/nxvp/+q4+2P6BWMQRn2MpZxmRCZ/to3cftz+aZL/h5dz8MWCyyP6HGjdIoTgBQwAx4QR2a
	2kqBI/a0sjrd8P4p33NtIl0Dq2byFTJD9Xj5uEdwE/W62TpMUBvrOrtDm3ngQKO8v6mcAzTcVpp
	eB92dveuiy4VOuk/68rgDfo+P/riYVAFfaFKYDp9yhkSlpkj/on7DUj1UZX2mHJdEoo/uKTdy2W
	wbb1qwNbFXRhCHBtny1PKYohb0vSzdInAbDz0rhXhctcCWacZ1S6RlEMs2oTFUN1sk+iWfCEXPZ
	g8LlVUjFmHPVbUIW2UGgqjyYKYTZZ2naFaN8i8/6k+a6RSWQe9PWRQo9dGJS+ybPlIcUntco9Cw
	GLp5xMYECthmVxs907q+S745JE3GgUq5fsW0zMpcIRKhgfInls36pB2gbN/dKG69nfQE5nTtcfM
	JsUK/WhJFoBm4wFw/zUTxU4S9SkiqfEghq4vtYgElczuECkEoPyXvG7jywR6TFJL/YPUTluxSv2
	IRXgWPl3CXMdKp7rtXz07gzyueePL43Ql0A==
X-Received: by 2002:a17:90b:5107:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b1b0cdafd9mr2717852a91.32.1794619637389;
        Fri, 13 Nov 2026 17:27:17 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm6809102a91.14.2026.11.13.17.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:27:16 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 01:27:16 +0000
Message-Id: <DMUJKFF59EU0.3D4OXJLXB2N6B@gmail.com>
To: "Andrii Nakryiko" <andrii@kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
 <linux-perf-users@vger.kernel.org>, <peterz@infradead.org>,
 <jolsa@kernel.org>, <rostedt@goodmis.org>
Subject: Re: [PATCH bpf-next 1/3] arm64: perf: Don't report the caller twice
 in caller-regs callchains
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261114001846.873499-2-andrii@kernel.org>
References: <20261114001846.873499-1-andrii@kernel.org> <20261114001846.873499-2-andrii@kernel.org>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_172718_662414_47500974 
X-CRM114-Status: GOOD (  14.24  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 04:18 PM Andrii Nakryiko <andrii@kernel.org> wrote:
> perf_arch_fetch_caller_regs() sets regs->pc to the return address of
> the function it is used in (CALLER_ADDR0), but points regs->regs[29]
> at that function's own frame record, whose saved LR is that same
> return address. perf_callchain_kernel() reports regs->pc and then
> unwinds from the frame record at x29, so the caller shows up twice at
> the top of every kernel callchain built from perf_fetch_caller_regs():
> tracepoint events, software events emitted by __perf_sw_event_sched()
> (context-switches, cgroup-switches, cpu-migrations), and
> bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
> tp_btf and fentry/fexit programs. E.g., for a tracepoint program
> attached to sched_process_fork:
>
>   __traceiter_sched_process_fork+0x44
>   __traceiter_sched_process_fork+0x44
>   kernel_clone+0x250
>   ...
>
> Use __builtin_frame_address(1), the caller's frame record, the same
> way kunwind_init_from_caller() does, so that pc and x29 describe the
> same frame.
>
> x86 had the same duplicate entry, fixed by commit 6d08340d1e35
> ("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"").

riscv has the same duplicate it seems.
Its perf_arch_fetch_caller_regs() stores __builtin_frame_address(0)
in s0. walk_stackframe() reports epc, then frame->ra of that frame.
Can be a follow up by riscv folks.

> @@ -15,7 +15,7 @@
>
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
>  	(regs)->pc = (__ip);    \
> -	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
> +	(regs)->regs[29] = (unsigned long) __builtin_frame_address(1); \
>  	(regs)->sp = current_stack_pointer; \
>  	(regs)->pstate = PSR_MODE_EL1h;	\
>  }

Will, Mark,
this looks correct to me.
Mind if I take it via bpf-next together with the selftests?


