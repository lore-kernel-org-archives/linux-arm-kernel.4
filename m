Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DF606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ah4b+9I3;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EoqZ9CD1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H7I8f7k1W+MvbLqlposU+ufKq5AqOagDbSY2Y1sQhYo=; b=ah4b+9I3hfEF3K
	jeUwlaZnSOdH7N2kbtwkjgoq2+r8yJIqyxWa4LT83+nHm2sz2L4/oebWqlrmW1zoBYgfre99XSKa2
	ztoGpq7I/b22fe6gW1I6AqEcprHfk40VyYcdzifYRFauOp84ouUhvc5qYkjAMYGa9Zm8UDI56PZml
	3jIEngYEtlhhyYLY11GadVzLpjoDlkazvlXEybqfoZBzZvGiLxe+KKq+M52PnPmQdJ9QsGqrAz9rn
	5M8HzfSIjZ4bZKIWHhZJofLhCL7NxuBySXxNg4AwrruFpToDlUSXIAhyEsVQd+D0ihZ0RTgmyuS1F
	86+2qvozp7ZMkVb7J1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAyi-00000001P1z-37Bk;
	Sun, 22 Nov 2026 17:03:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAyf-00000001P1P-2YpY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:03:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8513C69140;
	Sun, 22 Nov 2026 17:03:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE15260512;
	Sun, 22 Nov 2026 17:03:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BCF211E625D6;
	Sun, 22 Nov 2026 18:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795367021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H7I8f7k1W+MvbLqlposU+ufKq5AqOagDbSY2Y1sQhYo=;
	b=EoqZ9CD1O1jJLUCpBhJaK3m4W3bvoGrp4ru9CZrL9o7WMRAHjjLlnUE7+r8BwF22rneynC
	WXxAAv9xcUcdi4VKM5P9Wy6WLgdJzun1hchFDfQyF39pbTkzDCmWHDpiUNyWKrHfH2C2ra
	U1B01KRQMaF4WGEdE/mySJpDqReLjIbuuyQagWUPqiDNDI36BHUw5YeUgh/ZAShzrmOefx
	EmDcB2R6Lhd8k/h1qSWOCvLRz9T9z6HURaaJcHtLxymo9J61DCwaPyiyIzUn1YaI7cFn1e
	jaxdSf6p4VWweQThXDLffn5RKghX+a2EHV1Rd+i39Gw0YAilgegT95+LSCs/rA==
Message-ID: <5d0fb0b7-54c8-4145-819e-3cbbb9b253ea@bootlin.com>
Date: Sun, 22 Nov 2026 18:03:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when the
 probe fails
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_090345_806740_D27A926F 
X-CRM114-Status: GOOD (  15.08  )
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



On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> __stmmac_dvr_probe() enables runtime PM and takes a usage count before
> it registers the MDIO bus, but its error path undoes neither. After a
> failed or deferred probe the device never runtime-suspends.
> 
> Undo both, as stmmac_dvr_remove() does.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d1..4ebf4b625374 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_disable(device);

Note that in __stmmac_dvr_probe(), we enable runtime PM with:

if (!pm_runtime_enabled(device))  
        pm_runtime_enable(device);

And I discovered painfully this weekend that on PCIe (dwmac-motorcomm), the PCI bus
does a pm_runtime_enable on the device before probing, so here we'd have a mismatch.

OTOH there's no easy way around that. The proper way would be to get rid of that PM
handling in __stmmac_dvr_probe() and do that closer to the bus (so, in the stmmac
platform code for non-PCI devices) but lots of glues are currently bypassing this...

We're trading one unbalance for another one, but I'd say let's go with this for
now, and we can then properly deal with PM driver-wide.

Let's see what sashiko says too.

Maxime


