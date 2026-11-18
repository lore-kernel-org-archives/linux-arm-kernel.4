Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5539606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LEoKNfue;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jwsgmkUf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGwfspGlZydInl36JBBWlsrbZVsfQfMf2BFCiJS1BiA=; b=LEoKNfueqJC8bylUfseQ3RGTwy
	uNgug0R90b2s3wGic2E52bDY092i/AjDZVYOtQGUfkyycrhoJZfSHMnXxa05GMOg1BXAL9tGFgvhc
	ehF/WkGRj1xSkPDqkUqF9EL00qHi+UCq7GzTbdSlcb7bEC52XEL8r5XhR7vJfGygP/v3FlBx/TXKB
	TdMwf2/C6Le4Ppb30I/5XyCVQG1ipaXQ//GaQmAipMA0Ug/PE603mdPMil8AhC+4YSCmPCubLp0kN
	lAFN1/n2s5dIbzwN12bw0KtszsjpiN+K2peHDi2h0N0d2SgHbwWV3w21bgsETf+2IH0U+s+OmELcE
	JP0YiVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZyJ-00000007zam-0Ox4;
	Wed, 18 Nov 2026 07:20:47 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZyC-00000007zYL-2p1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794986441; x=1826522441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+2udD+I/B2oEnhd74DurfplmADbgc1YhIACKTb7a8dg=;
  b=jwsgmkUf0LQGBgy0xY+Cmu06DzvNKuSHrQE4SZ4XEVJOcrtL80dkGshB
   zkbLiLIaRF8SX9Aiwo7UTI8GEhtWlZ80ppzZycoK7YolM3ymqi/jklwVr
   +vKug6Nh++KWezWUGlVjWUPNgog5bxS2Z+rl6XgGeADNSHE37rQ8YMHaI
   RN+T8oKls+W4Lm+7npts1rJ8VB+XOlX04LLJusc4ZM3ftG5v9k/ZDqiWe
   bwyOkC0T5lmrjXM7lNWL+T81a2RowxOHPdCYS2h7zkoPMm8iX2Umgwe2t
   Etc1CJKcH0R4ZgJvp3k5PQpHvcN9mqCInWfgEj38nupEQk9dKkdycd4aY
   g==;
X-CSE-ConnectionGUID: oDBg7OUHToG6nyKm/DKOyw==
X-CSE-MsgGUID: /tD2G3GSQaexE9j+7PccUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3786044"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3786044"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 23:20:38 -0800
X-CSE-ConnectionGUID: P1j6hrGhTiiAhyx+IilPVg==
X-CSE-MsgGUID: 6OJJH8AFTDWd5J0HmgVxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11872150"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 23:20:31 -0800
Date: Wed, 18 Nov 2026 15:11:35 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 03/13] virt: coco: tsm: Complete PCI registration
 before publishing the device
Message-ID: <av1Pp0vDUisoErEo@yilunxu-OptiPlex-7050>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-4-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116081935.85372-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_232040_769849_BA179179 
X-CRM114-Status: GOOD (  17.18  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>  drivers/virt/coco/tsm-core.c | 35 +++++++++++++----------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
> index 57db3f14cf46..181d6114086f 100644
> --- a/drivers/virt/coco/tsm-core.c
> +++ b/drivers/virt/coco/tsm-core.c
> @@ -56,24 +56,6 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
>  	return no_free_ptr(tsm_dev);
>  }
>  
> -static int __tsm_register(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
> -{
> -	int rc;
> -
> -	tsm_dev->pci_ops = pci_ops;
> -	rc = pci_tsm_register(tsm_dev);
> -	if (rc) {
> -		tsm_dev->pci_ops = NULL;
> -		dev_err(tsm_dev->dev.parent,
> -			"PCI/TSM registration failure: %d\n", rc);
> -		return rc;
> -	}
> -
> -	/* Notify TSM userspace that PCI/TSM operations are now possible */
> -	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
> -	return 0;
> -}
> -
>  struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
>  {
>  	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
> @@ -91,15 +73,24 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
>  	if (rc)
>  		return ERR_PTR(rc);
>  
> -	rc = device_add(dev);
> -	if (rc)
> +	/* Complete PCI registration before exposing the TSM to class lookup. */
> +	tsm_dev->pci_ops = pci_ops;
> +	rc = pci_tsm_register(tsm_dev);

Ah, sorry. I see you've open-coded it.

I think let's move all tsm_register() side change in this patch. That
saves much intermediate change.

> +	if (rc) {
> +		tsm_dev->pci_ops = NULL;

Besides this unnecessary nullification, others are good to me.

As mentioned, we've done several rounds of detailed reviews for this
early publishing problem. I think it's time to split Patch 1,2,3 out
for merging.

> +		dev_err(parent, "PCI/TSM registration failure: %d\n", rc);
>  		return ERR_PTR(rc);
> +	}
>  
> -	rc = __tsm_register(tsm_dev, pci_ops);
> +	rc = device_add(dev);
>  	if (rc) {
> -		device_del(dev);
> +		pci_tsm_unregister(tsm_dev);
>  		return ERR_PTR(rc);
>  	}
> +
> +	/* Notify TSM userspace that PCI/TSM operations are now possible. */
> +	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
> +
>  	return no_free_ptr(tsm_dev);
>  }
>  EXPORT_SYMBOL_GPL(tsm_register);
> -- 
> 2.43.0
> 

