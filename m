Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81174606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTmq0Jp+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Yyo4rq6/;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=1qtHyBFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VOvOxD+X2UN2TPKpyy/Bqehaknm7Zlxsdy/UTJbgJig=; b=uTmq0Jp+xWdBk+
	B9AyaORSRbUWirsRoJvzWkLVcUj4+66RLDiKWP5Dk9eXEseIFIkestfE/PTonPxvmGH0HYeNu+3Z3
	tGdK9KpovT6XAwv1e34N4cu8mJoX2cqeKIll8+zzsyc7R4jqemEIjFgmn+TZnEjYVwlPS3E7rcDGo
	8SM8ALabdPFCXZXFRu+LpRdP/YdGSuVQRBR0bHOzDqOWK2oPkaabF+qualU47SXAyk/fNi2BU4rDc
	CbRFodwggTLw55MIiAA774Xb8an6OiDMo8k0zr7VVWlndddn3CDWkYn3DI/SXVp0pkqG0bAH9e5QG
	+wTxUcFKydUzO2TyauZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrtI-00000006p4v-2ye1;
	Tue, 24 Nov 2026 14:53:04 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrtE-00000006p4K-02X5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795531975; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=g/cIfuSvnxAYfAhys804uSMHPLIC6kwHm+xMKmiYEw68c38kC1gWUYUxQlQILuRMIf
    tOjfaj+2dB9IeyoR1lRGmTzz7g7XLwuONdHdWOAP183qitv71J/ZlECt51703NteR+Wy
    GQuF6+/RwkJcaFfj/Hyq2zH3zSTYpvhn/Rmv3NeMPG2eXtVJuV/pLM+aw2109Vg6mpFV
    MUduMA72hNLHbFSMQX3N2JKUkgtPCU9/J7ezI2Xk+oQ4TlrjR89e8kmqCRO5WQ75V+Re
    oKz1G3D9tFOKeTxlNFRr3qUZGoUR3ol4QZ3GFqM5e/JE+ZiablI1r6VWej/7WwFUNtBw
    pn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795531975;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VOvOxD+X2UN2TPKpyy/Bqehaknm7Zlxsdy/UTJbgJig=;
    b=TZaaa20KgxxGxwHpYjVwTbYUZMXNcWWyBSHn1kW5lT+c9f8jUGNysT8A0tG/rUAAM9
    z+KRtPoAKkaqrdAL5M1v6GFBKx6+gL/7dep54lP05DxQgPT5Nu9asoR0HeSMpn2N0pVg
    qJQGN5VbHUlzkmn/y3JMtNFWQNUFkyEIxDw4dbDi4i49GObD/a3CfvwsLtaqe5zb+bNG
    6IgiiEsMGZkZS6ZQJeKYeJMyON5CUzk/I+6MFzW/mDkNMLDVJZsAdn8uM62FjO1jd38c
    oni9yZ5+wi+NAogFDdjaQ16fr5F/cttY0z12qvnNjCcC2PZ/XhfV7iAIxMnTbQwuZPSt
    21+A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795531975;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VOvOxD+X2UN2TPKpyy/Bqehaknm7Zlxsdy/UTJbgJig=;
    b=Yyo4rq6/shfcXzKH7+6iZ8MMjB75ix4XYXT2eiFbvlsR1IJ+y7Q5F4Xbc2jeTKaetG
    zs0xjo8mANrXIwVW0PUspqQJwC98JeCnJL1dXQ2zGOqQwgU4WFzxFoPeo/YDdQGlkN6W
    0TQiNMOpnzsaApPdBswb5K0LE01NLfhMVbIjFK9TETKELq9rT0JyEXNUaU22vRgcA+eu
    +NoRQs/pOORcquX8OZUmX3kyrX1kQDJ36FKmFe3F7OwZJZnbGKvjn6Y6UI1/HFdMlegQ
    T+CMaTx/u8IKoXbvBjHe2ObNQF2j//88OPRIYLELmWuIUjn+ssMB6sjLpVP4qMbCPDHO
    FUeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795531975;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=VOvOxD+X2UN2TPKpyy/Bqehaknm7Zlxsdy/UTJbgJig=;
    b=1qtHyBFy6/7v2jFCe9OBsp8/jDpSbBOvwY+AqMRUgkcVy2E0vmKjnhW9TBnwNEOltn
    FgeBMxxx1Qly5o6oaxBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVWUgMvoVkTTR2P7jtjQyY2AeEP/F"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AOEqs3gU
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 15:52:54 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [PATCH v2 00/20] ARM: omap3: pandora: Modernize audio and
 backlight to use Device Tree to finally remove pdata-quirks
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f31b5adb-f6e8-4cab-8d92-17645bf1b69a@sirena.org.uk>
Date: Tue, 24 Nov 2026 15:52:23 +0100
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA8DA6BB-6E58-46E7-98C7-5D32C098CD6C@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <f31b5adb-f6e8-4cab-8d92-17645bf1b69a@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_065301_896368_6F904DFB 
X-CRM114-Status: GOOD (  16.41  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,

> Am 24.11.2026 um 14:38 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Tue, Nov 24, 2026 at 08:25:40AM +0100, H. Nikolaus Schaller wrote:
>> PATCH V2 2026-11-24 08:26:00:
>> Changes in V2:
>> The series has been reworked and expanded from 16 to 20 patches,
>> addressing review feedback and issues identified during hardware =
testing.
>=20
>> Audio and power management:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
>> PWM and backlight:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>> Device Tree and general cleanup:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is dealing with several tangentially related topics over multiple
> subsystems in a single series, this makes it a lot less digestable and
> results in a huge series with an extremely large CC list and murky =
merge
> strategy.  Please split things out into separate serieses, even within
> the various subsystems there are batches of independent work which
> really do not need to be in the same series.

Well, they touch exactly one device, the OpenPandora which is the common
factor.

They are connected through partially common power management and the =
total
goal is to finally get rid of the ugly and old style pdata-quirks which =
has
been requested for many years but never achieved.

Another goal is to keep bisectability. Therefore a sequence that can be
merged independently is quite tricky and may reqire to stretch over =
several
merge windows but seems to be possible (at least ChatGPT pretends to =
have an idea).

I'll wait for more feedbacks and then prepare multiple series (may =
become
5 or 6) referring to this one.

BR and thanks,
Nikolaus




