Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbOWiO0D;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KKgfGU4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DPgtUnPt8A2Ex4gPVPYsXkQVGxN0nieCp/+AS0RsgRw=; b=EbOWiO0DAaNEtz
	vFafvpy7lOAZu8+PLQXj8BWnLvD6LB3HDBqKSqAcSc2K05CorT21wL2HYyb+mU6BhulTIS0jj8An9
	OorbLRZxCI58BvG3Ve2bqlgZOcVr7ScoMqpo8olTqoOod4Wqwb0ryDdBJTw0HYrKgNbJ3OUHBxCzT
	BEhVATVi7PMjgWcWjWvcbi3dEfhX/og+ndmzJ9U4h9iif1Ou6AM9nKWsswkefewrYKddXh5itWYQX
	MNbeiU7YSUAbEbZtuSqCx6LVlQmkV9+smCr7sM7wks+DcKh37KGc2CaK4mlwEaYBn7pAYpK7CiE2N
	XV16/FI+w54XR1qaaSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUHn-0000000CKKy-16Tw;
	Thu, 26 Nov 2026 07:52:55 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUHj-0000000CKK8-2aWy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:52:53 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261126075245euoutp02db1aa5996a37a6fdbafca699c7b2c997~riQ0Lda8S1138511385euoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:52:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261126075245euoutp02db1aa5996a37a6fdbafca699c7b2c997~riQ0Lda8S1138511385euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795679565;
	bh=DPgtUnPt8A2Ex4gPVPYsXkQVGxN0nieCp/+AS0RsgRw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KKgfGU4XMr8bjSinXHAW9DLzalUCgCKOFZlrFuHucpVdilnQk62wv3U6upS7awWfO
	 UOd0JpOgVMu5qLUTdOl6hZYVHXOGBXbYlmyaahOAkslAgHVkiNgYBu1u08b2gNt0K+
	 iwTC1rjZufsBudqc5YWC74Z3b84yi5G46/LTjzqE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261126075245eucas1p1570c4ab21c1e2ed63e13386ba12430ed~riQz46jSB1345313453eucas1p1Y;
	Thu, 26 Nov 2026 07:52:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261126075244eusmtip2cc7fbf8f02e77449e3b2c6819c2ed33a~riQzFNlAx0282502825eusmtip2W;
	Thu, 26 Nov 2026 07:52:44 +0000 (GMT)
Message-ID: <27eac3a7-d5d3-4d29-a38f-8d22a3faf504@samsung.com>
Date: Thu, 26 Nov 2026 08:52:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] iommu/exynos: Disable runtime PM on registration
 failure
To: Zhiqi Zhang <zhiqizhangg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261126045203.62181-1-zhiqizhangg@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261126075245eucas1p1570c4ab21c1e2ed63e13386ba12430ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261126045219eucas1p11712605a6aec839075da6ff9bc9dfe15
X-EPHeader: CA
X-CMS-RootMailID: 20261126045219eucas1p11712605a6aec839075da6ff9bc9dfe15
References: <CGME20261126045219eucas1p11712605a6aec839075da6ff9bc9dfe15@eucas1p1.samsung.com>
	<20261126045203.62181-1-zhiqizhangg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_235252_255564_2411135F 
X-CRM114-Status: GOOD (  21.29  )
X-Spam-Score: -2.8 (--)
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

On 26.11.2026 05:52, Zhiqi Zhang wrote:
> exynos_sysmmu_probe() enables runtime PM and then registers the SysMMU
> with the IOMMU core. If iommu_device_register() fails, the error path
> currently only removes the sysfs entry before returning.
>
> That leaves runtime PM enabled for a device whose probe failed. The same
> path can also leave dma_dev pointing at this SysMMU when it was the first
> one to initialize the global DMA helper device, so later domain allocation
> may use a device that never finished probing.
>
> Add an unwind label for iommu_device_register() failures. Disable runtime
> PM there, clear dma_dev if this probe set it, and then remove the sysfs
> entry as before.
>
> Found during static probe error-path review with help from OpenAI Codex.
> The fix was build-tested with ARCH=arm exynos_defconfig and W=1 using an
> arm-linux-gnueabihf GCC cross-compiler.
>
> Fixes: bbc4d205d93f ("iommu/exynos: Fix driver initialization sequence")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

In real world this doesn't happen, but anyway:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/iommu/exynos-iommu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 7c337ba96..18a536008 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -844,10 +844,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>  
>  	ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
>  	if (ret)
> -		goto err_dma_set_mask;
> +		goto err_iommu_register;
>  
>  	return 0;
>  
> +err_iommu_register:
> +	pm_runtime_disable(dev);
> +	if (dma_dev == &pdev->dev)
> +		dma_dev = NULL;
>  err_dma_set_mask:
>  	iommu_device_sysfs_remove(&data->iommu);
>  	return ret;
>
> base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


