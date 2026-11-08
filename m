Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D326080C64
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AmXveswY;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=aHzLZn9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R3v5E6SNCq7UvDHGsaVgQX7pHBfqmsknhHYIo4WDvV0=; b=AmXveswYerIWtsrCeTLC2HytrN
	xwYdOHqseO2/mQV+wmGkY++c5KtijKm7BGcBNcJYPUP3ugwWkD/HqJ17DDhwQ8yiYZO4Aalc/YyML
	xTuPK6Mn2yRYNnd7r+6rA0XXhhiQLXcsQLeblMsA4ygYWYUtC/LYSw2VP4Thp21dPuSauZjeEXl51
	x1wTfX534mfGy1vcUAEQrKfoskjFdi5lS0KFPRIoAvvUssNRkQiLifzWNuOAycpHRtrCHl1H5j/yW
	k+9DpXQqZ0O4zCZtWNK82FEsedrIwX4bhCcZpcdXXYG8yISj/lbcULSIxCon5CJnA2pIEWBX4FKfp
	Khhvm25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Rg-0000000GZuh-1Yia;
	Sun, 08 Nov 2026 20:24:56 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Rd-0000000GZtX-2xTf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:24:55 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 45131D4223;
	Sun,  8 Nov 2026 22:24:45 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 45131D4223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1794169487;
	bh=R3v5E6SNCq7UvDHGsaVgQX7pHBfqmsknhHYIo4WDvV0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aHzLZn9tkRvOVkfpnsUMQMHZiAQWh3Gzqp4ZTW8AszPuqSZvBpI0Wt/XRSEP6uq9l
	 rehiNqgcnUGn6vf7uYXo70S+xjC+Kg3v42oYibC+BxZYcuJ8kJyVe0qXewWwRvbo6B
	 g+uFZ5xMFpGDnuEF3aSewpeiRs5hsMHqS3fYLYCK7OalyRJcendJtETrh8nMznB+JF
	 EntSpYa1g6snYfARIJYyWr3DdjcW9KaKMNDgG/eN79QbO1u1Jj3hzcRhMwdDxZlLKz
	 zHoSOLZlxPgKQq39eBkpMq4AYkmL1b0NQkNJ0TO8iWcv0JmZUdrAd4BhWsAmWCQnIr
	 9DVViC10ITaCA==
Message-ID: <0df179e374de91aa3e671f0fe66b45bca716e095.camel@rendec.net>
Subject: Re: [PATCH v7 08/10] irqchip/imx-irqsteer: Dispose of child IRQ
 mappings in remove()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam	
 <festevam@nabladev.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, 	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 08 Nov 2026 15:24:43 -0500
In-Reply-To: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_122454_050532_62F24AF1 
X-CRM114-Status: GOOD (  15.29  )
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
> Once the driver can be unloaded, the IRQ domain mappings handed out to
> downstream consumers must be released on remove(), otherwise:
>=20
> =C2=A0- a parent interrupt racing with the teardown can run the chained
> =C2=A0=C2=A0 handler while irqsteer_data is freed (no synchronize_irq());
> =C2=A0- downstream irq_descs keep dangling chip pointers into the unloade=
d
> =C2=A0=C2=A0 module.
>=20
> Dispose of every child hwirq mapping in remove(). irq_dispose_mapping()
> calls irq_domain_disassociate(), which runs synchronize_irq() and frees
> the descriptor, closing both races.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index a14a8b80d60e..d15b806b278c 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -272,6 +272,7 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0static void imx_irqsteer_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev)=
;
> +	unsigned int hwirq;
> =C2=A0	int i, ret;
> =C2=A0
> =C2=A0	/*
> @@ -294,6 +295,9 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0		irq_dispose_mapping(irqsteer_data->irq[i]);
> =C2=A0	}
> =C2=A0
> +	for (hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
> +
> =C2=A0	irq_domain_remove(irqsteer_data->domain);
> =C2=A0
> =C2=A0	if (ret >=3D 0)

Reviewed-by: Radu Rendec <radu@rendec.net>

