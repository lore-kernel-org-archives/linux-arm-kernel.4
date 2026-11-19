Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93883606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUTFs+/r;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZ0zE6AQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E7h8y9q5NeM+rdkgTl7ssLz1V6qUb/C0JHpQHZ+0bxs=; b=kUTFs+/rt6eBGL
	Ge2u9eR31vxZeIMueXdSYCmjRXl9kLpmu58BMg/MoM/ERxgKfpAMN7tRR7WmlZLTBgvqzXcexPLT7
	+6bCoIGqTqpLWdZKipOX419LGlRzgLfVSefdl4FjKVSlVASLsg0KDZE737zEQSxzyLT+pD4dJ28lk
	XOImXn0xBBuJDLkaP2eTJwb3rbUTG+fpGzjVZ8GaoKUaZllO2VjON+urEGb+fgi0xwo824ncqZ/b/
	ZjVtvxvqoolJ4RxwgC6zkuIIcKEGZJNjPqBfl6aC3zXG5s4XPWhdnHYUECzjfPewsuf1ekBFX8bBS
	hXMWG9cdvQh3WEDRsO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwQJ-0000000B3KH-09KV;
	Thu, 19 Nov 2026 07:19:11 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwQE-0000000B3Jd-3aOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795072747; x=1826608747;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3DN1/OgZfO6kqe/noeYjCjobh7lUNxQjvfpeYc0fl00=;
  b=PZ0zE6AQUr7rSBE2UfbYoC68H7paaWqJGSO4qi3nTvPeqaeU6XyM+kIC
   p0J6V40KWpUqUxhiCdFSM2Eg5KSBJ4658BjdpmA3ZIKPrLbpPOqUF80+W
   /yHCVzC04/Sl9hh8cERH83ie2B/z7hiDAZp/bvI450e/4wMpoOwrgyKp4
   3rVCbFZltMLEpJQuntX61CRgbeI47TPV5IASkVhbGL8QkDwBOaG/cZjzs
   B3JFvK3kdVfvlmXgCBKikOdJcg/yANTVjcgVsxLQVdsiuK2WSsiyzNYyW
   umkF+IWWjvvdGY4DiySzUQmuP23hA+4JynRwC9jnujTTR7II84HgeFeMw
   w==;
X-CSE-ConnectionGUID: MO6lXyJfSgGQcM+YL2Zq2w==
X-CSE-MsgGUID: ArT9jmwjQT2IDNiMJrmsFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3991651"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3991651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:19:06 -0800
X-CSE-ConnectionGUID: iHQUrNNQQoW2AgElOEgTwA==
X-CSE-MsgGUID: 4Ehj8R4lSQCZoiG7usmh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10453034"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:18:56 -0800
Message-ID: <a594edd6-6184-4381-9b48-004c18efa56f@linux.intel.com>
Date: Thu, 19 Nov 2026 15:18:54 +0800
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
Subject: Re: [PATCH v9 01/13] virt: coco: tsm: Require PCI operations when
 registering a TSM
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-2-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261116081935.85372-2-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231906_968645_784D9D37 
X-CRM114-Status: UNSURE (   8.10  )
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
> Reject a NULL pci_ops argument in tsm_register(). Every registered TSM
> then has PCI operations, so registration no longer needs separate paths
> for TSMs without them.
> 
> Cc: Alexey Kardashevskiy<aik@amd.com>
> Cc: Jason Gunthorpe<jgg@ziepe.ca>
> Cc: Lukas Wunner<lukas@wunner.de>
> Cc:linux-coco@lists.linux.dev
> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
> ---
>   drivers/virt/coco/tsm-core.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

