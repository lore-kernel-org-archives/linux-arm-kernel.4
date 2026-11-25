Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePGilaYm;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cgEfGQ43
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EZeIddDxt24rVimWv2GYDAtePnr1zfDgT9qisCJrRAE=; b=ePGilaYm/5kBJG
	wtQj89AvMVnDa6mh/56Bg5RwQFklHxe7lKaLsz5msLj66UmfxE7r/Rc9btQ4z74kRu7uE5qmNfszX
	vhmo3hNsmEywXjr9tP9RR+nl5fqcLPgC6GdWq7hvLxA4+KjEgJeYMfDN/rescI+Lg1DfKvAgioGGX
	N3MDJpOq/DBQNnikNECzdRdRjZSJOq3Lkl0iX0HH0PYJ/CyKOvDyWIl51OKGsK+uXW8iFNCccLHxO
	1wXenJ6RXO15AsTZemBhLQTzHZ5AZ3vT76WoMUNvRXs1cVe4OSU/9tg97INV3DJtLqsonC5q2nqnS
	ZZ2yn5XPOu76FUsl+3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW85B-00000008zDY-181b;
	Wed, 25 Nov 2026 08:10:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW857-00000008zCp-0rx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:10:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAA681A17DE;
	Wed, 25 Nov 2026 08:10:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76E3160480;
	Wed, 25 Nov 2026 08:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D2A711E69A4B;
	Wed, 25 Nov 2026 09:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795594215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EZeIddDxt24rVimWv2GYDAtePnr1zfDgT9qisCJrRAE=;
	b=cgEfGQ43D37X3Y47TvTD2Mgi35Eh7tmhpZFNQv+WFASJ1AzeUvt8/fGFK3HCVhWpsxJRXs
	L0kWy8ZLOtcRSjrs4KfdcXzdyjAiavoRWckmTTN8q2uBm+aePqbYvnDxeuiRfLLnTsWOe6
	4+2pZnwYF3Hda5PazDvAvqSWXZYk/Oic78DZgbo/7Gx7aga3OpwkdEfjNNDVG6CAFt+DRv
	ys/5dhJJSDJ0vIzQiNciChAi+NmE6UAXcCnEGTBeV8qZh6BhRrssildDx3EojMs4S0uQ85
	IaIlvRE+4mmORFaEziFloHa4q0BX4MjN1mhNxwsMcKRI4w4Y37D4R2FseICJTg==
Message-ID: <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
Date: Wed, 25 Nov 2026 09:10:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: Zxyan Zhu <zxyan0222@gmail.com>, romain.gantois@bootlin.com,
 cathycai0714@gmail.com, avifishman70@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <7732873.EvYhyI6sBW@fw-rgant>
 <20261125075716.2262174-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261125075716.2262174-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001021_389759_4AC2E46B 
X-CRM114-Status: GOOD (  20.57  )
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/25/26 08:57, Zxyan Zhu wrote:
> Hello Romain, Cathy, Avi,
> 
> We hit exactly the interrupt-storm scenario you discussed, on a local board
> running a PREEMPT_RT kernel, and I'd like to ask whether this series is
> still being worked on.
> 
> Our setup and trigger:
> - stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
>   with PREEMPT_RT and panic_on_rcu_stall.
> - Trigger: fault-injection of an uncorrectable MAC safety error, which
>   makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e. 
>   dev_close()/dev_open().
> 
> Symptom:
> About 30 seconds after the injected error the board panics with an RCU
> stall (rcu_preempt detected stalls, rcuc starved).
> 
> Root cause (confirmed on-board):
> - The main level-triggered IRQ storms at roughly 820k irqs/sec during the
>   reset window (irq count jumps from ~220k to ~23M in ~28s).
> - stmmac_interrupt() returns IRQ_HANDLED without clearing any status while
>   STMMAC_DOWN is set -- exactly the "unconditionally returning without
>   clearing any interrupt flags" behaviour you flagged as dangerous.
> - The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
>   grace period never converges -> panic.
> 
> This matches Romain's point: the unconditional early-return in the
> STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
> watchdog.

Taking a step back, I wonder if the right move is not to just get rid
of STMMAC_DOWN entirely.

It seems to me that it does not protect stuff that much, reading the
different sites in the code where it's used... It just seems to cause
more problems than it solves. All of them work without STMMAC_DOWN
if I'm not mistaken.

It's even misleading, as it's only set during a reset from the service
reset subtask, while most of the callsites seem to assume this really
means 'interface is down'.

I think this is the better lead to follow there.

Maxime

> 
> Fix we validated:
> disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->state)
> in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
> during the synchronize_net() window.
> 
> Results: irq count peaks at ~724 instead of ~23M.
> 
> Questions:
> 1. Is anyone still working on this series, or should we revive Cathy's RFC
>    with the evidence above?
> 2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
>    window" be acceptable, or do you prefer the more general approach you
>    suggested -- wrapping the STMMAC_DOWN set/clear in a handler that also
>    disables all interrupts?
> 
> Best regards,
> Zxyan Zhu


