Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65542606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=03dGyh91;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaZKGWdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ajNwRVkrHKmg+nmQoX/j5cIgs+avtvW7l5600Ntz7FI=; b=03dGyh91jgFsNE
	4dq7XJIBd/52bKWD7QBW6zX+dCwsDIppPj4DGk4WfKgU7cPOAIIH9mfbiQush2xIylvleBEQOrVpc
	wJmzHFqHM348LUwrzpRqhxQu9/f6s8++LG7twzAc3CgQAr9lTSnslGAs9ll6BoDlu9hhSV4TYe5a6
	YS3FMxmy4gQ412IRqmIK5/GhBaG6HfYbPwqgcfIQs6hz8tHMj50hyX1r9bbme4+CR5tTB+XaUIfmh
	XJK4RcagGm46kjsOqDJRZHRPVnLzpagQ689GBNhllYAo5kVw3M8dOR8XlVkouIOqWG4TbSSrnrQV1
	cmD8HLUe0MQiIYhJu8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW86e-00000008zY3-32yj;
	Wed, 25 Nov 2026 08:11:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW86e-00000008zXl-0Nx5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9564843632;
	Wed, 25 Nov 2026 08:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5D01F000C4;
	Wed, 25 Nov 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594315;
	bh=ajNwRVkrHKmg+nmQoX/j5cIgs+avtvW7l5600Ntz7FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SaZKGWdKdaRUC5LSiZDy5U1KnjAaYGzK9EvmKbFRQ3Gm05kgEMDjnGXg2P29FoQlP
	 FRQYc1zJxrlxxNDdGXm9pW3D3F24jvrlWheiG0/YP8Pp8sUFO2fFu2jHAwTn3/b2Oh
	 buTsadqaK7qTxq1qNTNZXx2tn96IkDG0j4rAPT/uHzDh79wkpLtNXsLZyQBpU3E+Pc
	 Lj3l3/AAqwgda5I2n2RcIOJoZ8GqZvlILoE6kr9yFfSDEdigXRRau20W4uQwSqEbOI
	 EvzawWsbhijpN92PxfHjrD2HIC5d+l9E2R6qyeQrzkK3QpCgYnfzZzmQQWUIjMh+Zt
	 JxralxzPjRy/Q==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	patches@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v10 01/18] MAINTAINERS: Update TSM file coverage and repository
Date: Wed, 25 Nov 2026 13:41:04 +0530
Message-ID: <20261125081121.379481-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125081121.379481-1-aneesh.kumar@kernel.org>
References: <20261125081121.379481-1-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-coco@lists.linux.dev
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed1991cac46..a3ee234d79ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28549,11 +28549,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
 R:	Lukas Wunner <lukas@wunner.de>
 L:	linux-coco@lists.linux.dev
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
 F:	Documentation/ABI/testing/configfs-tsm-report
 F:	Documentation/driver-api/coco/
 F:	Documentation/driver-api/pci/tsm.rst
 F:	drivers/pci/tsm.c
 F:	drivers/virt/coco/guest/
+F:	drivers/virt/coco/tsm-core.c
 F:	include/linux/*tsm*.h
 F:	samples/tsm-mr/
 
-- 
2.43.0


