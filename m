Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E1606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=an/ue2D5;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ND8caDPt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=; b=an/ue2D5AuHJ0/nGVI5SLdf9uB
	1Jz4yHWn4ebm8nCyArs1IQRRD7kde/p8abJeq8Dnt9D1KjAiyv05t4auHG0JHIAx9Usme5Jr9kov0
	NGcWnG6mnnLR9xPuqSqJpYZ0ckQY6yJN+imFDM7KU3IRqhdjqW2QXd8vCqukIQe0IfJvUpei6eJYr
	F0kHdZv2Q34kL6BTv04GlbgVQ8aR97tiWHC9mn/xichaLSR7dFVlAGJ4Z+Ii5nIhyizL+HpG1jWby
	dEQAFrUnQHkDRLcVc1HbbbP8FGcI5LBlz8Zl4yDeurZb6XhTCKHTQtzDVp4OzfghEVAFu161BGrFG
	SeozFWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB1q-00000009ZO1-2mRH;
	Wed, 25 Nov 2026 11:19:10 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB1j-00000009ZNT-3m2N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:19:09 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D3653200037;
	Wed, 25 Nov 2026 12:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=;
	b=ND8caDPtAtwSt2twEzOI9yd23v7XoHTcw3Lw75soG+EgPPdsxEsyeKFRqw3o2OJj0+TUzj
	J7IXvqEPYXLVGxpJlClodDCtLA2Y9/UttaL24O1/4duPyQ+7hR3bNCNIkjGiDqS45AZXfS
	TUHYz92xXymEQ8g2KPiD/+7n8xWLJOmbbgZl4oFmj9YwMTjhB+n41JgdrrZML7GKeFPByK
	s/K0GIj0CK201ZobwEdkLq81BLSrr4fsV+OoHH1L+i+QLcXFjV6AI2aOnjKz8f0fONFT68
	UEWBflYzR5ksPTXOE7wnfq9Z0Bebnb6vyUTQgS3lmINxpglpduxf/s19eQXfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxX/KRbPOCkNcpI6+Rv+y3C1vdctOR1gnbhti2p7x78=;
	b=WqiiQewmo0FmvuOi0s68OfMRBs5PYHt+D0x6sC1rdx4AkWRlZtMV64ly3nChAwtay3i/D/
	KZJz1SF/34GeiOLX27KgTSmP/CugUidVkWK/hNpS2ehhf9Dpdn9y7rK5jev4imffiavUeJ
	VzH3GikUFg4kM3UArUrG/h36XsQDQ1ueUSDxIXiY204waLoiJ9e5EXQA6vhujtXvzmKPI7
	Bs2oexxvGf7WgaWws0aHWLw9VJA+eLcjAWBAK525+27boroqvCgErmBZchsgDP7MES3NQe
	GkiH4OGKDI+R0WZsoLnesFC0Izz1MmsRNusgtCaKWk0eAQJEftIWcnt/vfdJIw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795605541; a=rsa-sha256;
	cv=none;
	b=E2vdOFTcAHnNOSiEGiSk+Zlfwi6N+BNzk23sLgZZBZE2o101/3UN2MYavVsFgkGXjKO4z+
	Vaf7P2AvBz33O15djLWn3mVB4diMO0ILb08HR6gxkbYzL4Z8NrgZfTSbUuAz6IOOUe20XI
	dl4PExN2wBA6VO4Nf2F6MFLdODSeJAbqT6IXtbkkU15DA6ckZJzRLWAYFiJwViV6XzSJxC
	hPwf0Blh0g/gS8XQLaUkHj7ReYhNppFrt318xWzAtaqm8xN31Zt2BJiRPopdX6pvFAgzaw
	5/T8K7EUz5bVaTSl9Xlky/A6hkZ5U/NkzTXDYUVLIE2YFLbrzDH5rgJAemGUgg==
Message-ID: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset
 controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: filipp.dunsky@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 25 Nov 2026 12:19:01 +0100
In-Reply-To: <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
	 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_031908_133971_BDCCEDC4 
X-CRM114-Status: GOOD (  17.36  )
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

On Mi, 2026-11-25 at 13:34 +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>=20
> Use the shared syscon regmap to control three PCIe and seven network
> engine reset signals. PCIe consumers supply their own assert and
> recovery timing. Verify level transitions of the network resets before
> the consumer releases DMA buffers. Reject the unassigned group ID to
> preserve exclusive ownership of the underlying lines.
>=20
> The clock provider registers early for timers. Match the platform
> device for the same syscon when reset consumers can probe.
>=20
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/reset/Kconfig        |  10 ++++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-cs7542.c | 134 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 145 insertions(+)
>=20
[...]
> diff --git a/drivers/reset/reset-cs7542.c b/drivers/reset/reset-cs7542.c
> new file mode 100644
> index 000000000..b86c82554
> --- /dev/null
> +++ b/drivers/reset/reset-cs7542.c
> @@ -0,0 +1,134 @@
[...]
> +static int cs7542_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cs7542_reset *rst;
> +
> +	/* Clock-only descriptions also use this syscon. */
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);

devm_kzalloc_obj()


regards
Philipp

