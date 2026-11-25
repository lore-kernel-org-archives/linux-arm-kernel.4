Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C6606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oQYsbCQM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz1BodnZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eNx5ZwxwQF3pCAIZSJDgbBLvyG1xG91t2PRrZIJMuvY=; b=oQYsbCQMQisbRYGD076kbfcKQo
	ejhu6WqNIpyizXXEjWYjXJL5otVJi0KUyhkYT3bDfIongWEcOyWo03a9zCYoc0b4tyCZZGLPt4K/s
	RFCxxZamfPHMDD6hu7KDfRx6Iy/Tt4wcY3ma9E4QLpvgS3LdLNHhJDGcNJUi5Bx3LcVBBITqT+Irr
	rnKeoGP87IWJEl8j0hzsvYdpQyI0wHMv1sdOBAoVtJIlcIxMqapoB0em6zbe3AQqHnitBrgnAo1gz
	0Rfawna+SBHEiyrCp9QT8mR/hVnAZbGDbS1f4ESK7mcZhD/MCiz/9L/Hy2dNTF+g3/JyrCZZsDjzA
	OFoZXMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHQ6-0000000AxQF-2F55;
	Wed, 25 Nov 2026 18:08:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHQ4-0000000AxPh-2xT7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:08:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C47246608
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCAF1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630116;
	bh=eNx5ZwxwQF3pCAIZSJDgbBLvyG1xG91t2PRrZIJMuvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hz1BodnZcBZT/KUwNGE15a/sxBOr1vuiHCkTfm7U6wkJkAQdx0ore508uH+2Dx2cx
	 YU6ThbEHy3L5YaWUAx1ZkYdNoqGrUskSAJKSsLpYfKR/ewNgQuQelvtdeWq+anG+tf
	 hux2kmccH24GanEaohs+3C8bKyd85w2TaippKDpmJLPYoe8o6vCBtighNFHySpYc/2
	 9rxxShcP+EpmowKq2i0l6jHMgeuarQlzPXHXtN3tDoj/ReAseB5Tyi8llFQ2q4Lb5o
	 Cn1apVqM9Ied3S1tfgh0b9UyremBYtzFylKEiEko+rBtW1FCZsepAENxuWxwQ95/ww
	 hH6qxEtD8gFSw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso7504800e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqbTSYJB++1FuzB/TiG2YVXgz9dvOwUuG6/SyfN+PqqpMuVQ7ZF837a/QdAJ3p/3YV462Akh0twuMfG49+J9jp@lists.infradead.org
X-Gm-Message-State: APuU4Z/zFt8RomtCGaTMI5+3i5MuzxGOt11ZmQU7tnLn1WXntdGwINhh
	yXpDgfucdTyE2k+/2ojHEwadjwsB7fqXucE7e0id2/JrrAvJi+0WoOa4qqwQPJ0j/KvQLYFyZsi
	vkvO6jtB6Pk0T1owdfSg2RJ85zIaw2t0=
X-Received: by 2002:a05:6512:85c6:10b0:5c3:182f:bac5 with SMTP id
 2adb3069b0e04-5c3182fbd1fmr1537008e87.0.1795630114620; Wed, 25 Nov 2026
 10:08:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111114225.3977243-1-ruanjinjie@huawei.com> <20261111114225.3977243-2-ruanjinjie@huawei.com>
In-Reply-To: <20261111114225.3977243-2-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:08:22 +0100
X-Gmail-Original-Message-ID: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
X-Gm-Features: Aa3M54q6226d-LNf-pEP1kf8MunikGkNJM-jG6MXhZoLCqA1MQYdS9z2y0_SJt8
Message-ID: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
Subject: Re: [PATCH v21 01/15] arm64: ptrace: Fix spurious pseudo-single-step
 for PTRACE_SYSEMU_SINGLESTEP
To: Jinjie Ruan <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, linux-kselftest@vger.kernel.org, will@kernel.org, shuah@kernel.org, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:43=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
> Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
> pseudo-singlestep exceptions"), syscall_trace_exit() injects a
> pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
> set, including for an emulated system call.
>
> That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
> and the tracer must get a stop at the return address to inspect the
> result. An emulated system call does not run, and its syscall-enter-stop
> already reports the SVC, as the x86 implementation and generic entry
> (report_single_step()) both say. The extra stop is wrong:
>
> 1) Stepping armed before the SVC (the normal case). The SVC exception
>    leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
>    hardware step is taken at the return address anyway, and the tracer
>    now stops there twice without the tracee executing anything:
>
>         syscall-enter-stop  pc=3DL
>         pseudo-step         pc=3DL    si_code=3DSI_USER  <- added by that=
 commit
>         hardware step       pc=3DL    si_code=3DTRAP_TRACE
>         hardware step       pc=3DL+4
>
> 2) Stepping armed after the SVC, e.g. a tracer resuming a
>    PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
>    stop is the pseudo-step at L, so the instruction at L is not
>    executed before the step is reported. Before that commit, and on
>    x86, the first stop follows the instruction at L.
>
> Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
> does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
> before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
> pseudo-step, so both problems fixed by that commit stay fixed.
>
> Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
> in QEMU, L is the instruction after the SVC:
>
>   case          before that commit   v7.4-rc1      this patch
>   normal        L, L+4               L, L, L+4     L, L+4
>   after seccomp L+4                  L             L+4
>
> Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep =
exceptions")
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This patch looks like something that should be sent separately and
even considered
for stable.

Can you please send this patch separately to the arm64 maintainers as
a fix?

Yours,
Linus Walleij

