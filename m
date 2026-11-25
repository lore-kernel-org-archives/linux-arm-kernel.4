Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1E3606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tmk7Jz+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IQ9fZw32uZVF3Ywd8chKQW0lakTMcQKc2jgAvfNuIBI=; b=Tmk7Jz+XCxGH8duqO8IURmOcSh
	PtmbNpaPY4w8I7eBdFPUtkGetDT76pTCwVPXvUjY5W8mYpqoJswRus8xqR+Zol2x2jaF8wAil4Mi9
	nYZfp7QNIdZVYA3Coupn1bOWUwP6aZHHm8QJDAyM1+oG4Z1t6Cittmi8E2ifDdOU7/adu7MvVSWAa
	L0HXvPm+6KOtW6MSoKX8VKag2JZHvNBPv3c9fCRVSlN2fnYP8Y7z47RYfD0ve2eoMpDGDrtHR6v6X
	BYh86EyAO51uNSMSZFKAVth6hdSuBq5ExlncYpYHSrBikwTQAccfUuFWiV9ts8dgauJpKIgiF8b7J
	znUh6M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWE9A-0000000ABkm-3FJV;
	Wed, 25 Nov 2026 14:38:56 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWE97-0000000ABiF-3Dq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:38:55 +0000
Message-ID: <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
Subject: Re: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
From: Paul Cercueil <paul@crapouillou.net>
To: Prasanth R <ragaprasanth@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Support Opensource	 <support.opensource@diasemi.com>,
 CL Wang <cl634@andestech.com>, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-mips@vger.kernel.org, Prasanth
 R <prasanth.r@lineo.co.jp>
Date: Wed, 25 Nov 2026 15:38:45 +0100
In-Reply-To: <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
	 <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_063853_973351_021DB0E6 
X-CRM114-Status: GOOD (  16.64  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prasanth,

Le mercredi 25 novembre 2026 =C3=A0 16:20 +0900, Prasanth R a =C3=A9crit=C2=
=A0:
> From: Prasanth R <ragaprasanth@gmail.com>
>=20
> The driver has no remove callback, so the wake IRQ set with
> dev_pm_set_wake_irq() and the wakeup source enabled with
> device_init_wakeup() are never released on unbind.
>=20
> When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
> IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
> fails with "Failed to set wake irq" and the RTC cannot be bound again.
>=20
> Use the device-managed variants so both are released on unbind.
>=20
> Compile-tested only.
>=20
> I used an AI assistant (Claude) to find this and write the change.
>=20
> Fixes: 3b2dc19ff9a1 ("rtc: jz4740: use dev_pm_set_wake_irq() to simplify
> code")

Should probably Cc: stable@vger.kernel.org then.

> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>

(Your family name is R?)

> ---
> =C2=A0drivers/rtc/rtc-jz4740.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 32c331f3f..41501c9ed 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -367,9 +367,9 @@ static int jz4740_rtc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, rtc);
> =C2=A0
> -	device_init_wakeup(dev, true);
> +	devm_device_init_wakeup(dev);

I see devm_device_init_wakeup() can return an error, which should be handle=
d.

Cheers,
-Paul

> =C2=A0
> -	ret =3D dev_pm_set_wake_irq(dev, irq);
> +	ret =3D devm_pm_set_wake_irq(dev, irq);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "Failed to set wake irq\n");
> =C2=A0

