Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6393606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rhF1sttV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVCKZF+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DaFOdktrS9fp8GjCaaexp9MaiiYjCXQTieg0RYTagzo=; b=rhF1sttV7/vP8Frc08C0xRUs59
	hzP8/TD+o2G35f/HluKS5y3uhprOGQRovTJaiQRcRzhQBGUWus/P699U4lkEvOxOHoTjT6eUwldqr
	50YJ60Zp9coIolTGQfE96QXrvMuGtJwJlQd7DEk//0DZeKYD5nShVoqYOIgv96tRrVAD9hJWLU34a
	JxTVoHQSQox20hAMZNqaMBF+hQzjML+UJFv5221dbz0GI18E6lbYZBfnUolRu/h4TOVHnTEdzWc2u
	lhQr0MPTmk8ej4F1IhuZIdjrNybINCs24lY2EAdHf6XOMZKMrS01K6T7BPERf1L6/mp0VMDyO03eb
	GprHou6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS6B-00000009XBE-2vRl;
	Thu, 12 Nov 2026 10:32:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS6A-00000009XB7-1FFj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CBF94039C;
	Thu, 12 Nov 2026 10:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9843A1F00A05;
	Thu, 12 Nov 2026 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479525;
	bh=DaFOdktrS9fp8GjCaaexp9MaiiYjCXQTieg0RYTagzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SVCKZF+auGmqT7JSUb746d9UAYnxXK8NWFfq/0oYpoErPWvB81l2FLR7ZNtt1TzRs
	 SOfI8u76neTSvF2w5qbIOVuKL+j0Qdh6z4NfLSuKTzJC1HYiLRrvVCW+ItdeGsyYhB
	 0xlkYqobVHgprk7YC6bfI9EaNr8ah+XrX4cNJm0+dsmvib7BsjEv9Z3jN2rLkg2sGR
	 MI32t1e5nR4llWY0pS55Dcb/MdeZz4OkIAu7g3AqoCR6aOMCNrkFy4bHY133gLUfKu
	 NvKAmHPiobyEkFiawUS89SUAGf2RECSFN4yWnkCah3YSfAeSzsWc22rZpjE4HCsa5S
	 l3Qlv9hfTFjNQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH v8 11/15] iommufd/viommu: Select vIOMMU operations
 before allocation
In-Reply-To: <SA2PR11MB4844544BB238847916EA3A038C762@SA2PR11MB4844.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-12-aneesh.kumar@kernel.org>
 <SA2PR11MB4844544BB238847916EA3A038C762@SA2PR11MB4844.namprd11.prod.outlook.com>
Date: Thu, 12 Nov 2026 16:01:54 +0530
Message-ID: <yq5ay0aypch1.fsf@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Tian, Kevin" <kevin.tian@intel.com> writes:

>> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> Sent: Thursday, November 5, 2026 12:16 AM
>> 
>> Physical IOMMU drivers currently provide the vIOMMU size and
>> initialization callbacks through iommu_ops. The initialization callback
>> then selects and installs the corresponding iommufd_viommu_ops.
>> 
>> Add iommu_ops::get_viommu_ops() to select the operations from the
>> physical device and requested vIOMMU type before allocation. Move the
>> size and initialization callbacks into iommufd_viommu_ops. The core can
>> then validate the selected operations, allocate the driver structure,
>> initialize it, and install the operations.
>> 
>> Convert AMD, Arm SMMUv3, Tegra CMDQV, and the selftest backend to the
>> new interface.
>> 
>> Selecting the operations early allows subsequent changes to use
>> implementation-specific vIOMMU properties, including when validating the
>> parent HWPT.
>
> what does "implementation-specific" mean? Isn't every existing vIOMMU
> type already implementation specific?
>

How about I update this to.

The current code requires a valid parent HWPT before calling
viommu_init(), which selects the vIOMMU operations. A later patch adds
an operations flag indicating that a vIOMMU type does not require a parent
HWPT. Selecting the operations earlier allows the core to check that flag
before deciding whether to look up and validate a parent HWPT.

>
>> 
>>  /*
>>   * This function is assigned to struct
>> iommufd_viommu_ops.alloc_domain_nested()
>> - * during the call to struct iommu_ops.viommu_init().
>> + * when the vIOMMU operations are selected.
>>   */
>>  struct iommu_domain *
>>  amd_iommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32
>> flags,
>
> the comment sounds changing the semantics.
>
> ideally it's still assigned at viommu_init(), just from iommufd_viommu_ops
> instead of iommu_ops now.

How about
 /*
  * This function is assigned to struct iommufd_viommu_ops.alloc_domain_nested()
- * during the call to struct iommu_ops.viommu_init().
+ * during the call to struct iommufd_viommu_ops.viommu_init().
  */

-aneesh

