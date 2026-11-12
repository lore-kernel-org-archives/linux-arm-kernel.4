Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNPkJcE7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j+GrNe7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mgRO0VBWjRY/9EHbtSgQvAd+ddMpjekAAo3rcaJiw5U=; b=RNPkJcE74tHeWe
	GOB8I0YXxM5DXJPGpVeAsKGBdV2miWFROwWHayeDDCJX2Rqr6KS0GYHcVtgzQnWbEfW3sZfYq34//
	yrZMwKTFFEdpJ379/cRlE7cJdbtB7k3vUzYGBjLQI7J1pYSKt817hB2XrRRW0dYVfYCQUl8hmhvUZ
	zDFBuHNybm3LOo76UWfLIQzEZazuP9MmX1VyblOWaO5lX8fc6Hb3FI1tVWD5X9Kp+37899iLHYQt7
	pjvhT0H79MnoxS/UkMhHPduPuy+eJe4a7bL7hZvh65QBMNAsHcEmAWBE0DbINAHGFwN8/fGwJAYpt
	y8wb3ObwRDae42U2qisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaIn-0000000Aw6f-0pAN;
	Thu, 12 Nov 2026 19:17:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaIl-0000000Aw65-1joB;
	Thu, 12 Nov 2026 19:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C58DF41F4D;
	Thu, 12 Nov 2026 19:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0796B1F000C4;
	Thu, 12 Nov 2026 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511058;
	bh=mgRO0VBWjRY/9EHbtSgQvAd+ddMpjekAAo3rcaJiw5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j+GrNe7Yeq/1XBFJGG2GGi4w4nBOCjKTif4kT2vB8GzXwlBcSGwr4z3h1++5rg/Qr
	 gFnCgvJed7L7xWkXaYwde0T7vLhUjxjk8rxPn75sV/GGVaAldE8toCSDCb6R+xVm9u
	 FtwVNZPTKZgzNu1BKOKSzdWmePVOJLMU2KrbAL9xU0UMcxH9SEZa4tOvpBThqwsz98
	 YVpn8OsbyZgCtmhZNk671j7IRoTDMRZrRjc0zMdXQ7Otg1UhQGW8wSjein2bSnZL4G
	 m/UhbPxf+Cfu7l0MdXjc9A+wIEFeC2a7Mhm1sJzKJ4/oBo5ZMs6f2F/kQtFY0hCm5w
	 3MlS4o9/Ouv7w==
Date: Thu, 12 Nov 2026 11:17:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Lukas Wunner <lukas@wunner.de>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Wei Fang <wei.fang@nxp.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Paul Barker
 <paul@pbarker.dev>, Florian Fainelli <florian.fainelli@broadcom.com>, Doug
 Berger <opendmb@gmail.com>, Thangaraj Samynathan
 <Thangaraj.S@microchip.com>, Shenwei Wang <shenwei.wang@nxp.com>, Haoning
 Cheng <Haoning.CHENG@cn.bosch.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/4] net: phy: postpone PHY interrupts during
 sleep with MAC-managed PM
Message-ID: <20261112111737.730f8875@kernel.org>
In-Reply-To: <20261112-phylib-v5-sinfo-reply-1@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
	<179444109487.2168702.10631162542543162252@kernel.org>
	<20261112-phylib-v5-sinfo-reply-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 12 Nov 2026 01:55:16 +0200 Igor Velkov wrote:
> Patch 4 fixes a hang seen on Helios64 (dwmac-rk, RTL8211F): in s2idle
> without WoL the board hung or reset 10 of 10 times without the series.
> The PHY IRQ thread stalls its CPU on an MDIO read while the GMAC clocks
> are off, so that CPU never answers the NMI:
> 
>   watchdog: CPU0: Watchdog detected hard LOCKUP on cpu 1
>   After 10 seconds, these CPUS still haven't responded to the NMI: 1
> 
> Patches 1-3 fix defects found by code inspection and Sashiko review;
> they were not triggered.

please remember to add this to the cover letter

