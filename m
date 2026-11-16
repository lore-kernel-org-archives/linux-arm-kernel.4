Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjomyYMM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K312HXAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A6Xj23FIEaFeM37IBMzXKP6MnIBdZMu6s0WQEXC7JzE=; b=jjomyYMMayyqRj
	Xtlv/MbKeBMBhNBQ2mzqsIETHjOsqwzdcYlGYkVpIW8saTj3+uJTlKQt/sHERtfiYWgcemVAWzzbn
	nOw/UgXayFUMLC7AIsn+Zy7MTSp3fzyaUhpnj3wdfP0WElMnyiGv1N4VwyOPZfkHyengVFGPiPwD3
	D7J8MThTNDddB65CyztWSt2kfj50bSq7d9YlpAUfBB2nOj4mvEJeejFhdNid+hftME9n+2Lf+lwlt
	IRAUucyYDbzd9QWEpyCdGfHR03u7V56PL6SJIboC9Rg6gJViCr6qjnsWbe3pSsbIWXv+gN9hN1j8O
	beDjTRuj/gup2aHJKdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSry4-00000001YQo-3V9v;
	Mon, 16 Nov 2026 08:21:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSry3-00000001YQH-3UIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8B59627C9;
	Mon, 16 Nov 2026 08:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65D01F000C6;
	Mon, 16 Nov 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817294;
	bh=A6Xj23FIEaFeM37IBMzXKP6MnIBdZMu6s0WQEXC7JzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K312HXAenwu70JRQBv5ILd8TVHIH0kOvJuJ7tX/q8fGH8SOS7mm8mBr6hfEHZRXbY
	 XVcR7/qDFzvaUxdwU2JhrHD2OtMYJSP7GF8G58PDV/nDMxQOhAgBNq3W5lOczNefdW
	 zwuzbpYTw1kLgJok3rwSfTHik+gQpK1cTcffyx3FQLljnnXVD7xY6jNhlGdxofRU/v
	 JY767Li+2tTxt4ghIXf9lLe+TJ/pTNoHHcEui5IzMofBOgRMJ73jxwH2gAYs/M03JS
	 2Y5fEwHXhQFQMEaQO3jANelTC96i/F/rDbpFWNyMkG8pEYV5UBrS3l8o17dXg8QvCI
	 EoilM5tyTdRPg==
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
	iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v9 10/13] iommufd/viommu: Allow PCI TSM backends to provide vIOMMU operations
Date: Mon, 16 Nov 2026 13:49:32 +0530
Message-ID: <20261116081935.85372-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116081935.85372-1-aneesh.kumar@kernel.org>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
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

In confidential-computing configurations, a vIOMMU may be implemented by
a TSM driver rather than by the physical IOMMU driver. Such an
implementation also needs the TSM identity when creating and validating
vdevices.

Allow VIOMMU_ALLOC to first query the TSM associated with the target PCI
device for vIOMMU operations. Fall back to the physical IOMMU driver
when the TSM does not provide operations for the requested vIOMMU type.

Resolve the PCI TSM association under pci_tsm_rwsem, take a TSM device
reference, and pin the module providing the operations. Store the TSM
device in the vIOMMU. Release the device reference and module pin on
allocation failure, fallback to the physical IOMMU driver, or vIOMMU
destruction. Drop the device reference before releasing the module pin,
since the final put may call into the backend module.

The device reference preserves the TSM allocation. Backends providing
vIOMMU operations must not unregister their TSM while the module is pinned,
since the reference does not prevent backend resource teardown.

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
 drivers/iommu/iommufd/viommu.c | 35 +++++++++++++++++++++++++++-----
 drivers/pci/tsm/core.c         | 22 ++++++++++++++++++++
 drivers/virt/coco/tsm-core.c   | 37 ++++++++++++++++++++++++++++++++++
 include/linux/iommufd.h        |  2 ++
 include/linux/pci-tsm.h        | 24 ++++++++++++++++++++++
 include/linux/tsm.h            | 25 +++++++++++++++++++++++
 6 files changed, 140 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 2eba1562a704..7e74d3992ae4 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -15,6 +15,8 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
 
 	if (viommu->ops && viommu->ops->destroy)
 		viommu->ops->destroy(viommu);
+	if (viommu->tsm_dev)
+		tsm_put_device(viommu->tsm_dev);
 	refcount_dec(&viommu->hwpt->common.obj.users);
 	if (viommu->kvm_file)
 		fput(viommu->kvm_file);
@@ -30,6 +32,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		.len = cmd->data_len,
 	};
 	struct iommufd_hwpt_paging *hwpt_paging;
+	struct tsm_dev *tsm_dev = NULL;
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
 	struct iommu_device *iommu_dev;
@@ -49,15 +52,33 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		rc = -EOPNOTSUPP;
 		goto out_put_idev;
 	}
-	if (!iommu_dev->ops->get_viommu_ops) {
-		rc = -EOPNOTSUPP;
+	tsm_dev = tsm_get_device(idev->dev);
+	if (IS_ERR(tsm_dev)) {
+		rc = PTR_ERR(tsm_dev);
+		tsm_dev = NULL;
 		goto out_put_idev;
 	}
-	ops = iommu_dev->ops->get_viommu_ops(idev->dev, cmd->type);
-	if (!ops) {
-		rc = -EOPNOTSUPP;
+	ops = tsm_dev ? tsm_viommu_get_ops(tsm_dev, idev->dev, cmd->type) : NULL;
+	if (IS_ERR(ops)) {
+		rc = PTR_ERR(ops);
 		goto out_put_idev;
 	}
+	if (!ops) {
+		if (tsm_dev) {
+			tsm_put_device(tsm_dev);
+			tsm_dev = NULL;
+		}
+		if (!iommu_dev->ops->get_viommu_ops) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
+		ops = iommu_dev->ops->get_viommu_ops(idev->dev, cmd->type);
+		if (!ops) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
+	}
+
 	/*
 	 * It is a driver bug to omit the required operations or provide a size
 	 * smaller than the core vIOMMU structure.
@@ -95,6 +116,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		viommu->kvm_file = get_file(idev->kvm_file);
 	viommu->type = cmd->type;
 	viommu->ictx = ucmd->ictx;
+	viommu->tsm_dev = tsm_dev;
+	tsm_dev = NULL;
 	viommu->hwpt = hwpt_paging;
 	refcount_inc(&viommu->hwpt->common.obj.users);
 	INIT_LIST_HEAD(&viommu->veventqs);
@@ -119,6 +142,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 out_put_hwpt:
 	iommufd_put_object(ucmd->ictx, &hwpt_paging->common.obj);
 out_put_idev:
+	if (tsm_dev)
+		tsm_put_device(tsm_dev);
 	iommufd_put_object(ucmd->ictx, &idev->obj);
 	return rc;
 }
diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
index 8f0e5af808a5..4107ff443228 100644
--- a/drivers/pci/tsm/core.c
+++ b/drivers/pci/tsm/core.c
@@ -9,6 +9,8 @@
 #define dev_fmt(fmt) "PCI/TSM: " fmt
 
 #include <linux/bitfield.h>
+#include <linux/iommufd.h>
+#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci-doe.h>
 #include <linux/pci-tsm.h>
@@ -36,6 +38,26 @@ static const struct pci_tsm_ops *to_pci_tsm_ops(struct pci_tsm *tsm)
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
+	if (!ops->viommu_get_ops)
+		return NULL;
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
index 181d6114086f..766f4ad67ed7 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -9,6 +9,16 @@
 #include <linux/cleanup.h>
 #include <linux/pci-tsm.h>
 
+/* The caller must hold a tsm_get_device() reference for the entire use. */
+const struct iommufd_viommu_ops *tsm_viommu_get_ops(struct tsm_dev *tsm_dev,
+		struct device *dev, enum iommu_viommu_type type)
+{
+	if (!tsm_dev->pci_ops->viommu_get_ops)
+		return NULL;
+	return tsm_dev->pci_ops->viommu_get_ops(dev, type);
+}
+EXPORT_SYMBOL_GPL(tsm_viommu_get_ops);
+
 static void tsm_release(struct device *);
 static const struct class tsm_class = {
 	.name		= "tsm",
@@ -16,6 +26,33 @@ static const struct class tsm_class = {
 };
 static DEFINE_IDA(tsm_ida);
 
+/**
+ * tsm_get_device() - Pin the TSM attached to a device
+ * @dev: device whose TSM is to be pinned
+ *
+ * A successful lookup takes a TSM device reference and pins the backend
+ * module. Release both with tsm_put_device(). Backends providing vIOMMU
+ * operations must not unregister their TSM independently of module unload.
+ * Return: NULL if no vIOMMU-capable TSM is attached, an error if the module
+ * cannot be pinned, or the TSM device associated with the pinned backend.
+ */
+struct tsm_dev *tsm_get_device(struct device *dev)
+{
+	if (!dev_is_pci(dev))
+		return NULL;
+	return pci_tsm_get_device(to_pci_dev(dev));
+}
+EXPORT_SYMBOL_GPL(tsm_get_device);
+
+void tsm_put_device(struct tsm_dev *tsm_dev)
+{
+	struct module *owner = tsm_dev->pci_ops->owner;
+
+	put_device(&tsm_dev->dev);
+	module_put(owner);
+}
+EXPORT_SYMBOL_GPL(tsm_put_device);
+
 static int match_id(struct device *dev, const void *data)
 {
 	struct tsm_dev *tsm_dev = container_of(dev, struct tsm_dev, dev);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 5f5c67b24134..a4b29915d0ca 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -23,6 +23,7 @@ struct iommufd_access;
 struct iommufd_ctx;
 struct iommufd_device;
 struct iommufd_viommu_ops;
+struct tsm_dev;
 struct page;
 
 enum iommufd_object_type {
@@ -104,6 +105,7 @@ struct iommufd_viommu {
 	struct iommu_device *iommu_dev;
 	struct iommufd_hwpt_paging *hwpt;
 	struct file *kvm_file;
+	struct tsm_dev *tsm_dev;
 
 	const struct iommufd_viommu_ops *ops;
 
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 1458935234a4..27a76aeedf50 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -3,7 +3,10 @@
 #define __PCI_TSM_H
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <uapi/linux/iommufd.h>
 
+struct iommufd_viommu_ops;
+struct module;
 struct pci_tsm;
 struct pci_tsm_context;
 struct tsm_dev;
@@ -16,12 +19,27 @@ struct tsm_dev;
  * @devsec_ops: Lock, unlock, and interrogate the security state of the
  *		function via the platform TSM (typically virtual function
  *		operations).
+ * @viommu_get_ops: Return operations for a supported TSM-owned vIOMMU type,
+ *		  or NULL if unsupported
+ * @owner: Module providing the vIOMMU operations, if built as a module
+ *
+ * The vIOMMU owner holds a TSM device reference and pins the backend module
+ * before querying @viommu_get_ops, releasing both after vIOMMU destruction.
+ * A backend providing this callback must not unregister its TSM while the
+ * module is pinned.
  *
  * This operations are mutually exclusive either a tsm_dev instance
  * manages physical link properties or it manages function security
  * states like TDISP lock/unlock.
+ *
+ * @viommu_get_ops runs with the backend module pinned. The PCI/TSM
+ * association is checked during acquisition under pci_tsm_rwsem.
  */
 struct pci_tsm_ops {
+	struct module *owner;
+	const struct iommufd_viommu_ops *(*viommu_get_ops)(
+		struct device *dev, enum iommu_viommu_type type);
+
 	/*
 	 * struct pci_tsm_link_ops - Manage physical link and the TSM/DSM session
 	 * @probe: establish context with the TSM (allocate / wrap 'struct
@@ -151,6 +169,7 @@ struct pci_tsm_pf0 *pci_tsm_context_pf0(struct pci_tsm_context *context);
 struct pci_dev *pci_tsm_context_dsm_dev(struct pci_tsm_context *context);
 bool pci_tsm_context_match_device(struct pci_tsm_context *context,
 				  struct pci_dev *pdev);
+struct tsm_dev *pci_tsm_get_device(struct pci_dev *pdev);
 #else
 static inline int pci_tsm_register(struct tsm_dev *tsm_dev)
 {
@@ -165,6 +184,11 @@ static inline bool pci_tsm_is_configured(struct pci_dev *pdev)
 	return false;
 }
 
+static inline struct tsm_dev *pci_tsm_get_device(struct pci_dev *pdev)
+{
+	return NULL;
+}
+
 static inline struct pci_tsm_context *
 pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 {
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 19dedf971f14..3d5286aeaa42 100644
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
@@ -124,4 +126,27 @@ int tsm_report_unregister(const struct tsm_report_ops *ops);
 struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
+
+#ifdef CONFIG_TSM
+struct tsm_dev *tsm_get_device(struct device *dev);
+void tsm_put_device(struct tsm_dev *tsm_dev);
+const struct iommufd_viommu_ops *tsm_viommu_get_ops(struct tsm_dev *tsm_dev,
+		struct device *dev, enum iommu_viommu_type type);
+#else
+static inline struct tsm_dev *tsm_get_device(struct device *dev)
+{
+	return NULL;
+}
+
+static inline void tsm_put_device(struct tsm_dev *tsm_dev)
+{
+}
+
+static inline const struct iommufd_viommu_ops *
+tsm_viommu_get_ops(struct tsm_dev *tsm_dev, struct device *dev,
+		enum iommu_viommu_type type)
+{
+	return NULL;
+}
+#endif
 #endif /* __TSM_H */
-- 
2.43.0


