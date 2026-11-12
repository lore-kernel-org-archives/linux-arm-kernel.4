Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BCao0Dqm;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=YD5jokag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HoRCw77ZwoLoLapCSKXoJHWwYpZwKjiCThC98/UXUv0=; b=BCao0Dqmj+i/J1
	HFSfj8+v+676X1vPPVlj9X1fuPW1oOsNXf9kFpNaR5StRv/QvULcc3KFA7ppFo3p0svhe2fj+JztN
	e4yMEG9qC0iPxH98JxY+BWO+Qzj/1vjmhoG9isE0607F5nR+54/50eF1lUGnqzP3b41WULYFi91ZU
	kvo+9RztDqyjmGl0Cykg0r0fKjbH6/B6cnDG/FVx4n0anw0pTlFNZ18LsiXJ2F6mT+yAH+TKbGdMX
	ruYMyprJh4JZxWF4W9EvZvxSMWaFFD+/QMU733sUtbOWMVG2iGOgjOAHqtAS4dUcJLXLEqyYrenz0
	e+SyqPYUVTtapV3XR2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRL5-00000009Pcu-0BGA;
	Thu, 12 Nov 2026 09:43:27 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRL1-00000009Pbz-320G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:43:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A19D9A1632;
	Thu, 12 Nov 2026 10:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794476594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HoRCw77ZwoLoLapCSKXoJHWwYpZwKjiCThC98/UXUv0=;
	b=YD5jokagYA6izzSHyGkcS07RAUIFMpS/3kZfLRecMVHQrBIxESaCOw5UZZviDzldV+gken
	awTT+Mo0KFXVOfSmLRia78oTafNSahzA5fenahWpog3hjufNnBTBNLZnHA/k9UNIBvFz80
	mPJIVm9z3nb/KvRjqWAUlzyEtndbl0+kKxSVCHVJGxxnQIe/EkRZJl0SQxFMNOnN4/bsFw
	q1O827qAbGguuQakCraEZ39UvyGjHCwR6PtFRFCmdxmNDMHv1PBeTVAjxdaOSEcbDaGlh3
	Ud5mkdUMFonKD3235XuaiyPDgwfdSzR6KuA9Kl/iYvolI3hILEN3V5ft4P0jrA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:43:10 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
Message-ID: <58be9817f150b4b67de284c68b3265dc@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_014324_232368_64938B37 
X-CRM114-Status: GOOD (  15.43  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 09:41, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 = 64 bytes and
> 01 = 32 bytes (H616 user manual v1.0, 6.5.10; 10 = 96 and 11 = 128 
> bytes
> as in the driver). The driver has the first two swapped.
> 
> The values are only used in RX threshold mode, which stmmac selects 
> only
> when the snps,force_thresh_dma_mode property is set. No Allwinner 
> device
> tree sets it, so no in-tree board is affected.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 47954537b29e..0c82662fbe6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -198,8 +198,9 @@ static const struct emac_variant 
> emac_variant_h616_emac1 = {
>  /* Used in RX_CTL1*/
>  #define EMAC_RX_MD              BIT(1)
>  #define EMAC_RX_TH_MASK		GENMASK(5, 4)
> -#define EMAC_RX_TH_32		0
> -#define EMAC_RX_TH_64		(0x1 << 4)
> +/* RX_CTL1 RX_TH encoding (H616 UM 6.5.10): 00 = 64, 01 = 32 bytes */
> +#define EMAC_RX_TH_32		(0x1 << 4)
> +#define EMAC_RX_TH_64		0
>  #define EMAC_RX_TH_96		(0x2 << 4)
>  #define EMAC_RX_TH_128		(0x3 << 4)
>  #define EMAC_RX_DMA_EN  BIT(30)

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

