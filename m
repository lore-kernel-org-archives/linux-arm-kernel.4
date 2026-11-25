Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BD606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kvvjNaTn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IkxZN628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TmvUw2ZVyUsMcdadsKZcjzgp0p8e0wTBduKxTgJF7d0=; b=kvvjNaTnKsQ5Fg
	gPqmNbWmK+o4Fnx7per8VDzGNAVHdnScaQVnL1exodndE3DFJqZqX5U6WBOeHMeRgnlE7gX8xM29d
	ixGiTklokfvw/B6Zg7UFGJhw6FLGU0u3CBOXXQdXVGlDlunop/a8zjg+hUD9MKA9TbP/W7Ss6jqXb
	iX0z/JSD1PzsQx1nkbdX74TTt9gCAb4EVPOEK8RwAA4IMqyKwEQ2EccLA73b0ubD5FFkDTqUlg0b9
	kJLlM89oNLr5j77TtaKe2ARM8n2xWRLY4LJfH05QtHcW688P9fCVOoBZx0UPI6+p8vBx0grxH5tuM
	Jl7fabnf7VJI+xyjUpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW87T-00000008zsk-2aig;
	Wed, 25 Nov 2026 08:12:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW87R-00000008zrw-2WWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:12:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1789B45A64;
	Wed, 25 Nov 2026 08:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03801F000E0;
	Wed, 25 Nov 2026 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594364;
	bh=TmvUw2ZVyUsMcdadsKZcjzgp0p8e0wTBduKxTgJF7d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IkxZN628ybcwca27neAchYKstENCxE13/+I3sQX7CHsiLoIElvpghqepsqlyibvoZ
	 TxPy5kjwQm1NKtR6p7LBfFUngIeEUgpX9GjHTw+HfAgvmV0tS0K90FANFuaIiyMkqN
	 rx9mfGWppMk8SBXGSfKU16IozmCo3UTWhLIERDH4bK3nAICDZMuZdu8J20LLGk84nW
	 XueCuTu90UYX2y5xooui1EXJaCJAnkLnT+//AAEAb+HMUuhHe6Qdi76hcEreKGsrWG
	 2GqCt4iGFcLFaeKSaq22g6DFTiISC2RQW1I3GY3FotZ7H5gwuMl5xH/i1AakkdgzS7
	 G9/iMEoSRRoUQ==
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
	patches@lists.linux.dev
Subject: [PATCH v10 05/18] virt: coco: tsm: Register the TSM class before device drivers
Date: Wed, 25 Nov 2026 13:41:08 +0530
Message-ID: <20261125081121.379481-6-aneesh.kumar@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register the built-in TSM class with subsys_initcall() so it exists
before a platform TSM driver probes, independently of object link order.
CONFIG_TSM is boolean; remove the unused module exit path.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index 2fa746d078b3..bf09bb4546de 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -115,13 +115,7 @@ static int __init tsm_init(void)
 {
 	return class_register(&tsm_class);
 }
-module_init(tsm_init)
-
-static void __exit tsm_exit(void)
-{
-	class_unregister(&tsm_class);
-}
-module_exit(tsm_exit)
+subsys_initcall(tsm_init)
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TEE Security Manager Class Device");
-- 
2.43.0


