Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HUlaLkXv;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3wTozIw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ElvNMLPb9nWTefCnh+Wvm1TWF1EkTveOzrAIj5NeSzA=; b=HUlaLkXv8OTD00
	D3qu6biznPHGVQXr18tyEmdQK8YhlzwxGkg6OzXH4MlD81TAUZHn8bob6lO+F1pjJ+hJHFOWvsCAX
	J7WQNxlZdqdDJZlUIgcBVyhzKSAG4isptg2ce4CjkKIN6nj8uhr28uNE0WXyY0h4OzIA8km+637G3
	W28Nw/k27ijki9jswCZOXRSAY6i9no0nxaXk7pDYi/LXBAvdaqRGEnRyz7Y/5URjmsNEbqQNg2m6z
	ZExX9fzVQAftXUldkCX05NIvgmXo0teC5TF5aKEdJQacI+AJ7tXfcBGrXy6gechihpG/qdXsRPmOw
	0RBCZbJQ8c8eJpHHdLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHLf-0000000E6JV-3YNZ;
	Fri, 20 Nov 2026 05:39:47 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHLd-0000000E6J9-0iNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795153186; x=1826689186;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JOXloh/WTQ18M0f0+orJ8jQWk9eyZPfHxhSzgmLwgig=;
  b=l3wTozIwOlQzZcAXQL7AANbVSETjXCnF+BlPDw7BG/vVoi+UTII+0z2C
   9s2swZ8PNkbi2D28lgJuT7myndMdAFiS/LjdTafX3c2fSFAH/cyWb/KWi
   KHTL6mO/VhZY9ASGCCVaHniMXUV8Df3zFhM8HJmKN7KaKe55OZDuay46U
   FMWIs/l2sGChWtMbWIQ4MEow5FTsi0aXVDZ6FHF2wArUeG3VSrWs8WtTk
   iix+4eG00KcUsNpv7x2NS9QOD9AOcym5m8HCljZzep9p3HDxBVX4of6up
   SZvpIhGWcA+26+4oLLSMwyaKPGvQuq6RKfcrNXJO8iiiwz0winuOQHc0J
   Q==;
X-CSE-ConnectionGUID: Ue6g8lHWSOiKr+C2V1qM8g==
X-CSE-MsgGUID: YdrqT7e4SVO5Nil8QHrrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3926494"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3926494"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:39:45 -0800
X-CSE-ConnectionGUID: NCD7hbrERneuQrgdNmaJMQ==
X-CSE-MsgGUID: qCE/ag8EST2VFpCAsOOiuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12327914"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:39:36 -0800
Message-ID: <2d8af908-4dd5-43a9-b618-d1ee4189f6ba@linux.intel.com>
Date: Fri, 20 Nov 2026 13:39:34 +0800
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
Subject: Re: [PATCH v9 10/13] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-11-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-11-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_213945_248043_E885D4F2 
X-CRM114-Status: GOOD (  16.32  )
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
> In confidential-computing configurations, a vIOMMU may be implemented by
> a TSM driver rather than by the physical IOMMU driver. Such an
> implementation also needs the TSM identity when creating and validating
> vdevices.
> 
> Allow VIOMMU_ALLOC to first query the TSM associated with the target PCI
> device for vIOMMU operations. Fall back to the physical IOMMU driver
> when the TSM does not provide operations for the requested vIOMMU type.
> 
> Resolve the PCI TSM association under pci_tsm_rwsem, take a TSM device
> reference, and pin the module providing the operations. Store the TSM
> device in the vIOMMU. Release the device reference and module pin on
> allocation failure, fallback to the physical IOMMU driver, or vIOMMU
> destruction. Drop the device reference before releasing the module pin,
> since the final put may call into the backend module.
> 
> The device reference preserves the TSM allocation. Backends providing
> vIOMMU operations must not unregister their TSM while the module is pinned,
> since the reference does not prevent backend resource teardown.
> 
> Cc: Jason Gunthorpe<jgg@ziepe.ca>
> Cc: Kevin Tian<kevin.tian@intel.com>
> Cc: Joerg Roedel<joro@8bytes.org>
> Cc: Will Deacon<will@kernel.org>
> Cc: Robin Murphy<robin.murphy@arm.com>
> Cc: Bjorn Helgaas<bhelgaas@google.com>
> Cc: Alexey Kardashevskiy<aik@amd.com>
> Cc: Lukas Wunner<lukas@wunner.de>
> Cc: Xu Yilun<yilun.xu@linux.intel.com>
> Cc:iommu@lists.linux.dev
> Cc:linux-pci@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   drivers/iommu/iommufd/viommu.c | 35 +++++++++++++++++++++++++++-----
>   drivers/pci/tsm/core.c         | 22 ++++++++++++++++++++
>   drivers/virt/coco/tsm-core.c   | 37 ++++++++++++++++++++++++++++++++++
>   include/linux/iommufd.h        |  2 ++
>   include/linux/pci-tsm.h        | 24 ++++++++++++++++++++++
>   include/linux/tsm.h            | 25 +++++++++++++++++++++++
>   6 files changed, 140 insertions(+), 5 deletions(-)

This change spans both PCI/TSM and IOMMUFD. Could it be split into
separate patches for each subsystem—for example, one adding the TSM
lookup interface and another updating IOMMUFD to use it?

Thanks,
baolu

