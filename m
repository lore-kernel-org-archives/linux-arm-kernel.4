Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DC606D814
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AunPJeXY;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=i4poTfs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CLg0dkhkAHqwvH4NqaW3nQ9pKyM6DLsfJFXhxQWDQ00=; b=AunPJeXYEVpw1a/1vxOmx+siJu
	80VzEg++8ffP2VLazo3PgMf17y1Xdc7yOpo/rftKzjREuRzzyWCEnF+giGUukr7gxhCTIeyxy2/lW
	kkixOj4BIjJhiMKXMnWNg3nlbRNQU07Ei4SunMXVcgit7+MoLTXB1G6+qu2Tj9XSpY91yCL02Fjss
	iuk2bBWmSuL/xd/8WlTkOXaL3xgt6fK95TACSIDaAMD2bsQheUH+wXWLo0synSZu3Vnkt7icHGKtw
	oU8BSawy6p8bDJ2VlNWKzLbJiDVcm+c9B8hJvC98K9/jQ3vXHhLo5uLHfohHaLzdToDRukToEeQms
	qm5dl3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Ws-0000000GaPZ-04JD;
	Sun, 08 Nov 2026 20:30:18 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Wp-0000000GaOe-1WqM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:30:16 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 39EDFD4223;
	Sun,  8 Nov 2026 22:30:11 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 39EDFD4223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1794169813;
	bh=CLg0dkhkAHqwvH4NqaW3nQ9pKyM6DLsfJFXhxQWDQ00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i4poTfs6sLriei2b8QRGHlw6KjyTG6NLgwR+p3tAfmpwrNOONvb8J77ZkXxCA8CL3
	 sYO03+q9Hfzuaklw4QWATFZIvjr3StGH5Q50CzVOxzMFbF0jO25m27QiCyuq5QTiIo
	 DqnkQrOGyVI1Bh0WsAi9HAeCarhrfENIHg+m9apQdrXKKbA7pl5nkE23uIBulrv2lA
	 M0XEpsFyWZgq+lAOtg0C7elFUGWh0nYDdws+3END/2OoNC/BZiN+1OQIA2qLVKFMxW
	 SK25IMV8g6j2S6yZAWzU2V7ckPD/GigjTvfcIwYUU3nav3gxA33A7iWEKuRj9KId9k
	 ChTKFNl9KelFw==
Message-ID: <912bdd213166ff7d6c24580896b92bb0a3edea78.camel@rendec.net>
Subject: Re: [PATCH v7 10/10] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam	
 <festevam@nabladev.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, 	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 08 Nov 2026 15:30:09 -0500
In-Reply-To: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_123015_578814_046B3CED 
X-CRM114-Status: GOOD (  12.80  )
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

On Wed, 2026-11-04 at 16:37 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> Replace irq_domain_create_linear() with the new
> devm_irq_domain_create_linear() helper, so the IRQ domain is released
> automatically on unbind and remove() no longer has to call
> irq_domain_remove(). No functional change.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index d15b806b278c..da6e8d1bbec1 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -248,8 +248,9 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data-=
>reg_num * 32,
> -						&imx_irqsteer_domain_ops, data);
> +	data->domain =3D devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&=
pdev->dev),
> +						=C2=A0=C2=A0=C2=A0=C2=A0 data->reg_num * 32,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 &imx_irqsteer_domain_ops, data);
> =C2=A0	if (!data->domain) {
> =C2=A0		dev_err(&pdev->dev, "failed to create IRQ domain\n");
> =C2=A0		return -ENOMEM;
> @@ -298,8 +299,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0	for (hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> =C2=A0		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq=
));
> =C2=A0
> -	irq_domain_remove(irqsteer_data->domain);
> -
> =C2=A0	if (ret >=3D 0)
> =C2=A0		pm_runtime_put_noidle(&pdev->dev);
> =C2=A0}

Reviewed-by: Radu Rendec <radu@rendec.net>

