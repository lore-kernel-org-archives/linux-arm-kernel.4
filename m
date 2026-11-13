Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F2606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lrXeDiq5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkNi0WJe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GjFNdrxT3EZFR3J6YnNd1f/Z2k934t/npf1oL+Xxd74=; b=lrXeDiq5sJdr2Fx2bZy19WY3j2
	hsMuxls/D7dP5OaZbJtY0M3/Heo6DTCbNVpaUBO/9vExtRHg55rNDQl8oU5CEZYAThx5lL5ieBhd5
	KxYxNxBG/0ahbKK3sb94T/cMXBJ+ldZCTJTEILb4QA9WWR9V2D2se5ugTJFFMVvl2Ee1u6MKQhi0e
	yWh+4njjMk/iWB17n1BOX9kw3we0zwY5hteKOVom3bKksdOjNCakg2MlD8aJ6ZnN7xKQrKbhQUNKY
	ojSrU3ngMUHvi9tA16GKGMMknjiKXYEg4PStlnHoBKuXqtjwk7fIGIcVFEnYqUkl8gQFdkHZhOcHC
	6opymHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkC9-0000000BisX-0mL7;
	Fri, 13 Nov 2026 05:51:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkC7-0000000BisE-3NWg;
	Fri, 13 Nov 2026 05:51:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DB6D61404;
	Fri, 13 Nov 2026 05:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117941F000C8;
	Fri, 13 Nov 2026 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549086;
	bh=GjFNdrxT3EZFR3J6YnNd1f/Z2k934t/npf1oL+Xxd74=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lkNi0WJeOwuHsOONt4kswun2pDApIBs0KFMSAwcGgXveBRLLWwsWzxZiBA+wmzVRm
	 aDXJz5A/WG+ht+rX6gAiKuUcIys5pvIHz/8YRLkgVnR+d3vXeNdO9ly1lcAzmvoUgL
	 750MWv3GfoMcL1A8aFvgbMO35MyG+jKdssBcJW0K2XqbPyWTYPVtro3PedEkB7txfa
	 S+csPzK/tfaFktsR9fkycsF0Zo3imP1STx+9L4YL1z22Jib8n8p1qrSdWZ3MRr2KBU
	 qjsVvgzJnMahByMt1sTaQD+OGz89baO2mADlxNS28Fg8/Mx5bQzrvn+ATWEROOYk/V
	 QT4rDzwwq0AbQ==
Subject: Re: [PATCH net v5 1/4] net: phy: move irq_suspended and irq_rerun out
 of the bitfield
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com,
 wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 05:51:24 +0000
Message-ID: <179454908461.2199510.508928890759611464@kernel.org>
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-1-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-1-bbfdb5afb7d3@iav.lv>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch adds the comment "/* Written without phydev->lock, so
  not bitfields */" above irq_suspended and irq_rerun in struct…

--

net: phy: move irq_suspended and irq_rerun out of the bitfield

This commit turns irq_suspended and irq_rerun in struct phy_device from
1-bit bitfields into bools. phy_interrupt() sets irq_rerun without
phydev->lock, and that write could lose an update to link and
autoneg_complete, which share the same word. After this change the two
flags are separate memory locations.

> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 21afc2082b174..bbe28ff97e51c 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -726,8 +726,9 @@ struct phy_device {
>  
>  	/* Interrupts are enabled */
>  	unsigned interrupts:1;
> -	unsigned irq_suspended:1;
> -	unsigned irq_rerun:1;
> +	/* Written without phydev->lock, so not bitfields */

[Severity: Low]
This isn't a bug, but the new comment states a rule that the
neighbouring fields don't follow. Several of them are written without
phydev->lock. They are still 1-bit bitfields in the same run as link
and autoneg_complete, and the state machine writes those two under the
lock.

interrupts, the field just above, is written in phy_config_interrupt():

drivers/net/phy/phy.c:phy_config_interrupt() {
    ...
	phydev->interrupts = interrupts ? 1 : 0;
    ...
}

This is reached from phy_request_interrupt()/phy_free_interrupt(). Some
PHY drivers also set it in their suspend/resume paths (dp83867, micrel,
marvell-88q2xxx).

phy_suspend() writes wol_enabled and suspended:

drivers/net/phy/phy_device.c:phy_suspend() {
    ...
	phydev->wol_enabled = phy_may_wakeup(phydev) ||
    ...
		phydev->suspended = true;
    ...
}

mdio_bus_phy_suspend() and mdio_bus_phy_resume() write
suspended_by_mdio_bus:

	phydev->suspended_by_mdio_bus = 1;

The commit message itself names these unlocked writers of the same word.

Later in the series, "net: phy: postpone PHY interrupts during sleep
with MAC-managed PM" adds another bitfield to this word, wol_phy:1.
phy_suspend() writes it without phydev->lock, and phy_irq_wake_source()
reads it.

Could the comment say that these two fields are split out because
phy_interrupt() writes them from the IRQ thread? As written, a reader
could assume the remaining bitfields are all lock-protected.

If any of those unlocked writers can run at the same time as each
other, or as the locked link/autoneg_complete writers, the lost-update
problem this commit describes would still apply to them. I haven't
shown that concurrency here.

> +	bool irq_suspended;
> +	bool irq_rerun;
>  
>  	unsigned default_timestamp:1;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3%40iav.lv

