Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89B5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsgoHBZX;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ny2sWYgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qbd+z81NWcBJ3UbzNi7GzHSjiR7on5yG5EEeouAnung=; b=dsgoHBZXGWI4OZ
	PPb6rCHeSxt1/KnoHXbej1ezN2sPaYnC4Hr5JiPpqloZFV4pxk+HURvDe/AKJf4S0OVvBy+vYANHz
	uqSKzXanw9cMhFVgh3N63Wih52PxrfzQTba1BVZ0ZymF6NOCDj8qXJ2vvnZofOEu7J64oEKKzlubx
	DdQEMdS2Dwv3zQknSAbpTEkuDMjl2uz9NJxnIAYKlOrT+AVLBQLllrRrYTI2A1NhW0pMMbsAAiyR6
	yqYqM1BckQNDoS0KdMRFN17UBolOJr3XX/0F9pay5Zn/yVuRkhsCwrcdU5oJybhxCSmU6KGOZ2LGl
	MiZkzXAWt1PbgHwF63WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoy-0000000FI32-11ZH;
	Fri, 20 Nov 2026 14:42:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPor-0000000FHvm-134w;
	Fri, 20 Nov 2026 14:42:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 150D91A1735;
	Fri, 20 Nov 2026 14:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDB99601B9;
	Fri, 20 Nov 2026 14:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D8C11BC0232;
	Fri, 20 Nov 2026 15:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795185740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qbd+z81NWcBJ3UbzNi7GzHSjiR7on5yG5EEeouAnung=;
	b=ny2sWYgnB0zcWHeFXhqxhDIAWQ/uV1VQzEEqCRq0frSEgIqGk0A/Gnr16gKIM/7MkE8G3Y
	Dj81WUujkTgIygPti1bkzTol8TEO6lCcIikzANbIIz9JsdQguQvKy+ZskThQzoVvwiFImN
	ANv6xsoO9kd+7yRJvQmXW5XinY6o210rhfzz1pDFd1wbNowGtBfLLgcifRK1mXcQ57HSSE
	W+CrBat6FC4flKNMgU5QC43LywpdbagUOGBJVu+eQhirnHhKXtfyTU6I4iJWgHXVY94oMC
	E6BVwAjHuXZOYLo00D9sQDoL4Queg25DHL5gvFaP98HIwXURNSC9YxMG30bvxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before
 controller cleanup
In-Reply-To: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:07:31 -0700")
References: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 15:42:16 +0100
Message-ID: <87tslba7jr.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064229_467063_AF20AD6E 
X-CRM114-Status: GOOD (  16.31  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/2026 at 14:07:31 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The NFC interrupt is shared and devm-managed. Controller removal disables
> the clock used by the legacy binding before devres releases the handler.
> An interrupt from another device on the shared line can therefore make
> atmel_nfc_interrupt() read the NFC status with its clock disabled.
>
> Release and drain the handler before freeing the controller resources.
> Track successful IRQ registration because probe also uses this cleanup
> path when requesting the IRQ itself fails.
>
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index 0bdbcbb50d94..9a724de67624 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -263,6 +263,7 @@ struct atmel_hsmc_nand_controller {
>  	struct completion complete;
>  	u32 cfg;
>  	int irq;
> +	bool irq_requested;
>=20=20
>  	/* Only used when instantiating from legacy DT bindings. */
>  	struct clk *clk;
> @@ -2334,6 +2335,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand=
_controller *nc)
>  	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
>  		     ATMEL_HSMC_NFC_CTRL_DIS);
>=20=20
> +	if (hsmc_nc->irq_requested)
> +		devm_free_irq(nc->dev, hsmc_nc->irq, hsmc_nc);
> +

That's a terrible approach, completely defeating the main purpose of
devres.

Your problem is a devres ordering. The fix should be by teaching devres
the right order instead of open coding the fix. So you need a
***_clk_cleanup() helper which does:

	clk_disable_unprepare(nc->clk);
	clk_put(nc->clk);

and you want to register it before the IRQ request so it is triggered
after:

        devm_add_action_or_reset(dev, ***_clk_cleanup, ...);

Thanks,
Miqu=C3=A8l

