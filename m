Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uAum3C+J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sf4jeTTU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GCQiR5Lx2UKMEtsK+gSKSdJH4PY2fbRO9XAcb5R+0z8=; b=uAum3C+J/UHq/6
	7YNLVl8LDac7nj6q9oJiQ9Gf5eN3tYDiFVGDUIts/3MqO2hpYtzXAv500SeBaawy7Tj51Mkos5Rib
	mw7OYIOGs598BKK+W721rLAT7gJ8VYRqEwFQEtejWLkiM18fk3vAEWsHlwGlyIecn4y2fDEpyVPuQ
	A4t31WMNeihKXNt2fOjjKufVnfGkp+Eh/ci/9egTAKeqS7SjYhl3ynS0kzkhPv7B4RMV6PBQQm0O3
	EmqL33aLDc+E9ovNIBfn/A8Zb/819oQkbeIhRjJFXhVAP4pUgnl0iRJypLuCxTwH75cu0ozz+RkZQ
	EonekA/QV0uB8tTUCx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViiQ-00000005aMP-1Jjo;
	Tue, 24 Nov 2026 05:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViiO-00000005aM9-0lFw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 05:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99DE44082B;
	Tue, 24 Nov 2026 05:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E35D1F000C4;
	Tue, 24 Nov 2026 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795496710;
	bh=GCQiR5Lx2UKMEtsK+gSKSdJH4PY2fbRO9XAcb5R+0z8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Sf4jeTTUeyNECnDrWH/zHQwCweqyr3ICg/XJr7Dn7sQUhHdZSBrQSD52eyo6OmH0Q
	 zU8gOnX247GPxo4ufgj/OAOJ3DoOsgjDn3NaJ1x3hgmutbUe9OpgE/loVkCo79kJxR
	 oRohNM3MgCe0WDqEpWRyv1fw3lRIHaMTei8SLBUsVYDEYEzjNDq10xh+T1xQ/nzrLg
	 tI3D+xn/LzxZQ6MvVEHtySmqi/Zejda2tFa6wKh82wHIoDZ2wN/DlM4JuRjYn5fp3M
	 baPqje+9fvFyJGEsSLy0k2u6v7W42SrhJUxFg2/zy9paZ5C6Ektd1wsCp1zwiH30CK
	 H2nILDRrxSQqQ==
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
Subject: Re: [PATCH v9 10/13] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
In-Reply-To: <2d8af908-4dd5-43a9-b618-d1ee4189f6ba@linux.intel.com>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-11-aneesh.kumar@kernel.org>
 <2d8af908-4dd5-43a9-b618-d1ee4189f6ba@linux.intel.com>
Date: Tue, 24 Nov 2026 10:34:58 +0530
Message-ID: <yq5ao6bebz0l.fsf@kernel.org>
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
>> In confidential-computing configurations, a vIOMMU may be implemented by
>> a TSM driver rather than by the physical IOMMU driver. Such an
>> implementation also needs the TSM identity when creating and validating
>> vdevices.
>>=20
>> Allow VIOMMU_ALLOC to first query the TSM associated with the target PCI
>> device for vIOMMU operations. Fall back to the physical IOMMU driver
>> when the TSM does not provide operations for the requested vIOMMU type.
>>=20
>> Resolve the PCI TSM association under pci_tsm_rwsem, take a TSM device
>> reference, and pin the module providing the operations. Store the TSM
>> device in the vIOMMU. Release the device reference and module pin on
>> allocation failure, fallback to the physical IOMMU driver, or vIOMMU
>> destruction. Drop the device reference before releasing the module pin,
>> since the final put may call into the backend module.
>>=20
>> The device reference preserves the TSM allocation. Backends providing
>> vIOMMU operations must not unregister their TSM while the module is pinn=
ed,
>> since the reference does not prevent backend resource teardown.
>>=20
>> Cc: Jason Gunthorpe<jgg@ziepe.ca>
>> Cc: Kevin Tian<kevin.tian@intel.com>
>> Cc: Joerg Roedel<joro@8bytes.org>
>> Cc: Will Deacon<will@kernel.org>
>> Cc: Robin Murphy<robin.murphy@arm.com>
>> Cc: Bjorn Helgaas<bhelgaas@google.com>
>> Cc: Alexey Kardashevskiy<aik@amd.com>
>> Cc: Lukas Wunner<lukas@wunner.de>
>> Cc: Xu Yilun<yilun.xu@linux.intel.com>
>> Cc:iommu@lists.linux.dev
>> Cc:linux-pci@vger.kernel.org
>> Signed-off-by: Aneesh Kumar K.V (Arm)<aneesh.kumar@kernel.org>
>> ---
>>   drivers/iommu/iommufd/viommu.c | 35 +++++++++++++++++++++++++++-----
>>   drivers/pci/tsm/core.c         | 22 ++++++++++++++++++++
>>   drivers/virt/coco/tsm-core.c   | 37 ++++++++++++++++++++++++++++++++++
>>   include/linux/iommufd.h        |  2 ++
>>   include/linux/pci-tsm.h        | 24 ++++++++++++++++++++++
>>   include/linux/tsm.h            | 25 +++++++++++++++++++++++
>>   6 files changed, 140 insertions(+), 5 deletions(-)
>
> This change spans both PCI/TSM and IOMMUFD. Could it be split into
> separate patches for each subsystem=E2=80=94for example, one adding the T=
SM
> lookup interface and another updating IOMMUFD to use it?
>

Sure, I'll split it into separate patches.

-aneesh

