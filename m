Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75750606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D/tSndOy;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=FAfZksCh;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=PkX+5e99
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VvTdIJHKuouRllvVwKtOQDRcHd3EzCa9wjhnYhHsdr4=; b=D/tSndOyoa3D74
	MzeHJWcy2x+Pz/ZbBojMkPxhwJumgVC/vHag7D3QZFOUxm7eQAxTPwFTfP0132OoxIC3jnvthrpPx
	xd+DSo6dRRqeaamOUzynlE71XbKESwOL/LxchWc1WwcrAS8/I7Oc9yH5NRK5COsJJoSyrdi+ddqNe
	KwchIsWdSsmWGBPeV5YCU5xjKqABJx9J7nVplEFPLvxc/EmHEhiawKcMnQS8s72tfGGi9oNX/6LBX
	EkDWNtIVfr/ty8O+V4V6iYCgsioPJ2W+MenMcFCrE1nxvxE3PkKmKV2JfgLbcAi44/sqwBMheB4YB
	W8N7EMwK/ak11/SA3kBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXINv-00000000mdU-1ERk;
	Sat, 28 Nov 2026 13:22:35 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXINs-00000000mcW-2rUZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872151; bh=wJ5lUs3BX7Bttw2LUpjz2R6r/7Wqq+5g9XMCrfdK2mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FAfZksChn70Qyi/QPP5lLIasiOVasEsTFPZS94+gerTyy2BcE59ph+aYEmPbMxyK7
	 3jRqzqoCY9+zlBaEQi2Juvl+EJ4KEsml6rwDtgHba1RknsLc1qWTDWtLp+/6erfXjt
	 rjqfLUEO84O/dRlQspecv0ElSyK/diHhPU/ff85aEKPFbsO3jfQZkRd1OebT4kRi8l
	 yo7LaLZAfYQV9l2yYiqDj/6g8+6RBfYD2pkzO4hyzSu7alK8u4FVa54zLoDW2mWkqF
	 lTeDQJUajhICKnoxTFj6i0s73ddqluth1ylmA3yNL7j3cT2EJvSGr8qsCbBv7Kg6wq
	 5H2bjtGxTppKw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0D729413E90;
	Sat, 28 Nov 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872150; bh=wJ5lUs3BX7Bttw2LUpjz2R6r/7Wqq+5g9XMCrfdK2mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PkX+5e99abrvKB/z+zefMqr6WvvmFBsdqOR4g8njOTpoxynYkOGijvfzx72kWq7u2
	 5YubRRtl3nBJqaXp1exwwufd8n3LjCkvS+EqdPbTZkS/hZgw60WuDU+FcLuSXgwLcc
	 V80Iqacu3bnO1FqtCVzOUHGgoHyXQP8jXoppDPQWzxXB6p+jbNT0ExmzUG3gjOfTcB
	 CdvXlNUunYH9As6QDPCQnHidJ2u0HN/9vAzAguT8RZ4ou85XEMPKCp+H6KjkVpntFr
	 yStOyHDbSdu6JomYvVm+5Aex2Sm+YiZt5belGu9KKWeE8NWkeA4S9ggDkmJMV6cYDC
	 RMCkS+g8lzrxg==
Message-ID: <f140988f-823b-43e6-a6b1-3356d5df5c5e@mleia.com>
Date: Sat, 28 Nov 2026 15:22:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dmaengine: lpc18xx-dmamux: Use managed DMA router
 registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_132231_076490_BF2EDAD0 
X-CRM114-Status: GOOD (  19.04  )
ln: failed to access 'reaver_cache/texts/20261128_132231_076490_BF2EDAD0': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_132231_076490_BF2EDAD0 
X-CRM114-Status: GOOD (  18.31  )
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

On 11/27/26 13:03, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")

The change is correct, but it should be clear that the fix does not
apply to the fixed commit:

Cc: stable+noautosel@kernel.org # relies on new API

> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Use devm_of_dma_router_register() instead of a remove callback.
> 
>   drivers/dma/lpc18xx-dmamux.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index d3ff521951b8..0c6758c53a72 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -166,8 +166,9 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>   	dmamux->dmarouter.dev = &pdev->dev;
>   	dmamux->dmarouter.route_free = lpc18xx_dmamux_free;
>   
> -	return of_dma_router_register(np, lpc18xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc18xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>   }
>   
>   static const struct of_device_id lpc18xx_dmamux_match[] = {

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

