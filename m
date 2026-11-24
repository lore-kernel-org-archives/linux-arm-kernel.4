Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NWund0hB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=PkRezWk3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4+V4dSRGnzJ/VnBrav+/YZ8i/rQ7LsI9He/HzxOZObo=; b=NWund0hBYO0+4l
	vhxQFVFr4k8BeiBaACmLROU2bDv2XnpUvqgee+oV6E+7ikbWKV+7Y8DIK4FvSnm5+VbZZVCOF4+Qk
	pnn9aDR742NZgX7ksXfOsB4j6tZMRLuhhVqdgXT6mh+01Zgh07hlc+q2GwXQ2mzsG+8yOm+8FvtEI
	0o4anJtGCBNS7JicQt6/EiQYo9JS+YVF/C9bD11dboaECfFPXyio0UDjMcyvetHKD4hCKdR7ugUS2
	bmycIY38WdZH1ZrVdmzJDGtJWtSWcIsC8pCwhaKxQkGFeDoxQAVyyN6KAq/UBxXgNRFNIKJ8TBMpF
	IJ2VkRhEhNN93eqBL5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi89-00000005X9C-13P5;
	Tue, 24 Nov 2026 04:27:45 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi82-00000005X8P-17YD;
	Tue, 24 Nov 2026 04:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795494420; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ENDkdvJleOPV+g1ulm2XPp2ajq+wL1ROaBUYZl4g/bYpinUNhffVai3/Sz964Hu0Y1JOrX8F8aeS8SJwRuGD9wem48XXslivjnw7KXU3n6aXcCnVbS8ePywwUovcJABvlZGqMOs8Emxia6bLiKig28e3xO0K9CrTg8LpcJRcJuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795494420; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4+V4dSRGnzJ/VnBrav+/YZ8i/rQ7LsI9He/HzxOZObo=; 
	b=fgFrYNl+nSlzp555z1gIy4JU5efaLRkASiLhr9bRV1aTzgfaf6fpd1SWR6Q7EZXKNldbxEa3p+4z6T5BHczCba5vBONaSksS2V/vT9Xcm97oTeizAyFc7Bmw2eDStBGuNyBxCyotbYWWIqcAn9GZQ7ZKkSY98UAWgWXXC5xSyrs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=PkRezWk39gKolyjHUxOIqzxoT9JZB1u2/1ecP74wq/KyGJ2t6sGkwZqAi527j6KumLib5Ftm0ySYy2+St6+DWpZ0fxLWz9nkbOxgs7vMD6/D5dtwK79ucHl4WT1/SPmOdxWxfnClUGnTem6iOlEc8c/wfg+4D0xB9hQO22/I/5g=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=4+V4dSRGnzJ/VnBrav+/YZ8i/rQ7LsI9He/HzxOZObo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795494419197698.9156739315267;
	Tue, 24 Nov 2026 05:26:59 +0100 (CET)
Date: Tue, 24 Nov 2026 06:26:57 +0200
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, tglx@kernel.org, linux-pm@vger.kernel.org, maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com, wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev, florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com, shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v8 2/5] net: phy: fix three paths that unbalance a postponed PHY interrupt line
Message-ID: <179549408687.90849.139754794817286@iav.lv>
In-Reply-To: <179548269886.3135.1487195148841555901@kernel.org>
References: <20261123-b4-phylib-mac-pm-irq-v3-v8-2-e9f706e79614@iav.lv> <179548269886.3135.1487195148841555901@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_202741_206487_20E45ADA 
X-CRM114-Status: UNSURE (   9.16  )
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

> Can a stale irq_rerun here turn a stuck line into an interrupt storm?

Yes, this is the first of the three cases the commit message leaves
open, and it lasts until this PHY resumes. Closing it needs to know
whether this PHY's disable still counts in the line's depth, and phylib
has no interface for that.

> Should this check use phydev->irq_rerun_line rather than phydev->irq?

Agreed, it should match phy_request_interrupt(). I will fix it in the
next version or in a follow-up.

> Is this PHY's disable still counted in the line's depth when this
> enable_irq() runs?

This is the case the cover letter lists as not covered: another user
requests the line before this PHY does. That the enable can also cancel
the other user's disable_irq() is missing; I will add it to the commit
message.

