Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpiYUk7S;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=h3aKLKln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ycuAt8nWPqLFoRiGaSafeLgsWrIGk1PBMq6nncFMtF4=; b=hpiYUk7S+jojMq
	3nVKNHt1j+HBUYVVMwkS6nRxQjqbNSou8F5DKSeqIfab12e2eHdMUgkg1I7P4e4yBR57BbdDL8FtK
	M3D4Zj6+jeZO6A5CxcoXCLdpGqCS0U8gqPsxrZHSCRlZRKw6YGDLn1EqV+dvMGaDSyNkRbukO4jqk
	rcZe/pMdAky1lHALFdGdswHcxdUwkDU7eOR94EYHrDPHv3W/SWqslA5U5BBZFa8eSK/OLRIwFt4So
	PsxNpvD0gJaplVxbBvYeg1X/8CdNEwKQj+wFc1D7/hPp1QJtNjzrHGIkGcZrPjkm2KDdC1a4lQFyw
	TkIp38P9WzZwEOFINNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWe5m-0000000EAH7-09Ix;
	Thu, 26 Nov 2026 18:21:10 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWe5i-0000000EAGm-46Q0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=ycuAt8nWPqLFoRiGaSafeLgsWrIGk1PBMq6nncFMtF4=; t=1795717266; x=1796926866; 
	b=h3aKLKlndKZEEXf7Y+W2AdagGUR5CTzqTl08fGyrze1Qa34J3A+VQLDHDuFhKGSELpZQ2Zd6KUe
	NyltElsTxUZWE7tsMLkcqtqQAVvacdnVndub3KXOq70zLlFJ+LVQasrSqbgWf4CxQ2qyVDPoILUT2
	ofSiaPKwrj8eU+kn0gqWwJJs0ThyrbNv8SxRwTxfuCtE5Ts7YEJutGQ39AisHAVyUp2W5afi7AdhG
	mWrWCT2f9n5/cF6iuVqaeudm+IsRhWauCwcDCj1yNBiqauvEoeHL/lRa8z/vYwlQVuVBp2RFlP1To
	RtSWTDcURjJxZJL6zMRWf393tDasZjX2KeoQ==;
Date: Thu, 26 Nov 2026 19:20:36 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH v2 06/20] dt-bindings: sound: Document OpenPandora sound
 card
Message-ID: <20261126192036.6646c688@kemnade.info>
In-Reply-To: <20261124224300.519d8686@kemnade.info>
References: <cover.1795505160.git.hns@goldelico.com>
	<5c6f7deca16f70f1f19cb40c57d70e30068d6000.1795505160.git.hns@goldelico.com>
	<20261124224300.519d8686@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102107_051598_991BA4F3 
X-CRM114-Status: GOOD (  13.81  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 22:43:00 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Tue, 24 Nov 2026 08:25:46 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> 
> > The OpenPandora audio subsystem describes the routing links between the
> > OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio
> > codec, alongside amplifiers and power supplies.
> >   
> I think at least in some commit message should be commented why such
> an interface is needed and the generic sound cards are not sufficient,
> also as a starting point to recheck that later if these reasons are still
> valid.
> 
To clarify a bit what I am talking about:
there is e.g.

https://lore.kernel.org/linux-omap/20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev/

which might be one piece of the puzzle.

Regards,
Andreas

