Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810AA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXams1H3;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FmDii5Tk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwjWgtW4kRseoA0zVDGCPLIdUcXknOULKOmu6gYkLdw=; b=dXams1H3cc4rC4
	KEFIhuMpeSmh1v/6a7SE+2VqAetn+e2iRAZKu8aCiZxWOECbXN4an/Ilr+D3t8XOarmuzWt8wceF0
	vR97DAqF/lIylUPnp+lI+yDxu6TNkdUQlXaaytkir+Vckpb52t8BoYmCBI0kodNhm4dU3DVzlBelj
	gjAedF9wcvUe1M2O6yeStdDVnnVIDGL3go02eS0S46/Ib4BEfLZ5x44/7FO/DzF8qZx6F6vNkghIU
	wih6pQjaQhGdiKSICCANDXU8zS//RG3r6KrbixNy3DYEXWxCqo57KufZkZtRq0rvV/Sd7Epu0SZKt
	ogF/ko2zIRipD7YgCu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEq2-0000000DvER-3crW;
	Fri, 20 Nov 2026 02:58:58 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEq0-0000000DvE3-2ISc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 02:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795143538; x=1826679538;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hj2txJligqlKIDnOrXcY2GWTzSNfobaEGxDoiQKT+JY=;
  b=FmDii5TkWVfiabeKlm1GtxUlCNwN0nINS6K5lIexlMMzoBJ3Vhgm5Pk8
   SdSeFf9pmKHo162mvxuHhV/uDfCCZ1QEQMGErXAo/lDWxUEvKHgG/dy80
   SJIutCe0rvAFQKdoGYr9oNBGd7kfxa2X6LktqxNKRJWsMLIAxO8VMwO18
   QAyL+sIwGqgBk+MxItFCDrdCYQLdm388RLHAyrsyVXgsPPEywnLSxzu3t
   QCqQIH3BLA1FKI2NlqdmtsXL2/pH98U5izjWdRQp8fPJpbmDomkJvYCiB
   30Il1sXMlXejtNgd3z3EBUY1rAoYA0z8VmAZOlzCL8PHbBSAi0KU9BxKV
   Q==;
X-CSE-ConnectionGUID: snhMfYnGTFaSsoFo23zI2Q==
X-CSE-MsgGUID: bFPv1G/YTVeswkpoSh332w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3931090"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3931090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:58:56 -0800
X-CSE-ConnectionGUID: pk12LqTwRhqc5Oao+l9uWg==
X-CSE-MsgGUID: fKSf6pqqQ4++4flk103ZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10591451"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:58:46 -0800
Message-ID: <0996eead-a63e-4a17-96d3-45ccd48cd4b1@linux.intel.com>
Date: Fri, 20 Nov 2026 10:58:44 +0800
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
Subject: Re: [PATCH v9 08/13] PCI/TSM: Keep connections active while device
 contexts exist
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-9-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-9-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_185856_641417_8F8BAB47 
X-CRM114-Status: GOOD (  11.12  )
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
> Add PCI TEE Security Manager (TSM) contexts that prevent PF0 disconnect
> while in use. Verify that the device is connected to the requested TSM.
> Each successful get returns a separate context and requires a matching
> put. Reject disconnect with -EBUSY until all contexts are released.
> 
> Remove the legacy bind and unbind interface. Device security state is
> managed by the backend, so also remove the associated "bound" sysfs
> attribute and its ABI documentation.

This patch does two things: add pci tsm contexts to keep the pf0 active
while in use, and remove the old device bind/unbind interface. Could
these changes be split into separate patches? That would make the
changes easier to review.

> 
> Cc: Bjorn Helgaas<bhelgaas@google.com>
> Cc:linux-pci@vger.kernel.org
> Cc: Alexey Kardashevskiy<aik@amd.com>
> Cc: Jason Gunthorpe<jgg@ziepe.ca>
> Cc: Lukas Wunner<lukas@wunner.de>
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   Documentation/ABI/testing/sysfs-bus-pci |  15 +-
>   drivers/pci/tsm/core.c                  | 227 ++++++++++--------------
>   include/linux/pci-tsm.h                 |  71 +++++---
>   3 files changed, 136 insertions(+), 177 deletions(-)

Thanks,
baolu

