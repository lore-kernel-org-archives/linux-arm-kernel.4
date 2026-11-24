Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 05:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lAlDV5s/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMuZ/82I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6hEHnZ4sfgUflRbEhxUh0CD0ylQZFIJ15GBUvc4I5mw=; b=lAlDV5s/BFZF+gzI4QAfdm/C8c
	+TX2IsEVkP7fJ8mxrtmnnzH1/7PVf1NYV8NS5a2+DO8Oglk5aiyQOdSSO0psOu0siUracLrtHdNXQ
	UaIN9Hn26IBM1xif29OIiCVuWXtB3t0Teex3PQGxcEPkNF4AVCtv4C5O6x3K1DtYjll6HkT1Xfz+2
	crOymG8dBNRE8RruWlhIHJRL/5qEXXJA2POnXgFxMM8KHrYtN2oWtAGKNlF5a6tEhcIaVgfM8SnQd
	EQKmQ8cEwO7yP5520W0WUey2wMVkaDZeyiAASIqzSrLeSFCmVl1semIIS3bA5MtqAj30ydv1XlZbr
	eC1RhTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj3O-00000005bi8-3Tcx;
	Tue, 24 Nov 2026 05:26:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj3M-00000005bhv-1014
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 05:26:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D345409DC;
	Tue, 24 Nov 2026 05:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0C21F000C4;
	Tue, 24 Nov 2026 05:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795498011;
	bh=6hEHnZ4sfgUflRbEhxUh0CD0ylQZFIJ15GBUvc4I5mw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bMuZ/82I+vs+8NKsF31D7nQhBoDtC/vh+MdJDEQFc6RfLu9u4tc1iXSnh9tQUIt1R
	 7B4aBvaDLvXRLuiTN1J7kRllSEWDL5FAyMso3WrOUo3yd+gxajeQWfNT+SPnw1JR85
	 nBowKBVgT76oli9zpQaDZRhbQAs8+j2FbwhIxOTktb7YTs9tvpPqUQff1wyBXBTqZX
	 UWpTbmZiOBunZB6QKAj5MxB+n26rmgEzueQlO0KVhXTYiGVNLPvsfiB8Qz9ab3ckww
	 3NiPz4iKGto4wg14EG/cvFr3KsGIznEulrKB1dyBb+9p9Y/pw05d9hw5P8rcLwFQCN
	 Ocw7AG9iUNzXQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev
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
	Xu Yilun <yilun.xu@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 00/13] iommufd: TSM-backed virtual IOMMUs for
 confidential guests
In-Reply-To: <3573001a-24b8-49f3-97c8-7a414c88deb4@amd.com>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <3573001a-24b8-49f3-97c8-7a414c88deb4@amd.com>
Date: Tue, 24 Nov 2026 10:56:40 +0530
Message-ID: <yq5ah5h6by0f.fsf@kernel.org>
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

Alexey Kardashevskiy <aik@amd.com> writes:

> On 16/11/26 19:19, Aneesh Kumar K.V (Arm) wrote:
>> This series adds IOMMUFD and PCI/TSM infrastructure for assigning PCI
>> devices to confidential guests. A TEE Security Manager (TSM) can provide a
>> virtual IOMMU (vIOMMU), and an IOMMUFD vDEVICE object represents a physical
>> device within that virtual IOMMU.
>> 
>> The series adds a common framework for operations on vDEVICE objects and
>> updates lifetime management to keep the VM and device-security resources
>> available while those objects are in use.
>> 
>> The Arm CCA backend is provided in a separate series, together with
>> operations for TEE Device Interface Security Protocol (TDISP) state changes
>> and access to cached device-attestation objects.
>> 
>> The full series, including the Arm CCA backend, is available at:
>
> nah, it is not :(
>
>> 
>>    https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/topics/7.4/tdisp-host-rc3


Can you use https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/topics/7.4/cca-da-integration-v1


>> 
>> Notes:
>> * Codex was used to assist with commit message formatting and code
>>    rearrangement.
>> 

 [ ... 148 lines skipped ... ] 

>>   include/linux/tsm.h                           |  41 +-
>>   include/uapi/linux/iommufd.h                  |  36 +-
>>   25 files changed, 880 insertions(+), 462 deletions(-)
>> 
>> 
>> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
>
> This is v7.4-rc3.
>
>> prerequisite-patch-id: 121492d71cc22b2adbfdedd668868c5a449ad764
>> prerequisite-patch-id: ed31fd728f0adba3d60dcd6f3bae8da1a2193bcc
>
> What are these two? Cannot find them any tree... I really want try this all but also trying to eliminate guessing...
>

Those prerequisite patches are from this series:

https://lore.kernel.org/all/20261116075420.76205-1-aneesh.kumar@kernel.org

-aneesh

