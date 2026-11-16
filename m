Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95309606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WduRn5k;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=e77DMDMx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BKwH/iPsGpBgdjotukbv47/XMRavn61B5PvO9PeiRxY=; b=4WduRn5koP/REj6jQ3Uxnd7ZM1
	OLQ36mmYHT4k/iAxFJ3ysm3MgABG8Te92hlO4iy4z3U3QTQ3DSErhRd6APzb2cL6Inkd/WVTPlv4c
	9XeTNQCXXQsmoQ2EtoJj9caNYYbu1wWA9hHW1vVPxx98jKpgdg59sbcZ4f3lQu8K6GcSe5UBWs7/U
	jLAqlGIRTTUG/IiemMWPoP+lZx6KS7dO5DwNdTtgSK5mOl9HkQ4weEvcA5UQ/rGHwtF5QqmLVvNG5
	Nj/CASFnrJmW6TrQnvpxI1tLhwage6XJ2SsCT/RMZIuHm8ucPjijT7OdLDmewIO+Z4ZbjfytCBB3s
	APRr3DVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStSh-00000001rUa-0ISp;
	Mon, 16 Nov 2026 09:57:19 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStSe-00000001rTp-24TT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:57:18 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C930720059B;
	Mon, 16 Nov 2026 10:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794823032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKwH/iPsGpBgdjotukbv47/XMRavn61B5PvO9PeiRxY=;
	b=e77DMDMxYre+lT0XsCkBPm6hniRa/0AKlIuy3d+048vtiK7EOeN76xZGEXQV1xWz/LsEpd
	+Oq4JRLLrMpOXGo9Kay5U6gtFdYh4/MbSoL+uT/R8dBcQ4omhoWI04Uc0rxHrfxjgOvsGA
	MYDII28WbWKFPbgqpsmtF+ruObzviCmsJmyHManqwfsZbjxqzQZfsz+Qdxbixn+C6tgpsE
	nm/tY+hGooOvQV9Ib0TrB57BdQdMafeqeBr2DxEBZpX+iMMPSpWlg/z4HoaZuSGWvn4RBZ
	p1yO8mUBhURyaMmuXUo6rOj66b1oYq/kYCo1tEehZQXBugBW/JsE4l1S2QuOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794823032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKwH/iPsGpBgdjotukbv47/XMRavn61B5PvO9PeiRxY=;
	b=ZUruFCBkOh5XjH83QYSicDz/2wzBRnfd7CBdbuBGh03CddG9P4OMOam+bFujPXK1aUv/59
	0qcxKSIq1rSWr3KEms3Mhvx5F9K8lq96lnovSKWJVzgTbFbvcQeP0y6FiqUTjTU42wPdiu
	iozyjJ2zUgyfNfHgloQgH5DW1Y95yKdJy6HLNVkt060faWQoAx3iNj7AxWq9a+sU9Xut8i
	blQsULChDYFSfe52iuHM6GpfpZ83vhV9aNXf0LfzJk9NpT6NWGYuj9R8Qy5DO3JATSNVuM
	yHHPgoifue+MhG14SkNOV921ONcYGIaha7D/2uFgiUlIpz1wZY6SsUyR1bgUvg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794823032; a=rsa-sha256;
	cv=none;
	b=Sh4oh/QqUDxHSdEQodkdsbc4tb0Wo9LbXyM4Wgk32fnwZiAha1ikyFBqAhePPO9lDvN1kC
	AOUR2KKCfaS4lsd70Ss/g0NuEymuJlBuyeXaULg4S0IJCGSHa78xqRO+CrsL12FR6I4NzZ
	EYehOABDF594URR48QRRv6TIMkziWwjvHIBd+ldUqBwB2Md6ArbxNdImPEiwYp+aXi9tjT
	T8rIieD4Tkv56eOyd1gIeRmTykg26BzV4P5Ha2NzN5PRpTynmMLcrLymGO1i9JWzWdOtJq
	w4fZrI9USOQqyUBYy4JAkWVdC/pV+DeujrCMA99faBOZ2MWFX6KXaAwiW2ilLQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <2bf193a0353fe74cd2d2faf48528e40df00d36bc.camel@pengutronix.de>
Subject: Re: [PATCH v4 5/7] reset: Add BCMBCA block resets through the PMB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore	 <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Guenter Roeck	 <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Randy Dunlap	 <rdunlap@infradead.org>, Ulf Hansson
 <ulfh@kernel.org>, Benjamin Larsson	 <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org
Date: Mon, 16 Nov 2026 10:57:12 +0100
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-5-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
	 <20261111-xg6846b-bcmbca-xrdp-reset-v4-5-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015716_686703_D14EE76F 
X-CRM114-Status: GOOD (  10.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mi, 2026-11-11 at 12:00 +0100, Linus Walleij wrote:
> Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> Assert all blocks before releasing any of them, preserving the vendor
> reset masks and ordering. Provide the independent PVTMON acquisition
> reset as well. Serialize complete sequences and hold blocks in reset
> on failure.
>=20
> Consumers must enable their power domains before triggering a reset
> pulse (i.e. the cycle of asserting/deasserting reset).
>=20
> Suppress bind attributes: it's not good to be able to unbind the
> reset driver for the SoC manually.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

