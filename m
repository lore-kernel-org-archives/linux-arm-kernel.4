Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEEB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vTwJwv/r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rK7aLHVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=; b=vTwJwv/r0S0Siz
	hYvgVIXB7Gqy2LLOvG9ibsWRejoHOP2EKznbQb34FnpP6sTIqTxp1Af9+rckfAlBReXLg1sUIXlvU
	C5YIKeUNebED1rAm5gT/22QwYjRnYHfJUJyWSAVV8YvSnIyINBIiie2IN7I9gh6XG6mlhh3yh6Yox
	/dOQCzNCUfSRgod8NozDyeh68KBh+xmZ8qFjm6sJ7uf2tPOfkeMjscjVRas07/t6N/jjSriDLBDSA
	5YSDzVkippXxWXt0dS/AuStAaQa9Q9nA8BLZ8yApmEPM5XdkpWzMscYvRNupxBPoJ2Ar6HOJrnF0I
	rNA+uDWPfGXyMh6D6XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCBM-0000000GsyW-2kNS;
	Sun, 08 Nov 2026 23:20:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCBJ-0000000Gsxc-1GHe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 23:20:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1634255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 15:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794180010; cv=none;
        d=google.com; s=arc-20260327;
        b=Zy2XI7k0sn5OUTrENAHLpRUD/NvItxs2f3d/lucyA6NCyDKRPcv+bbTZgrtXuNxCV0
         4zc6ao+bbdrtWmtfzCghdsTKZWTtqBWys9MvwgLOgSqT4jiEHUB6TJuB6mzmU4Eq/mp4
         fIq1JI0M8Fpz47mhqlZGVLnvbShNr+lcya4WXBgmZPin0x+ZvDmeG2c/ZvVZPH8QyOOF
         9Xaj1lyJz3Wj3jcXObKyNfKvmVeTzWQG1WR4jQ/f/j1NB8AQdkR3HiC6/WsNg05KRf5p
         wYEgd/NLNTLGF77JaSgyVDQ6ag1wUw06lKlm1W4UXYI8C3cX7H038MKjK2yr29hFxn34
         wsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        fh=CBLFY/NBQFvVaXYuUaDHHg8CbaCeU+apOmDMiuxSXLU=;
        b=Zuf1RV2Vu/nIruWFr6a/xq5bVEaXXsWM13nYEgOUONUeyaJ32Gs0i43o4+rKx4GsNf
         uyWij8d6Nsp8KYs0EoPFo36fXVXQcE12PdFUXrQpLPBjtisvDPcjOWyGhIMojvpsWMco
         1liFkt8Bgl6k5pM1sFQXmvW38rwG3HFuFOYi0EGAc2PEg7uMOpkI9p37HAjIGzo7il3L
         Rw75HdWFaP2WxOKcRTEF0/wdS+bSi19Iz6VDJy5+KF4QeIqfn2+giHecUiIeMwUpqhCn
         dYqQbg1Cj58azn/OqegxaicqcCn8qI+QzL2E0Dz6i7RYz4sxipU3b4E+ENil2o62bqSe
         TCKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180010; x=1794784810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=rK7aLHVudmT7wB5u/mW431jtiyNi5s3At7pbzORTInYWeXvUBu/bUgY3dRVOCTVXwN
         6hiQ14LOSiqfyITKFMavHnL3oXi6RmHZLCydR3scIl4sDEd2Y0LjVpmPMOFcpjj3n8r5
         /2NBCFGsFj+6UbNQyp3ZZF7w1xQJ9kFr6cbNK/Wacx8FXsrbie9+dTfp3Av5erCRLY6u
         78nJGuIxG8XcPHtzIeQSws6DLY9zxQjYQJktKNGq1AfxaWwQ+4/vJnK1+6yYpEzAU9pc
         /rGkzmtAsaF/2sZbS/YrMUW6ceyb7tO4UALTvjYmDruNqQg+ui7EwaFIh7Esgwq3el/h
         S/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180010; x=1794784810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=gwZ4reZx4U+39hfn4FHcVP6BnhDtNa/8LJVD/97BBgZNQ2wt/FP7dFdECalpDKVydl
         sbMyYE1le8c9jghvTdDncyI/9QYI2DbaEhyw8H/MbgulBrsNVMYpWdDeIA580cxZGbgs
         H8NN8bBnsr4sqMo4k0DeAPkM0Kzo4FQK4RzxtxXuK+0uoaDANhWjAvb8uaHxP+JJ/ib6
         qpT396UUnphUZ41ET4Lx4+M4A05vInNO20tDrUXgZcrf0T9WvFt9CEODm2OUQcI3zddL
         2YSYjp6QLD3+DLl7YaWZGLzmCLnWi3kAjiuOU9uUO+hg5b9bw6Phcf4oBb2BXoUIS8fY
         7XUQ==
X-Forwarded-Encrypted: i=1; AL+hErH6tEZHa3hFOQM/H0z4/aiib3KOIeZIBOPT9bAXHrqJ8FZqj11cs7+tHWILtp+XZVQ7ULxkl0ktw6suSG1A/fBl@lists.infradead.org
X-Gm-Message-State: APuU4Z/p4Cl/VXndkXdE2xQ+Y3q6MbKtzLJYvMN1Ahbm6R2ZgAKeP8q2
	s6krKH//5TMJBaM42MQd3mm6gL4QZlDayqydfYUJbe/X/N5wziNRV9VMsWLa5unbamo+LQVKSU5
	lSJbG6H/64rGoRnvsyBs9nlK4m9NUZY0=
X-Gm-Gg: AYBFou3hct5wA8PLzepFKI71z5hjkpZPPnX/NQCuF4PmW3ygGRqYZW7v6PgSm/3YHsu
	Lv0mMcMZA0uPlqJw45ofU9FuHwBsUtylp75wT2KgIPTOU69U1umwenpy7ho6fHuWVsdS10ai8nR
	fu43hQKoVVmgvfw19rfZPbc83w9dqgnJylqVO9Eo03pGIWiczM7kpY4tZZonBv3TGIiwiPShYb8
	+PZjWcZs0r9aQ8brtt15i+cU+uTsfdytDfRhRGRdVkU2igaMgZb0kieE8gVgDWDmRCH4N2Q10KE
	7IF8YkuDxwi1TW8ZqIY7Nd7tFUsmbHAdAyadIjEg3qT/S34VzDMSf6S/SJ4lYppU6W0anLWqLHb
	becq+IcVnzUcabXjslPlxk+cxqbftXQEEIismrLXnHeFzLhjqspAvcan80JJEwFDS0NJkTFn7w1
	ijKFiUoy2BX3H0BIUDP+Z8K/getEXsHwdmdQjNOWKBgrkvTw3xabpM5c2xwwI=
X-Received: by 2002:a05:600c:6095:b0:4a1:fbf8:55c9 with SMTP id
 5b1f17b1804b1-4b963c89227mr39662885e9.33.1794180010333; Sun, 08 Nov 2026
 15:20:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 8 Nov 2026 23:19:44 +0000
X-Gm-Features: AclHuK-aeVO63ZKWXARmCrmFPccfQkZVnuibMmil6eYfKAtCJR8zv2owsIJ8nxI
Message-ID: <CA+V-a8tDskFKhsJJiV1OUXEzcTN6nKEz4DJCPjJC2tEdrCUTgg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_152013_354643_BBE900D2 
X-CRM114-Status: GOOD (  15.87  )
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

On Tue, Nov 3, 2026 at 2:52=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> index d96042e28cd5..e644092cc2f7 100644
> --- a/drivers/reset/reset-rzv2h-usb2phy.c
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -68,11 +68,9 @@ static int rzv2h_usbphy_reset_status(struct reset_cont=
roller_dev *rcdev,
>                                      unsigned long id)
>  {
>         struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_p=
riv(rcdev);
> -       u32 reg;
>
> -       regmap_read(priv->regmap, priv->data->reset_reg, &reg);
> -
> -       return (reg & priv->data->reset_status_bits) =3D=3D priv->data->r=
eset_status_bits;
> +       return regmap_test_bits(priv->regmap, priv->data->reset_reg,
> +                               priv->data->reset_status_bits);
>  }
>
>  static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
>
> --
> 2.47.3
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

