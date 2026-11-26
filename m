Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sHaotbQz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGZMx2+9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HbyBlYoSc4oQNkMHH7+GzwCjpt+AsrusHMpyq+R+lm8=; b=sHaotbQztAXdDC
	b5nDbp6ZplhHFD1s/ba7eTJ/Jv3Z7nwzXkVHpV+TBXurba3UmE6nElEkQ3DirUe/xk+iS2g358r88
	tC7IXgwStsoWh7eOesIirdlVS/gv+s/qFbwlX3P7iXpFCqIOa3C0iIT+5XsQtHTUZAZtPxDSX6WJX
	GKSVEZK2bkB7HiVxLqzdv7T3DoGLlX+rmiQvRhcoTk0okg/mZaYBY8UVmb//F1ujy6J+qGhh8M68U
	CZg/dHKyiA8yJOHRxNUqdW4arziOgtRw47wBw28ZEajnC6H0/fYkxfj1AJwEmwb/wXDYXPWrt/miU
	h52YicdAmqkjyLjeiqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOUL-0000000Boby-1mmH;
	Thu, 26 Nov 2026 01:41:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOUK-0000000Bobr-23LP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:41:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A597A612C8;
	Thu, 26 Nov 2026 01:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDD71F000C4;
	Thu, 26 Nov 2026 01:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795657287;
	bh=HbyBlYoSc4oQNkMHH7+GzwCjpt+AsrusHMpyq+R+lm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fGZMx2+9wN474RbdEH0dBdNmm7KD9n4vNxooWNmcLHTHs3/RU1zISmcGg1x8d9+Aw
	 YeaOGlasmDT9e6xuUjxYcuE6nfNA2mW0OzePjygEI8QcSmZmQmbE66Nt7oIjI9YUVh
	 xOsCrlzUvfw7kRo+1iZJMFRCu9eg68QjgUa/BVxNK5sTqwrZrEXbkNePnYN5+9aZOd
	 GNwryei3TmXwO3sAUf70Z+R4Uubi9Ja5tNTXjKzfmqyYIwNfWMYlN62h3eYi2ERVJM
	 6OZI5DN5qVUOOZXcx1MWQaJ8NjN1j6FtzjFJD06okBp48/DMH6QcCjQvBcK/ZeWr/p
	 ddF6eTdhZ8Gyw==
Date: Thu, 26 Nov 2026 01:41:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Adil =?UTF-8?B?SMO8c3Jldg==?= Tepe <tadilhusrev@gmail.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Message-ID: <20261126014118.6eb12fea@jic23-hlaptop>
In-Reply-To: <20261125193122.747908-2-tadilhusrev@gmail.com>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
	<20261125193122.747908-2-tadilhusrev@gmail.com>
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 22:31:23 +0300
Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com> wrote:

> On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
> > This small series adds support for the ADC block found in the Samsung
> > Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850=
-96
> > development board. =20
>=20
> I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
> with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
> and the board's three NTC channels.
> Readings match what I get with the vendor-style sequence (re-init around
> every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
> channels, the NTC channels follow the temperature, and 200 back-to-back
> reads per channel show no stale values. So initialising once at probe
> works fine here.
>=20
> One small thing: channels 8 and 9 always read 0. The downstream driver
> uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
> channels that don't exist.

Other than that thing to chase down this looks fine to me.  So I'll wait
for Alexey to confirm if the magic channel pair exist before picking it up =
;)

Thanks for testing!

Jonathan

>=20
> For patches 1-3:
> Tested-by: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>
>=20
> Adil
>=20


