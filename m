Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E2QXYkX0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmOoe8fI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vc9ZjW3MdZZrSawTDR1LO60vJFvLL8Ygoa4DX6STls8=; b=E2QXYkX0tllmsFTz0MHvKF5DAa
	VIDMe+G0h9qvMF2hs2qd/e12dk+kHcs3Jtg3cEJYPuwlI2YT4Jq1vBSv8Gv0rbtUk2/vpN7942zIk
	cub9D2Unw653qV6ZJIx9S9XwRCpKbbq/FFFxTi8Q67BeuBcVV/ViJia0WyYeMKNa7+p46kmziK+yM
	HTXwSBlOjzwwiUGDoBPhFn7F6tgLsuioWR5hsAS8ajAGE5HoEl1sdAATM5y7xQrXR70blZMDcdjb8
	jRf6qjp+QTpTx62k60CRetdudOGKcAP+4rmJNzzZmAQTf2s4ggBK2Pfgy/AxP1VIZRit98n0txxMu
	cJSbnKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj0K-00000005bPC-1uRO;
	Tue, 24 Nov 2026 05:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj0I-00000005bOs-2x82
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 05:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCF7A60DC3;
	Tue, 24 Nov 2026 05:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3B21F000D0;
	Tue, 24 Nov 2026 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795497820;
	bh=vc9ZjW3MdZZrSawTDR1LO60vJFvLL8Ygoa4DX6STls8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VmOoe8fIHUx8L+nCT7j0WFguj/mguXuQR+RGYclGZKFMdy5PEqlwkPvJZux3QVsb3
	 +BwWMmsS1qJ+8/JwL+UpJSrNkZlHXHU1QLvTZFptUArdX/bTBrW1UPnRTO2q+RDxmS
	 O1S4B2d4ZwGaIaDmOfEyz4z+3HMfvTZof4a76BDCAs9HoV3uiX1V/fHDcJVz/2iX2N
	 UlDOCiqW0cyYxgG2vcmjxmTYQ9FwgbMUtavZB2X3C0kJYq7ZdPZudm3NbNVsRgkdsj
	 0j0VJA+pjn/QLwJ6eSWg4h4DIYzRwnNjwFoW8rNAPvswHpBqjJRQL9CmofF4QogBGl
	 Q8aMWhaAGmr4w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Baolu Lu <baolu.lu@linux.intel.com>, linux-coco@lists.linux.dev
Cc: baolu.lu@linux.intel.com, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 11/13] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
In-Reply-To: <620712ae-e21e-4daa-9cd3-0c5d06ffb67f@linux.intel.com>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-12-aneesh.kumar@kernel.org>
 <620712ae-e21e-4daa-9cd3-0c5d06ffb67f@linux.intel.com>
Date: Tue, 24 Nov 2026 10:53:27 +0530
Message-ID: <yq5ajym2by5s.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Baolu Lu <baolu.lu@linux.intel.com> writes:

> On 11/16/2026 4:19 PM, Aneesh Kumar K.V (Arm) wrote:
>> VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
>> the selected vIOMMU implementation has no use for one. This would force
>> implementations such as the following Arm Realm vIOMMU to create an
>> unused parent.
>> 
>> Add IOMMUFD_VIOMMU_NO_HWPT so an implementation can opt out. Require
>> hwpt_id to be zero in that case and pass a NULL parent domain to its
>> initialization callback. For implementations that require a HWPT, verify
>> that the parent supports nesting and its domain belongs to the device's
>> physical IOMMU driver before invoking viommu_init().
>> 
>> Reject nested domain and hardware queue allocation for a vIOMMU without
>> a parent, and document the two allocation modes in the UAPI.
>> 
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Kevin Tian <kevin.tian@intel.com>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: iommu@lists.linux.dev
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   Documentation/userspace-api/iommufd.rst | 44 +++++++++---------
>>   drivers/iommu/iommufd/hw_pagetable.c    | 14 ++++--
>>   drivers/iommu/iommufd/viommu.c          | 62 +++++++++++++++----------
>>   include/linux/iommufd.h                 | 13 ++++--
>>   include/uapi/linux/iommufd.h            |  3 +-
>>   5 files changed, 81 insertions(+), 55 deletions(-)
>> 
>
> [...]
>
>> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
>> index ae62db50885c..52e52ef089a2 100644
>> --- a/drivers/iommu/iommufd/hw_pagetable.c
>> +++ b/drivers/iommu/iommufd/hw_pagetable.c
>> @@ -306,6 +306,10 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
>>   		return ERR_PTR(-EOPNOTSUPP);
>>   	if (!user_data->len)
>>   		return ERR_PTR(-EOPNOTSUPP);
>> +	if (!viommu->hwpt)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +	if (!viommu->iommu_dev)
>> +		return ERR_PTR(-EOPNOTSUPP);
>>   	if (!viommu->ops || !viommu->ops->alloc_domain_nested)
>>   		return ERR_PTR(-EOPNOTSUPP);
>>   
>> @@ -404,10 +408,12 @@ int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
>>   		struct iommufd_viommu *viommu;
>>   
>>   		viommu = container_of(pt_obj, struct iommufd_viommu, obj);
>> -		iommu_dev = iommufd_device_get_iommu_dev(idev);
>> -		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
>> -			rc = -EINVAL;
>> -			goto out_unlock;
>> +		if (viommu->iommu_dev) {
>> +			iommu_dev = iommufd_device_get_iommu_dev(idev);
>> +			if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
>> +				rc = -EINVAL;
>> +				goto out_unlock;
>> +			}
>
> Is it intended that every tsm-provided viommu has viommu->iommu_dev ==
> NULL?
>
> If so, could the tsm-provider patch make provider selection exclusive by
> looking up the physical iommu only on the fallback path? All checks
> against viommu->iommu_dev should be in that patch. This non-parent-hwpt
> viommu support patch should no longer check viommu->iommu_dev.
>

IIUC, you are suggesting moving the iommu_dev check from this patch to
patch 10?

>
> Also, if viommu->iommu_dev and viommu->tsm_dev are mutually exclusive,
> could that be made explicit in a comment or by using a tagged union?
>

That would be a much larger change, as it would require updating all
current users of iommu_dev to check the tag. We can address that
separately from this series.

>
>>   		}
>>   		hwpt_nested = iommufd_viommu_alloc_hwpt_nested(
>>   			viommu, cmd->flags, &user_data);
>> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c

 [ ... 163 lines skipped ... ] 


-aneesh

