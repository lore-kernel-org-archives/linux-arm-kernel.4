Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3E606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=djdp2EYc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pmVcnvAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YB3wzJxxHDHi23P+//gC1AV+iO0J/fjZ+eovqPNBwYA=; b=djdp2EYczO+v10
	qgC3KnJjr1EGRAMM3mi9BGRDA5M1Agz628urd8B/Hq0x4Y7tflzQ41Und5ym5+O6nxRwETRqG9FC4
	H969tKf2jZFrVAxhz/pesWD+8M/8lCqk/X+OMMr6EZgt4ozPWKAW7piSNVfsLu0lHEZTiGD4Q8vGe
	mCXJ6gDsMw9lh5rjJE/qtQ9pSCr7KJA7rM5TdXoZwwnXXN1NqNOnNuwO8WzIR2LjpqybWRCyaHbzp
	7691TYgxQLJXldZVJRWNN0XoMxH9z3MRq/XO4WwWA6qK4YpTOOkfE9yoSwiWuT9CKTx6OYcSJPFWm
	F6qm5BD9fBVKIs20+cqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWb8-0000000CjAZ-2l14;
	Thu, 26 Nov 2026 10:21:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWb4-0000000CjA4-2tpZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:21:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F7B44E41799;
	Thu, 26 Nov 2026 10:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A82760237;
	Thu, 26 Nov 2026 10:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B438211E68598;
	Thu, 26 Nov 2026 11:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795688454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YB3wzJxxHDHi23P+//gC1AV+iO0J/fjZ+eovqPNBwYA=;
	b=pmVcnvAdBlby3lhBVtVzuDtEQLF1hCM4Aizt/91F8Yjpmr8T+0TgMHD0rCk/d6cJS/wkUo
	oJtNkt3fpNUAb/E6WwJYBykOwgQUwUpogW46AxsssrZ5hDAv8CT9HNH0730k8SiybPLmdH
	0PbOd9YnzbknCGGvZX3m4kbbL1s3vJXEmlWkrPWLksq4AzKdEjo+N7NEwR3N/Y1WHaSmxx
	6XxIY5ikUIgYDU/pTZ7e8i/eZTZ701r34zw6/7ROZnXo0hqrr4VHkP7A9wKsF3dpTERtg+
	8M/1mDxKn2whFEZywyT7XJitLgSiQzeyAMoRCC4XZx1jV+kilYOgCl9i0ZveSA==
Message-ID: <652a5de2-4c63-4e0a-9af0-f968cae730fd@bootlin.com>
Date: Thu, 26 Nov 2026 11:20:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Drop received MAC control
 frames
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_022058_902259_CFA4F046 
X-CRM114-Status: GOOD (  18.24  )
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

On 11/26/26 10:56, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> sun8i_dwmac_set_filter() sets CTL_FRM_FILTER to "receive all control
> frames", so every PAUSE frame reaches the stack and is counted in
> rx_dropped. Leave it at 0, "drop", as the Allwinner BSP does; the MAC
> still obeys PAUSE.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This shouldn't go to net, this is fairly harmless.

> ---
> Tested on an Orange Pi Zero2 (H616), net/main, MAC loopback: TX still
> waits 32.6 ms per PAUSE; rx_dropped per 20 PAUSE frames 20 -> 0.
> Claude (AI) helped find the cause and write the patch; I reviewed and
> tested it.

How ? For me on H2+, mac-loopback with Pause didn't work without this series:

https://lore.kernel.org/r/20261122144926.284857-1-maxime.chevallier@bootlin.com

What does the "ethtool -t" flow control selftest report with this new patch ?

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..f669bf22b7dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -192,7 +192,6 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in EMAC_RX_FRM_FLT */
>  #define EMAC_FRM_FLT_RXALL              BIT(0)
> -#define EMAC_FRM_FLT_CTL                BIT(13)
>  #define EMAC_FRM_FLT_MULTICAST          BIT(16)
>  
>  /* Used in RX_CTL1*/
> @@ -720,7 +719,7 @@ static void sun8i_dwmac_set_filter(struct mac_device_info *hw,
>  	struct netdev_hw_addr *ha;
>  	int macaddrs = netdev_uc_count(dev) + netdev_mc_count(dev) + 1;
>  
> -	v = EMAC_FRM_FLT_CTL;
> +	v = 0;
>  
>  	if (dev->flags & IFF_PROMISC) {
>  		v = EMAC_FRM_FLT_RXALL;
> 
> ---
> base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
> change-id: 20261122-sun8i-emac-ctl-frames-186c03e03399
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>


