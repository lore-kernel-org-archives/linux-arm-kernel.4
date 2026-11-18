Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3460A2606
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 21:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VvavG2Jl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMtKPAWq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1v260OT69H55l4pPpHqX5ZIgboqZUsGVMtlBm+leSH4=; b=VvavG2Jl8n8rR0
	AZWN7AjR23hx+9QWa+FurQviKrguG5jj+SrZekUPr+jgdgFfKOwTuNpAmTgG++MRSi2vxpiSfMdSv
	LYlXtg2Or8a+FIahqZKxObSZF7/lLGrLsEg83kkoXdODaMZct62//cjvTANoTUbWojA2Pq/MuQMLV
	lA1Mi5j5gmAsgfua8k6ieUxabcTkXdOVOx1fNVpoeF78r9zZobWzUDgdmodeh15ZcoavPWrvyTRm4
	N1JrS9V92fCff/PGPZuUtk5dEAKtQXsEShMHzRNaL5cerkRTI6bxuF8io2RIny+J9xFvvl/K0w8sr
	aXR3NH8T+Nslwx6N5Vow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmtF-0000000AHVL-2aPK;
	Wed, 18 Nov 2026 21:08:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmtE-0000000AHVD-1cTk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 21:08:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A82B94734A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 21:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B3C1F000CE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036103;
	bh=1v260OT69H55l4pPpHqX5ZIgboqZUsGVMtlBm+leSH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aMtKPAWqv/9NpkWPUxD4QcmJvVdUClTFWGkif1c7/N6d4sm0sFskJb0B9DHB1/N63
	 HTJh/0PLD4F6dZaHs9MenIlX0vZoLUwDEaawhyzrl08RY98KcmGIczJ4OsDjKdeFwS
	 Da75NJqCx0xJgQMA1fyT2nJAalcfrx5/oZG09/QDMVrPxB0wIe5E1LwuO+Z/snqmBt
	 ORDO44Zp7WyBCU8sobMyCF4OlnUDcNTGnm9jjvHbC+Hp52DffluZxasmLZqDyBQGk1
	 Jb9CANWl0YFQjpZg8KxH7wFZUKKseDa9Dw34YymJbW7VS7lbYPlgf2wR7/xEgKvnal
	 +quEpvvipzzqg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso1242650e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGiFY/wun0dDyhnHMQytNdocE9VDv9/BX3Q5zPgkqP9iKpnlnB/mLKDoEmAtaKS0x1981Eb+ArF1vX86q9X/gBQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/p6HJzCnzLSXwhbJNkGUjgT0Sfp97U2WsU4YfVV+InnxxjRkzz
	PjBe1KdfCQp+IcUIM5SIrt1QkMySB7A3rjGy4r+chzVmmBiwG+LTARc5xfL3teXiBtxImSBg52j
	wMLs1XNbIc2BKx8E7m4+Mfg/mnmrMr3A=
X-Received: by 2002:a05:6512:a352:b0:5c1:ad4b:4bc8 with SMTP id
 2adb3069b0e04-5c1ad5a9200mr672182e87.33.1795036102287; Wed, 18 Nov 2026
 13:08:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:08:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUqc1Bm-34_5ocG7Qw4oJjSNu=B93CvANba-3LNMo-9Q@mail.gmail.com>
X-Gm-Features: Aa3M54pzy5iXCZO2yGpkbAFpLnZT71qI2PdQXtRpY5tdOhwtfxvX4H4dr9ZLAU0
Message-ID: <CAD++jLkUqc1Bm-34_5ocG7Qw4oJjSNu=B93CvANba-3LNMo-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Philipp Zabel <p.zabel@pengutronix.de>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 9:32=E2=80=AFAM Xiangwu Lai
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
> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
> ---
> Changes in v2:
>
> - Point the Fixes tag at 2254e77665d5, which introduced the reset
>   control acquisition in the stm32_pctl_probe() bank loop and the
>   -EPROBE_DEFER return path; bb949ed9b16b only replaced the child
>   node iteration helper (suggested by Sashiko AI review).
> - Also release the clocks of the already processed banks on the
>   -EPROBE_DEFER path, which was missed by dfd8259507c5.
>
> Link: https://lore.kernel.org/all/20261110065722.1340-1-laixiangwu@cmss.c=
hinamobile.com
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm3=
2/pinctrl-stm32.c
> index 98cf9c6f4..2a54a0176 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1966,15 +1966,18 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
>                 bank->rstc =3D of_reset_control_get_exclusive(np, NULL);
>                 if (PTR_ERR(bank->rstc) =3D=3D -EPROBE_DEFER) {
>                         fwnode_handle_put(child);
> -                       return -EPROBE_DEFER;
> +                       clk_bulk_put(i, pctl->clks);
> +                       ret =3D -EPROBE_DEFER;
> +                       goto err_put_rstcs;

Looks like a bulky fix, what about just stop using
of_reset_control_get_exclusive()
and use devm_reset_control_get_exclusive(&pdev->dev, ..) hmm?

Yours,
Linus Walleij

