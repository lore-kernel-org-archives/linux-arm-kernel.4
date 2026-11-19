Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D027606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hvovZsGX;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JHtfP26L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Va/Oxtu6vlA30n7TkoMr9m9dnyboRnI7B5KkvZShXuk=; b=hvovZsGXW+b1YI
	pIdVoiVMlSoZqV+1FhSaQA+t1Hweh3DX8rp36Sx7Nuxvt2Gkc82sssD6vpbPCDEJ/oyGZz09N0tXg
	H2P59Sa/rIAdkkSqNbod10gjv1ghuEonPtrs4910a6rqYbPXSWJ+t8ehN4oFUqvkl/+3HsBslaP0v
	i+HOC3UaqkarbTtQK/ASs6QDT3mIjppL1/xaxOleSuWe4xLo31v9e//Ct0eH5MEFj0Xa8dNlipMQx
	ej7DiJtaVN7BCTRv43oBybPiHaSCzdqCMf3lq0rpqAwEY5e4KuIjOCy5EPfz/xxl/8JTDP4w0tnh0
	aKFARnB8dRUFfmvuh60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxHh-0000000B9PG-1APg;
	Thu, 19 Nov 2026 08:14:21 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxHd-0000000B9Os-1rnk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795076058; x=1826612058;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kzJo+8BaOAZhUntz86DhI1HKcpzg32Rvn/ODVmcnDig=;
  b=JHtfP26LfKGpzsHg0MB2vZ6ix6lSedBydZdHOc/+kGNo4PR95dK1KcHN
   WbtGF0ga04gRvZIBYOXkBdlMLYlAhG60y7ckdX2yEb7P3lOQESXH1KY8Y
   GBYYkMycrosbEfe2IDaGFCTyNWUYyga9mHkEdxVdKoYxpy9oJaiXVnMh1
   ZdXfs6WSggm+kJNCjGGyHeD89I6/3CXFHROYt1fccGHpZFABsxJbgiwwD
   0ysCv/mdWRKp6mDE78z2X2g5gH6Rtqm2wU/H2WgJzhEcZeEICYIKxfxnU
   GJSXTXfh+QbtlYL9q2cgk3FUO1+tR5N4VEFYWaJaH0z/Dq6cxeP0QweN1
   w==;
X-CSE-ConnectionGUID: mVHusagDQ+2tjkh0UUpYRw==
X-CSE-MsgGUID: ogaRBBqqQh+4SsoXS1ISOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3944402"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3944402"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:14:00 -0800
X-CSE-ConnectionGUID: 0tlw9+aHSg2IlofLNzybUA==
X-CSE-MsgGUID: EoPnrkujQkWheEz1swf5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10730909"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:13:49 -0800
Message-ID: <fac3d200-e1e8-4a0f-bd41-8e1c0d727d1a@linux.intel.com>
Date: Thu, 19 Nov 2026 16:13:46 +0800
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
 linux-tegra@vger.kernel.org, patches@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 04/13] iommufd/device: Associate KVM file pointer with
 iommufd_device
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-5-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001417_500956_616B7019 
X-CRM114-Status: GOOD (  20.73  )
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
> From: Shameer Kolothum<shameerali.kolothum.thodi@huawei.com>
> 
> TSM vDevice support needs access to the KVM associated with a VFIO device
> after the device has been bound to iommufd.
> 
> Extend iommufd_device_bind() to accept the device's KVM file and store it
> in the iommufd_device. The KVM file reference is owned by VFIO and is
> already held for the duration of the device open path.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Shameer Kolothum<shameerali.kolothum.thodi@huawei.com>
> [nicolinc: fix build error in iommufd_test_mock_domain()]
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> [aneesh.kumar: Switch to use kvm_file]
> Cc: Jason Gunthorpe<jgg@ziepe.ca>
> Cc: Kevin Tian<kevin.tian@intel.com>
> Cc: Joerg Roedel<joro@8bytes.org>
> Cc: Will Deacon<will@kernel.org>
> Cc: Robin Murphy<robin.murphy@arm.com>
> Cc: Alex Williamson<alex@shazbot.org>
> Cc:iommu@lists.linux.dev
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   drivers/iommu/iommufd/device.c          | 7 ++++++-
>   drivers/iommu/iommufd/iommufd_private.h | 2 ++
>   drivers/iommu/iommufd/selftest.c        | 2 +-
>   drivers/vfio/iommufd.c                  | 3 ++-
>   include/linux/iommufd.h                 | 4 +++-
>   5 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 1b0bdf57ac8a..935f42616a65 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -295,6 +295,7 @@ static int iommufd_bind_noiommu(struct iommufd_device *idev)
>    * iommufd_device_bind - Bind a physical device to an iommu fd
>    * @ictx: iommufd file descriptor
>    * @dev: Pointer to a physical device struct
> + * @kvm_file: VM file if device belongs to a KVM VM
>    * @id: Output ID number to return to userspace for this device
>    *
>    * A successful bind establishes an ownership over the device and returns

As discussed during the v8 review, how does this series address the risk
that the KVM file pointer could become invalid if REMOVE_WAIT times out?
The changelog says the extra KVM file reference was dropped. Is the
timeout expected never to occur, or should it be addressed by a broader
fix if it does? How about explaining this in the commit message so
future readers understand why the extra reference isn’t needed.

Thanks,
baolu

