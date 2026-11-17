Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ABA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LWLx/2JA;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EuR34IKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=; b=LWLx/2JARX3tPuZeZ29SuEKDSt
	WqgcjeJlkvpVqAzRN1/iHD3qJafntQqxlU7cqEKFYO7HKvz+ABKdZ2qPRJr6cUhCSGnF0+VLglHmd
	Vg73bcR6ij1RjC248wpvodXgbRtUFWwye+IdgjBxfS1yFVc3OkVNYlI2KG+iad3KlXnTGfpXFKD4s
	A7Yvra3uhK3eJtirTrlU13gQHZsx8iR9F4Dbv+pycgbEA3vjaAStBA2SaIu3p+qlghrrpQbccNsSr
	7NCjXB/6O98SEGikOI50WGYFUveV1BZ6Ze0q0Ogb0i5QT8jMRF+lDduip0UjeetJJN0sZ1WP4RKMi
	qFG5XfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIs4-00000005opP-1vkK;
	Tue, 17 Nov 2026 13:05:12 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIs1-00000005onX-3DCw;
	Tue, 17 Nov 2026 13:05:11 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 149DD205A39;
	Tue, 17 Nov 2026 14:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=;
	b=EuR34IKS78/70jA0BYwlFltzbYpToNVtlCkJSn1sEeFSYBVUk5alXzemWRufKyGF7WARYs
	kCCGDrWfE8Xf3rGpOk5h/oTKtrRndgcwnBwGTXdKLsVUjgkSypD0gavWNddYjkBCeoH28R
	7aswVtDmVCtPcAw3S84/hmvrNlozkQ1E+rVQA2ds14xORdsf80h7spAObHIvqyFf7rnmQt
	KNuogkpKmrGlupLgiZI8HYnB6yBE1bz5LWepbX/Pq+eB8uKzmCfBWCh8kLCe2yqnSofmcy
	c4JMC9SxQsmz6bq+VXTrW+o8Bf/TbvJ4RYOj+7brZyfcQy7LR6yOPv8td0qelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=;
	b=b4CuNcaW53D0Yi3pjeP3TOFrZ2sR2Qv5jjxxnHWmQ8auf8Zv070xzx26OaFl7uW5d//eOY
	oE9RFhJvty+d+cuKB04ZvKwcoPoq2tgCxEHsgii/Ua8k9G2BGcIrb5lMex4LQ2Sl9uUInA
	F5dUHpAda+vDbPW+TGFUS5jU+VJZkGPgotaDpawUB69z5YOnASJDjERnkdMSTU9gNYt9o5
	VLDmjUhAFtS8fMwKF49CN9my4qJhWte1NHLaKWCfSULgCr+oiVZDlzVMNFfSsVwC2uxrvp
	z3uSSwJN/NNIomeVY7B+qHNp5Ub+3oYe1c257D1ntah9f6Ax9cwsEwC2KzW4eQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920708; a=rsa-sha256;
	cv=none;
	b=KkiV7OtFgI2w9GfXbA/k6E6DSPnj3I63JajbRZ8SMZVNpC0BKRWL/QSKj/gFRD4iZ0JB+9
	d71rvk8aa8bykkh5kDDTritaZQqRUFRGnGSvCEz7M+Yc5eL4PSGTTq+p+2SUavsMQkuQ/N
	Us66u6dsgWd+5sPrrNmXlb6/QKPkI/LcZVN66qxJOpr+TLKpA6P9WotEqZdzB4BP6sNbnt
	ctxWOda4P4RMwiz5GbSoDM2jvzq4yfSPFuggaZg9kUxg+0azuK7tO/1DfHIcuzZskuUMuz
	jHXjsg92CW+JVTsCvVf7K1i6zm+xlGu66NUSAWQJyxwZO3KcLBa+yl5XTKvmWQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <974d629b23d38d46a033513db9b4e783b9c11cda.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] usb: musb: sunxi: Assert reset before deasserting
 on init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: admin@roadbobek.com, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Date: Tue, 17 Nov 2026 14:05:07 +0100
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
	 <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050509_956071_FF15F29F 
X-CRM114-Status: GOOD (  15.73  )
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

On Di, 2026-11-17 at 13:00 +0000, Roadbobek via B4 Relay wrote:
> From: Roadbobek <admin@roadbobek.com>
>=20
> When a bootloader such as U-Boot (for example with
> CONFIG_USB_MUSB_HOST=3Dy) initializes MUSB and boots Linux
> without stopping USB first, the controller reset line is
> already deasserted at probe time.
>=20
> In that case reset_control_deassert() in sunxi_musb_init()
> is a no-op and stale MUSB register state persists across boot.
> On Allwinner A33, MUSB stays wedged in a_wait_bcon with
> DevCtl=3D0x99, Power=3D0xf0, and a frozen Frame counter even
> across hot-unplug and replug.
>=20
> Assert glue->rst briefly before deasserting it when
> SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.
> Tested on an Allwinner A33 Q8 tablet (Laser MID-786).
>=20
> Signed-off-by: Roadbobek <admin@roadbobek.com>
> ---
>  drivers/usb/musb/sunxi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index a17b1c150626..3d16049e53b5 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/extcon.h>
>  #include <linux/io.h>
> @@ -239,6 +240,8 @@ static int sunxi_musb_init(struct musb *musb)
>  		goto error_sram_release;
> =20
>  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
> +		reset_control_assert(glue->rst);

No error handling?

> +		usleep_range(10, 20);
>  		ret =3D reset_control_deassert(glue->rst);
>  		if (ret)
>  			goto error_clk_disable;

regards
Philipp

