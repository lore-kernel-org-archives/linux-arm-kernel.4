Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCD606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lhmqNF/1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=WRxd5AtB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AVBjQGBWsRhbqtXGph3xAHQAvMR6+/rx3lfHXKGz6Zg=; b=lhmqNF/1Oj52j0
	kniN8a3K7SeaK34bNCjm19cQu8E//XKRBNIyEPbIvJzkgawr6N3sSwnb5HKy4817/raz76S6ro2BJ
	NtH8lpWQrl+RT1yQBX9ef2O7gvlMn36L0KSc3AS34cSELheSXmEyy1ABXRr3WmWMB8mZXwIGvUcUQ
	ZaIWSoiUPCQzLmSj3VX2zbod8+OAsxslmWiZ6VuXw0OU/92lvrvdz86a5b3jq76kF90x5KEKthznf
	t4oNmVDxHAFCSO85vqTgMOiKvAKBdWmC+lTvpht7fe+ugmoBSMIISWe6HRSsf5jltXKhGCENbYAQx
	uVJpDWLaaYEEUVSM0Fqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi8c-00000005XLA-3Mxq;
	Tue, 24 Nov 2026 04:28:14 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi8a-00000005XJb-2vqo;
	Tue, 24 Nov 2026 04:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795494470; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Mmyzwk889ELTgYQyLnf7ie8jjy9zwLTbLgJUa00RTIdusRvaHZj1ccqBPasAkbiyjUa9VIrpbuFklkJ9G1KEb1jeRkMrJ1gWmcJaZtYJ8j35N6XevM9UOYKc8ekSYa1Erue/sC2eb6pZaFf9BKPK+9rWICR4M2eQUgQ3kWUqeHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795494470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AVBjQGBWsRhbqtXGph3xAHQAvMR6+/rx3lfHXKGz6Zg=; 
	b=OU5/CiF5ZMGIYB2eLtEyBzkaWMWoftJ4jOayra0YFQDBAchPdhcFEPfxm7uI28dMW2Lavt0SmsD6oYFipSajAc0xvySgBflekGUI9A6xYhi+QwjI72thT58RwzW6f1YlcbWOIGxmj+1cJSJDdb7/EaQ7dnq9IHIql1dJxYAegTo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=WRxd5AtB7K/QZ5HA6TcTMeRxMrm9lkOu0AXdJVXxL5ufL41Or+X2EvopnuyJUto0wHFJKv3eHDqp2s6Bk26W2sbMaXCwtff+iP04gp2YV4sSi1DDWeJHJjB2xCEyzNAGbFEQ4VSdGxXrEFnZeQnUCR5J1RUx0Rn6mbVp+7fuxfs=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=AVBjQGBWsRhbqtXGph3xAHQAvMR6+/rx3lfHXKGz6Zg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795494469281732.244746746565;
	Tue, 24 Nov 2026 05:27:49 +0100 (CET)
Date: Tue, 24 Nov 2026 06:27:47 +0200
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, tglx@kernel.org, linux-pm@vger.kernel.org, maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com, wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev, florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com, shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v8 5/5] net: phy: postpone PHY interrupts during sleep with MAC-managed PM
Message-ID: <179549408717.90858.144565102470528@iav.lv>
In-Reply-To: <179548270352.3135.4334710117066284426@kernel.org>
References: <20261123-b4-phylib-mac-pm-irq-v3-v8-5-e9f706e79614@iav.lv> <179548270352.3135.4334710117066284426@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_202813_020039_F615BB16 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

> in some topologies the replay here can still reach the MDIO bus before
> the MAC has resumed.

Yes, the commit message describes it; the patch moves this access
later, not earlier.

> Can this abort every suspend for a Broadcom BCM54210E behind stmmac with
> PHY Wake-on-LAN on a level-triggered line?

That is the level-triggered case the commit message describes: the PHY
driver has to restrict its interrupt to Wake-on-LAN in its suspend
callback. I have no such hardware; bcm54xx_suspend() is for a separate
patch.

> Could the check fall back to irqd_is_wakeup_set() for nested-thread
> lines?

The cover letter lists these lines as not covered. Enabling one in the
noirq phase is not safe: enable_irq() goes through chip_bus_sync_unlock(),
which on regmap-irq writes the mask over I2C or SPI while the bus
controller may already be suspended.

