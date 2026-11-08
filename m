Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC79606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QXToMIrk;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZL7T7561
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sORGFzRD8E4HzQkwXuFsiWbFglj3g8iaUxPq0zUsHdo=; b=QXToMIrkz2GDd5
	gGKEWAEjQdpSOwuA8qXlBEDGMOcoFyHo+UO93vvY1NhVIhotoQsDG5UBes3rMA4ca1ENWvwRa34vf
	/wpIf9ToPJvsfr+e8hN7drC7jpoVMDFRmbKz5jMdE7vR3xPa/IcXivoUH6+/9tMHFqYBYlzYtfxO1
	LU5bLlKulHR1M/wtuxZBcSjBnTmafYwe/l6rbwBUw9lBWS80mHgiPfcJgz61oIBLHKu83OFjk5PeP
	dhOnsH8SdQhfsP8C2o/OkHsB15FZQyhnblgUeXNA/i9e6SgoUB0ADscD9kAca6JkL1twBxqRjz6HZ
	oXT48JPxUpkeaZGtXjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3Zz-0000000GEig-42Q7;
	Sun, 08 Nov 2026 14:09:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3Zw-0000000GEiL-0y4U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:09:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07E5F1A1577;
	Sun,  8 Nov 2026 14:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B64B360025;
	Sun,  8 Nov 2026 14:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5ABC9103288D3;
	Sun,  8 Nov 2026 15:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794146937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sORGFzRD8E4HzQkwXuFsiWbFglj3g8iaUxPq0zUsHdo=;
	b=ZL7T7561Lu4FFwwsI7q0I9RZ2BQQlKh+5WelkTXTfY642Co5faUCOke7jxn9QZSQFt+Udr
	u2wQcYlfcdX9sC6fI0Tad2Qqu4QNVzH96Ba2zmocZovrYEfPzhp+KXZIU1jOY7WMmkvD2K
	1Kpu9W3Lk8G3sxablbgrJD3UE8iqyytlGBq2DlLMGC8i5rq99oI3iq41a+/GOqtzVMe2Q0
	Ijfu0iGvXv6lBraFURij0WGZQFy2eZNapHctiGgj1ukc0QNFBeABvS4da5liFp8ocP3WEr
	mE01PN2hwO1cEkzAWpBkqRqbt+woN1nVOQlAdiJmqMR5E1xyC6Z+DJYsoIv43g==
Message-ID: <864f2931-4eb7-45c5-b58f-23339eb3af11@bootlin.com>
Date: Sun, 8 Nov 2026 15:08:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: release MDIO node if bus data allocation
 fails
To: Wentao Liang <vulab@iscas.ac.cn>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Simon Horman
 <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108110231.315004-1-vulab@iscas.ac.cn>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261108110231.315004-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_060904_460829_91631D6A 
X-CRM114-Status: GOOD (  23.82  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/8/26 12:02, Wentao Liang wrote:
> stmmac_mdio_setup() takes a reference on the MDIO device tree node and
> stores it in plat->mdio_node before allocating plat->mdio_bus_data. If
> that allocation fails, the function returns -ENOMEM and the caller
> jumps to error_put_phy, which only drops plat->phy_node, so the
> reference on the MDIO node is leaked.
> 
> Release the reference before returning, using an error label so that
> the cleanup stays in one place.
> 
> The issue was found by a static analysis tool; the candidate was then
> audited and the fix was prepared with the help of DeepSeek and
> GPT-6.1 Sol. It was identified by code inspection only and was not
> triggered; this patch was compile-tested, not tested on hardware.
> 
> Fixes: 1a981c0586c0 ("net: stmmac: Make MDIO bus reset optional")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> Changes in v2:
> - Sorry for the very late follow-up to the review.
> - Use a goto-based error label, as suggested by Simon Horman,
>   instead of an inline of_node_put().
> - Describe how the issue was found and how it was tested, as
>   requested by netdev-bot.
> - Drop Cc: stable@vger.kernel.org: the leak is only reachable when
>   the bus data allocation fails.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 3ea16d618215..ded352afd103 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -356,12 +356,17 @@ static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
>  						   sizeof(*plat->mdio_bus_data),
>  						   GFP_KERNEL);
>  		if (!plat->mdio_bus_data)
> -			return -ENOMEM;
> +			goto err_put_mdio_node;
>  
>  		plat->mdio_bus_data->needs_reset = true;
>  	}
>  
>  	return 0;
> +
> +err_put_mdio_node:
> +	of_node_put(plat->mdio_node);
> +	plat->mdio_node = NULL;
> +	return -ENOMEM;
>  }
>  
>  /**


