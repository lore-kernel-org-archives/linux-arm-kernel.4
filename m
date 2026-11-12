Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D819606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2u03gL7B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3uIJDmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3qK75ks52nk2OhdqDIRGQrGiq6Cnz7HxfpZQKI/KNAQ=; b=2u03gL7BQMWtOU
	toS885gnpuD+P1dbwsRCf7s5chTNCym7vbdz3f3070Cgm1dApW7XAJi15qLwcU72LrTnaEKoeDwre
	U4G9ONepwgQrtbk8X1SKFiqQFDnul0jPkecoO5VNx+6pof3HlN5ysS559DiusGTunzAr8LfsYBxuf
	wAq6PpkLyyG8dfB5c1wX/LV1V8GEuiuNOqJCgv5YQpSb2btxERTgWHhLrkVU+CC21vLSp/nnUM5+P
	gprHwA43P7NGckchicvAhF8LTjK8HB9NkKNCl7+tGVGr8KLBYxdxIe1cTh5vdxKr+hrelNh/gT5hz
	xQHYo6/Dig1Waq5sE7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVK1-0000000A9ug-1UtR;
	Thu, 12 Nov 2026 13:58:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVK0-0000000A9uQ-0lGC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FCA442AF6;
	Thu, 12 Nov 2026 13:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52581F00A0A;
	Thu, 12 Nov 2026 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491915;
	bh=3qK75ks52nk2OhdqDIRGQrGiq6Cnz7HxfpZQKI/KNAQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Y3uIJDmVvCDh5voNMl19wu28hbwD1rXp14sZthY/q01Zk2uaF6DFEd131ALHyzC10
	 DihF5Xt+moRHhZjRQvA41Jeiprq3ljUHjeWx+M8cZcf5aWXewYNtmPpf64pHxXJZWl
	 ltOok2ej+oXTHLidcpZMc+aSo9rvEUipi2AKiJ+iMQkJK06QjYA5BYPi0qDzlOpE/I
	 JaLV7L4MdFVAKtT1LhMcebQOhegcEBgnGeprqhRgON13eEyfVI1gk5GcC14i+qDAch
	 YSnR9Jdjf5crPsROHeV0FuplwrFVCTsZsbdrqCVLXbC5BJAg1JaSIb0nT/p0P24kwb
	 EXopyZ/myjaKA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 6/7] clk: bcm: Add BCMBCA PMB clocks
From: Brian Masney <masneyb@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Ulf Hansson <ulfh@kernel.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-pm@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-6-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-6-17035a5e8ad2@kernel.org>
Date: Thu, 12 Nov 2026 08:58:26 -0500
Message-Id: <179449190684.1220086.2034099469330026473.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=626; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=7vI5ainOfrrxAECdVE4Ka6p8NFP0cAJd1sALUJmEwV4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+HmPJy+0ydnl+an6y7JIgz5tKZQ9NwnRFHHb/5smab
 O+zQd6zo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIm8zGH4H6fCddeBw/vGjX+/
 RfbXlS/XrPaVW2Uc67zr90SHQ9xvSxkZvh2/yrfn26z34k92CNyqP+1mJDft3ObnPxdcN578OJ8
 jgAsA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

> Add a BCM6846 clock provider for the Power Management Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
> 
> PVTMON and zone clocks provide gate control only.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

I missed that you sent a v4 yesterday and I left comments and a question
on the v3 that are still relevant.

https://lore.kernel.org/linux-clk/179440936574.1126566.13988760065429157595.b4-review@b4/

Brian

-- 
Brian Masney <masneyb@kernel.org>

