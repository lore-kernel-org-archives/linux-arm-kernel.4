Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gafWuWKe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G2i4MnW1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W2BLdFCLXqqGzqgzzWL5ZjqtGuQVWcPcrvfmmj2AsEQ=; b=gafWuWKeSmJXDQ
	wLY95GoVCpCHZLfukHQL+jamckdaFH4DeOMCgnVMtksOf/LIufdtcuFWpwWaSCvQ5f+UZY+JnrgyT
	XNzY5q/eKc5PEZyr+7PCGHTFTDJ7go9I3u1LoSbMP18LfY7yawOt+q12H5ZsMfjL05gHM9cXDsOA6
	OaqaOameT4BGYZ0QmSuaB/K8Hsc456i6TxLwciEGxDY9MOnh2xHQTIQaeyCnNeStdsxAyAeUeNQ8C
	FeFPLOdGBFh0/HWc4fVx7ejcYMCLXCsaNg663mX/8scRla60iDBi1WF2GlA6xfmxfUwi74taFEcum
	x/TnSgE0AfLxpZrreDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwLq-0000000GJ34-15ze;
	Fri, 27 Nov 2026 13:50:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwLn-0000000GJ2N-2n85
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:50:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA5871570;
	Fri, 27 Nov 2026 05:50:49 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490133F632;
	Fri, 27 Nov 2026 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795787452; bh=InPRxVzDI2vjxwZEavNbuf666pud9/KmCUGG5pDASzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2i4MnW1cdxQ9bbPd/ojeNKVpcA7dVi9RkhkGSConJ8BzgFbXeYBGNRCBGuwf61lU
	 ml0Lv82yEpVRg8e98RuLOswk6aoe1ZcEsrq2/a6sLK2R1Lphdv7Se62lzsAVVbdfBR
	 NuR2cdtvGeeGB+KPF3cGWTNfPUOmOQZ8f7D+YShI=
Message-ID: <f789bb4c-ad5c-455a-a51d-fc9fe67b1d13@arm.com>
Date: Fri, 27 Nov 2026 13:50:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/exynos: Disable runtime PM on registration failure
To: Zhiqi Zhang <zhiqizhangg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 stable@vger.kernel.org
References: <20261126045203.62181-1-zhiqizhangg@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261126045203.62181-1-zhiqizhangg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_055055_824263_873961F6 
X-CRM114-Status: GOOD (  21.09  )
X-Spam-Score: -4.4 (----)
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

On 26/11/2026 4:52 am, Zhiqi Zhang wrote:
> exynos_sysmmu_probe() enables runtime PM and then registers the SysMMU
> with the IOMMU core. If iommu_device_register() fails, the error path
> currently only removes the sysfs entry before returning.
> 
> That leaves runtime PM enabled for a device whose probe failed.

If that matters, then wouldn't the same theoretical reasoning also still 
apply to module removal after a successful probe?

> The same
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
> ---
>   drivers/iommu/exynos-iommu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 7c337ba96..18a536008 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -844,10 +844,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>   
>   	ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
>   	if (ret)
> -		goto err_dma_set_mask;
> +		goto err_iommu_register;
>   
>   	return 0;
>   
> +err_iommu_register:
> +	pm_runtime_disable(dev);
> +	if (dma_dev == &pdev->dev)
> +		dma_dev = NULL;

But what about other IOMMU instances that could have probed in parallel 
and already observed dma_dev to be set? Sure the existing code is not 
perfectly race-free to begin with, but this only makes the issue much 
more obviously worse.

Thanks,
Robin.

>   err_dma_set_mask:
>   	iommu_device_sysfs_remove(&data->iommu);
>   	return ret;
> 
> base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838


