Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2882606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yage55h9;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sVQy5hd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q+8+Qcc4d5ZANtBpb5U5j6S3mXMyfrM7UV1WqSNqxMQ=; b=yage55h9CHAKJL
	Ei322RkYQLsCzJjeAysW/M7Aza2uOb/O9ds+/o5omXGBap1opLS1wVGgJLC9gvpe4FhO8xvlq9C3g
	8n0hopjRTNTcRTsUZ1sdn1CeMVWQBNKCbyK+2vTeSYxeElXxjeI+hxZYGbrtsGlrRVdI3TMqCJsVN
	mKba8yqZXYvVj+NE7pw4EeOjiJmSixNpI4Wfbs8uJE5LimKaNp/rPcEAF5UjdcNzVGBUYDxhpJQvy
	7tD8JdpUlMtNTf+NTUk5KkuJUBL9pR7fx4CJKeFETLVCMNkGJ7+G8ms6w2pDbdIOY5OD+UkRgHkrO
	5nzKSmT3jrMdYUiWrfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEs6-00000004xIT-3Or9;
	Tue, 17 Nov 2026 08:48:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEs4-00000004xGv-1AjL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:48:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 450F54E4014C;
	Tue, 17 Nov 2026 08:48:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 181535FC81;
	Tue, 17 Nov 2026 08:48:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72BE911BC05B4;
	Tue, 17 Nov 2026 09:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794905330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Q+8+Qcc4d5ZANtBpb5U5j6S3mXMyfrM7UV1WqSNqxMQ=;
	b=sVQy5hd8INEq3tK8BfV4oagGw2sPV3PgOfFgl/Y34gyLjx7Qz78Jxdime+cfg6/8NCn3m1
	7nYs1N6Xy2diVwMqTQ1ahmWWGzBKu10H+bAwnnHg/QNqDmAv04oRVR4znKu8aS5xLFkrRN
	4uhzCQUL8jgc7Jz/IqX1df3M7YptQPSq57rDOQsXiwlXSzuuc7k+3Cx75NWAP33N+cqW0u
	SXblehz4p4ElzkY8iytWq+IzcPh+vHVJoSc/DSJWSppcmqUFNXr92llabgFV7grw9S7HpI
	pJPW0TCD6cVJJbGYALhrI1pImf4Iv18VkR+e1Cl1BN4+3XMJpZERDMRAJKNC3A==
Message-ID: <9a17822b-3e7b-4338-8663-7007d27daac6@bootlin.com>
Date: Tue, 17 Nov 2026 09:48:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 magnusleatti@kernelriot.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
 <179482516756.3136.16592047633231652675@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179482516756.3136.16592047633231652675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004856_458273_18A941D3 
X-CRM114-Status: GOOD (  30.37  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/16/26 11:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 (1) · Low: 1 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In multi-MSI (INTM=1) mode the patch makes the MAC vector
>   responsible for fatal bus errors.
> - [Low] stmmac_dma_err_interrupt(), called from the MAC hardirq for every
>   channel, adds another unserialized writer of the plain `unsigned long`…
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch adds
>   a new hardirq source that arms it.
> - [Medium] This problem wasn't introduced by this patch, but it concerns
>   how dwmac4_dma_interrupt() acknowledges status.
> - [Low] This problem wasn't introduced by this patch, but Loongson is not
>   covered by it.
> 
> --
> 
> net: stmmac: Clear DMA errors for multi-channel interrupts
> 
> This adds a DMA_DIR_ERR direction and a DMA_CHAN_STATUS_MSK_ERR mask for
> dwmac4. On GMAC4 cores, the multi-MSI MAC interrupt handler now calls a new
> stmmac_dma_err_interrupt(). That helper acks AIS/FBE/RPS/RBU on every
> channel and calls stmmac_global_err() on fatal bus errors. The goal is to
> stop the RBU/RPS interrupt storms seen on dwmac-motorcomm.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
>> index 43b036d4e95bd..a7caac3c98e6c 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
>> @@ -173,6 +173,11 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>>  					 DMA_CHAN_STATUS_TI | \
>>  					 DMA_CHAN_STATUS_MSK_COMMON)
>>  
>> +#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | \
> 
> [Severity: Medium]
> 
> This is a pre-existing issue, but does putting DMA_CHAN_STATUS_AIS in this
> mask actually clear AIS on 4.00 cores?

Pre-existing, this should be addressed separately
[...]

> 
> [Severity: Low]
> 
> Can one hardware event now be counted twice in the abnormal counters?
> 
> stmmac_dma_err_interrupt() runs this path from the MAC hardirq for every
> channel. The per-channel RX/TX MSI handlers process the same bits:
> DMA_CHAN_STATUS_MSK_RX contains RBU, RPS, AIS and FBE, and
> DMA_CHAN_STATUS_MSK_TX contains AIS and FBE.
> 
> The counters are plain unsigned long increments:
> 
> 		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
> 			x->rx_buf_unav_irq++;
> 		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
> 			x->rx_process_stopped_irq++;
> 		...
> 			x->fatal_bus_error_irq++;
> 
> Suppose RBU, RPS or FBE arrives together with RI or TI on a channel. Both
> vectors can then read the bit before either one writes it back. Could
> rx_buf_unav_irq, rx_process_stopped_irq and fatal_bus_error_irq in
> ethtool -S then count the event twice? The concurrent read-modify-write
> could also lose increments.

I'd say, this is both unlikely and acceptable for these counters

> 
> [ ... ]
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 25894771e9e9f..0bcbf837d9cc8 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -3145,6 +3145,22 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
>>  	return status;
>>  }
>>  
>> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
>> +{
>> +	u8 channels_to_check = max(priv->plat->rx_queues_to_use,
>> +				   priv->plat->tx_queues_to_use);
>> +	int status;
>> +	u8 chan;
>> +
>> +	for (chan = 0; chan < channels_to_check; chan++) {
>> +		status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
>> +						     &priv->xstats, chan,
>> +						     DMA_DIR_ERR);
>> +		if (unlikely(status & tx_hard_error))
>> +			stmmac_global_err(priv);
> 
> [Severity: Medium]
> 
> Can the per-channel MSI handlers consume the fatal bus error before this
> loop sees it?

This is also pre-existing for multi-MSI handling then.

[...]

> [Severity: Low]
> 
> This isn't a bug introduced by this patch, but Loongson multi-MSI is left
> out here. loongson_default_data() sets:
> 
> 	plat->core_type = DWMAC_CORE_GMAC;

Yeah I mentionned it in the commit log... The only loognson board I have (2k0300)
uses dwmac-generic and not the loogson glue, so I can't test that one, let's
see if anyone sees that hang on the affected platforms.

Maxime


