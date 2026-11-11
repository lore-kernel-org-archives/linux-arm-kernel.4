Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295AE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaYtiZnY;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Du1c83Xm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v1FQrKsL5f19EKemgEuMcNZOXhqO95k4RyWWOAZDF0E=; b=yaYtiZnYmthQgG
	0S6c3LgJbiimMfGIc6n19Inn8ELm9nLk6znx1jNOUz2I8fgbCogSkPGgXFf1RZBVxIWyDd/1akoAg
	mSekOmskeR/fDqNNWWpRCpAWalx2xU46eI/iOb3+HZBiq6sJS0/7JMkvqIG3d2GkPynHUZqme10cT
	vgPf0r/yUWy0iqrwORMgzLKY3uA7/FswDRCjWCAjzDjIAp3DeVr4Uwfb1IKSyBash4UYG9UGTRPtW
	h2U6FRB7fBOpKN96eNuPrmj5pUv5OnM1oqkQUFi18IxtOcOCDgNAn0+pQ0VOY3clUeLVAyf2tZy1E
	AuKCYAocEilj1u5ZGvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3bR-000000061tz-31Yx;
	Wed, 11 Nov 2026 08:22:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3bN-000000061tK-31xq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:22:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2691A4E4156B;
	Wed, 11 Nov 2026 08:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D65FA6017E;
	Wed, 11 Nov 2026 08:22:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 363D511BC1818;
	Wed, 11 Nov 2026 09:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794385355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=v1FQrKsL5f19EKemgEuMcNZOXhqO95k4RyWWOAZDF0E=;
	b=Du1c83XmXW4RTimL6RazFjOTZSXCRppgWXP+IdIvbn/X2D4IBE0iiaUsR3hh8xqLynNr9O
	lJN+MWtFrgRQ2HbY5V85hhJrn4QiBS63udBRm9KPD/dzTEf07yMMw3MlIbrYpufi0UQKR0
	5VkOJ+BbsNdT8upae4Ljl5ggK6neDz0ThfitQpvaQSnePUULFr9rp23f0Mz/fUN+Tq02Wo
	awcfcNdE0WGdpQ0yWSFbTZuJB3VAbIi5+E0NBYPc050nLuxflJnLQbqSjIPTXtzbRokQI7
	K6f7lgqYji2FffX9R/G0xRUPexgvQziDmVplapkl3keH32raQu2JRy3CJvDRMw==
Message-ID: <d3ba44a2-1692-4c18-a297-b04bf82c18d0@bootlin.com>
Date: Wed, 11 Nov 2026 09:22:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
 <179379704484.488856.2140619507341432623@kernel.org>
 <20261110091901.7080-1-magnusleatti@kernelriot.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261110091901.7080-1-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_002241_912551_5E7E7E8C 
X-CRM114-Status: UNSURE (   9.14  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/10/26 10:19, Magnus Leatti wrote:
>> Since RBU and RPS were enabled only for statistics, was masking them in
>> multi-MSI mode considered as an alternative?
> 
> Hi Maxime,
> 
> Tested that route on dwmac4 (YT6801, 7.3.3) next to v2.

Sorry I was away for the past days.

Thanks for testing,

RBU exposes the problem, but it's still lurking even if we mask it, it's only
a matter of another interrupt being enabled and we hit that again...

Let's deal with RBU separately, I'm still not clear wether re-masking it is
the right call, now that the counter works, people may want to use that :(

I'll send a V3 shortly

Maxime

