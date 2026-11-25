Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6SLTqo5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K92SQg3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aC7Yvp7R/nUyGaPxpcS0Wg+BA10n7Dewov7GQjC+GV8=; b=y6SLTqo5vxUC+r
	+xbfSf0sz1x2IijLEQfIpQ4M4+x+2+ClovmJZz90CLT/xNltXArTdctfCAZwED8wcZ0fUqU1l80Hb
	kP1JRWNHWAVjrceHIWuddMzrZ9/3mjmiQ6iIrmChbLuxfhbo+cWESgNKmt4nAPQAdhwPkn8UHjcr6
	m6JPk3b93Iql/pQfbGpttmXZANzh9Oz25os4JVIf94lmZUpUdFWVyN2jGUKmJvtAJcbBtnROCb/X5
	MDlKTN4gB2liulP6MkqarhB/9joiN1GmSPI1OXtb5DZ/cp/AQIy6ebnGJe2ABcNxedrPB1LTQQNdv
	AojpQz9+mkXujAQofjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW87K-00000008zoY-28x3;
	Wed, 25 Nov 2026 08:12:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW87E-00000008zmR-1L34
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:12:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15AE7402AF;
	Wed, 25 Nov 2026 08:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D151F000E1;
	Wed, 25 Nov 2026 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594351;
	bh=aC7Yvp7R/nUyGaPxpcS0Wg+BA10n7Dewov7GQjC+GV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K92SQg3N2CI8twZHo/WbVCD7n2//h7W1QmrkrJbmQ0PuwiaLPWniaSFjWeiw7iGr7
	 HP7p4Yj5sjNZ+OPO4kF3KlraX0hE7IVVZKlB6bRiHdWX1nAqTIkrq/abDwDk629BxE
	 LbYvxSeJ/do69BNG9pvlZtp89bOWTN9YpyoIKHYiHfq4RQb0VERwcSQJ6fnHdwf0CI
	 z81eQLrsdnqC306shrYc5Z7F4JBdcWYQ5G1RviKJ+dSH0NvHViaF3oK7RlkN5zjDqb
	 rV2FGrI6Aq93gDgsTAw5CDl2ogam9uUtxJzitRv3l49yGSm5wP/lVlVuUiGSaMoaCs
	 Pgy1UEfDWrfLg==
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
Subject: [PATCH v10 04/18] virt: coco: tsm: Complete PCI registration before publishing the device
Date: Wed, 25 Nov 2026 13:41:07 +0530
Message-ID: <20261125081121.379481-5-aneesh.kumar@kernel.org>
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

tsm_register() calls device_add() before initializing and validating the
PCI operations. This makes the new TSM discoverable through the class
lookup while PCI registration can still fail.

An existing link TSM can keep the PCI connect attribute visible during
registration of another TSM. A concurrent write naming the new TSM can
therefore reach it through:

  connect_store()
    find_tsm_dev()
      class_find_device()
    is_link_tsm()
    pci_tsm_connect()

If the new backend supplies both link and device security operations,
pci_tsm_register() rejects it before taking pci_tsm_rwsem. The registration
thread then follows:

  tsm_register()
    tsm_register_pci_or_reset()
      pci_tsm_register() -> -EINVAL
    device_del()
    put_tsm_dev()

If connect has already attached a PCI context, registration cleanup can
free a TSM still referenced by that context.

Complete PCI registration before device_add() publishes the class device.
On PCI registration failure, the TSM remains undiscoverable.

Send the PCI change notification only after device_add() succeeds.

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-coco@lists.linux.dev
Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index 863e2f5bb166..2fa746d078b3 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -56,24 +56,6 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 	return no_free_ptr(tsm_dev);
 }
 
-static int tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-				     struct pci_tsm_ops *pci_ops)
-{
-	int rc;
-
-	tsm_dev->pci_ops = pci_ops;
-	rc = pci_tsm_register(tsm_dev);
-	if (rc) {
-		dev_err(tsm_dev->dev.parent,
-			"PCI/TSM registration failure: %d\n", rc);
-		return rc;
-	}
-
-	/* Notify TSM userspace that PCI/TSM operations are now possible */
-	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
-	return 0;
-}
-
 struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
@@ -91,15 +73,23 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 	if (rc)
 		return ERR_PTR(rc);
 
-	rc = device_add(dev);
-	if (rc)
+	/* Complete PCI registration before exposing the TSM to class lookup. */
+	tsm_dev->pci_ops = pci_ops;
+	rc = pci_tsm_register(tsm_dev);
+	if (rc) {
+		dev_err(parent, "PCI/TSM registration failure: %d\n", rc);
 		return ERR_PTR(rc);
+	}
 
-	rc = tsm_register_pci_or_reset(tsm_dev, pci_ops);
+	rc = device_add(dev);
 	if (rc) {
-		device_del(dev);
+		pci_tsm_unregister(tsm_dev);
 		return ERR_PTR(rc);
 	}
+
+	/* Notify TSM userspace that PCI/TSM operations are now possible. */
+	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
 	return no_free_ptr(tsm_dev);
 }
 EXPORT_SYMBOL_GPL(tsm_register);
-- 
2.43.0


