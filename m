Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C948F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V24r0I4q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEHfmNXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u9HgPNrADctKV0cNUnNPBxSH8VCeQWXjUobqY+QLmgU=; b=V24r0I4qtCNjPs
	esMfsyg8EPu0/4oRj2IlehN+8FMvAO95E2qnbmQVGLu/8RxpUqH7n3a8ikmf7aotpboUBGCAR2RLk
	0YPy0xgCM1svKQ5gKE10pgw18PH3oZqcXroRKT+8BUtPm/YG+BYKuAl8cRkxw+Ir7aYNhybS/Jk7R
	hkbBQSGW2aU99j+a0o2lpde7kciDVjNQIBK/QPhK63Er2e5hsIDla+Nqd9FGHHLA6eSEjwVS+beqm
	RqvvkwmAvRmXfXxKVBzXaAYMQzWH7amzsi9aVCT5CenpCgPz+vOyIRwhicUeqila+z7BdcUkQzHw7
	H6EOcXtxlcDTajv4zJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89b-0000000916p-0bhd;
	Wed, 25 Nov 2026 08:15:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89S-0000000912k-3Gz0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EA6843C99;
	Wed, 25 Nov 2026 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8FB1F000D1;
	Wed, 25 Nov 2026 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594489;
	bh=u9HgPNrADctKV0cNUnNPBxSH8VCeQWXjUobqY+QLmgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PEHfmNXypxAQviZBuzm+SUVG1YH8JH14TjUc1E0Op8Qco8Xc++mVptMeop6M9JHKD
	 eN2D6p2nw6SqCR1HFJ2I5q/DOfKk9V5x3GRJ9YY/YT+XIsbItl3EbmM+Aa7W+3kig0
	 +N7psWRRGrjLZOtV9Uo9v7Hrw+Y2a0q7VxbibJFhbLT/1UjJt3Pr56hPYR59NsXsP8
	 ko6kHlD4LYXUGNsgkKOS5i2TUEowGQFqNyG4OzEoOhtL/14VDbLo8jiOkHstQn+WKB
	 mS99cCkRoVUEWuoHsemmEzt9d7J/myJl8Z1rgFQmUVw+3hzNx9NwFsyQno1UGQRIWP
	 95w4nAOjACOMA==
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
Subject: [PATCH v10 15/18] iommufd/viommu: Allow PCI TSM backends to provide vIOMMU operations
Date: Wed, 25 Nov 2026 13:41:18 +0530
Message-ID: <20261125081121.379481-16-aneesh.kumar@kernel.org>
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

Allow VIOMMU_ALLOC to use the TSM lookup helpers and query its vIOMMU
operations before falling back to the physical IOMMU driver.

Add the PCI TSM viommu_get_ops callback and tsm_viommu_get_ops() helper
to query operations for a requested vIOMMU type.

Add a TSM backing tag and store iommu_dev and tsm_dev in a union.

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: iommu@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/iommufd/viommu.c | 60 +++++++++++++++++++++++++---------
 drivers/virt/coco/tsm-core.c   | 11 +++++++
 include/linux/iommufd.h        |  8 ++++-
 include/linux/pci-tsm.h        | 11 +++++++
 include/linux/tsm.h            | 11 +++++++
 5 files changed, 84 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index dab499d24c45..909ef86f39a9 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -15,6 +15,10 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
 
 	if (viommu->ops && viommu->ops->destroy)
 		viommu->ops->destroy(viommu);
+
+	if (viommu->backing == IOMMUFD_VIOMMU_BACKING_TSM)
+		tsm_put_device(viommu->tsm_dev);
+
 	refcount_dec(&viommu->hwpt->common.obj.users);
 	if (viommu->kvm_file)
 		fput(viommu->kvm_file);
@@ -32,7 +36,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	struct iommufd_hwpt_paging *hwpt_paging;
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
-	struct iommu_device *iommu_dev;
+	struct iommu_device *iommu_dev = NULL;
 	const struct iommufd_viommu_ops *ops;
 	size_t viommu_size;
 	int rc;
@@ -44,20 +48,38 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	if (IS_ERR(idev))
 		return PTR_ERR(idev);
 
-	iommu_dev = iommufd_device_get_iommu_dev(idev);
-	if (!iommu_dev) {
-		rc = -EOPNOTSUPP;
+	struct tsm_dev *tsm_dev __free(tsm_put_device) = tsm_get_device(idev->dev);
+	if (IS_ERR(tsm_dev)) {
+		rc = PTR_ERR(tsm_dev);
 		goto out_put_idev;
 	}
-	if (!iommu_dev->ops->get_viommu_ops) {
-		rc = -EOPNOTSUPP;
+
+	if (tsm_dev)
+		ops = tsm_viommu_get_ops(tsm_dev, idev->dev, cmd->type);
+	else
+		ops = NULL;
+
+	if (IS_ERR(ops)) {
+		rc = PTR_ERR(ops);
 		goto out_put_idev;
 	}
-	ops = iommu_dev->ops->get_viommu_ops(idev->dev, cmd->type);
+
 	if (!ops) {
-		rc = -EOPNOTSUPP;
-		goto out_put_idev;
+		tsm_put_device(no_free_ptr(tsm_dev));
+
+		iommu_dev = iommufd_device_get_iommu_dev(idev);
+		if (!iommu_dev || !iommu_dev->ops->get_viommu_ops) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
+
+		ops = iommu_dev->ops->get_viommu_ops(idev->dev, cmd->type);
+		if (!ops) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
 	}
+
 	/*
 	 * It is a driver bug to omit the required operations or provide a size
 	 * smaller than the core vIOMMU structure.
@@ -100,13 +122,19 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	refcount_inc(&viommu->hwpt->common.obj.users);
 	INIT_LIST_HEAD(&viommu->veventqs);
 	init_rwsem(&viommu->veventqs_rwsem);
-	/*
-	 * It is the most likely case that a physical IOMMU is unpluggable. A
-	 * pluggable IOMMU instance (if exists) is responsible for refcounting
-	 * on its own.
-	 */
-	viommu->backing = IOMMUFD_VIOMMU_BACKING_IOMMU;
-	viommu->iommu_dev = iommu_dev;
+
+	if (tsm_dev) {
+		viommu->backing = IOMMUFD_VIOMMU_BACKING_TSM;
+		viommu->tsm_dev = no_free_ptr(tsm_dev);
+	} else {
+		/*
+		 * It is the most likely case that a physical IOMMU is unpluggable.
+		 * A pluggable IOMMU instance (if exists) is responsible for
+		 * refcounting on its own.
+		 */
+		viommu->backing = IOMMUFD_VIOMMU_BACKING_IOMMU;
+		viommu->iommu_dev = iommu_dev;
+	}
 
 	rc = ops->viommu_init(viommu, idev->dev,
 			      hwpt_paging->common.domain,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index 4f735c628ec3..8cb6fdaf8a84 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -9,6 +9,17 @@
 #include <linux/cleanup.h>
 #include <linux/pci-tsm.h>
 
+/* The caller must hold a tsm_get_device() reference for the entire use. */
+const struct iommufd_viommu_ops *tsm_viommu_get_ops(struct tsm_dev *tsm_dev,
+		struct device *dev, enum iommu_viommu_type type)
+{
+	if (!tsm_dev->pci_ops->viommu_get_ops)
+		return NULL;
+
+	return tsm_dev->pci_ops->viommu_get_ops(dev, type);
+}
+EXPORT_SYMBOL_GPL(tsm_viommu_get_ops);
+
 static void tsm_release(struct device *);
 static const struct class tsm_class = {
 	.name		= "tsm",
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 192d46b8ccfd..77c1a2944c3b 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -23,6 +23,7 @@ struct iommufd_access;
 struct iommufd_ctx;
 struct iommufd_device;
 struct iommufd_viommu_ops;
+struct tsm_dev;
 struct page;
 
 enum iommufd_object_type {
@@ -100,13 +101,18 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
 enum iommufd_viommu_backing {
 	IOMMUFD_VIOMMU_BACKING_IOMMU,
+	IOMMUFD_VIOMMU_BACKING_TSM,
 };
 
 struct iommufd_viommu {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
 	enum iommufd_viommu_backing backing;
-	struct iommu_device *iommu_dev;
+	union {
+		struct iommu_device *iommu_dev;
+		struct tsm_dev *tsm_dev;
+	};
+
 	struct iommufd_hwpt_paging *hwpt;
 	struct file *kvm_file;
 
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 6e31faa2c36c..44895c585d75 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -3,7 +3,9 @@
 #define __PCI_TSM_H
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <uapi/linux/iommufd.h>
 
+struct iommufd_viommu_ops;
 struct module;
 struct pci_tsm;
 struct tsm_dev;
@@ -16,14 +18,23 @@ struct tsm_dev;
  * @devsec_ops: Lock, unlock, and interrogate the security state of the
  *		function via the platform TSM (typically virtual function
  *		operations).
+ * @viommu_get_ops: Return operations for a supported TSM-owned vIOMMU type,
+ *		  or NULL if unsupported
  * @owner: Module implementing the PCI TSM operations
  *
+ * The vIOMMU owner holds a TSM device reference and pins the backend module
+ * before querying @viommu_get_ops, releasing both after vIOMMU destruction.
+ * A backend providing this callback must not unregister its TSM while the
+ * module is pinned.
+ *
  * This operations are mutually exclusive either a tsm_dev instance
  * manages physical link properties or it manages function security
  * states like TDISP lock/unlock.
  */
 struct pci_tsm_ops {
 	struct module *owner;
+	const struct iommufd_viommu_ops *(*viommu_get_ops)(
+		struct device *dev, enum iommu_viommu_type type);
 
 	/*
 	 * struct pci_tsm_link_ops - Manage physical link and the TSM/DSM session
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index dc03b2e38eaf..a1c805d6342f 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -110,6 +110,8 @@ struct tsm_report_ops {
 };
 
 struct pci_tsm_ops;
+struct iommufd_viommu_ops;
+
 struct tsm_dev {
 	struct device dev;
 	int id;
@@ -128,6 +130,8 @@ struct tsm_dev *find_tsm_dev(int id);
 #ifdef CONFIG_TSM
 struct tsm_dev *tsm_get_device(struct device *dev);
 void tsm_put_device(struct tsm_dev *tsm_dev);
+const struct iommufd_viommu_ops *tsm_viommu_get_ops(struct tsm_dev *tsm_dev,
+		struct device *dev, enum iommu_viommu_type type);
 #else
 static inline struct tsm_dev *tsm_get_device(struct device *dev)
 {
@@ -137,6 +141,13 @@ static inline struct tsm_dev *tsm_get_device(struct device *dev)
 static inline void tsm_put_device(struct tsm_dev *tsm_dev)
 {
 }
+
+static inline const struct iommufd_viommu_ops *
+tsm_viommu_get_ops(struct tsm_dev *tsm_dev, struct device *dev,
+		enum iommu_viommu_type type)
+{
+	return NULL;
+}
 #endif
 
 DEFINE_FREE(tsm_put_device, struct tsm_dev *,
-- 
2.43.0


