Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hKCIvYFV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rD+jRhQi;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hv6cbJ4M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKkYWihfdRNCMKKO6J64hBPhG+NVMAKKX6FQ+i+pK6Q=; b=hKCIvYFVn9ClGpf9qnJHwWsbmS
	BvTdp2axQDmuw63KodwXcdL0Y0lnnm6zm6i+T3BGgonqdMld9sgQQjWSzTLbJByKxy6I4rqOXm58F
	OARi6cxEp1T/ih0H88ZmzfUM4cKw/o3MxKsguK6HNOm8U9lSAI/GuE+O/r08xpD7OETIuYjo4gPPa
	o2QY0Ak4q8xnm6RTIAx2dkbwtY++lgiwBS0b8y5NOgmoyv1lHX64NC+GzCDbo2R0MpsjugZWh0ZdY
	SkgIqqICuk6feZV48knhHPVGOc/YuYKJMNrYurzsS6xvnlCVDX+cKlTPu6BTUhetiKqYGySV4jmLw
	lQYJ0udA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZXD-00000007wXv-2Cdr;
	Wed, 18 Nov 2026 06:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZXB-00000007wX6-29me
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FKkYWihfdRNCMKKO6J64hBPhG+NVMAKKX6FQ+i+pK6Q=; b=rD+jRhQiXhKewPgbi+Kuaw5jZ0
	t1wQWzDABa3ez2Tj4zDX7GOkzKtRQrp/noayOWWafVU1bECaJLHG4JHXM6PEWWaxWPz4YiRcop8Er
	x1jc8EkbtkhYjBbUMqbLpWpQysBqCVIJz/o68vgSmH5quzLMOYigQ/C+QqLldKUqaL2c/lC2yzhud
	iFYhq8RxXjeuupiSRBDjNR7OAW0dIpCyngQJdvagRDHhZTo8NdW1DuwxNymOxoaK7kaqdikTN98CS
	D0EiyrP4fPHtQiV8bxparEuOWhXKg4MYUlio2qJ2FHmZoJy6pcXGmfdgfyNMClbcp5MDN6rdQgtht
	E/E7c8+g==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZX6-0000000FiQP-1488
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794984761; x=1826520761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DrEUIZ3qyU/ux7WrUPR07gul8fRUSWl1kJJN3nWoEdY=;
  b=hv6cbJ4MXsusRRaSmY5wnFjKSH0dcZJ2QUSagoIxTiqPQxqDWO8MNo/B
   2K8RtAR3UD2id/fC1lB/T5CB+tumEWXjRvEtN5VmnT+wKvP6n5tnsDkPE
   i54V/pnrXabgcOMPgavDCDW7e6cDGys6X9faq1hmH1rFdYHTpGNvPFDoh
   FyQouphVzk0mTi5+nQnEo9j5893fJJ5hEqAkiIGYCSWCAdRYH7HE4I9gy
   lA3MnHk7tyOTQ6CFTC95Mt1zxoG9TFSw2gx+ttIhUiQmMAb7MoslgBtC+
   rhOi8Y4a8KRw592AD4C925/gtl0bgl/h0nPrLxazrHzoj557fF3/6tkmu
   A==;
X-CSE-ConnectionGUID: yzi5AREbQp24xHE5SFLRog==
X-CSE-MsgGUID: 6iK5kv4TRqelSEg1ROvXOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3772248"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3772248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 22:52:36 -0800
X-CSE-ConnectionGUID: T9CVNhvrRNOyjSE6/SDleg==
X-CSE-MsgGUID: tRAtyKlLR/y4UDhkKRsFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9988327"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 22:52:28 -0800
Date: Wed, 18 Nov 2026 14:43:32 +0800
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
Subject: Re: [PATCH v9 02/13] virt: coco: tsm: Remove the device from lookup
 before PCI teardown
Message-ID: <av1JFH8W63T37bK6@yilunxu-OptiPlex-7050>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-3-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116081935.85372-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065240_565618_C2FF47BA 
X-CRM114-Status: GOOD (  25.49  )
X-Spam-Score: -2.3 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:49:24PM +0530, Aneesh Kumar K.V (Arm) wrote:
> PCI connect looks up a TSM by ID under pci_tsm_rwsem. Previously,
> pci_tsm_unregister() released that lock after tearing down PCI state
> while the TSM was still in the class lookup. A racing connect could then
> attach a new PCI context that the teardown would never see.
> 
> Remove the device from the class lookup first, then take the PCI write
> lock to drain in-flight operations and destroy their contexts. Drop the
> device reference only after PCI teardown completes.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: linux-coco@lists.linux.dev
> Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/virt/coco/tsm-core.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
> index 03894c5663f1..57db3f14cf46 100644
> --- a/drivers/virt/coco/tsm-core.c
> +++ b/drivers/virt/coco/tsm-core.c
> @@ -56,23 +56,22 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
>  	return no_free_ptr(tsm_dev);
>  }
>  
> -static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
> -						 struct pci_tsm_ops *pci_ops)
> +static int __tsm_register(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
>  {
>  	int rc;
>  
>  	tsm_dev->pci_ops = pci_ops;
>  	rc = pci_tsm_register(tsm_dev);
>  	if (rc) {
> +		tsm_dev->pci_ops = NULL;

Previous comment shows this can't solve any racing connect problem.
And with your next patch, the racing connect is solved. So I think
remove it.

>  		dev_err(tsm_dev->dev.parent,
>  			"PCI/TSM registration failure: %d\n", rc);
> -		device_unregister(&tsm_dev->dev);
> -		return ERR_PTR(rc);
> +		return rc;
>  	}
>  
>  	/* Notify TSM userspace that PCI/TSM operations are now possible */
>  	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
> -	return tsm_dev;
> +	return 0;

I really don't think we need this wrapper. In next patch we move uevent
out, so this wrapper is just:

	tsm_dev->pci_ops = pci_ops;
	pci_tsm_register();

Open code it, as Alexey and I suggest before. All kinds of xxx_tsm_register()
are really confusing.

>  }
>  
>  struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
> @@ -96,15 +95,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
>  	if (rc)
>  		return ERR_PTR(rc);
>  
> -	return tsm_register_pci_or_reset(no_free_ptr(tsm_dev), pci_ops);
> +	rc = __tsm_register(tsm_dev, pci_ops);
> +	if (rc) {
> +		device_del(dev);
> +		return ERR_PTR(rc);
> +	}
> +	return no_free_ptr(tsm_dev);

I think none of the above changes belongs to this patch. They don't
solve any problem mentioned in the changelog.

They belong to the next patch.

>  }
>  EXPORT_SYMBOL_GPL(tsm_register);
>  
>  void tsm_unregister(struct tsm_dev *tsm_dev)
>  {
> +	/* Remove the class lookup first. */
> +	device_del(&tsm_dev->dev);
>  	if (tsm_dev->pci_ops)

The patch 1 rejects NULL pci_ops, so is this check still needed? Can we
remove this check in your Patch 1?

>  		pci_tsm_unregister(tsm_dev);
> -	device_unregister(&tsm_dev->dev);
> +	put_device(&tsm_dev->dev);
>  }
>  EXPORT_SYMBOL_GPL(tsm_unregister);
>  
> -- 
> 2.43.0
> 
> 

