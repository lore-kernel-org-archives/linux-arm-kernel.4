Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EA8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PRHQCLDB;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IKbczG5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=55skxeKZ9XJ2oPQI1dpQfpuUvuGaN5lAgogsDovX5xc=; b=PRHQCLDBT6ZN1D
	xn/OwsdBDW3Qg6xEpMqqNXVHYLmvTtUgLAGRkPfa1GbtwuPd8Xo/QsRzM4HQulPqdgRS4mBersLz9
	ibRd1s00XC3G645FjjwXm1cWKxlPhoVqAvI/7xZFG5lDnwnbzPQBNxBgMs3cNtoaE8E8RwIrmau1o
	/QtoHsa8vPnLoh5KxZsbSE/Ifu1EXQtqBw1hGyX+RqMBLsQ0k9YaXcJEVHwyoL3DrdToaQGtTtAVT
	1NyOqZk/Kuqp+pWOG6UY/JnBuxiTbi/acv11ZY4SOE1o44qPgu/ez+c5k4EiLAgj841LCRYwofaRg
	5MZI4Ck5EG3jIIlSH/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWlP-00000004AiH-1hL7;
	Mon, 23 Nov 2026 16:19:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWlL-00000004Agr-1jTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:19:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF1EF1A179F;
	Mon, 23 Nov 2026 16:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A044601E1;
	Mon, 23 Nov 2026 16:19:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1A9F11E6A730;
	Mon, 23 Nov 2026 17:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795450762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=55skxeKZ9XJ2oPQI1dpQfpuUvuGaN5lAgogsDovX5xc=;
	b=IKbczG5d7XD6KV38kQVObMWAt+QUHAu4ETZvLtVo8dmG+nqKFdURsuU2BF3jboRnqBluFz
	sNFBUN8uVGXLMTEUUbjdXddSnvGlp/3M/9jgO1ibnNXR53yTQhCk0EkGo2C3CMb7tvOATw
	oF88Uj9saaCklyMjkkDgrTICMVQ37/6Zl8LUUcW9Gb9DFJRrOgWmQvuc4KvWOmcOuaUrGB
	53rICNqC3tGVbboUCsXSOTMvHe3Q55HHeT3iAb48w+BnOTa2YEfK3jZ5A/UUTlW1AjgynJ
	sYu6pyW+Sx4gZAvvPbtiN7ZT4mWWf7ZRRv0bEtlBzpysxZ2iSdOKwYaFyH+ZLg==
Message-ID: <c4dfa9e9-6df3-4251-945c-b476d6c65fbd@bootlin.com>
Date: Mon, 23 Nov 2026 17:19:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
 <179544551937.3135.9976133356956488963@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179544551937.3135.9976133356956488963@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_081928_321394_E4759A34 
X-CRM114-Status: GOOD (  16.14  )
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



On 11/23/26 15:51, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Unserialized read-modify-write of EMAC_RX_CTL1 in
>   sun8i_dwmac_flow_ctrl() (drivers/net/ethernet/stmicro/stmmac/dwmac-…
> 
> --
> 
> net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
> 
> This commit sets the RX FIFO flow control thresholds in EMAC_RX_CTL1 from
> sun8i_dwmac_flow_ctrl(). With these thresholds, the MAC sends pause
> frames when less than 2K is left in the RX FIFO and stops when more than
> 4K is free. The new bits are set only when TX flow control is requested.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index c63f4d87de509..75c743dfe3483 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> 
> [ ... ]
> 
>> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>>  		v &= ~EMAC_RX_FLOW_CTL_EN;
>>  	writel(v, ioaddr + EMAC_RX_CTL0);
>>  
>> +	v = readl(ioaddr + EMAC_RX_CTL1);
>> +	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
>> +	       EMAC_RX_FLOW_CTL_TH_DEACT);
>> +	if (fc & FLOW_TX)
>> +		v |= EMAC_RX_FIFO_FLOW_CTL |
>> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
>> +				EMAC_RX_FLOW_CTL_TH_2K) |
>> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
>> +				EMAC_RX_FLOW_CTL_TH_4K);
>> +	writel(v, ioaddr + EMAC_RX_CTL1);
> 
> [Severity: Medium]
> Can this read-modify-write of EMAC_RX_CTL1 race with the RX DMA start and
> stop helpers?

Hmmm yes indeed, I think we can work around that by writing these FIFO
values in sun8i_dwmac_dma_operation_mode_rx(), just like we do in dwmac1000
and dwmac4, that way no race :)

I'll iterate and fix my typos,

Maxime


