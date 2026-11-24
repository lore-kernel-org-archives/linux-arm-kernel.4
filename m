Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HNOranv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Eekg1VTb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vuetuOMcXl7Z9VetHlJKUvaUZnnt7YAI79ma6kC/W1M=; b=3HNOranvo7N6tD
	aylGQV0Y8SG105SGjhp6ZJb4rNz1oYgU00+0tFpIVozLFAP1Xi6k1YA7aprbhpxTghhCnUlaVu/Ug
	QqfsstwAfGgS1r0r3IZR7yp1QVuxcltBBJArH2UP/pnlawcuJnyE/s1rjNetcQbtPW6si0F6ugxbC
	MhmOWZU0JJ9H678Xh7DH8Lquq6M775qhY/Md9gJXLb7tSBEyUAIZQf619JLcsS45kGi5pkdY6aQP7
	rGO5jho0wk3PfY65y3RDja3ALBRewYq6Z8uAb8K68qcj2MUpvSBoM6JtQ3+LV1hyNR1JTQTI8elCu
	qXm3rOytZ7THtyXD2JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi8L-00000005XDQ-1o6k;
	Tue, 24 Nov 2026 04:27:57 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi8B-00000005X9T-0msh;
	Tue, 24 Nov 2026 04:27:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795494443; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Cr1Rs+QodrLqQQ20hcMUtR7OGvnCP5i0DEoyl4qdrHQd7lrieXsl6gJ7cMVHwyuKJUWL0SF24FJpIr+h5xzL8lbvCRi0PkJoU0JGqOepBz1f43uvI5tsWVt4Lm5vRkVqNAyda2il7VTDbD/rv4WXgA+cz/shIf+kl9VRbTMMCMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795494443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vuetuOMcXl7Z9VetHlJKUvaUZnnt7YAI79ma6kC/W1M=; 
	b=T2/Rr/7HnJ2gG7bzZcVE/01JzR07zi8t9YLg0pEeZOC1ehE5eiUor1gTSFGsf7ZjLjvYdo/UipOQaGEzO7jZIEpThyg06kEKmtM+cXQzn/UlHek7LsOpygaN/klwy5UfmScVKLYxWP0xkKWfGe9qdzayl3tjnp4KXky+8f4j7zM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Eekg1VTbLiA3RT5+LuRlMnci8jA7g7lxoiL0RFN0JBFtn5He01n3x5e/A0nv+RzdplzEX0HKgQ8WxqXC2mycPrD5U0+O4F05Y+5Lp7aVKv0xNHQQl+a8S4p9MGeR4iuWqDN5+lcs65ovS0hoS0CsARDAaJQgv4YBEsbL15L+os4=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=vuetuOMcXl7Z9VetHlJKUvaUZnnt7YAI79ma6kC/W1M=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795494441932964.2980390085781;
	Tue, 24 Nov 2026 05:27:21 +0100 (CET)
Date: Tue, 24 Nov 2026 06:27:20 +0200
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, tglx@kernel.org, linux-pm@vger.kernel.org, maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com, wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev, florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com, shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v8 4/5] net: phy: run a postponed PHY interrupt handler directly on resume
Message-ID: <179549408701.90856.922626687148@iav.lv>
In-Reply-To: <179548270110.3135.13757603939004535921@kernel.org>
References: <20261123-b4-phylib-mac-pm-irq-v3-v8-4-e9f706e79614@iav.lv> <179548270110.3135.13757603939004535921@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_202747_509637_9A6B0AD5 
X-CRM114-Status: UNSURE (   6.42  )
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

> Can phydev->interrupts reliably tell us that the PHY still has its
> interrupt requested at this point?

> Is this read of phydev->interrupts really serialized against the write in
> phy_free_interrupt()?

Agreed on both: some resume callbacks set the bit again, and it shares
a bitfield word. I will gate the rerun on a separate bool that only
phy_request_interrupt() and phy_free_interrupt() write under
irq_pm_lock, in the next version or in a follow-up, and update both
irq_pm_lock comments with it.

