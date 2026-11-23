Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A356606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xLba/lgX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAZVdFjD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OM5RiI5MPg9K/gV7t/uunDu6RnP3U/TYNj4L/SIdYKc=; b=xLba/lgXqnLNFocLsbVrfQRIMq
	QpQa+Yj0IouduIUs4OIueMUoo+0Kw0gANsPn/a6jP8da5hygsRvWGjNnw90z7lzYtjlcMzPxH/Gb1
	Jw4DTdU5tVS6sqtvYTgOHlFnnlch22d/KEsNQHVy6tNvfO74eAWxvfTKJWtCY3RC3FGIjtiPtldZh
	yLzP0/7CEn4AI6djm/lZvoSQHZlT7IMqb+5Fds1sV86pxs4jLrCOwj0nkGwngtzILAPOkVyC4Ka0M
	7k4W6PKZi1rMgaMp+GmMBKY1uyi34S0fG48oci6AKdwmd/vBehc7oXQmTQSt3iPTxFllQiaoeQalx
	LmFpas2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVOj-00000003nvj-2w3e;
	Mon, 23 Nov 2026 14:52:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVOi-00000003nvP-0pAT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 427EC6223B;
	Mon, 23 Nov 2026 14:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B739C1F000CA;
	Mon, 23 Nov 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445518;
	bh=OM5RiI5MPg9K/gV7t/uunDu6RnP3U/TYNj4L/SIdYKc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YAZVdFjDFEs0NzeNC9ZBFipCn50+OJD1FhfJDKJIG9+2Ye+6MuGT+5KOdWqzczomL
	 1vDrFJmuDqfKIM4Gihh3D7LyHgVFo5g3cwIzrwfsc6XD7VxKYi8AthMvCm+OvHVMaE
	 Y/tlkC8M5TpfIlLC3BoxgfdUQ20PB+5gFH5BmCxRCJhiyJ+7h2OacdXCsVX9jFzW4m
	 yijw7+N4MT0qDz5XVvjQtxr6wxytTWJ6agFqBBf5yikMZsadymw1KW2pH8Z/W6GwyJ
	 X7Ui+2IFY7ahw1ZYRShTIZRe1EHv7akMEnt2os4lmsF9e/BV/1SngxKXwJ6pK/UK1Z
	 V42Wjr7MN15Dg==
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 14:51:57 +0000
Message-ID: <179544551726.3135.4955672049699501900@kernel.org>
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c, the commit
  message for sun8i_dwmac_flow_ctrl() presents the change as a new…

--

net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately

This changes sun8i_dwmac_flow_ctrl() in dwmac-sun8i.c to test the FLOW_RX
and FLOW_TX bits on their own. Before, it only enabled
EMAC_RX_FLOW_CTL_EN and EMAC_TX_FLOW_CTL_EN when fc == FLOW_AUTO.

> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
>
> Allow enabling RX/TX flow control directions separately.

[Severity: Low]
Would this be better described as a fix than as a new capability?

Since commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific MAC
capabilities"), sun8i_dwmac_setup() advertises asymmetric pause to
phylink:

    mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
                     MAC_10 | MAC_100 | MAC_1000;

When pause resolves asymmetrically, stmmac_mac_link_up() passes a single
direction:

    if (rx_pause && tx_pause)
        flow_ctrl = FLOW_AUTO;
    else if (rx_pause && !tx_pause)
        flow_ctrl = FLOW_RX;
    else if (!rx_pause && tx_pause)
        flow_ctrl = FLOW_TX;

With the old fc == FLOW_AUTO test in sun8i_dwmac_flow_ctrl(), FLOW_RX or
FLOW_TX alone cleared both EMAC_RX_FLOW_CTL_EN and EMAC_TX_FLOW_CTL_EN.
Phylink and ethtool -a still reported pause as active.

There are two ways to reach the rx-only case:

- The link partner advertises only Asym_Pause, so linkmode_resolve_pause()
  gives rx_pause=1 and tx_pause=0.
- The admin runs "ethtool -A ethX autoneg off rx on tx off".

In that case the MAC ignores the partner's PAUSE frames.

Should the commit message say that this fixes that behaviour, and add a
tag like this one?

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")

That would let the stable maintainers consider it for backporting.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122144926.284857-1-maxime.chevallier%40bootlin.com

