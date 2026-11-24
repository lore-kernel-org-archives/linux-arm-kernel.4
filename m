Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZXtp7qVT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=btgL06DM;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=izAsToY0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZAH3uJtDRDARFLlkyP7xUIfb21FLpBpXW/Qncc4Cje4=; b=ZXtp7qVTTYfe8ikb0EAa6jzCc+
	PVCQgUcN1eBF5sZTpQuK88ycCoV7tLzciHqyo+86OoJgdPC52B1UZyqn+FzaO5wl/l0kffIX2DiCA
	1JRJKkaGZ5htKEhadjZQlY69/m0JY1ALSpnbmG7iXVl90+6KkbXJHPiub7KwuqEky1fNDuKnf49Km
	D9Pp5DMKJ9TPicdnuQ91usB7GSfBcJJc65Fy1TngI2KAl+5sewiB7vLp60N1iB8M2ffcAIuUWAy8A
	nNEaH3UniXZERaEZMo24bYlqzj7yjueRZ8vYGobYVUhgR7n4mc2aLUSg0lnvgTEbm/TIAyoIgBUiV
	Ql/j+BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7k-000000074Ma-2xOx;
	Tue, 24 Nov 2026 16:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7i-000000074LY-20zW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZAH3uJtDRDARFLlkyP7xUIfb21FLpBpXW/Qncc4Cje4=; b=btgL06DMNycZztpSctKoA0E5Ur
	SYRUrffoJCj/mlTTKZamcTWyok4kiVTnouLEr2fegb0Iur++emUB79VzLquPOX4ntnNVY+JkYj1JL
	yjsOetWlstUoRbdP8zDN1x4LNL+3WQ89kdMnr2bN3GIvb8Zh+Gu2QWPXnp57H14nxSDv3p+gFJfgx
	OHit8Km8K30BJN1p7YZ8cRRMJnZHLxxM0OHHDMl/fK2zZzRXraYzEE/pkYv2HVX42hzpuS5FmFpzH
	6vZ90S9ZJDK0q6auhbUltGlEWd/7xEgM+uVbw2/J1u5ZTW851ZJdxxtCHNAValQ69S+BWKc0wTIGT
	XpEl2owQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7Y-00000004K5G-1QmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:11:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A12D1C2C65E;
	Tue, 24 Nov 2026 16:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21F15601E1;
	Tue, 24 Nov 2026 16:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A72E11E69A44;
	Tue, 24 Nov 2026 17:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795536696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZAH3uJtDRDARFLlkyP7xUIfb21FLpBpXW/Qncc4Cje4=;
	b=izAsToY0CPCK6ofDDGATgxe0On9y83CeO4uz6Vb/iYIc9JbPM1wsXYVwuV6uoxzAWXsQjp
	ubSqwRDEA5mm6eldGynVFPdOTCchhyoofs8ADkxfrU9IcSqXfUiz26+QyenyYMxLzFeGCe
	uOLVic3NkI+RGgTHH4jAG5vYhMAjvLGuPLTzkP3qGmr7WufqiSZ7dk7QJF70Jx8eKuRyiO
	9f4h0DXNHj1zUZCH/Q/7rOnpX4cwMfrGfvIrrDpoY4WccWuA/RlDRLPUguGNfJ5hcCd1SO
	uS32qZ5/g++IHzR1o/n/1T5nhEjTSM5ymBNz5jzYK8km3k6Ry6n8anK2ufLY/Q==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
 Abhash Kumar Jha <a-kumar2@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: cadence-torrent: drop cdns,num-lanes
 default value
Date: Tue, 24 Nov 2026 17:11:25 +0100
Message-ID: <UlYYmHSPRwOwyW5SQXMI_w@bootlin.com>
In-Reply-To: <20261121-favorite-turtle-of-penetration-c3157f@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
 <20261121-favorite-turtle-of-penetration-c3157f@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_161152_341377_EE85F7B6 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -0.2 (/)
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

On Saturday, November 21, 2026 at 5:19=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:50PM +0100, Benjamin Robin wrote:
> > The driver treats cdns,num-lanes as mandatory and refuses to probe a PHY
> > sub-node that does not provide it, logging:
> >=20
> >   No "cdns,num-lanes"-property.
> >=20
> > A default value in the schema wrongly suggests that the property is
> > optional, which it is not since it is listed as required. Remove the
> > "default: 4" so the binding reflects the actual driver behavior and the
> > mandatory nature of the property.
>=20
> No, that's a bug in the driver introduced in 2020. You ignored the
> background and history of this driver and DT bindings.

Hello Krzysztof,

I was not aware that this was a driver bug introduced in 2020. Series [1]
made the "cdns,num-lanes" property required in the DT binding back then
(see [2]), so the mismatch has been there for six years with no one
complaining so far.

Two options (I have a slight preference for the 2nd proposal):

1. Keep my current change: leave the property required and drop the
   misleading "default: 4" from the schema, so the binding matches the
   driver's behavior.

2. Restore the previous behavior: make "cdns,num-lanes" optional and
   default to 4 lanes again, fixing the driver regression introduced
   in 2020.

Which one do you prefer? If you consider the 2020 change a regression,
I can fix the driver instead and make the property optional with a
default of 4.

[1] https://lore.kernel.org/all/1600280911-9214-6-git-send-email-sjakhade@c=
adence.com/
[2] https://lore.kernel.org/all/1600280911-9214-8-git-send-email-sjakhade@c=
adence.com/

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




