Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C075606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RtIv3wrQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J8NDL01K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BIjsyfCAMtV7iYJZyUQnR/qSWRidGT61sCTUErFE8Y0=; b=RtIv3wrQx42zHzHhTsLgyeHLdc
	wdrhQia9347IYO56AaW4uik3Xa7pjsbEy+E6paP6CP8PGbPYdg10/xSSRaMY+C3zSBgL5WBhMe1M3
	QycL5Jtbj6ikH/ztMZ+AIxiZNpxPTR7NQ0470glR80SojXir4GZrZ2tp/HMBUmysdSvzybiMFCbEc
	c3NAiUwWTTuyYeI7iGTmG9rvGfyTB4ed3zve/DIQHRsZpMH/NKzNU3wCl2FSxMeHxNqpYfz/otvb9
	97K4Ov/ExB7L8K56qPh5Fh5vPJ9uHQNMeRpjE3bgM7171xvUsmsWeKl2foZYAb1F77kfCXu/lsTAj
	8JjinNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBlR-00000007Gju-0kAT;
	Wed, 11 Nov 2026 17:05:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBlP-00000007Gjl-12r5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:05:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5198F65435;
	Wed, 11 Nov 2026 17:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C233A1F00A07;
	Wed, 11 Nov 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416734;
	bh=BIjsyfCAMtV7iYJZyUQnR/qSWRidGT61sCTUErFE8Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J8NDL01KzKueCRrzIThmTcCU88ocXYyn4+kkLuTyba7c3VtJ14dFSHV8Fh1TqJVAU
	 FnEf3wgOPWM65xQN8GRR3PwDt5YApemSB1gz97EsPmL57pyi8zpjf3fJD+V+2PrzV2
	 PIVbUCJBFHML12Wozi5frrxK58PL/CPqMvJAzWiOixfvza7MrqYJRB/vRYkW+LBnb9
	 Pt2p4ITMbclSYQl4lleawgEnm5AdyBkvOW34tu8RR7b+wGPVO4dRywdX6yk/Z0VgSL
	 GFMyhxHgDiq+7QEeTAfQkhgTXutpxLur+Yye1yTuTLQfkIOvN0Q/eO3j7XCQIPxrqE
	 +JL7oz0bTFKaA==
Date: Wed, 11 Nov 2026 11:05:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Anand Gore <anand.gore@broadcom.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Brian Masney <bmasney+clk@redhat.com>,
	William Zhang <william.zhang@broadcom.com>, mfd@lists.linux.dev,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Kursad Oney <kursad.oney@broadcom.com>, linux-pm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 1/7] dt-bindings: soc: Describe the BCM6846 Power
 Management Bus
Message-ID: <179441673078.3717632.4630154111518612765.robh@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org>
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


On Wed, 11 Nov 2026 12:00:42 +0100, Linus Walleij wrote:
> The third generation Power Management Controller (PMC3) accesses SoC
> block control and reset registers through the Power Management Bus
> (PMB). Describe the BCM6846 PMB and its child controllers.
> 
> Add bindings for the power, clock, reset and PVTMON child controllers,
> and headers defining their clock, reset and power-domain IDs. Include
> the combined XRDP, Runner and WAN power domain and the zero-cell PVTMON
> thermal sensor.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> I considered even just using the PMB but the PMC has more stuff and
> it seems natural to let it live in a simple-mfd node.
> ---
>  .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     | 39 ++++++++++
>  .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    | 42 ++++++++++
>  .../bindings/power/brcm,bcm6846-pmb-power.yaml     | 44 +++++++++++
>  .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     | 31 ++++++++
>  .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         | 90 ++++++++++++++++++++++
>  MAINTAINERS                                        | 12 +++
>  include/dt-bindings/clock/brcm,bcm6846-pmb.h       | 42 ++++++++++
>  include/dt-bindings/power/brcm,bcm6846-pmb.h       | 12 +++
>  include/dt-bindings/reset/brcm,bcm6846-pmb.h       | 11 +++
>  9 files changed, 323 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


