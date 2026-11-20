Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023F560A2606
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNeRYoTc;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYnIkn7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wkd4nqwFfR5tsb8FGSQqj7aBv7pRJtWn5SfKVCnGq1M=; b=GNeRYoTc7J/yXq
	bBkXF6fCd1LYIJOjjDw0wwh79g/y5zo3ff6xOjLAUgkm5VXWJzaI8GrdSlRfruwaOysoTp6Pg++IY
	CyPh597ucZkstEW0v3ckApofRQOQ1ZmmRq3uvoBUhAAH2S4RQ24C02SI/fPECvO9wF+q5FMdwXXKt
	Ei0+d8TrhA2EwqmrjGvfoTAXlG4uvUcsBo/ja2pzHjpnvWHceuJMHlgAxwSTI3DObJB9PZQAt6fkg
	3LD8U0s4r5KCjUUxJgEauGX9Wedgm12V8PtoD25dCwdQe4TyI+PShLJPnOzG8IFFYt3tE0V8bM+QD
	+/WhHheV2S6+5v1G9mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIRm-0000000EBOO-3G8Y;
	Fri, 20 Nov 2026 06:50:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIRk-0000000EBNX-0O67
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795157408; x=1826693408;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mhxWMgCH5HMfkFHe/VNr+MzQbbFwX222p1eoUESgZ50=;
  b=BYnIkn7RUaJYFf5fgEbMbzu35xQH/8A68XqM6R+VR9g+/Irn2ilus1f0
   JgwVRPxX3nc0PuIhSMGxECj85+i3poWPuHjjp1I9EzGygWB6hbLvzZy9W
   ItutUyyIdqB7FTWzqNYPNLUnJwSRk+UcStw8PTqB+1JL8KftE1/nrgYmT
   ODI5uu6zdwifZ8L9E3gMB10J1w2ZqH542DB6/41kYcVxDoK2+wf2eXZHj
   W3j1xJe1m3sQLNpWI/vbeukR48FuNPhk9UQ/j0fvTBY+fu7CgJaTGchZt
   VDJz+zWG9R8IsRWedSQdKsD+odtC685hWCpAk9ELJVQhwa9FkF41CFA+l
   w==;
X-CSE-ConnectionGUID: WiZEfvqUQpGNWDpERIWjqA==
X-CSE-MsgGUID: tuDEw+nxSE6mOmjNeuiCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4037351"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4037351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:50:05 -0800
X-CSE-ConnectionGUID: Y2qOi1RRQBGJruwAMXvr9Q==
X-CSE-MsgGUID: spG0wXLKRgukaky3T7VPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10525531"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:49:58 -0800
Message-ID: <620712ae-e21e-4daa-9cd3-0c5d06ffb67f@linux.intel.com>
Date: Fri, 20 Nov 2026 14:49:56 +0800
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
Subject: Re: [PATCH v9 11/13] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-12-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-12-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_225008_223461_BE2FFFBB 
X-CRM114-Status: GOOD (  25.08  )
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
> VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> the selected vIOMMU implementation has no use for one. This would force
> implementations such as the following Arm Realm vIOMMU to create an
> unused parent.
> 
> Add IOMMUFD_VIOMMU_NO_HWPT so an implementation can opt out. Require
> hwpt_id to be zero in that case and pass a NULL parent domain to its
> initialization callback. For implementations that require a HWPT, verify
> that the parent supports nesting and its domain belongs to the device's
> physical IOMMU driver before invoking viommu_init().
> 
> Reject nested domain and hardware queue allocation for a vIOMMU without
> a parent, and document the two allocation modes in the UAPI.
> 
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: iommu@lists.linux.dev
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   Documentation/userspace-api/iommufd.rst | 44 +++++++++---------
>   drivers/iommu/iommufd/hw_pagetable.c    | 14 ++++--
>   drivers/iommu/iommufd/viommu.c          | 62 +++++++++++++++----------
>   include/linux/iommufd.h                 | 13 ++++--
>   include/uapi/linux/iommufd.h            |  3 +-
>   5 files changed, 81 insertions(+), 55 deletions(-)
> 

[...]

> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index ae62db50885c..52e52ef089a2 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -306,6 +306,10 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
>   		return ERR_PTR(-EOPNOTSUPP);
>   	if (!user_data->len)
>   		return ERR_PTR(-EOPNOTSUPP);
> +	if (!viommu->hwpt)
> +		return ERR_PTR(-EOPNOTSUPP);
> +	if (!viommu->iommu_dev)
> +		return ERR_PTR(-EOPNOTSUPP);
>   	if (!viommu->ops || !viommu->ops->alloc_domain_nested)
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> @@ -404,10 +408,12 @@ int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
>   		struct iommufd_viommu *viommu;
>   
>   		viommu = container_of(pt_obj, struct iommufd_viommu, obj);
> -		iommu_dev = iommufd_device_get_iommu_dev(idev);
> -		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
> -			rc = -EINVAL;
> -			goto out_unlock;
> +		if (viommu->iommu_dev) {
> +			iommu_dev = iommufd_device_get_iommu_dev(idev);
> +			if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
> +				rc = -EINVAL;
> +				goto out_unlock;
> +			}

Is it intended that every tsm-provided viommu has viommu->iommu_dev ==
NULL?

If so, could the tsm-provider patch make provider selection exclusive by
looking up the physical iommu only on the fallback path? All checks
against viommu->iommu_dev should be in that patch. This non-parent-hwpt
viommu support patch should no longer check viommu->iommu_dev.

Also, if viommu->iommu_dev and viommu->tsm_dev are mutually exclusive,
could that be made explicit in a comment or by using a tagged union?

>   		}
>   		hwpt_nested = iommufd_viommu_alloc_hwpt_nested(
>   			viommu, cmd->flags, &user_data);
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 7e74d3992ae4..cadd8a5ca912 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -17,7 +17,8 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
>   		viommu->ops->destroy(viommu);
>   	if (viommu->tsm_dev)
>   		tsm_put_device(viommu->tsm_dev);
> -	refcount_dec(&viommu->hwpt->common.obj.users);
> +	if (viommu->hwpt)
> +		refcount_dec(&viommu->hwpt->common.obj.users);
>   	if (viommu->kvm_file)
>   		fput(viommu->kvm_file);
>   	xa_destroy(&viommu->vdevs);
> @@ -31,11 +32,11 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   		.uptr = u64_to_user_ptr(cmd->data_uptr),
>   		.len = cmd->data_len,
>   	};
> -	struct iommufd_hwpt_paging *hwpt_paging;
> +	struct iommufd_hwpt_paging *hwpt_paging = NULL;
>   	struct tsm_dev *tsm_dev = NULL;
>   	struct iommufd_viommu *viommu;
>   	struct iommufd_device *idev;
> -	struct iommu_device *iommu_dev;
> +	struct iommu_device *iommu_dev = NULL;
>   	const struct iommufd_viommu_ops *ops;
>   	size_t viommu_size;
>   	int rc;
> @@ -47,11 +48,6 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	if (IS_ERR(idev))
>   		return PTR_ERR(idev);
>   
> -	iommu_dev = iommufd_device_get_iommu_dev(idev);
> -	if (!iommu_dev) {
> -		rc = -EOPNOTSUPP;
> -		goto out_put_idev;
> -	}
>   	tsm_dev = tsm_get_device(idev->dev);
>   	if (IS_ERR(tsm_dev)) {
>   		rc = PTR_ERR(tsm_dev);
> @@ -68,6 +64,11 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   			tsm_put_device(tsm_dev);
>   			tsm_dev = NULL;
>   		}
> +		iommu_dev = iommufd_device_get_iommu_dev(idev);
> +		if (!iommu_dev) {
> +			rc = -EOPNOTSUPP;
> +			goto out_put_idev;
> +		}
>   		if (!iommu_dev->ops->get_viommu_ops) {
>   			rc = -EOPNOTSUPP;
>   			goto out_put_idev;
> @@ -93,15 +94,22 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   		goto out_put_idev;
>   	}
>   
> -	hwpt_paging = iommufd_get_hwpt_paging(ucmd, cmd->hwpt_id);
> -	if (IS_ERR(hwpt_paging)) {
> -		rc = PTR_ERR(hwpt_paging);
> -		goto out_put_idev;
> -	}
> -
> -	if (!hwpt_paging->nest_parent) {
> -		rc = -EINVAL;
> -		goto out_put_hwpt;
> +	if (ops->flags & IOMMUFD_VIOMMU_NO_HWPT) {
> +		if (cmd->hwpt_id) {
> +			rc = -EINVAL;
> +			goto out_put_idev;
> +		}
> +	} else {
> +		hwpt_paging = iommufd_get_hwpt_paging(ucmd, cmd->hwpt_id);
> +		if (IS_ERR(hwpt_paging)) {
> +			rc = PTR_ERR(hwpt_paging);
> +			goto out_put_idev;
> +		}
> +		if (!hwpt_paging->nest_parent || !iommu_dev ||
> +		    hwpt_paging->common.domain->owner != iommu_dev->ops) {
> +			rc = -EINVAL;
> +			goto out_put_hwpt;
> +		}
>   	}
>   
>   	viommu = (struct iommufd_viommu *)_iommufd_object_alloc_ucmd(
> @@ -119,7 +127,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	viommu->tsm_dev = tsm_dev;
>   	tsm_dev = NULL;
>   	viommu->hwpt = hwpt_paging;
> -	refcount_inc(&viommu->hwpt->common.obj.users);
> +	if (viommu->hwpt)
> +		refcount_inc(&viommu->hwpt->common.obj.users);
>   	INIT_LIST_HEAD(&viommu->veventqs);
>   	init_rwsem(&viommu->veventqs_rwsem);
>   	/*
> @@ -130,7 +139,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	viommu->iommu_dev = iommu_dev;
>   
>   	rc = ops->viommu_init(viommu, idev->dev,
> -			      hwpt_paging->common.domain,
> +			      hwpt_paging ? hwpt_paging->common.domain : NULL,
>   			      user_data.len ? &user_data : NULL);
>   	if (rc)
>   		goto out_put_hwpt;
> @@ -140,7 +149,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
>   
>   out_put_hwpt:
> -	iommufd_put_object(ucmd->ictx, &hwpt_paging->common.obj);
> +	if (hwpt_paging)
> +		iommufd_put_object(ucmd->ictx, &hwpt_paging->common.obj);
>   out_put_idev:
>   	if (tsm_dev)
>   		tsm_put_device(tsm_dev);
> @@ -240,10 +250,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   		goto out_put_idev;
>   	}
>   
> -	iommu_dev = iommufd_device_get_iommu_dev(idev);
> -	if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
> -		rc = -EINVAL;
> -		goto out_put_idev;
> +	if (viommu->iommu_dev) {
> +		iommu_dev = iommufd_device_get_iommu_dev(idev);
> +		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
> +			rc = -EINVAL;
> +			goto out_put_idev;
> +		}
>   	}
>   
>   	mutex_lock(&idev->igroup->lock);
> @@ -463,7 +475,7 @@ int iommufd_hw_queue_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	if (IS_ERR(viommu))
>   		return PTR_ERR(viommu);
>   
> -	if (!viommu->ops || !viommu->ops->get_hw_queue_size ||
> +	if (!viommu->hwpt || !viommu->ops || !viommu->ops->get_hw_queue_size ||
>   	    !viommu->ops->hw_queue_init_phys) {
>   		rc = -EOPNOTSUPP;
>   		goto out_put_viommu;
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index a4b29915d0ca..4d5995956cce 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -6,6 +6,7 @@
>   #ifndef __LINUX_IOMMUFD_H
>   #define __LINUX_IOMMUFD_H
>   
> +#include <linux/bits.h>
>   #include <linux/err.h>
>   #include <linux/errno.h>
>   #include <linux/iommu.h>
> @@ -102,6 +103,7 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
>   struct iommufd_viommu {
>   	struct iommufd_object obj;
>   	struct iommufd_ctx *ictx;
> +	/* Physical IOMMU backing, or NULL. */
>   	struct iommu_device *iommu_dev;
>   	struct iommufd_hwpt_paging *hwpt;
>   	struct file *kvm_file;

[...]

Thanks,
baolu

