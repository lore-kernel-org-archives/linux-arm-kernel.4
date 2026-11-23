Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDB0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0g50ej+V;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OO5oWUNp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=; b=0g50ej+VBqPEM9gsarpqy8xWVa
	EWdfX1dBqHf685V13dIAJGP88bNBuruwIj7Yd1tH1jrjnwTQHJRxCb+G8lXbWrw5OPUKsH2TDhgre
	fUv4WwCGURXPoFovtUcl6y1sEZ4JYg9yKodIfhr5Khpi28i6ECk/CCOg4VkyN5X+E8kA48JkL6cft
	YuOramRuYCc6YK3+YU5qzLsItYPTsK7Qxjjomo/ljDvtZ4Ca5sSlUfFBObuwBC83DJMmLtWfnl+0n
	36JODven4TYwZyf26XbMOe0/SHbub/+NVIC2L4IEMVm5NM6Oqkd/Fc2/jk0TYH0Df49pvRcnK4ONH
	GGQPyu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLKd-00000002Es7-3s8y;
	Mon, 23 Nov 2026 04:07:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLKb-00000002Erm-2eEt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 04:07:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f020d0169eso12656035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 20:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406824; x=1796011624; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=;
        b=OO5oWUNpZjrbZ42H4Oyh+ljoqTeynJI1KfeOyY9KzpS8cTfhTM5g3ah785oHXa0gXk
         84nprW+XuVdTEMf6wNDkZKtz6/DP5TplF7juXHZ+jBYW0HggBtT7EFBN2SywviDT8g2j
         3uCR7dCMgYb7jmCsm+cxi6ejLYzPIZwVWgIlciPeJCP7ks6oLf3hQHaSgHM21mQ+cqTJ
         D+R2IeFuO9xrlaeQMWiWLOfCv6iazgX+u4/RHH+nal7wxylCNqvOVmSgMU1RfCF6lyM3
         JZZ5RhZpdHxpGYs1QnNwoF1+mN7RAQ0Qbx5AlNizeXm2RFbUQKaL3Hehkgs8OG12vLOj
         Ftjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406824; x=1796011624;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=;
        b=IyJvcplcQOwXQ29AibUfhpxmqiCeToYfWSk2BMGc9D+nYwBDuYV2+rQk6uYiNGkFat
         j11SW1GUc/UUmEgkchfBHZnoG+aIUKQDdO4Xvl709G5n3MNpIYn6UPFNe+QoQK4vsKX8
         6/Sbau7z0y53Y52eElGd4YFNWmM6j1fllGv7+sYON1os3zwtjEcBUepvknq+hKjb2BAy
         X86/yaWh7T392rTO4cEFK6gwc5piPr42WVU39MnANcOTaizdxHl0rwsqde83V5q7J1tU
         RwjoecFVr1w+fUxF8bOCdmXdE8CYkxHlTE9MyK79KrcXwNVzrguMHXDxxm1+8MFauF/4
         WKgQ==
X-Forwarded-Encrypted: i=1; AL+hErH0eYdZxzaVsDRy+lE9OdYJD2LKp3oYRC+VLTO3/IHTOfU/SeyzvdZ0E0H7xdQwxJSQDT4erar9itQ3ci84z5Km@lists.infradead.org
X-Gm-Message-State: APuU4Z/Jlpv6WBQUdwzOw/PMBCOnvXtUmnOUySJgd3NuZs+NpwUTYESL
	e0SMcOibZjZxpkYAsArsu8PNdG0yi0ZZDCpPYcw89bvLksgHVb1MerB7
X-Gm-Gg: AZFdTZeXS5jFkAsi7xLXTbThbY8kOpASwyfcTPmwz3fJ2CHFO4jpIFSzsrUTpg1XWVS
	0gn7z+1LQ7vLOMNj1It5/ifr+c5/+/bMISx+Utvlx4vxXBHIXBBn3Xq6MvhfruI1tSjfz8tXx0u
	4Jdgd9u8U2gqYV2Z2jdhL1orRk2vSqbwhcqt7y2/0wwI1r7+k4i9rD0co4JNCu+YMJDmfjTsuwC
	vUg6W6AkrYZAWyBnn2yKnsiECFERmWihv7jOoS+XAp3evJzrPNJhObCRU2iTI9YaHEJmrpvREeO
	ShNpsBE42aRTDejIxtoKuMzOc9MTdwGEsn+TDpA5rmIBOqkZESTiGEVuk3iNjXakZrvX58EGe9P
	fTvoIROrxPO7FSXpsOBnQ4VE7ha7C/0fT+LcDStmpsAgOKsRzn5ddF+asqlFfY/GyDPsl0IWl/y
	OzM7LPlf87jG5yIXupb0B+bYgCURSUs6jmY0jd54o2EzmDOi8hC8LNoPpNR2kTNyI4VjPu53jvd
	pjqadCYpEhwMK16EN+T/vmG5nU2i99snTVWqGzkjEcpRzWI840l2TBsi1sTBENqWa/DgizRj4Sa
	izxn+p+S4R0kCyASpbcU3VDBJnj7Ms34mlnZD6ypGVRZB70D2bvJP+9gqdtIlkAqRza+R+g7SG1
	65yH7kOMEJf1UzN8EnNIKUB0XNFErmwWbIw==
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr9277361a91.51.1795406823840;
        Sun, 22 Nov 2026 20:07:03 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm15511490a91.4.2026.11.22.20.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 20:07:03 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 04:07:03 +0000
Message-Id: <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com> <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com> <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com> <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_200705_678324_27DAFC8A 
X-CRM114-Status: GOOD (  18.57  )
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

On Sun, Nov 22, 2026 at 12:58 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
> BPF code - I've only removed an out of date comment in BPF code, which assumed
> the code path was for Spectre v4 only. But that's not true since Commit
> dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").

Fair enough, but the arm64 part of that comment is stale.
The verifier relies on nospec for v1 since
commit d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1").

> arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
> the same situation as x86. I think this is orthogonal to whether or not the BPF
> interpreter permits speculation attacks in other places?

Not quite. In the interpreter the barrier sits behind an indirect branch:

  goto *jumptable[insn->code];

arm64 has no retpoline, and the prog can train this branch.
With a wrong target the CPU skips ST_NOSPEC and runs the next insn.
So the interpreter is still not safe.
Yet you're arguing that you're making bpf interpreter a viable option
on arm64. That's just not fair to users.
Say it in the commit log that you're fixing one tiny issue and leaving
giant security hole in place.
With that I'm no longer nacking it.

> Looking at bpf-next, it is still possible to deselect BPF_JIT when building. If
> this is such a security issue, shouldn't we disallow that on arm64, or at the
> every least make it an EXPERT option?

Yeah. Good point. Let's disallow it on arm64 and x86-64.

I'm thinking to push something like this

diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
index d705d7b..8b8688d 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -26,8 +26,8 @@ config HAVE_EBPF_JIT_KASAN
 config ARCH_WANT_DEFAULT_BPF_JIT
 	bool
 
-# Used by archs to tell that kernels that were compiled with BPF JIT support
-# have no BPF interpreter.
+# Used by archs to tell that kernels with the bpf() system call have the
+# BPF JIT compiler and no BPF interpreter.
 config ARCH_WANT_BPF_JIT_ALWAYS_ON
 	bool
 
@@ -36,6 +36,7 @@ menu "BPF subsystem"
 config BPF_SYSCALL
 	bool "Enable bpf() system call"
 	select BPF
+	select BPF_JIT if ARCH_WANT_BPF_JIT_ALWAYS_ON
 	select IRQ_WORK
 	select NEED_TASKS_RCU
 	select TASKS_TRACE_RCU

