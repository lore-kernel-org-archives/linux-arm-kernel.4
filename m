Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB8606A880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j9cdj8Zz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHMSLTL+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5tNehFBJ33R0z8lfodFC1+DglDViXOEHspTEflqBg3Y=; b=j9cdj8Zz6Gb0x7HQDj03kY5/tk
	ZgZx9uF6QxRAuKzfW6BOaQfqgFHI2VcWx94RfHEfbLfbHXoo2JPMGbakrqPFp2C6/52AyimgGNqBe
	SPexT6HPFONcNQB9wtbdVdsNxfcCmEYm9bLiyfPDoiS2gm/hXuRJ7kK3b2kaqKYW+GYREeAH9g1Uj
	Pajd9c65yJmYow7cwIKTVuSUI+jQPMbZImUzGalezOc5d4xaoMYFQG/O4dYVHoP/ofLFOoWDODCUy
	djOLR8IxSTAR6Qjbt/HNB3Tqtcon4Ftz3ca/37m6Y8MpMxsCNr9Ritvp/2SGZt5O6OrgPDrKSZVRF
	qA4uoVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFj-0000000CJSA-0KPk;
	Fri, 13 Nov 2026 10:11:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFg-0000000CJRr-25bd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6D7262671;
	Fri, 13 Nov 2026 10:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54F61F000C5;
	Fri, 13 Nov 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564683;
	bh=5tNehFBJ33R0z8lfodFC1+DglDViXOEHspTEflqBg3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VHMSLTL+CGbJJ2JqEzecMys5HgjhxI4zl63jUdcIScw8CEURu7pAKKL1RyX+0pAUn
	 nHtX/spyshS/I681BqHx2CfO0LOxpl5WfoSEcXRkitMHawDpl1EKB0BM8F2INP0z+c
	 kfUTsAG48m2826AxPUIw5Lvr+4LDBoQlQklRo9uozv11QOfwwE45jSqInT6dRAcYFa
	 QhWRa6GN8jFY43/lZ1EyGI04P/hLCOe7Uw2oI14YfBzweuRAa1SXxk6q2Ihpj3EjCP
	 lAv3ARVaxLVBKKKA+9hFK7dMIsNC7MMe/tlVPwxrfYfe33dXqwp7Xt9d3gRhBzZSuQ
	 ggRHW+FB1mMgg==
Date: Fri, 13 Nov 2026 11:11:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113-roaring-relaxed-oryx-5cfa1e@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
 <20261112163703.3358164-2-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112163703.3358164-2-lukma@nabladev.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> Add "national,lm77" as compatible for the National (now TI) LM77
> digital I2C temperature sensor.

Are you sure this is a trivial device, not like LM75? No interrupts, no
VS supply? Datasheet disagrees.

Best regards,
Krzysztof


