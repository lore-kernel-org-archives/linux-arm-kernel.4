Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D74606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltR4ukuu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJWQxbbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlZVWqmvZWHITNYiqbgfMr5wxDub7pUxLf4YfFXgD68=; b=ltR4ukuu86+D+iwWmFOhjJPDIu
	j+1NSZbv13WhXfJPduzw4/tHuLW3oDtTxB3uKQWcBAZhDqsU0KAnJpovHoeOe8jhiao465ANXXTlz
	Uo3zwAuu8srfg4V8gawxz6yI2MFnki2+Fzs/dY9oq0WYAVoa7qEVs7oA2cClHkz5co9ZpVNx/D+lx
	emSMZSEm64zCr0LiTV1V8wGAoElJyyIjIF+KfVeT2d+VUGUXJ7N8hNYkbrmgqMlSb2BfxD7dswGX5
	zG2q9nDG3weZZ1ygnpPWdc/gcimXz+HRLVGn4vInzD2u4bB9h/LiPAUFAbvkQb97s8TSOSN3I1OOl
	igbgKLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMpj-00000006W0X-1pRy;
	Tue, 17 Nov 2026 17:19:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMpi-00000006W00-0y7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:19:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A34FA408B1;
	Tue, 17 Nov 2026 17:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AA41F000C5;
	Tue, 17 Nov 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935941;
	bh=NlZVWqmvZWHITNYiqbgfMr5wxDub7pUxLf4YfFXgD68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KJWQxbbHQtVsO3ajxbSUqzgVmUczjQSHPjQfsKb+nWioITz4tpc8zjQMlCKp3PzR8
	 mJ9mcVHOTUHScyns9PW7aH7odcC1IHCExeMfF6pohSiOggohnsRQcJFeiQGULO/sxM
	 HQji3sGd6R0LJaveZry307kFNc4gHAwLTPt8E5CcTNqLGv5yURwmzONp76lHY5Wc31
	 v+oxNicTiVCQWzBitxEcKFFKQsJxip6/1i9gXQnl5yqD54IE1Fw7xkFq8vj/HQW7oW
	 P6kZW1YjAq/O41nKIW5kXvATbAizBFO47secTMpGlmvvnGkdf/xkYhf3kSRJmLt+LK
	 Rox9DhfKXD+BA==
Date: Tue, 17 Nov 2026 11:18:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	William Zhang <william.zhang@broadcom.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-hwmon@vger.kernel.org, Kursad Oney <kursad.oney@broadcom.com>,
	mfd@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anand Gore <anand.gore@broadcom.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
Message-ID: <179493593878.2709317.8975088229427570809.robh@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org>
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


On Tue, 17 Nov 2026 00:47:53 +0100, Linus Walleij wrote:
> Describe the BCM6846 Power Management Controller complex and its Power
> Management Bus, including the power-domain, clock, reset and PVTMON
> providers. Define the clock, reset and power-domain IDs used by consumers.
> 
> Keep the complete hierarchy in one schema so each child is validated
> once through the PMC binding. Include the combined XRDP, Runner and WAN
> power domain and the zero-cell PVTMON thermal sensor.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 238 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 +
>  include/dt-bindings/clock/brcm,bcm6846-pmb.h       |  42 ++++
>  include/dt-bindings/power/brcm,bcm6846-pmb.h       |  12 ++
>  include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  11 +
>  5 files changed, 311 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


