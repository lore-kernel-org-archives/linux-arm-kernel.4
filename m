Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72D606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JbJLg7Rs;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vI11SneC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WwhwaYFJNMtPhT56t3rNjNOo+MK4UinclZfxdqo22ag=; b=JbJLg7RsEFUjSx
	XE8396XtXWvgwxz+OBz3V81LEy5EDMg9qp1k2v82LLrsbRZPavMl00ijUyqsdDzxCtWwF+v7yitss
	1Q3yZXpttlMkjN6oeRYu0QcF+QPKMk8apOnX1hMdVUVugpAowIwG3GBpq8WDeGtI5ZuR0XNfL/Obb
	RkUgo0sIH2xfC86Wn/uc6y8EXO/0574lR1ldcxavKzCfC+wteHAb4nzVgKEJNLKYl8M/GaaXXkAzv
	Tz4C7PcHGXSsKA0jjOETB71/kDLOlEHJBXJy2n7FmfOnFoyKIRLSD+whx9fn+TM54UKZ656/byPgg
	EfDLHxvc3kr740J4/KpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFbD-000000056UG-41CX;
	Tue, 17 Nov 2026 09:35:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFbB-000000056Tt-3Ffn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:35:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93C50C4EDBC;
	Tue, 17 Nov 2026 09:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 410EE5FC81;
	Tue, 17 Nov 2026 09:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18CF011BC0B8F;
	Tue, 17 Nov 2026 10:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WwhwaYFJNMtPhT56t3rNjNOo+MK4UinclZfxdqo22ag=;
	b=vI11SneCI57vK3QInTMJGFmCHhAx0leLQ4YOKCpOSQITmvWd+ijDWcMsdWsjwe4olDvKXG
	lJp6vHcNgfsAYJxHFIKAjUyZJopqKXIdt9Yko+ilDnz//erJz52amc8o9TGyqanFZ0/rdE
	d1WeNt4Uog1Cwm5T8A7opkjYz+Tus1i0LdB7ADk2ztleDz9d7yG20dJAt2gukKMI8LpKNU
	V/+umM5GnXCckLLfBcPOxL3AwE6Xz8+81LvUTp65dgQhOavHiH90OqrA9+m3E6q6WAlj61
	vs6Gh+caEYLNzCDzVE5RMMdEGKLg5on2sgGZgCyR9NVksik888lc7sYrsO4CuA==
Message-ID: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
Date: Tue, 17 Nov 2026 10:35:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: netdev-bot+sashiko@kernel.org, aiyengar1990@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179490321548.3136.12535368591168637116@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013534_004178_8E9A3573 
X-CRM114-Status: GOOD (  19.68  )
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

On 11/17/26 09:13, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The patch makes get_ephy_nodes() in
>   drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c return -EPROBE_DEFER…
> 
> --
> 
> net: stmmac: dwmac-sun8i: Defer probe when the EPHY clock is not ready
> 
> With this patch, get_ephy_nodes() returns -EPROBE_DEFER when of_clk_get()
> on the internal PHY node returns -EPROBE_DEFER. Before, it skipped the
> node and the probe ended with -ENODEV. Other clock errors still skip the
> node.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index 2ece7ba9dd73b..8163e49fa7ad0 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> @@ -801,8 +801,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>>  		struct clk *ephy_clk;
>>  
>>  		ephy_clk = of_clk_get(iphynode, 0);
>> -		if (IS_ERR(ephy_clk))
>> +		if (IS_ERR(ephy_clk)) {
>> +			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
>> +				of_node_put(mdio_internal);
>> +				return -EPROBE_DEFER;
>> +			}
>>  			continue;
>> +		}
>>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>>  		if (IS_ERR(gmac->rst_ephy)) {
>>  			ret = PTR_ERR(gmac->rst_ephy);
> 
> [Severity: High]
> Does this deferral come too late in the probe?
I agree with the bot here, this defer happens after the netdev is registered,
which isn't great... And it's likely the PHY is on that mux'd bus, no ?

Was this tested ? Doesn't it really work to return a probedefer so late ?

This mdio mux logic should likely be reworked so that we register the mux in due
time (i.e during the mdio init sequence, may be by hooking into stmmac_mdio_setup
or something like that ?)

Maxime




