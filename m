Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159F1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3zImuDUk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkwy0Pw6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=; b=3zImuDUkrk4iaz
	yoUxPa4Cf1pmeL7R4ztMa2uYS6z5Kv+GPDuOzbWjqK2MgjUK9KrvlbNRLz8w1O70B04H6FTEjR/JM
	2t+kgNbjWr2HyNbiXRf3hmsOpBTpyaH7Iq04kRDLwjD+lVk9323utVmjhWEVUIIzuMT3+kY2UmPL4
	lFno+ZOrF6WAMKe2UADy+u3Kp1jf1yDX6cevjLmqcgAFuW2jkjnySfaOwY8nJnrbhvDtKbv/Mshn0
	XqzimAf3luHi/SocXVHYeiFrxtWahbTkkOj5+agCPzsk+ZqvF2ArFpUQIG17I1x/zVnlsd/WGaXtX
	CLaDImFNBVFUfN7OtT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZC7-0000000DIhZ-1ezj;
	Thu, 26 Nov 2026 13:07:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZC3-0000000DIgz-0cxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:07:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B727E44ECD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396A71F000D2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698438;
	bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jkwy0Pw6kheEy3Bf54lDMZfIwZbTP0UhNeq6TrUDmAwiib+pNkpMEpSZMLBkMFpk0
	 9QxxnryKn7D4iRJQunPjHgv0MQcyA4WveEXdsAh4Om4HwcNHnppuzXiYMAVG/nBxfM
	 N451kxiOk4jDmJMI4fXYIqZP8XMVWFZ9R1NFLO8BHJhZYp9ryFtXWPMXRf3Qk/Nlt1
	 7uRpvWq3GVmLQcMoyat6UoUTOwsrACZdsRoz89k8wxpNUi6OMcStndOvPUP+whZgSK
	 2ls2p8yhJSgYsHw2e5RZZYqbZu1YhAaobwvMmyRZwQJ98xWNZqwM9j82olirp2/kv4
	 YR8u2DQqYHCeA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c126f80426so6725967e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:07:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHH4iR1+J4wjJA7tYSZawtam6pkjW9fJLXrYw5rBMCSjpOYVzw6f1gbEbxFwzVMb9lHS2o0yDGk76pxwwxXL/29@lists.infradead.org
X-Gm-Message-State: APuU4Z9J5dYa2o/7/Zd8H2gnjMoArG6ls59pMTqo9ZcxNJkcgD7Ou7KI
	oLzVR7Pp+qbwc8TIr6Jt1sjwmlQbbne9swyuJbNoLUrnH7Q/9MEdGzhUk9dlw/AINTictceWmtf
	MDl4xC2fTUu7EPE3Nr5fEq9HaCEY4ILw=
X-Received: by 2002:a05:6512:3b14:b0:5c0:465:3fb5 with SMTP id
 2adb3069b0e04-5c1bc806862mr6763468e87.10.1795698436999; Thu, 26 Nov 2026
 05:07:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:07:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
X-Gm-Features: Aa3M54oOpmRcJWcEY0wb-eeul9G7QcTYb_X8Hc7Y0lyAIc5DHSEcaFmVlL8EIqk
Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 4:10=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> stm32_pctl_probe() acquires an exclusive reset control for every GPIO
> bank with of_reset_control_get_exclusive(), but none of the error
> paths release them again: the bank loop returns directly on
> -EPROBE_DEFER and on a failed clock lookup, and the
> clk_bulk_prepare_enable() failure and the err_register path also
> leave the already acquired reset controls behind.
>
> On success the reset controls are kept for the lifetime of the device
> and are never released either (the driver has no .remove), but that
> is harmless.  On a failed probe, and in particular when the probe is
> retried after -EPROBE_DEFER, every attempt leaks another set of
> reset control references.
>
> Release the acquired reset controls on all error paths.
>
> Also release the clocks of the already processed banks on the
> -EPROBE_DEFER path, which was missed by the earlier clock leak fix
> dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
> stm32_pctl_probe()").
>
> Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is no=
t yet ready")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Patch applied for fixes.

Yours,
Linus Walleij

