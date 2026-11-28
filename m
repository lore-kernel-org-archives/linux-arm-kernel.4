Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F011606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Te3eDimd;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iznsA3tuh367bUtmJzfjdQpTwH0gqm+N+dnutb6NMMU=; b=Te3eDimdConan0
	OSsoGwZ+tJFmiFS0s09fV1l2mTn0p9vWEhdlPRPPleJLaHWQ/vRuZCdDOGSvzohSTl2kNsAjI5HZN
	ixBHgZ27QxY6XFkmklqOewZS8NaenLtfMH1GtFSPXt9rhq9JpOOpaK95WPzXg/ObIprXedN5J7ZZo
	hJAOSC/L6yj8EDqC7kUzlZAjhmXidisVhyiMwPK8EXteuaI+gqZT0w5HCxqejo49m3cR4R3R8MCzW
	LBTG9KVB/dvgRbiNub4WV+vClAjpHDr+Y6TCW6j4uVbmUNt6Lvbl1kMlq/9YMefLWTeYi2AChRVPg
	4PK0q4uRTmkjh9dxqkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIP3-00000000mjc-2PKV;
	Sat, 28 Nov 2026 13:23:45 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIP1-00000000mj2-0fqH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872221; bh=+TAdfg5T/qdwwjeCMT1NCNUY0OQwknykReIuv2qNOvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abQxF4DVceMvKEoTV1vVEmLD0jPpdmvAETeZnVb5JXQOA3Mp8D16cOM9A+GRyTjJs
	 gjnRsr5d7mNvD99ItYH+IE9l3w+KpfU72666IPHli7yaTdSE7lLgm5HQ8tuiNelxmZ
	 wSEUEpm35EGl3tgTJBIt4IHZky0IsUeScf2iS2KjQqsX/Nu1ZbtLgBKC1Y4+8bpsVo
	 G9q+Qg8SPStcIMa4hNTOaD93wNhINqup11YKuvE+xW+tWCZsDVYChi7m2PoG2/Tybl
	 RGCapeZnYQvbNeQYupj4MRPoMYJM89m1PM8nbku7xex8Z9tBLBUv5ImwbOROIyzhJF
	 mkdHudDmTJ0Rg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 6E175413E90;
	Sat, 28 Nov 2026 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872221; bh=+TAdfg5T/qdwwjeCMT1NCNUY0OQwknykReIuv2qNOvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abQxF4DVceMvKEoTV1vVEmLD0jPpdmvAETeZnVb5JXQOA3Mp8D16cOM9A+GRyTjJs
	 gjnRsr5d7mNvD99ItYH+IE9l3w+KpfU72666IPHli7yaTdSE7lLgm5HQ8tuiNelxmZ
	 wSEUEpm35EGl3tgTJBIt4IHZky0IsUeScf2iS2KjQqsX/Nu1ZbtLgBKC1Y4+8bpsVo
	 G9q+Qg8SPStcIMa4hNTOaD93wNhINqup11YKuvE+xW+tWCZsDVYChi7m2PoG2/Tybl
	 RGCapeZnYQvbNeQYupj4MRPoMYJM89m1PM8nbku7xex8Z9tBLBUv5ImwbOROIyzhJF
	 mkdHudDmTJ0Rg==
Message-ID: <7c224686-0a28-4fd7-bf41-980909623a5e@mleia.com>
Date: Sat, 28 Nov 2026 15:23:40 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dmaengine: lpc32xx-dmamux: Use managed DMA router
 registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_132341_467798_82B9E4F3 
X-CRM114-Status: GOOD (  18.81  )
ln: failed to access 'reaver_cache/texts/20261128_132341_467798_82B9E4F3': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_132341_467798_82B9E4F3 
X-CRM114-Status: GOOD (  18.51  )
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

On 11/27/26 13:04, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")

The change is correct, but it should be clear that the fix does not
apply to the fixed commit:

Cc: stable+noautosel@kernel.org # relies on new API

> 
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Use devm_of_dma_router_register() instead of a remove callback.
> 
>   drivers/dma/lpc32xx-dmamux.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> index 33be714740dd..3218be8e8eae 100644
> --- a/drivers/dma/lpc32xx-dmamux.c
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -180,8 +180,9 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
>   	dmamux->dmarouter.dev = &pdev->dev;
>   	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
>   
> -	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc32xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>   }
>   
>   static const struct of_device_id lpc32xx_dmamux_match[] = {

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

