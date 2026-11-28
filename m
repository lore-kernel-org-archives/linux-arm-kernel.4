Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9VlRUrf;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cZm5m9xfo4Jb6pFNmztBRasuevWqhbDWf7mk78V/z2E=; b=h9VlRUrfhybpu4
	zksWeadHmO6Fx4oA82bbFQFi1cE6XL9c27+vrz3IY0JnyyaDfLAP041rDNIfM5NzdFXHbaqJ9Gway
	T6TuuApiEPBdz2evM0P2bVdaM0NbAx+e9o+F9KaIM9D2n+7hBxM5LkTq+R2IxH84r4R+pz46nQWog
	R6ED7+0OpZFmrbhuCN9oj0Xx+3nlLCbQxr9mc8DjSI6ThTGq/a/29rca9ZC0RUy+kv7DydFSypZwT
	bJKnq951MNl0g2M7bS+ka9cQ9Ua63B3VigOO15EjqcbYTNS3uDRyqsx49PFONbYTOdu2b2ZOh3Rl3
	mKiaLRpZHzcAZ+8VASFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIJx-00000000mRB-2kGW;
	Sat, 28 Nov 2026 13:18:29 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIJt-00000000mQm-12Ka
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795871901; bh=WKJMErkZW4DjO8u8iHFA3D1mfv7gzRSJwYlysqbmBQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJz2+YO8p/n7CfrdNuZwMovzpkkjRdxUNllt2Kk0WMm0OnLnsAJQoLgepWWvSMTyE
	 iCnoVFjNkGbwr4sx8orjoxPQeC5DDUa3A14qB+bnGNU0LaCkBtKa3kgY0HgBpmLQMD
	 KDYmoRisOuruOqsvJ1kA52PXKoAJdNfRfLCXVgVf4eJrhghouEf51gUyelumznWDAX
	 35Hv6rR4cL+ihiGXi7tlsIIuQsaV3bdiA/VqSrokuG3r2lqm+DJ+o10f+B7owikeQJ
	 9kX3wDAvDCpEmvxAFuScPeMnhmoWrIbr2EoYlu/xJKkeFnl61rCILCPHoOdHktaPxd
	 fp374iyOio5Ew==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id D9B93413E90;
	Sat, 28 Nov 2026 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795871901; bh=WKJMErkZW4DjO8u8iHFA3D1mfv7gzRSJwYlysqbmBQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJz2+YO8p/n7CfrdNuZwMovzpkkjRdxUNllt2Kk0WMm0OnLnsAJQoLgepWWvSMTyE
	 iCnoVFjNkGbwr4sx8orjoxPQeC5DDUa3A14qB+bnGNU0LaCkBtKa3kgY0HgBpmLQMD
	 KDYmoRisOuruOqsvJ1kA52PXKoAJdNfRfLCXVgVf4eJrhghouEf51gUyelumznWDAX
	 35Hv6rR4cL+ihiGXi7tlsIIuQsaV3bdiA/VqSrokuG3r2lqm+DJ+o10f+B7owikeQJ
	 9kX3wDAvDCpEmvxAFuScPeMnhmoWrIbr2EoYlu/xJKkeFnl61rCILCPHoOdHktaPxd
	 fp374iyOio5Ew==
Message-ID: <46b5102a-4448-439c-b9c9-f6b17fbe4d43@mleia.com>
Date: Sat, 28 Nov 2026 15:18:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dmaengine: of: Add managed DMA router registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_131821_913836_39289E2E 
X-CRM114-Status: GOOD (  14.17  )
ln: failed to access 'reaver_cache/texts/20261128_131821_913836_39289E2E': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_131821_913836_39289E2E 
X-CRM114-Status: GOOD (  13.26  )
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
> Add devm_of_dma_router_register() to unregister a router when its
> device is detached. Reuse the controller cleanup action, since routers
> share the same OF registry. If registering the cleanup action fails,
> remove the newly registered router immediately.
> 
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Add the reusable managed router helper.
> 
>   include/linux/of_dma.h | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> index 16b08234d03b..7f9198ea9627 100644
> --- a/include/linux/of_dma.h
> +++ b/include/linux/of_dma.h
> @@ -64,6 +64,21 @@ extern int of_dma_router_register(struct device_node *np,
>   		struct dma_router *dma_router);
>   #define of_dma_router_free of_dma_controller_free
>   
> +static inline int
> +devm_of_dma_router_register(struct device *dev, struct device_node *np,
> +			    void *(*of_dma_route_allocate)
> +			    (struct of_phandle_args *, struct of_dma *),
> +			    struct dma_router *dma_router)
> +{
> +	int ret;
> +
> +	ret = of_dma_router_register(np, of_dma_route_allocate, dma_router);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, __of_dma_controller_free, np);

I had to double check that of_dma_controller_free() also suits
of_dma_router_register(), and it is.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

