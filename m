Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=beAhxLRA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUBfTU2b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0uolOVqD40xxzEqeWG55ZDWSlt7NaVVPmj6fMxUPPhA=; b=beAhxLRAldOc92v7iucGA6Om0T
	GP/IEpRCYtgm8luKJ1j1/nxOPew43gnrE9gTV8gn5LlC05nM1Ww5jUvyWxDsUxgCWa98sXgaiHmKW
	VcaXBVVNIM59hrhz4TJtGBPhrrFhIx7LbM+oHA7dyPRLooThvF9opKIpmCEzRgbyE3D9pZgHQqkCL
	7TZJQP3s9uxizL5gbG4zE1p59fWrvtpJf4iz9Mdaqym/wEMaVZFkbac9d8r0qxu8HfSNJOs1SzYzO
	fcmBjcXw0L02wvYdBv3k0oFHZFmtPjZWP2w1sVCUA957EShPedxaohb2erNEOSg8Tkx562SsICsn1
	qycSq8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhkd-00000005Uq1-2nvu;
	Tue, 24 Nov 2026 04:03:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhkV-00000005Up9-1xmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 04:03:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0F886126F;
	Tue, 24 Nov 2026 04:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5A81F000D0;
	Tue, 24 Nov 2026 04:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795492997;
	bh=0uolOVqD40xxzEqeWG55ZDWSlt7NaVVPmj6fMxUPPhA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dUBfTU2bZcriHyCyznmH+wtA4cnOoSaG8LaH1IiDJmFTGiErgOff/JaXdhZtcKNpR
	 QVrWCpJegIFq7g/12U5wBrAGd+26SB9CbXYXNjEJddRYB/CEBLMRRSly+b67LsJFLa
	 vH6tqLGB05fpyjzFuvcVfpD1qP1GdWX8X991h3E88f19Nm/bD3flaoI5G3ei9yJp78
	 glKx0hXlkIKU7OobyUcTjw/wXDd5+EnqSvZQyJBYQ55CZJDfqAwbDsksWrIu7/TPu5
	 J0l8jFnsHmTZuwZsGnBw/hhNHfDY31+c6PfotH7V5Kytit6yI755loWgbMEnvqOReH
	 o7scafsqHqvow==
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
Subject: Re: [PATCH v9 08/13] PCI/TSM: Keep connections active while device
 contexts exist
In-Reply-To: <0996eead-a63e-4a17-96d3-45ccd48cd4b1@linux.intel.com>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-9-aneesh.kumar@kernel.org>
 <0996eead-a63e-4a17-96d3-45ccd48cd4b1@linux.intel.com>
Date: Tue, 24 Nov 2026 09:33:02 +0530
Message-ID: <yq5awlq2c1vt.fsf@kernel.org>
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

Baolu Lu <baolu.lu@linux.intel.com> writes:

> On 11/16/2026 4:19 PM, Aneesh Kumar K.V (Arm) wrote:
>> Add PCI TEE Security Manager (TSM) contexts that prevent PF0 disconnect
>> while in use. Verify that the device is connected to the requested TSM.
>> Each successful get returns a separate context and requires a matching
>> put. Reject disconnect with -EBUSY until all contexts are released.
>> 
>> Remove the legacy bind and unbind interface. Device security state is
>> managed by the backend, so also remove the associated "bound" sysfs
>> attribute and its ABI documentation.
>
> This patch does two things: add pci tsm contexts to keep the pf0 active
> while in use, and remove the old device bind/unbind interface. Could
> these changes be split into separate patches? That would make the
> changes easier to review.
>

Sure, I will split the bind/unbind removal into a separate patch.

-aneesh

