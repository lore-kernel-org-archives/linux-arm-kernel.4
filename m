Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ciL1SO6n;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TlJMinkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aRheB04iyX7dVXieUD6PMSF3gXPAOjSc37jCJuLzCOA=; b=ciL1SO6naHLm0B
	iewIg6bGTJlSxK9jsGLq8sSrUGdwwZWqzAfOstgDsOVIG5AY4oB2VOme1KCp4gUvcNXam188Ch7Ro
	0Xu1HSuMhWgy1Pf+dipJiCuNIgQ0+gHNHyGC2IjgonK8bHfwzg49ARRHrthmo5Jb3j6KrUXAjg0tp
	2C0rOPKqz9mNN9dE81ljpcisuj52wYbxoXC58mCeD/CLzmjVcYvVyA77EHoHMBSG8QsHbi8xyY67o
	8BXjIY3olWRxlGxdyEHjgGyboYF9xdpdTNlk8W9xEIJ/ED/BiD/9A1ySYnN2Tgr239Tnwe5XZxv3K
	u5DlxBE/Ahfc3M4J/Syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDZD-0000000DqTr-13yT;
	Fri, 20 Nov 2026 01:37:31 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDZA-0000000DqSw-0njS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 01:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795138648; x=1826674648;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PqF9kZKHLawccCDUzoTo95Nflk56OouMnex8knpthCg=;
  b=TlJMinkWtRK2TKJJrwADOR0ALLhBcAVeRY2GYeiYmyVBFTH5vFZBKbpC
   hf64YYGsNN1g9TP+h+GUX0wbjyBGVTX+eKGhnKAMeBqN0l+gsmiSSKCTi
   3LguOSxsldkT4n8ZdMAdhxUHpkO2Hgba/SF/MbVwNldjPGTZiYaFLQJ0O
   tx57a5n6zalXYWnlg6wzY0Ba8ISEcGOSy1oaRM8/9Jkk+G3qrcIGoY8er
   b+CLWJPXWRFKMruYNEIY/twh2/ta2opUyBaf0YJJJo2i6abdlfNHtnmh2
   Tw/OMnv7GU+Xx9f2HleDIaZc0JhLudzFRJ4I3MWGoIqTIcKirIZdkrOhO
   A==;
X-CSE-ConnectionGUID: /k22/vuPQ5O98JXw569Jig==
X-CSE-MsgGUID: BxNwad1KSNiQqDEjGFekVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3908721"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3908721"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 17:37:26 -0800
X-CSE-ConnectionGUID: QD2IAhdmTcWXu4GVw/OoQw==
X-CSE-MsgGUID: S+cVzm7cTCGeTTtfiaIvcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10867899"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 17:37:20 -0800
Message-ID: <e97e2e79-02e8-42c5-861b-a78636bcba0d@linux.intel.com>
Date: Fri, 20 Nov 2026 09:37:17 +0800
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
Subject: Re: [PATCH v9 07/13] PCI/TSM: Remove the legacy guest request
 interface
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-8-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-8-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_173728_303247_DC310DF9 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
> Guest TSM requests can now be dispatched through the IOMMUFD
> IOMMU_VDEVICE_OP ioctl. Remove the PCI-device-based guest request entry
> point, its scope enum and the corresponding PCI/TSM driver callback.
> 
> 
> Cc: Bjorn Helgaas<bhelgaas@google.com>
> Cc:linux-pci@vger.kernel.org
> Cc: Alexey Kardashevskiy<aik@amd.com>
> Cc: Lukas Wunner<lukas@wunner.de>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   drivers/pci/tsm/core.c  | 60 ----------------------------------------
>   include/linux/pci-tsm.h | 61 +----------------------------------------
>   2 files changed, 1 insertion(+), 120 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

