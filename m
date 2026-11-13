Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEslM2j4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+IV7MCg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1QCHCXTpwhaXOHfzz5l15bpjdkFUiznzxAOCYs8/1D0=; b=yEslM2j4D4d92qdEnPk0va6kZk
	Shq+GWNNTmvtSC/ya6SrQ4yC6znqBxVc/OBv7EzTOry9MtKkQboDj4yqnl2cGZcPV0E1gVxH3NJ0s
	wndyPeUEXWhZ3RgUDb+PgR2TzuAx70At85lebRD2WHRKsGBjKARSWajHvkTFQlUdSby7ccAgyrnhC
	gGzOeCugfNAdtBaBcvyjGZGlhOuruaj+47zR91bk3B9HkejUPEMu3F7+/us51oLDxkUcpT2KfEuJ/
	L+1qfOCkgMRVyB1c9hubpqK1gkqs7actYe4uIW4TOqjeIWFTLkFldws1XQx0qM1rD0RwwA3l9dwEh
	yLqzDc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkAj-0000000Bim6-1fg8;
	Fri, 13 Nov 2026 05:50:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkAh-0000000BilP-3gPt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 05:49:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0535C60234;
	Fri, 13 Nov 2026 05:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2A01F000C6;
	Fri, 13 Nov 2026 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794548998;
	bh=1QCHCXTpwhaXOHfzz5l15bpjdkFUiznzxAOCYs8/1D0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n+IV7MCgQdlJEEHAi6QKi/kWy8yzp/3uca4izpMGuczcmGYuWXP3sYO6HEulgaSBr
	 jiPtYks0VWhhv6b2H6VteZ5IaAhh5Zd1R7Q4rLovkGkISG7tPg3bxeb2G1DXjlB6qP
	 VDyDvwuF4X1U7cRFjeD2owWdYNi28hs7F7wxcGqpCUmQtrw4osKtcRuZM/NooYos0O
	 sJd4CYmm5Y50NXab3eCYjqRnjvTWUiEw4GDByC7PDQE+k0Q4B6nt+VDWI6ysFMK5zr
	 /KLvD3AiUaFTwd3rQgKN4RRszouPPgU26Q/Db8U6YHBXoV5XrhRsmcRCyb/Io6mwFw
	 l2Ohtqal/D2+Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, iommu@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>,
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
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 02/15] virt: coco: tsm: Remove the device from lookup
 before PCI teardown
In-Reply-To: <9eb572d7-fa3a-4734-9773-44a3fb465b6a@amd.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-3-aneesh.kumar@kernel.org>
 <9eb572d7-fa3a-4734-9773-44a3fb465b6a@amd.com>
Date: Fri, 13 Nov 2026 11:19:45 +0530
Message-ID: <yq5ajymhmgau.fsf@kernel.org>
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

Alexey Kardashevskiy <aik@amd.com> writes:

> On 5/11/26 03:16, Aneesh Kumar K.V (Arm) wrote:
>> PCI connect looks up a TSM by ID under pci_tsm_rwsem. Previously,
>> tsm_unregister() released that lock after tearing down PCI state while
>> the TSM was still in the class lookup. 
>
> tsm_unregister() is not touching that lock, what do I miss?
>

pci_tsm_unregister(). It uses guard(rwsem_write)(&pci_tsm_rwsem), so the
lock is released when pci_tsm_unregister() returns. We previously called
device_unregister() only after that.

>
>> A racing connect could then
>> attach a new PCI context that the teardown would never see.
>> 
>> Remove the device from the class lookup first, then take the PCI write
>> lock to drain in-flight operations and destroy their contexts. Drop the
>> device reference only after PCI teardown completes.
>> 
>> Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   drivers/virt/coco/tsm-core.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
>> index e784993353d8..f79135986102 100644
>> --- a/drivers/virt/coco/tsm-core.c
>> +++ b/drivers/virt/coco/tsm-core.c
>> @@ -56,26 +56,25 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
>>   	return no_free_ptr(tsm_dev);
>>   }
>>   
>> -static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
>> -						 struct pci_tsm_ops *pci_ops)
>> +static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
>
> Why changing a pointer to an int here as later tsm_register() converts
> it back to a pointer?
>

At the end of the series we have
static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)


>
> And I never understood what is _reset for here (so +1 for that) but
> now we have tsm_register_pci() and pci_tsm_register() which is weird.
> May be just open code it? Thanks,
>

How about rename that to 
__tsm_register(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)


-aneesh

