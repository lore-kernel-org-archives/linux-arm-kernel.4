Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfyU9oPE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=M5X5HITu;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VsiAfvSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NYe3fpJiKO8+IsXNE3ip4kByrEDJ+wWHRmGWym8cbdo=; b=pfyU9oPEv+Yj4J
	t8LIkoYE3AgBvzfPjToqg0H5rd8UWnXg78RrUceIaHDirCtk9geW6WRXuskG+HSmSNvDAlFBJNcB5
	QcthLh+2u4s6VOVlpJmoeKc0iv8tHWhl0cMVlzeJgoFqcIGeMX5y77dOwGzhO4YedQMLA8GJpCFZW
	PVfOAhUou1zkRH7zWcBE21jRVM1LNpAMqsD4j4lZ2tJqs5cJa0rMf7IiENA+K4KHGy1/7bEkrvfi7
	yqx+0kvn1jc79UMLpbePWR0hl9aatlbuqwfUe6jEke4W61hlGrF7cew42zfDa5lWxcnnTThbKtwWV
	1BD3jxiesDopjSNGss9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeLQ-0000000EBsu-25FD;
	Thu, 26 Nov 2026 18:37:20 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeLN-0000000EBsV-2pMg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795718191; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=J991VfTQxDV9HXTqDDuT+ttE7+L8zYNJmnh2n0bg29QdlQHeh7ymOY3PRDHsj4eMwk
    2V54jEX5K5A0iGS/d3TLeY/9m5usQ+f6QTIw7JA2V2LKTr6LHhybM84kCHrNq/+bbQzC
    vr/+6TlCxGEOZUTZqbPZ7N5TT/g+fErVdMg2wtjN1aa01pb2QcICY8M4zoeVStyGpli+
    mLTMh3kUaY+P8AjwE9Lbr4aG0HLqtk4fQeg0X+hhQ/i8eylRqlm7LIbxg8gG2bBn8NxY
    80B91p8OMusb2May46qmf/XwiDl0Y0+tJKbGb01AAOkfRxQGbQ7ckvKNZgyzwLxSGjrb
    e6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795718191;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NYe3fpJiKO8+IsXNE3ip4kByrEDJ+wWHRmGWym8cbdo=;
    b=g+IoJTz89+C1jquOfbCbjYnlDDOlOBjCOpL2E2hiZHiLieighaXdcSq5J53Grkq0Qa
    wmH+MPtZ29jJSK/Pv7DhYKxuoWTheGFVqY+EUh06hU6/LO2fCKMhdw80zR8RJwMRtgHx
    pMSPwBL7/gQ+MKvrkUEafypzmB0iBK4bFezt0pCROLZSxOx6kBK4rUyf6TPk25hdmuh3
    xAJX1+Hdx0QKEkpfssen7eNs1GXxdz6921aMzeofB8OmMsRcMMyhxxNr9+X59EWvDnKA
    h9il8RiIeFS2zd7kfTupI34TwBOC9sQOYdSwKTnUo8PJCDkn2+MOZq4rxlLyvqSayVUx
    iFvw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795718191;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NYe3fpJiKO8+IsXNE3ip4kByrEDJ+wWHRmGWym8cbdo=;
    b=M5X5HITulfuTW6C706dwdeNdHxjT3tUE4Za+jZj/L94gV6qsfBCQ/I+1r7SCTdt1IJ
    5gxBwbYOxs1izTnJDyDVMwqKj8yP3qC8YTmc0U7fK72fILK8VGehvONy9BDQM5PbkQdx
    +KvsG1JYWm/hpJdX8EJ7NQPZmdj6j3sFIxXyPabDazYzV1zfq7PIePaX5vtna2+MMwph
    b3eCH9Tf4C0aW+olQTzEL6ypSXtMpM8MdR/brA1dDlmI+Jcb3HCfTjN+wnkeTyPnXiTX
    mv/TPdZuCoNDMuiY12JhjyojQ9Pkgcnw08nPzJiZzU5tlk9zcSuxYhqNZs6MaLqxtNsj
    Yc3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795718191;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NYe3fpJiKO8+IsXNE3ip4kByrEDJ+wWHRmGWym8cbdo=;
    b=VsiAfvShX038YzxMDGCBnWBKQXU15hM3/nec/5OEW9bdKrQ9KHQd68FEBeQVGf7Ad/
    cj633Nrf/Dh7UfLW9KAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSippbmsiNApeHDyjDkvgGuStcrkeTGFmktdrc"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AQIaTEph
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 26 Nov 2026 19:36:29 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [PATCH v2 06/20] dt-bindings: sound: Document OpenPandora sound
 card
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261126192036.6646c688@kemnade.info>
Date: Thu, 26 Nov 2026 19:35:58 +0100
Cc: linux-fbdev@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 linux-pwm@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 David Airlie <airlied@gmail.com>,
 linux-leds@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Daniel Thompson <danielt@kernel.org>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Roger Quadros <rogerq@kernel.org>,
 linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@pyra-handheld.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CDC9F92-70F4-43CF-BBAD-255D98465F64@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <5c6f7deca16f70f1f19cb40c57d70e30068d6000.1795505160.git.hns@goldelico.com>
 <20261124224300.519d8686@kemnade.info> <20261126192036.6646c688@kemnade.info>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3826.700.81.1.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_103718_000836_CA16F787 
X-CRM114-Status: GOOD (  18.18  )
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

Hi Andreas,

> Am 26.11.2026 um 19:20 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Tue, 24 Nov 2026 22:43:00 +0100
> Andreas Kemnade <andreas@kemnade.info> wrote:
>=20
>> On Tue, 24 Nov 2026 08:25:46 +0100
>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>=20
>>> The OpenPandora audio subsystem describes the routing links between =
the
>>> OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 =
audio
>>> codec, alongside amplifiers and power supplies.
>>>=20
>> I think at least in some commit message should be commented why such
>> an interface is needed and the generic sound cards are not =
sufficient,

I think there was a specific reason as I would be happy to remove the =
board
specific driver as well. But I have to check.

>> also as a starting point to recheck that later if these reasons are =
still
>> valid.

Agreed, that at least a comment would be necessary.

>>=20
> To clarify a bit what I am talking about:
> there is e.g.
>=20
> =
https://lore.kernel.org/linux-omap/20261123-omap-mcbsp-tdm-slot-v2-0-3e3aa=
e215952@telaak.dev/
>=20
> which might be one piece of the puzzle.

Yes, it looks like it may be a piece of solution.

This should at least also be mentioned and checked if if it is applied =
upstream to rely on.

BR and thanks,
Nikolaus



