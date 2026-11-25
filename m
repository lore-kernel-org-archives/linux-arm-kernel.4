Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71203606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Svd8mVWW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1hDBWYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YbCmxHPge1v033HBbYUhrVZG7+3rPvU34p4BuHnhXsE=; b=Svd8mVWWDIVLp1
	n+TJ7Z+8Uz+w5/QVSHzE+57v1twN6V0dRQUaDRg1r+8b/+S26jCQMgwe/eg7v6fihFo0LcYBEc27B
	evoheAbIoO2H6P3yksW/bOAzM8YF5j7bFLjlEiWNmo525xb1hcr/s/i9MIxHbJ3UUqQVPPKRuBpUJ
	vRaZbRZZh1Gs7iz1ILIzD+f78vvhtZdHDpZy6a4a660aNtoCCIZhIKrvgoqgAYONmUxlml03wWJ8p
	rU8QfFPsV62n9o3b4vwthgjvOJLRh/95Twijg4VSDdvfj7/pV4Fo6nMNH2G3qs6rU8FA07qsfTXS8
	JF6DIS+ADGM8tZNa2XPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW86x-00000008zfu-3tnO;
	Wed, 25 Nov 2026 08:12:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW86q-00000008zd6-3gHj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:12:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06ABF620F3;
	Wed, 25 Nov 2026 08:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BA31F000ED;
	Wed, 25 Nov 2026 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594327;
	bh=YbCmxHPge1v033HBbYUhrVZG7+3rPvU34p4BuHnhXsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P1hDBWYJjzdO/BB3ddceENWCti/bghbH0NFSeYxuoTkkNtXjXA883BMDQ7NBYnjVm
	 QW1zQXTPvo905aaiJ9Feg8IxMuOOI8wCm78cFE8LPLL3mFApl6QqyOzOC688OApKko
	 hMxr16C9jF1dqeuyWosFSRxjR9zmuLZFZl+TAxLAqYnUyDtfjHQ28lEEpzaBKDsaEW
	 cjwlyve0t8JVHEWnoI0paCPoEwe3Y2YAC+mubZ7rTyj/4yXVXXhLQGtAuVm6S2kRYk
	 dKmRngw37u1AxovS2JQSCN5qpYVIPMtcys9b/b+HBDvpjRJTcXq/qdmcl5FR8XeIge
	 KhGV3oJMIz+vg==
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
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v10 02/18] virt: coco: tsm: Require PCI operations when registering a TSM
Date: Wed, 25 Nov 2026 13:41:05 +0530
Message-ID: <20261125081121.379481-3-aneesh.kumar@kernel.org>
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

Reject a NULL pci_ops argument in tsm_register(). Every registered TSM
now has PCI operations, so registration no longer needs separate paths
for TSMs without them.

Registration guarantees pci_ops is set, so call pci_tsm_unregister()
without testing that pointer again.

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-coco@lists.linux.dev
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..3e45b58183e2 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -61,9 +61,6 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 {
 	int rc;
 
-	if (!pci_ops)
-		return tsm_dev;
-
 	tsm_dev->pci_ops = pci_ops;
 	rc = pci_tsm_register(tsm_dev);
 	if (rc) {
@@ -84,6 +81,9 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 	struct device *dev;
 	int rc;
 
+	if (!pci_ops)
+		return ERR_PTR(-EINVAL);
+
 	if (IS_ERR(tsm_dev))
 		return tsm_dev;
 
@@ -102,8 +102,7 @@ EXPORT_SYMBOL_GPL(tsm_register);
 
 void tsm_unregister(struct tsm_dev *tsm_dev)
 {
-	if (tsm_dev->pci_ops)
-		pci_tsm_unregister(tsm_dev);
+	pci_tsm_unregister(tsm_dev);
 	device_unregister(&tsm_dev->dev);
 }
 EXPORT_SYMBOL_GPL(tsm_unregister);
-- 
2.43.0


