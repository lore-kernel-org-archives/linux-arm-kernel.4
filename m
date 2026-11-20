Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KRzO+qdv;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdZvtfwq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JWqZphWtsTTHGvtPX+nDXnK7WB6OveEljmDurlpZ0No=; b=KRzO+qdvOs0NU6
	gtgeY6RvGGet5UPaYPABPtWN4EPAB7UaCiy+V0lZ+HKuXwce0xJOpdmWHsRW6VPALP5gsVX/EPL1W
	+Q58czGkS5YeHaTW5zE9rBxmaRP65vhwrYlxG07klI9IqZ/ujORlF6vtK5nchVEKTUVXyYKsSnkmG
	ACXPdPvpaWgVSNlFKNCJW4eK+6ZeT1hvHaPRNU6iAfGrX0N1BgF/yRJ9ATt/TF2kXZ8gyQdhT8no6
	525Bkst380+NB14DGbq9xytRGVV9S6DXWD2jObeBLenTShysxzel3JBH5oDlR46ZDiC4VaZv3BIBN
	wem+uIxjobGjhIzhZMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDG4-0000000Dp5D-0b4Q;
	Fri, 20 Nov 2026 01:17:44 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDG1-0000000Dp4o-2CIV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 01:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795137462; x=1826673462;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tSIkeLpI67gd3O+5LLJj1iLHNmboO3o26BMKDZZIKS4=;
  b=hdZvtfwq7SSFMrevbWwoE+ONFUu0RhsW7/3M5uvytLWqW0Z4dyCtjPn3
   g8RVssfYqW7ZGHXrai3CXbc6jQfovUa2ygNMNKIzwop/ltGz4juSq/8Nk
   QIEdG5fmBWWC3zpzNRms+H90x+pVv8DuxmoLR3TkOU77PQuASl2Qne9VS
   6QukfxS9EbVigG826j7z79yTyM9YYQPi9IV5bJHr2q1N5/FZAu89CSxGJ
   O2SDxbJ4OiJsr/R2CSqSDfjk3FbApGRMD2pWEmHRI9oFDLhjALWtTpy5y
   M1YzRdJ+NgUNzP2WHlsEEaP/Va7Y5xjsRHJRrmoTxhrYGqvxpsVVfEcZz
   A==;
X-CSE-ConnectionGUID: cS7URcXuR5GGVoaYk5nkLg==
X-CSE-MsgGUID: 66dsZGWyTiCff8WfrRWB2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3908765"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3908765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 17:17:40 -0800
X-CSE-ConnectionGUID: 6v5FeCvQRiSoxhgN7PCPHA==
X-CSE-MsgGUID: l3gJMTkWTfSiu/FcIwximA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10478625"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 17:17:32 -0800
Message-ID: <3201ab57-cba6-4484-8dbd-7cfb79d731cf@linux.intel.com>
Date: Fri, 20 Nov 2026 09:17:30 +0800
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
Subject: Re: [PATCH v9 06/13] iommufd: Add a vDEVICE operation ioctl framework
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-7-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-7-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_171741_637733_7D0ACDA0 
X-CRM114-Status: GOOD (  10.16  )
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
> Add IOMMU_VDEVICE_OP to execute operations on a vDEVICE using separate
> request and response buffers. Each operation defines its request and
> response formats, with response capacity checked before changing device
> state.
> 
> Look up the vDEVICE and check its supported_ops mask before dispatching
> an operation. Reject out-of-range operation numbers before testing the
> corresponding bit. Backends set the mask during vdevice_init().
> 
> This patch defines no operations. The default dispatch returns
> -EOPNOTSUPP; later patches can add operations independently.
> 
> Cc: Jason Gunthorpe<jgg@ziepe.ca>
> Cc: Kevin Tian<kevin.tian@intel.com>
> Cc: Joerg Roedel<joro@8bytes.org>
> Cc: Will Deacon<will@kernel.org>
> Cc: Robin Murphy<robin.murphy@arm.com>
> Cc: Alexey Kardashevskiy<aik@amd.com>
> Cc: Lukas Wunner<lukas@wunner.de>
> Cc:iommu@lists.linux.dev
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   drivers/iommu/iommufd/iommufd_private.h |  1 +
>   drivers/iommu/iommufd/main.c            |  3 +++
>   drivers/iommu/iommufd/viommu.c          | 36 +++++++++++++++++++++++++
>   include/linux/iommufd.h                 |  3 +++
>   include/linux/tsm.h                     |  1 +
>   include/uapi/linux/iommufd.h            | 33 +++++++++++++++++++++++
>   6 files changed, 77 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

