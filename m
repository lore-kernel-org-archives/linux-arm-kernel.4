Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1312606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/VRQXIy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ff1VdN9z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bjVAU0iIAOgnI+Z9r4rv0Vrj1mrxZe06Xngjbnjh7i8=; b=J/VRQXIyu6NJo5
	virjkRRhwgO9ZPMEQt8RAfyPtozaqrQ3lGCrcR6wVw6wuUr3fdsaTvJJktFWaew809X1DSfHJE6Ni
	VWNSmgc3iI+pRFzevD+9xX49UVxgSQPWLqeyPlwrc4CsII5jmcBpbok3h80OY4dA0JYdYSMyvd2J6
	qsXvyJss7aG9KF6cgQb00kzC6y73M6vutJZdgCtDtmcgDRv6W3FROZo6/5gnSA1OA7bJZQLviXPVZ
	1L9ma+sqUXkNg0N3mz5X8WtkN3R6p9h2C9wJI+sF/1Ca5/u1eB8kge5Kfyi+EbE+iSwe+oj5zSvuN
	cGEAJTyp9xQBoxKRUpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhjF-00000005UiY-0sY9;
	Tue, 24 Nov 2026 04:02:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhjD-00000005UiR-2Juw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 04:01:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFD32435EC;
	Tue, 24 Nov 2026 04:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E733C1F000C6;
	Tue, 24 Nov 2026 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795492918;
	bh=bjVAU0iIAOgnI+Z9r4rv0Vrj1mrxZe06Xngjbnjh7i8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ff1VdN9zQAt1r47nwbUlqdCSDMu2C95as1MKY0RIwpnWfHbyx0cMO5TKpv4pkcKKn
	 8lgyvvRh56RPwugFLv4xkS7YVm9qh6aUKLwWtDVzNcCuBEf6P5D3LslpYpdaiz4sX9
	 CBcySUuMnXhYdaJ8KtmPtz/BjADI+AVI71RUkQxdChPaS5/RA1sFYw1M6ACBqdLbf+
	 sRQq9r9854hMiPvCJ50fgPXKyQ6okN2FKfGNuoCGeSfAY+495jj6enS3CwmGimIMHS
	 rdna2uyn8LJdO7q4zwLy+XEDnz6kgnLU6aILwK1oRajYg1d7TqUYNwe4HHsyR9IN7T
	 00oxS3AsIR9/A==
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
	linux-tegra@vger.kernel.org, patches@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 04/13] iommufd/device: Associate KVM file pointer
 with iommufd_device
In-Reply-To: <fac3d200-e1e8-4a0f-bd41-8e1c0d727d1a@linux.intel.com>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-5-aneesh.kumar@kernel.org>
 <fac3d200-e1e8-4a0f-bd41-8e1c0d727d1a@linux.intel.com>
Date: Tue, 24 Nov 2026 09:31:43 +0530
Message-ID: <yq5azeuyc1y0.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
>> From: Shameer Kolothum<shameerali.kolothum.thodi@huawei.com>
>>=20
>> TSM vDevice support needs access to the KVM associated with a VFIO device
>> after the device has been bound to iommufd.
>>=20
>> Extend iommufd_device_bind() to accept the device's KVM file and store it
>> in the iommufd_device. The KVM file reference is owned by VFIO and is
>> already held for the duration of the device open path.
>>=20
>> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
>> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
>> Signed-off-by: Shameer Kolothum<shameerali.kolothum.thodi@huawei.com>
>> [nicolinc: fix build error in iommufd_test_mock_domain()]
>> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
>> [aneesh.kumar: Switch to use kvm_file]
>> Cc: Jason Gunthorpe<jgg@ziepe.ca>
>> Cc: Kevin Tian<kevin.tian@intel.com>
>> Cc: Joerg Roedel<joro@8bytes.org>
>> Cc: Will Deacon<will@kernel.org>
>> Cc: Robin Murphy<robin.murphy@arm.com>
>> Cc: Alex Williamson<alex@shazbot.org>
>> Cc:iommu@lists.linux.dev
>> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
>> ---
>>   drivers/iommu/iommufd/device.c          | 7 ++++++-
>>   drivers/iommu/iommufd/iommufd_private.h | 2 ++
>>   drivers/iommu/iommufd/selftest.c        | 2 +-
>>   drivers/vfio/iommufd.c                  | 3 ++-
>>   include/linux/iommufd.h                 | 4 +++-
>>   5 files changed, 14 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/devi=
ce.c
>> index 1b0bdf57ac8a..935f42616a65 100644
>> --- a/drivers/iommu/iommufd/device.c
>> +++ b/drivers/iommu/iommufd/device.c
>> @@ -295,6 +295,7 @@ static int iommufd_bind_noiommu(struct iommufd_devic=
e *idev)
>>    * iommufd_device_bind - Bind a physical device to an iommu fd
>>    * @ictx: iommufd file descriptor
>>    * @dev: Pointer to a physical device struct
>> + * @kvm_file: VM file if device belongs to a KVM VM
>>    * @id: Output ID number to return to userspace for this device
>>    *
>>    * A successful bind establishes an ownership over the device and retu=
rns
>
> As discussed during the v8 review, how does this series address the risk
> that the KVM file pointer could become invalid if REMOVE_WAIT times out?
> The changelog says the extra KVM file reference was dropped. Is the
> timeout expected never to occur, or should it be addressed by a broader
> fix if it does? How about explaining this in the commit message so
> future readers understand why the extra reference isn=E2=80=99t needed.
>

The conclusion was not to fix it.

https://lore.kernel.org/all/20261112174009.GB2532299@ziepe.ca


-aneesh

