Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=autK1vZW;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODHU+r07
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PT0FK9wWU0tkRsvayMQ1N9RgAm8dfnFyjV1OONVZR3Y=; b=autK1vZWKEzGEb
	VDwaYD2ZuWjAHW8o71G43AnvSl0EtVDAD+ZFNhObaY8gSYiqqOh7Bp4lXfgkawzmHo686esfJG49F
	Hk/1lp1BCF3Ct8dUfYmmF+U3DmwtRttAnRK/RndPO9SATnCh17V40Iun7xAo/ah0uoXmUOSPm5Ij7
	jkcE25fs6OhNFJL6iS9NGfk70kdINffrsUsgQYSJBcNOtS3qqDrUHBkT4ybBBRYYOZ17LLnuYvdOr
	gHcv4eZClJlLV3eYTsih/xrwggqQQaXFBH7AbjF2ZgyPX31PYi6xxNUz87YGxFQDxZ11ep33OCkDX
	/6u3tJkuHyQeDmVq3VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGU9-0000000E2io-1qYm;
	Fri, 20 Nov 2026 04:44:29 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGU6-0000000E2iS-0bGt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795149866; x=1826685866;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y/i10jyYjFWeI3DRZs4bsQaJGnLxtLrgwJ61Ht7xyRw=;
  b=ODHU+r07ZWtROOvVtVis05iVMAalxuB8FBZJk7TSkFYoUBAXonE+rvQz
   0Prp/MePsWAkm0JD0UtGdHuavDqAnBshaKR+ywVvYs7mpezQHf98uoWXs
   qZ2LyA+W2sbqwF/R8QP8j6nuI0jB5bf6W7M3KEUw05XCSVseRyRB7BiHq
   WshcX+4W+q8iTwQBpRLR4dGOdPP9axEOPlaCa8tEEv+zhsOWEdTo9Umi5
   bEbHzAbvIrA1y4SOSxlPjc+0y6BAiw4ptaUp6JM7r4ORaBvfRgNu/98Kj
   zx1Jp9FJatv6c+P/XfN/lWQsF1FVtAM9gw7JNelL+h5ZI2EEDxSWRrfeU
   Q==;
X-CSE-ConnectionGUID: NOt57CmzQV+O13b6EfiYnw==
X-CSE-MsgGUID: VycrJIaIR4iBIIl2F5pdRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4101314"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4101314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 20:44:22 -0800
X-CSE-ConnectionGUID: H3ytyTdhTSWu5lchEfXTeQ==
X-CSE-MsgGUID: QpvzWzgNR6iJN9JsRdkisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11037850"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 20:44:14 -0800
Message-ID: <2e8a853f-9e7b-4cce-b578-2dac0c564eb5@linux.intel.com>
Date: Fri, 20 Nov 2026 12:44:10 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Alex Williamson <alex@shazbot.org>,
 Alexey Kardashevskiy <aik@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
 Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Ortiz <sameo@rivosinc.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Steven Price <steven.price@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Xu Yilun <yilun.xu@linux.intel.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, iommu@lists.linux.dev,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 09/13] iommufd/viommu: Select vIOMMU operations before
 allocation
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-10-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-10-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_204426_283493_4A0DE75B 
X-CRM114-Status: GOOD (  34.58  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 4:19 PM, Aneesh Kumar K.V (Arm) wrote:
> Physical IOMMU drivers currently provide the vIOMMU size and
> initialization callbacks through iommu_ops. The initialization callback
> then selects and installs the corresponding iommufd_viommu_ops.
> 
> Add iommu_ops::get_viommu_ops() to select the operations from the
> physical device and requested vIOMMU type before allocation. Move the
> size and initialization callbacks into iommufd_viommu_ops. The core can
> then validate the selected operations, allocate the driver structure,
> initialize it, and install the operations.
> 
> Convert AMD, Arm SMMUv3, Tegra CMDQV, and the selftest backend to the
> new interface.
> 
> The current code requires a valid parent HWPT before calling
> viommu_init(), which selects the vIOMMU operations. A later patch adds
> an operations flag indicating that a vIOMMU type does not require a
> parent HWPT. Selecting the operations earlier allows the core to check
> that flag before deciding whether to look up and validate a parent HWPT.
> 
> Temporarily disable AMD vIOMMU allocation by returning NULL from
> amd_iommufd_get_viommu_ops() while the vIOMMU interfaces are being
> updated.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Cc: Vasant Hegde <vasant.hegde@amd.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Thierry Reding <thierry.reding@kernel.org>
> Cc: Krishna Reddy <vdumpa@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: iommu@lists.linux.dev
> Based on original patch by Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   drivers/iommu/amd/iommu.c                     |  3 +-
>   drivers/iommu/amd/iommufd.c                   | 18 ++++++---
>   drivers/iommu/amd/iommufd.h                   | 11 ++++--
>   drivers/iommu/amd/nested.c                    |  4 +-
>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 37 +++++++++++--------
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  7 ++--
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 16 ++++----
>   .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 24 ++++++++----
>   drivers/iommu/iommufd/selftest.c              | 31 +++++++++++-----
>   drivers/iommu/iommufd/viommu.c                | 32 ++++++++--------
>   include/linux/iommu.h                         | 20 +++-------
>   include/linux/iommufd.h                       | 14 +++++++
>   12 files changed, 129 insertions(+), 88 deletions(-)
> 

[...]

> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 0d162a3fdc98..2eba1562a704 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -33,7 +33,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	struct iommufd_viommu *viommu;
>   	struct iommufd_device *idev;
>   	struct iommu_device *iommu_dev;
> -	const struct iommu_ops *ops;
> +	const struct iommufd_viommu_ops *ops;
>   	size_t viommu_size;
>   	int rc;
>   
> @@ -49,23 +49,25 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   		rc = -EOPNOTSUPP;
>   		goto out_put_idev;
>   	}
> -	ops = iommu_dev->ops;
> -	if (!ops->get_viommu_size || !ops->viommu_init) {
> +	if (!iommu_dev->ops->get_viommu_ops) {
>   		rc = -EOPNOTSUPP;
>   		goto out_put_idev;
>   	}
> -
> -	viommu_size = ops->get_viommu_size(idev->dev, cmd->type);
> -	if (!viommu_size) {
> +	ops = iommu_dev->ops->get_viommu_ops(idev->dev, cmd->type);
> +	if (!ops) {
>   		rc = -EOPNOTSUPP;
>   		goto out_put_idev;
>   	}
> -
>   	/*
> -	 * It is a driver bug for providing a viommu_size smaller than the core
> -	 * vIOMMU structure size
> +	 * It is a driver bug to omit the required operations or provide a size
> +	 * smaller than the core vIOMMU structure.
>   	 */
> -	if (WARN_ON_ONCE(viommu_size < sizeof(*viommu))) {
> +	if (WARN_ON_ONCE(!ops->get_viommu_size || !ops->viommu_init)) {
> +		rc = -EOPNOTSUPP;
> +		goto out_put_idev;
> +	}
> +	viommu_size = ops->get_viommu_size(idev->dev, cmd->type);
> +	if (!viommu_size || WARN_ON_ONCE(viommu_size < sizeof(*viommu))) {
>   		rc = -EOPNOTSUPP;
>   		goto out_put_idev;
>   	}
> @@ -104,16 +106,12 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	 */
>   	viommu->iommu_dev = iommu_dev;
>   
> -	rc = ops->viommu_init(viommu, hwpt_paging->common.domain,
> +	rc = ops->viommu_init(viommu, idev->dev,
> +			      hwpt_paging->common.domain,
>   			      user_data.len ? &user_data : NULL);
>   	if (rc)
>   		goto out_put_hwpt;
> -
> -	/* It is a driver bug that viommu->ops isn't filled */
> -	if (WARN_ON_ONCE(!viommu->ops)) {
> -		rc = -EOPNOTSUPP;
> -		goto out_put_hwpt;
> -	}
> +	viommu->ops = ops;
>   
>   	cmd->out_viommu_id = viommu->obj.id;
>   	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ef5043752a36..f27064917df7 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -46,6 +46,7 @@ struct iommu_dma_msi_cookie;
>   struct iommu_fault_param;
>   struct iommufd_ctx;
>   struct iommufd_viommu;
> +struct iommufd_viommu_ops;
>   struct msi_desc;
>   struct msi_msg;
>   
> @@ -669,16 +670,8 @@ __iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
>    *		- IOMMU_DOMAIN_DMA: must use a dma domain
>    *		- 0: use the default setting
>    * @default_domain_ops: the default ops for domains
> - * @get_viommu_size: Get the size of a driver-level vIOMMU structure for a given
> - *                   @dev corresponding to @viommu_type. Driver should return 0
> - *                   if vIOMMU isn't supported accordingly. It is required for
> - *                   driver to use the VIOMMU_STRUCT_SIZE macro to sanitize the
> - *                   driver-level vIOMMU structure related to the core one
> - * @viommu_init: Init the driver-level struct of an iommufd_viommu on a physical
> - *               IOMMU instance @viommu->iommu_dev, as the set of virtualization
> - *               resources shared/passed to user space IOMMU instance. Associate
> - *               it with a nesting @parent_domain. It is required for driver to
> - *               set @viommu->ops pointing to its own viommu_ops
> + * @get_viommu_ops: Return the vIOMMU operations supported by @dev for a type.
> + *                  Return NULL if the type is unsupported.
>    * @owner: Driver module providing these ops
>    * @identity_domain: An always available, always attachable identity
>    *                   translation.
> @@ -729,11 +722,8 @@ struct iommu_ops {
>   
>   	int (*def_domain_type)(struct device *dev);
>   
> -	size_t (*get_viommu_size)(struct device *dev,
> -				  enum iommu_viommu_type viommu_type);
> -	int (*viommu_init)(struct iommufd_viommu *viommu,
> -			   struct iommu_domain *parent_domain,
> -			   const struct iommu_user_data *user_data);
> +	const struct iommufd_viommu_ops *(*get_viommu_ops)(
> +		struct device *dev, enum iommu_viommu_type viommu_type);
>   
>   	const struct iommu_domain_ops *default_domain_ops;
>   	struct module *owner;
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index d1fd7888fc91..5f5c67b24134 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -148,6 +148,15 @@ struct iommufd_hw_queue {
>   
>   /**
>    * struct iommufd_viommu_ops - vIOMMU specific operations
> + * @get_viommu_size: Get the size of a driver-level vIOMMU structure for a given
> + *                   @dev corresponding to @viommu_type. Driver should return 0
> + *                   if vIOMMU isn't supported accordingly. It is required for
> + *                   driver to use the VIOMMU_STRUCT_SIZE macro to sanitize the
> + *                   driver-level vIOMMU structure related to the core one
> + * @viommu_init: Init the driver-level struct of an iommufd_viommu on a physical
> + *               IOMMU instance @viommu->iommu_dev, as the set of virtualization
> + *               resources shared/passed to user space IOMMU instance. Associate
> + *               it with a nesting @parent_domain.
>    * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
>    *           of the vIOMMU will be free-ed by iommufd core after calling this op
>    * @alloc_domain_nested: Allocate a IOMMU_DOMAIN_NESTED on a vIOMMU that holds a
> @@ -190,6 +199,11 @@ struct iommufd_hw_queue {
>    *                      does, it should set it to the @hw_queue->destroy pointer
>    */
>   struct iommufd_viommu_ops {
> +	size_t (*get_viommu_size)(struct device *dev,
> +		enum iommu_viommu_type type);
> +	int (*viommu_init)(struct iommufd_viommu *viommu, struct device *dev,
> +		struct iommu_domain *parent_domain,
> +		const struct iommu_user_data *user_data);
>   	void (*destroy)(struct iommufd_viommu *viommu);
>   	struct iommu_domain *(*alloc_domain_nested)(
>   		struct iommufd_viommu *viommu, u32 flags,

For changes in iommufd/viommu common code,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

