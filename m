Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64E60A2628
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0OfGzOW;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2FvFDC0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=; b=e0OfGzOWKpOqJhiO1Cxoz1hQfE
	cWj7iAO0K8+1gPFye+Ee1cNiQLWdz8zAH2Z1sQRROD+3lxuRZnhzp3nTuIeMnerw9CO7c2zuZBUGV
	Mgp8diYP6ll7/HXNYsavQtZcDbUiCHqSZQAcJIZjbooM4mPLEnl9BUxSUIcgX5YBlD2XhIq6RrmJ/
	1xPon4Rb0VFvNLqZ94sPs3z/agaG5HSukeyfwM1LyhQYeJ5uZ/h/o0b+Fjq4pRVVcEgV+qst8dhZV
	D9H+02SA2EN3NkbiZsFwz28GH5G8Esav1ZT3VVuc8CuzEIVAYAkHUVv30GY70n6CW4rP1wXRDIOsK
	SlYYd3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUzc-0000000A72c-1whe;
	Thu, 12 Nov 2026 13:37:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUzZ-0000000A71z-0zVP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:37:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso44185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794490647; x=1795095447; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=S2FvFDC0tlz5NJ4hp+3KR8vuzOveS5H0ieeDqf/r2YHxTCLXIMjY8mPXln1NbAEX9f
         gp9hxRg91SOqqNVPDQEysXvgUq6U4cwUG/0n/O1g3Lqdhc6vDqH1NuXRL6rzlGQunXQ1
         JyEsimi/8+6/PU/sDjn3H9Q1eiGk0RV3m8iYPoxXmYj3QBYAYO+/UlLsdcIpNKtLZA2f
         zInxw1R0q4w/Ti8U/Bocv6rDEVqd8madFcaqZocAqyYgX3bfilY0AM/wJgHCqJPBUrBo
         /kHzAfdoJt5jcS/kHLDAx+5zN5P9Bf+LUEZokS0a1xF8R1YvweAJjzefvjblIA1LlRjQ
         0o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490647; x=1795095447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=D/d95Frx/KZ/pZcqV5/Uc/gMbRnn8H5c7g57s2iFd3JB0Q8Gl3jT2rXZI/IYUco0/z
         QkynnfnsIe/fSxbFjVMlyca6JBm5ZFr7EDir9Gxyyt7TTbkn1D4kyuEJHM2t3qra/SOu
         CHQvmUv3FuykKYXw/uQa465rPeKU3+MMqyAF/pMhoHab2h9FxI/IEP8Es5iluB00600J
         7/eVbBSaX2Psm5utCxuJMzkPL+Ieqto6nch993d37bx2I7ZGG1S19vHUUdCtRDUfZW/w
         VYFwrhWklUSNlAEKqXw/nvX2dK35kXxQnZJtWBR5E4D5OIsYelywgPbrd/n7+5d67+/V
         oJIQ==
X-Forwarded-Encrypted: i=1; AL+hErF7DjUi6n0K7XIMnSTNhwt8urlfJn35Z3TPC0CIjvd+ePQRdG0h9L3Ebubj+nTtdcsvSzwPBsY9WVqAlpwMI51S@lists.infradead.org
X-Gm-Message-State: APuU4Z8VQAe9BzItxhkXoA79YVt1aDhEu5UOzyZdfNwdB9xgRjwuq9Ix
	WKhNGMp+lt8HhFkH7l0H+m7b/4mrzClxCMF/ZxCIFSDBpSv057MUhFQhVvxC9U3byQ==
X-Gm-Gg: AYBFou0dU0S6gFJqJcNnxrdXZ5N8gV3CLadwg+wd612kGHr8U5ZrwAU8fWMgKUDU0D3
	DaU1wffVwQw8o04CCA998jtP+OX+7YoWVyzSX+kpMAdaE35mh5l6OBAzldwmNC8fqwZw/U6hhZl
	p9P3Z8fifge6BMv8KP6AI29JhjCe15wqQ+Cnz4XYCHuvwmcF86IlOn47sH7rRFDJF6yI/7b2/7N
	RleLgVnvcLTjUoT/61xF9Ai9ah8BSiky8i/aMXrMbI7iYTZaEdJkCnQTnpLOW4Cm4D+P3OWXbm3
	68D9EqSA3yDeO40WG9RQD17PoxpZ7hTndbkUdsfpocbbwkFq7oNHpjngxYDi5ny1/t+EueVwKaQ
	6FiNfMA3rst8a7r8txJCy9osfIoo42n/c5d9Dwz26F9n1HOaeAcb9wQc/ULnTHTRtf4eVZagLhD
	Ejaw7mom8Hqq3oUw0XEV6zxXr/R6lBF5SAfCJn834XVNCDJvGHEiAr7EarDhTFtWHWpUslcQh8l
	PBtOm2p9MDBVeq+/IedNpgtMmtly+Nsv/tUBlOypUoQw3eMkMnvXzXG2nv6gjzOOIYYmBkhoWIm
	+YNp10RQqohbjqkXW4gdt6yP7XEvz8XZZv4uKgTZcrgk2r/cZXbVihwZXQIzPkjsofjLYRc=
X-Received: by 2002:a05:600c:a115:b0:4b6:c939:3bfe with SMTP id 5b1f17b1804b1-4bb4ff4ad18mr798825e9.8.1794490646742;
        Thu, 12 Nov 2026 05:37:26 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16911221f8f.46.2026.11.12.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:37:25 -0800 (PST)
Date: Thu, 12 Nov 2026 13:37:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad
 #iommu-cells
Message-ID: <avXBEbkBJ1ZMZ00B@google.com>
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_053729_746054_5BCBAB7A 
X-CRM114-Status: GOOD (  31.23  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:20:19AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> arm_smmu_device_dt_probe() only logs a missing or invalid #iommu-cells
> and carries on with ret = -EINVAL. For "nvidia,tegra264-smmu" it then
> calls tegra_cmdqv_dt_probe(), which takes a reference on the CMDQV
> platform device in smmu->impl_dev, and returns the error. That reference
> is only dropped by tegra241_cmdqv_probe() via arm_smmu_impl_probe(),
> which is never reached, so every failed probe leaks it.
> 
> Return the error as soon as #iommu-cells is found to be wrong, before

This is one of the things I came across a while ago when I passed
the whole driver to Sashiko [1] and IMHO, it shouldn’t be worth it
to fix as the FW can do many other harmful stuff to the kernel
leading to panics or memory corruption and the binding for the driver
is quite clear.

Thanks,
Mostafa

[1] https://lore.kernel.org/all/20260924085616.300650-1-smostafa@google.com/

> anything takes a reference.
> 
> Fixes: ea69dc4e207b ("iommu/arm-smmu-v3: Add device-tree support for CMDQV driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206486@kernel.org/
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> The Sashiko AI review found this leak while reviewing my series
> "iommu/arm-smmu-v3: Keep the clock of the RK3588 PCIe SMMU running"
> [1]. It is not related to that series, so it is sent on its own.
> 
> Only compile-tested (arm64 allmodconfig, W=1): I have no Tegra264
> hardware.
> 
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit message, and I reviewed it.
> 
> [1] https://lore.kernel.org/r/20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47308..f685ed0c01b3 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5661,14 +5661,15 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  {
>  	struct device *dev = &pdev->dev;
>  	u32 cells;
> -	int ret = -EINVAL;
>  
> -	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> +	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells)) {
>  		dev_err(dev, "missing #iommu-cells property\n");
> -	else if (cells != 1)
> +		return -EINVAL;
> +	}
> +	if (cells != 1) {
>  		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
> -	else
> -		ret = 0;
> +		return -EINVAL;
> +	}
>  
>  	parse_driver_options(smmu);
>  
> @@ -5680,7 +5681,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
> 
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261112-smmu-cmdqv-leak-003f273b5e59
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 

