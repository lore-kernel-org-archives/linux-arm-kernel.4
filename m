Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69003606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zfY7DjEA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftuJ51iu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VHYKwMKvPACMn5MQeShJE0HU3QErcgbBmjTZnSqlsy0=; b=zfY7DjEAeo5cOl
	qksfUo8YjJC/PiIOSMTcBKHIxQf70tVvtK+09bgsesxmBP34ZyojfE48zUTM8c6HrwtKQ5+fxXz4A
	HbB4mTKwW5MBKeyW8PNyTCU68oT7loqMyVmAUrXkTJCzoU4yscL7rAKJEJWTAU51n0Lxb/sTT2l32
	CsZLuw3FFZL1r36ah/es690Cg6Ge0iSRMBtSLF6ciVdAeiS5krGN47UVEQNNGhof9uC7Sfa+RY/6T
	EnUlXOnPxLO5RTWfUgOm1gKCg0v/DRZz95VYxHOo30/r8r0UBt8kfOX+31as5kBnDUsAR7GJ5cciE
	RFsq4sOfKNAp4VgbVqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW896-000000090qi-1FOi;
	Wed, 25 Nov 2026 08:14:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW895-000000090pT-0Dfd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C76262346;
	Wed, 25 Nov 2026 08:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F141F00A00;
	Wed, 25 Nov 2026 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594465;
	bh=VHYKwMKvPACMn5MQeShJE0HU3QErcgbBmjTZnSqlsy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ftuJ51iuKT8qxzSlV3oRYofion3uPTZb0NguEaItP5YhgIPQfX0KbOPl+z6tUfEQI
	 PuZL55ETNQTfYuJWhokBt23P0kyvJZxEeAYlVy30DwTKTg6L/eVk7sQWtNCDWkqSe1
	 xhT6yKyj4EFes7IwRS+uunNz3ebtsLtSvmKiXwYLuassine8f/6wUc9R0uC2439a/Y
	 nOOUgTvL4xt24yBQDqJQ2FOlgbqyMtGCxkkFi0iXd4fhlzwNd+eu8oiJEpBhj3c52R
	 iK/RAGPCfbnU7lsXnbg6jXZ4E72wR2kGq8425BWU7jIQOE7lNCPyoy396rvZ03AStz
	 WrVc5KbX8GHgw==
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
Subject: [PATCH v10 13/18] PCI/TSM: Add helpers to look up and reference a device's TSM
Date: Wed, 25 Nov 2026 13:41:16 +0530
Message-ID: <20261125081121.379481-14-aneesh.kumar@kernel.org>
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

Add tsm_get_device() to find and reference the TSM attached to a device,
using pci_tsm_get_device() for PCI devices. Resolve the PCI association
under pci_tsm_rwsem and acquire TSM device and backend module
references. Return NULL when no TSM is attached and an error if the
module cannot be pinned.

Add tsm_put_device() to release the device reference before the module
reference, since the final device put may call into the backend module.

Set the AMD SEV TSM operations owner to THIS_MODULE so lookup pins the
module implementing its callbacks.

Following patch lets IOMMUFD use vIOMMU operations implemented by the
selected device's TSM. vIOMMU allocation must look up that TSM to find
its operations. The vIOMMU keeps the TSM device and module references
until it is destroyed, so the TSM allocation cannot be freed and its
callback code cannot be unloaded while the vIOMMU can still call it.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/crypto/ccp/sev-dev-tsm.c |  1 +
 drivers/pci/tsm.c                | 19 +++++++++++++++++++
 drivers/virt/coco/tsm-core.c     | 32 ++++++++++++++++++++++++++++++++
 include/linux/pci-tsm.h          | 10 ++++++++++
 include/linux/tsm.h              | 19 +++++++++++++++++++
 5 files changed, 81 insertions(+)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5a..45f2995c3e4d 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -340,6 +340,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 }
 
 static struct pci_tsm_ops sev_tsm_ops = {
+	.owner = THIS_MODULE,
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm.c
index ddff81554372..88e88fc9aec6 100644
--- a/drivers/pci/tsm.c
+++ b/drivers/pci/tsm.c
@@ -9,6 +9,7 @@
 #define dev_fmt(fmt) "PCI/TSM: " fmt
 
 #include <linux/bitfield.h>
+#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci-doe.h>
 #include <linux/pci-tsm.h>
@@ -35,6 +36,24 @@ static const struct pci_tsm_ops *to_pci_tsm_ops(struct pci_tsm *tsm)
 	return tsm->tsm_dev->pci_ops;
 }
 
+struct tsm_dev *pci_tsm_get_device(struct pci_dev *pdev)
+{
+	const struct pci_tsm_ops *ops;
+	struct tsm_dev *tsm_dev;
+
+	guard(rwsem_read)(&pci_tsm_rwsem);
+	if (!pdev->tsm)
+		return NULL;
+
+	tsm_dev = pdev->tsm->tsm_dev;
+	ops = tsm_dev->pci_ops;
+	if (!try_module_get(ops->owner))
+		return ERR_PTR(-ENODEV);
+	get_device(&tsm_dev->dev);
+	return tsm_dev;
+}
+EXPORT_SYMBOL_GPL(pci_tsm_get_device);
+
 static inline bool is_dsm(struct pci_dev *pdev)
 {
 	return pdev->tsm && pdev->tsm->dsm_dev == pdev;
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index bf09bb4546de..4f735c628ec3 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -16,6 +16,38 @@ static const struct class tsm_class = {
 };
 static DEFINE_IDA(tsm_ida);
 
+/**
+ * tsm_get_device() - Pin the TSM attached to a device
+ * @dev: device whose TSM is to be pinned
+ *
+ * A successful lookup takes a TSM device reference and pins the backend
+ * module. Release both with tsm_put_device(). The TSM must remain registered
+ * while the module is pinned.
+ * Return: NULL if no TSM is attached, an error if the module
+ * cannot be pinned, or the TSM device associated with the pinned backend.
+ */
+struct tsm_dev *tsm_get_device(struct device *dev)
+{
+	if (!dev_is_pci(dev))
+		return NULL;
+
+	return pci_tsm_get_device(to_pci_dev(dev));
+}
+EXPORT_SYMBOL_GPL(tsm_get_device);
+
+void tsm_put_device(struct tsm_dev *tsm_dev)
+{
+	struct module *owner;
+
+	if (!tsm_dev)
+		return;
+
+	owner = tsm_dev->pci_ops->owner;
+	put_device(&tsm_dev->dev);
+	module_put(owner);
+}
+EXPORT_SYMBOL_GPL(tsm_put_device);
+
 static int match_id(struct device *dev, const void *data)
 {
 	struct tsm_dev *tsm_dev = container_of(dev, struct tsm_dev, dev);
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index e6fe099f2cc9..6e31faa2c36c 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -4,6 +4,7 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 
+struct module;
 struct pci_tsm;
 struct tsm_dev;
 
@@ -15,12 +16,15 @@ struct tsm_dev;
  * @devsec_ops: Lock, unlock, and interrogate the security state of the
  *		function via the platform TSM (typically virtual function
  *		operations).
+ * @owner: Module implementing the PCI TSM operations
  *
  * This operations are mutually exclusive either a tsm_dev instance
  * manages physical link properties or it manages function security
  * states like TDISP lock/unlock.
  */
 struct pci_tsm_ops {
+	struct module *owner;
+
 	/*
 	 * struct pci_tsm_link_ops - Manage physical link and the TSM/DSM session
 	 * @probe: establish context with the TSM (allocate / wrap 'struct
@@ -143,6 +147,7 @@ int pci_tsm_doe_transfer(struct pci_dev *pdev, u8 type, const void *req,
 			 size_t req_sz, void *resp, size_t resp_sz);
 int pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev);
 void pci_tsm_context_put(struct pci_dev *pdev);
+struct tsm_dev *pci_tsm_get_device(struct pci_dev *pdev);
 #else
 static inline int pci_tsm_register(struct tsm_dev *tsm_dev)
 {
@@ -152,6 +157,11 @@ static inline void pci_tsm_unregister(struct tsm_dev *tsm_dev)
 {
 }
 
+static inline struct tsm_dev *pci_tsm_get_device(struct pci_dev *pdev)
+{
+	return NULL;
+}
+
 static inline int
 pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 {
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 19dedf971f14..dc03b2e38eaf 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -124,4 +124,23 @@ int tsm_report_unregister(const struct tsm_report_ops *ops);
 struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
+
+#ifdef CONFIG_TSM
+struct tsm_dev *tsm_get_device(struct device *dev);
+void tsm_put_device(struct tsm_dev *tsm_dev);
+#else
+static inline struct tsm_dev *tsm_get_device(struct device *dev)
+{
+	return NULL;
+}
+
+static inline void tsm_put_device(struct tsm_dev *tsm_dev)
+{
+}
+#endif
+
+DEFINE_FREE(tsm_put_device, struct tsm_dev *,
+	if (!IS_ERR_OR_NULL(_T))
+		tsm_put_device(_T))
+
 #endif /* __TSM_H */
-- 
2.43.0


