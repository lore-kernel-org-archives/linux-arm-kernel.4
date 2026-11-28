Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A37606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 04:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q3axRsVP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1AlqW4e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZoHJQSosCyvIzVC9AlQobWPkr57eSEqy4IgYAS/z+IQ=; b=q3axRsVPf2EaG1
	agDEagMLi3LAYaQs3eNk5LHc5x+o/ZB7jyffbPJFAYWP3OSnGIdfHwyj+Mj6rEdsauPrrvAvDRS0E
	CPwKHAxorzZ6Wvmavc0fCOrE5fMQOWATtRR+vlqJlhr+4xLRJKAWgHocI6L7BLR9pJeUYTyJLSZUE
	8fqQ1ypVpnaA11j49ERH+10D5pIfSbFX2PYxULij9vTobPXppLQjGxDyvvQImxEsHZ+FIIarlm3Sx
	7paz6l4jJovZFZKD9QQF0ZUpUH9bMcxH5e1qrBY2DLr6+UyLrUsP02k1WTWMrRz/JSysTYy6Y5bhH
	6+nnl7CLwK4HPh9akN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9yb-00000000Ml9-3RDr;
	Sat, 28 Nov 2026 04:23:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9ya-00000000Ml3-1LkM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 04:23:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21A9560D79;
	Sat, 28 Nov 2026 04:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA81F000C1;
	Sat, 28 Nov 2026 04:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795839830;
	bh=ZoHJQSosCyvIzVC9AlQobWPkr57eSEqy4IgYAS/z+IQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D1AlqW4eeDJW30Apa5/NHcVGCQXfSXCFz7glQ2ll6icKWlmKQtYIQK8V5NbIwegCW
	 s2OxLZgdcqeFkPBn89arIZanFBq0rffYJcDkznw5JT5wD/yiJeeGUPgl3gAO5BYgWn
	 c8UJuk2y+3VoN/lOilk9vLW6Cuah+Kzx5U1lUTF2mygrSDv1ilBN391+dT4l7O3wfc
	 D4Y/MifzfcPfCH6YVB5nyfXzhPbBeA/+HoKe0x09UcA7Nyygr1iWB1jiP+JsggDHrp
	 HPin99kQkiOSwZUVdBKZtMhtXnVF8b853oxeI4/3aSebSBz/1SJf+k+VrzaCgklEXa
	 yocE1TODeLuqQ==
Date: Sat, 28 Nov 2026 04:23:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Adil =?UTF-8?B?SMO8c3Jldg==?= Tepe <tadilhusrev@gmail.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Message-ID: <20261128042345.42419711@jic23-hlaptop>
In-Reply-To: <20261127223213.2481987-2-tadilhusrev@gmail.com>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
	<DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
	<20261127223213.2481987-2-tadilhusrev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 28 Nov 2026 01:32:14 +0300
Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com> wrote:

> On Thu, Nov 26, 2026 at 04:23:15PM +0000, Alexey Klimov wrote:
> > Regarding number of channels. The Exynos850 spec says that ADC has 10
> > channels and, looking at the registers, the ADC_CON2 register (offset 0=
x4)
> > lists 10 channels as acceptable ones.
> > ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0=
000
> > to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".
> >
> > So, I tend to say it is fine to have it set to 10 if it doesn't trigger
> > any hw issues. =20
>=20
> Thanks for checking the spec. Then 10 is right, and channels 8 and 9 are
> probably just not connected on the XCover5. Reading them caused no
> problems here, so no objection from me.
>=20
> Adil
>=20

Thanks. Applied patches 1-3 to the testing branch of iio.git so they
are lined up for the next merge window.

Jonathan

