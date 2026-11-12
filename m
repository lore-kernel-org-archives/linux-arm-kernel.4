Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5403606A894
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aPwN7w4s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyTu+pBP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pywy5r6pDPMlHENdQdhMX3LebB9YShrau+u2EOFSYes=; b=aPwN7w4smWoF0ubwtsb0sg6jJl
	L1dNz/VPMYhV0XVusp7jrEGiSw66wUegezTR5GoCiC6M5dlLvQtHH6oBGIVHDt0JzpcNSuI7fKKz0
	vXFc0KFGMOhaN5B9eOLzXuu6ZFnhVnJKGNLKi+sUPKKISotY3R+sB2KSVspxOkQQgGmbTn1MBd9Wn
	EMWnSkLh15VN+Zkx1EOq0Rt49xk6+6/MP8suYF43BOlj3O9ZekT0qO803I+WnJAnAF4QOf3bYwTXM
	XWz3eJyUKBwifz/n8pW7ZsM52uMMYMv1PU1JFHV23do5Z893QPY+T7qGQI83KswvFcWXUw9ousow5
	l0hHo+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSOt-00000009aeJ-1PXf;
	Thu, 12 Nov 2026 10:51:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSOr-00000009aeA-1P8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:51:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A605643E99;
	Thu, 12 Nov 2026 10:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE0E1F00A05;
	Thu, 12 Nov 2026 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480684;
	bh=pywy5r6pDPMlHENdQdhMX3LebB9YShrau+u2EOFSYes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NyTu+pBPJgo0IB/eZQsoHzsyRKO3iN+jIxpyl8bWDIcxaDufID0hYesdnuAEu5S09
	 Sckhb1ihC0JjNfCe/VZ/0dE6EfvHMq1aeQjOGwGk+OV91Ff47v1Lqs6UvhF605Eta3
	 wqD82AU6Z6Q5HyU9Ltah30EsTw+B1M4g4W5yhvs3eqwGRFkKZ3lxXdMmEjSEumyXip
	 znxH4zR4+tL3nPFrvhzEV7ItlMOu0ZXK4cjY8u2jI7AC6j4dY1Vgqz6/YgsxSq5QDO
	 kxcuLzRHt03BGPhofFDyKegLBVhQ/EevoaFq2FN8rm1xr5+eOOTgX+dssNLgKSFySa
	 LHRs3t7Xtw3bA==
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
Subject: RE: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
In-Reply-To: <CO1PR11MB483536F447DF311831A64D4D8C762@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <CO1PR11MB483536F447DF311831A64D4D8C762@CO1PR11MB4835.namprd11.prod.outlook.com>
Date: Thu, 12 Nov 2026 16:21:12 +0530
Message-ID: <yq5av762pbkv.fsf@kernel.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Tian, Kevin" <kevin.tian@intel.com> writes:

>> From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> Sent: Thursday, November 5, 2026 12:16 AM
>> 
>> In confidential-computing configurations, a vIOMMU may be implemented by
>> a TEE Security Manager rather than by the physical IOMMU driver. Such an
>
> TSM is the firmware. Here it is the TSM driver.
>

Will use TSM driver instead of TSM 

>
>> implementation also needs the TSM identity when creating and validating
>> vdevices.
>> 
>> Allow VIOMMU_ALLOC to first query the TSM associated with the target PCI
>> device for vIOMMU operations. Fall back to the physical IOMMU driver
>> when the TSM does not provide operations for the requested vIOMMU type.
>> 
>> Resolve the PCI TSM association under pci_tsm_rwsem, pin the module
>> providing the operations, and take a TSM device reference. Store the TSM
>> device in the vIOMMU and release both references on allocation failure,
>
> what does "both references" mean?
>

device reference and module reference. How about i update this to

Resolve the PCI TSM association under pci_tsm_rwsem, take a TSM device
reference, and pin the module providing the operations. Store the TSM
device in the vIOMMU. Release the device reference and module pin on
allocation failure, fallback to the physical IOMMU driver, or vIOMMU
destruction. Drop the device reference before releasing the module pin,
since the final put may call into the backend module.



>
>> fallback to the physical IOMMU driver, or vIOMMU destruction. Keep the
>> module pinned until after dropping the device reference, since the final
>> put may release the TSM device.
>> 
>> The device reference preserves the TSM allocation. Backends providing
>> vIOMMU operations must not unregister their TSM while the module is pinned,
>> since the reference does not prevent backend resource teardown.
>> 
>> This enables the Realm vIOMMU implementation to provide its operations
>> through the PCI TSM backend and retain the TSM identity needed by its
>> vdevices.
>
> It's not specific to Realm vIOMMU, and Realm is never explained in
> prior patches.
>

I will drop this para.

>
>> @@ -49,15 +52,33 @@ int iommufd_viommu_alloc_ioctl(struct
>> iommufd_ucmd *ucmd)
>>  		rc = -EOPNOTSUPP;
>>  		goto out_put_idev;
>>  	}
>> -	if (!iommu_dev->ops->get_viommu_ops) {
>> -		rc = -EOPNOTSUPP;
>> +	tsm_dev = tsm_get_device(idev->dev);
>> +	if (IS_ERR(tsm_dev)) {
>> +		rc = PTR_ERR(tsm_dev);
>> +		tsm_dev = NULL;
>>  		goto out_put_idev;
>>  	}
>
> Is it legal to have a device connected in tsm (i.e. with a valid
> pdev->tsm) but one wants to assign it to a non-confidential
> guest using a non-cc vIOMMU type?
>
> If yes we want to fallback to the physical IOMMU driver even
> when tsm_get_device() returns an error.


tsm_get_device() does not use the vIOMMU type, so an error return
(rather than NULL) indicates an actual error. In the case you describe,
tsm_get_device() should return NULL or a valid TSM device. For a valid
TSM device, tsm_viommu_get_ops() will return NULL because the TSM driver
does not support the non-confidential vIOMMU type, allowing fallback to
the physical IOMMU driver.

-aneesh

