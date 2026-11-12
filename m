Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xgpTOUOK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJ/IuCmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y1I1XdjPmLu51Jes5z/YykJa8Y2i7KgQfh0jnMzsVbg=; b=xgpTOUOKyH2Ncx
	0ZAoOBuh7dTKehllB72YLe4IBpfRvdNcx2rl4wMXocOgjvy6aGhjYJ1QCTey+wk4A3DtdPM9LQ3BQ
	Jqg/eQxykNvdNAx/8gkc1lwEZRBqAhqlDkJGXuBzifms2C2/8Vz0Tn/iziXLCnP2WHyTePMwZ8kL8
	AGMRWo7M/aJys8rS6lELlKbBDa60KKpHzUe0w3CJf0v/3O1aHw7NHN1AAEzsYroEji6HZPwDpH6tx
	oObNZIXQoD2z6nmWSR2sV+sH/l9oR2LXsF1NdrCiwNHiaYEXMWIRirbGy1RJ9Akg1lJO6nFJKfcmS
	HzyFIsYsUbsgNMV6mFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPhn-0000000905g-011G;
	Thu, 12 Nov 2026 07:58:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPhg-0000000905I-0WgP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:58:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B25F63A17;
	Thu, 12 Nov 2026 07:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A061F00A07;
	Thu, 12 Nov 2026 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470319;
	bh=y1I1XdjPmLu51Jes5z/YykJa8Y2i7KgQfh0jnMzsVbg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=EJ/IuCmNp6HV++MUKExw+e0zFKkdDLksl5LgRXC3hYx8O+EuQX5HbOwOzzwHxa9bu
	 DQ9jzeMbh8WGpgS8/NxKbVGLSfcFI13tzPSM4PRazuOl355mdlsVcWjhJZBemMHgSJ
	 1rr3UvqJtyrw6PG9Bbb2NXKGCZ21A2Sv3rR/h5CYVzI7qWC6XbOAyhCTqlp4/ApjdA
	 J+sDby6MML0b0izWWmzH4oXYeohHkugNCp4RfJ05kYOnmCj36D3L3chmJot6lbKGIm
	 +4BVPyM7e27PVTu6nU7V/4/o1Na8lkWjVsZZjSmrS3NkmZYj7CgeH0mywx9vToR3dX
	 6L3JYc/BrqeOg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 84611198004A;
	Thu, 12 Nov 2026 02:58:36 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 02:58:36 -0500
X-ME-Sender: <xms:qnH1ag6GZq-r_9PRog4Yp0pqshvSyfncj5QJQD9QcmET_kTNaMufwQ>
    <xme:qnH1ast7jl80c080NpKZmUP5j90K6kbY__S9zGDGigRaVT7j3BDa-bwItG5sE1Ths
    3cvuQbB4GvhCQVpug5Mm-inDec8NfY6RkfIbBJCf8JAna-1zhru9TcW>
X-ME-Proxy-Cause: dmFkZTERLtRDG6ZbQFDjglPVPvdVL4k7sgxt9Igg7OLhoPO6t4JYSyqVZBkk0hsCtRB5oQ
    042s6IdxKwzPdgEJU8vy8J9TmeZWCFMOpSes+YqN8pDT8hE5fX7iVwgr7wmHauynPoM3qv
    TF2y87PKdswX86rx3vRV9TGulBjtR8HalMSiaJRNZEeGgTnZ/U38wEXoIa+RECF2uwR569
    t4xc/gXnZvm3ihMZXEHFwDDzniRxJ8gBfDrS5mof3s1d5H5ugo51Y9lXGCQ3Y9V/Veo5Q6
    N7s0lP/uqlRGVs9jXg4ezG6tGL0gkM5bDgyClTp2P0FxPjgPWEpd3ZLpZOYDUmLYoeIZTu
    4PmM++iQ1anCRs56y7cL/89BSRwyn4bECBmM2fJYBMBuyWSljPBbGyK5QBx5n9YNbt/z6e
    sC03Wc2NlG0PgXEar9XwA43EIQHRqheo+Avv5rnp1b9jDV4AoAN/Yld2tB95wdXA83ho2J
    SHrDtGRK+Mi1uhhx62P0a7a3pjH3pRF8aj58s+7nAkdjzC5ZHnivayPphm+0FIxkvHaXBI
    2FQ7wPy+nckeFc+zaW2uOJ/nf+nJXTSls06qdwbmVKh4F8X0AMdEzyS1e7KM7hyidoskaB
    wxdcl7mifMCMJt19hcWaLy+oN7Wdpp57MeBJ34hZiNg6dVKh47K8aHcU3tCQ
X-ME-Proxy: <xmx:rHH1asZnrIROwyn_Bd-DHQYXYeCBuDzgzscFHQSk_JUg2hv1PJ6YEw>
    <xmx:rHH1aqcUofFgoJE1fHBzgpX4qhSuPlID0a_hQKt5cDMkFBjhGKk3Xg>
    <xmx:rHH1ahmtNdJ6_iv5KZRu5sQEc_1MNYFZ4hs8hlP9y-80PAGFpE0Rug>
    <xmx:rHH1ai2hbdQ30BAXJWxc2akmUwICtql7iKgbmsFdt4Qzd7Hi4NyDxA>
    <xmx:rHH1aid3uCB_FhMhiCRNgy6HTim7ifyM8R31CtxUoAjmuVB5kj1IM7j6>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 117C3F8008E; Thu, 12 Nov 2026 02:58:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 08:58:13 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Patrick Lister" <patrick.lister.dev@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Linus Walleij" <linusw@kernel.org>,
 "Keith Packard" <keithpac@amazon.com>, "Nicolas Pitre" <nico@fluxnic.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <9ef08d62-11c3-4a99-9328-f12269592fe1@app.fastmail.com>
In-Reply-To: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 12 Nov 2026, at 03:51, Patrick Lister wrote:
> NWFPE locates the trapping process's saved registers relative to
> current_thread_info(), assuming thread_info sits at the bottom of the
> kernel stack. Since ARM moved thread_info into task_struct, that
> expression points past the end of the task_struct instead.
>
> This breaks FPA instruction emulation, as the user registers are
> never read or written and causes out-of-bounds reads and writes of
> kernel memory beyond the task_struct. Any unprivileged process can
> trigger this.
>
> Fix by using task_pt_regs(current), which finds the registers on the
> stack.
>
> The bug was found with assistance from Claude Code (Anthropic), model
> Claude Opus 5.5 (claude-opus-5-5).
>
> Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
> Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for 
> uniprocessor systems")
> Cc: stable@vger.kernel.org # 5.16+
> Signed-off-by: Patrick Lister <patrick.lister.dev@gmail.com>
> ---
> Build tested on Russell King's linux-arm tree with footbridge_defconfig
> (CPU_SA110, FPE_NWFPE,THREAD_INFO_IN_TASK), W=1, no new warnings.
>
> Runtime-tested on 6.12.116, where this patch applies unchanged
> (arch/arm/nwfpe/fpa11.h is identical to mainline):
>
>  - QEMU versatilepb (ARM926) with OABI_COMPAT, FPE_NWFPE and KASAN:
>    a test that executes FLT and FIX gets the wrong result back and
>    KASAN reports "slab-out-of-bounds in PerformFLT" without this patch;
>    with it the result is correct and KASAN reports nothing.
>
>  - Nokia 770 (OMAP1710, ARM926, OABI userspace): fixes the maemo
>    battery daemon's FPA arithmetic which would incorrectly calculate
>    the remaining charge of the battery and power off the device.
>
> Not runtime tested on mainline: since 25900bd99d4d ("ARM: limit OABI
> support to StrongARM CPUs") NWFPE is StrongARM-only, and QEMU's only
> StrongARM machine (collie) currently fails to boot mainline.
>
> A reproducer is available on request.
>

So NWFPE has been broken for 5 years and nobody noticed until now?


