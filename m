Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E91606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBFjBsrj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMEVZ0Az
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VemvpMjsxU7IG8WaLTB2YhtcJskkfyzuCSEZYtF0GpI=; b=OBFjBsrjf7YOsm
	0f6ShykVCH66SEBVdYo3glT2RR8/JAWIHrHDSAAKsTuSQG8SpLA4Tjsl1wynYrTQIDIQtOeL0FYfU
	C3uNlwB+sPc1rYx1sGcT4loEFCI7Si7ETQX8dM17Y2CWHVYiZPtDmXrUSoeI0MG5laAWP6yZ+V2Fr
	BHN47GwmVzTxl3kxdkynd2NoBJzDTExg70jLi+9Mk1leRoyb5qCKShk48DegoA5hYaR2LwqFWP+6u
	w6n/oclZ/e4+wbocobFsUTilkF+rTU7Jt8B5bJvQiLlcIGosfDnz/DGnSGZwZfMM9WpPLDqCd9oRk
	i3+VFs4wEkmaI2BgB0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW88g-000000090Y8-2ELW;
	Wed, 25 Nov 2026 08:14:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW88f-000000090XE-2xoQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CAB862295;
	Wed, 25 Nov 2026 08:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3501F000D1;
	Wed, 25 Nov 2026 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594440;
	bh=VemvpMjsxU7IG8WaLTB2YhtcJskkfyzuCSEZYtF0GpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MMEVZ0Az8ynv2Z9OT3gk+EAV3onr4iy92vMO4wFDa4/bPvhqMIgzXQv3xDXWyrTon
	 pkxGAzl9XVYN/4mG0/PnervL7iQz1wimJyPbMMX/hPokAOSXuu9C+4vnCd5DpUe8tW
	 CW4JIzTzaKlqICjqwuC/+zHOEqyuqIHVsDu3jLLzd8M4oREsf+9yF7pm3aGJgLE8tj
	 kiO5uYgcSmteqd41S4tnbXUcpphcALhuYohDO98861kbUwTHYL00cdXVFMxYZ2SM46
	 knQf3sfdFsV3uarL+dgR2xNEIzxkcUJUOaw2JW4lWtY1RNa3wnUMMS/OgL0KSplioC
	 tyUbdndCgkI7Q==
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
Subject: [PATCH v10 11/18] PCI/TSM: Remove the legacy bind and unbind interface
Date: Wed, 25 Nov 2026 13:41:14 +0530
Message-ID: <20261125081121.379481-12-aneesh.kumar@kernel.org>
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

Remove pci_tsm_bind(), pci_tsm_unbind(), their callbacks and the pci_tdi
structure. Device security state will be managed through vIOMMU
operations.

Remove the bound sysfs attribute and its ABI documentation, since they
report state maintained by the removed interface.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-bus-pci |  14 ---
 drivers/pci/tsm.c                       | 150 +-----------------------
 include/linux/pci-tsm.h                 |  34 +-----
 3 files changed, 2 insertions(+), 196 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
index 2906257eb610..ab9083f3b0d3 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci
+++ b/Documentation/ABI/testing/sysfs-bus-pci
@@ -678,20 +678,6 @@ Description:	(RO) Return PCI device name of this device's DSM (Device
 		PCIe switch port. This is a "link" TSM attribute, see
 		Documentation/ABI/testing/sysfs-class-tsm.
 
-What:		/sys/bus/pci/devices/.../tsm/bound
-Contact:	linux-coco@lists.linux.dev
-Description:	(RO) Return the device name of the TSM when the device is in a
-		TDISP (TEE Device Interface Security Protocol) operational state
-		(LOCKED, RUN, or ERROR, not UNLOCKED). Bound devices consume
-		platform TSM resources and depend on the device's configuration
-		(e.g. BME (Bus Master Enable) and MSE (Memory Space Enable)
-		among other settings) to remain stable for the duration of the
-		bound state. This attribute is only visible for devices that
-		support TDISP operation, and it is only populated after
-		successful connect and TSM bind. The TSM bind operation is
-		initiated by VFIO/IOMMUFD. This is a "link" TSM attribute, see
-		Documentation/ABI/testing/sysfs-class-tsm.
-
 What:		/sys/bus/pci/devices/.../authenticated
 Contact:	linux-pci@vger.kernel.org
 Description:
diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm.c
index 73f16a9a78ef..ddff81554372 100644
--- a/drivers/pci/tsm.c
+++ b/drivers/pci/tsm.c
@@ -337,95 +337,6 @@ void pci_tsm_context_put(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_tsm_context_put);
 
-/*
- * Note, this helper only returns an error code and takes an argument for
- * compatibility with the pci_walk_bus() callback prototype. pci_tsm_unbind()
- * always succeeds.
- */
-static int __pci_tsm_unbind(struct pci_dev *pdev, void *data)
-{
-	struct pci_tdi *tdi;
-	struct pci_tsm_pf0 *tsm_pf0;
-
-	lockdep_assert_held(&pci_tsm_rwsem);
-
-	if (!pdev->tsm)
-		return 0;
-
-	tsm_pf0 = to_pci_tsm_pf0(pdev->tsm);
-	guard(mutex)(&tsm_pf0->lock);
-
-	tdi = pdev->tsm->tdi;
-	if (!tdi)
-		return 0;
-
-	to_pci_tsm_ops(pdev->tsm)->unbind(tdi);
-	pdev->tsm->tdi = NULL;
-
-	return 0;
-}
-
-void pci_tsm_unbind(struct pci_dev *pdev)
-{
-	guard(rwsem_read)(&pci_tsm_rwsem);
-	__pci_tsm_unbind(pdev, NULL);
-}
-EXPORT_SYMBOL_GPL(pci_tsm_unbind);
-
-/**
- * pci_tsm_bind() - Bind @pdev as a TDI for @kvm
- * @pdev: PCI device function to bind
- * @kvm: Private memory attach context
- * @tdi_id: Identifier (virtual BDF) for the TDI as referenced by the TSM and DSM
- *
- * Returns 0 on success, or a negative error code on failure.
- *
- * Context: Caller is responsible for constraining the bind lifetime to the
- * registered state of the device. For example, pci_tsm_bind() /
- * pci_tsm_unbind() limited to the VFIO driver bound state of the device.
- */
-int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id)
-{
-	struct pci_tsm_pf0 *tsm_pf0;
-	struct pci_tdi *tdi;
-
-	if (!kvm)
-		return -EINVAL;
-
-	guard(rwsem_read)(&pci_tsm_rwsem);
-
-	if (!pdev->tsm)
-		return -EINVAL;
-
-	if (!is_link_tsm(pdev->tsm->tsm_dev))
-		return -ENXIO;
-
-	tsm_pf0 = to_pci_tsm_pf0(pdev->tsm);
-	guard(mutex)(&tsm_pf0->lock);
-
-	/* Resolve races to bind a TDI */
-	if (pdev->tsm->tdi) {
-		if (pdev->tsm->tdi->kvm != kvm)
-			return -EBUSY;
-		return 0;
-	}
-
-	tdi = to_pci_tsm_ops(pdev->tsm)->bind(pdev, kvm, tdi_id);
-	if (IS_ERR(tdi))
-		return PTR_ERR(tdi);
-
-	pdev->tsm->tdi = tdi;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pci_tsm_bind);
-
-static void pci_tsm_unbind_all(struct pci_dev *pdev)
-{
-	pci_tsm_walk_fns_reverse(pdev, __pci_tsm_unbind, NULL);
-	__pci_tsm_unbind(pdev, NULL);
-}
-
 static int __pci_tsm_disconnect(struct pci_dev *pdev)
 {
 	struct pci_tsm_pf0 *tsm_pf0 = to_pci_tsm_pf0(pdev->tsm);
@@ -434,8 +345,6 @@ static int __pci_tsm_disconnect(struct pci_dev *pdev)
 	/* disconnect() mutually exclusive with subfunction pci_tsm_init() */
 	lockdep_assert_held_write(&pci_tsm_rwsem);
 
-	pci_tsm_unbind_all(pdev);
-
 	/*
 	 * Refuse to disconnect the link until all contexts have been released.
 	 *
@@ -489,33 +398,6 @@ static ssize_t disconnect_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(disconnect);
 
-static ssize_t bound_show(struct device *dev,
-			  struct device_attribute *attr, char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pci_tsm_pf0 *tsm_pf0;
-	struct pci_tsm *tsm;
-	int rc;
-
-	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
-	if ((rc = ACQUIRE_ERR(rwsem_read_intr, &lock)))
-		return rc;
-
-	tsm = pdev->tsm;
-	if (!tsm)
-		return sysfs_emit(buf, "\n");
-	tsm_pf0 = to_pci_tsm_pf0(tsm);
-
-	ACQUIRE(mutex_intr, ops_lock)(&tsm_pf0->lock);
-	if ((rc = ACQUIRE_ERR(mutex_intr, &ops_lock)))
-		return rc;
-
-	if (!tsm->tdi)
-		return sysfs_emit(buf, "\n");
-	return sysfs_emit(buf, "%s\n", dev_name(&tsm->tsm_dev->dev));
-}
-static DEVICE_ATTR_RO(bound);
-
 static ssize_t dsm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
@@ -570,13 +452,6 @@ static umode_t pci_tsm_attr_visible(struct kobject *kobj,
 	if (pci_tsm_link_group_visible(kobj)) {
 		struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 
-		if (attr == &dev_attr_bound.attr) {
-			if (is_pci_tsm_pf0(pdev) && has_tee(pdev))
-				return attr->mode;
-			if (pdev->tsm && has_tee(pdev->tsm->dsm_dev))
-				return attr->mode;
-		}
-
 		if (attr == &dev_attr_dsm.attr) {
 			if (is_pci_tsm_pf0(pdev))
 				return attr->mode;
@@ -603,7 +478,6 @@ DEFINE_SYSFS_GROUP_VISIBLE(pci_tsm);
 static struct attribute *pci_tsm_attrs[] = {
 	&dev_attr_connect.attr,
 	&dev_attr_disconnect.attr,
-	&dev_attr_bound.attr,
 	&dev_attr_dsm.attr,
 	NULL
 };
@@ -693,22 +567,6 @@ static struct pci_dev *find_dsm_dev(struct pci_dev *pdev)
 	return NULL;
 }
 
-/**
- * pci_tsm_tdi_constructor() - base 'struct pci_tdi' initialization for link TSMs
- * @pdev: PCI device function representing the TDI
- * @tdi: context to initialize
- * @kvm: Private memory attach context
- * @tdi_id: Identifier (virtual BDF) for the TDI as referenced by the TSM and DSM
- */
-void pci_tsm_tdi_constructor(struct pci_dev *pdev, struct pci_tdi *tdi,
-			     struct kvm *kvm, u32 tdi_id)
-{
-	tdi->pdev = pdev;
-	tdi->kvm = kvm;
-	tdi->tdi_id = tdi_id;
-}
-EXPORT_SYMBOL_GPL(pci_tsm_tdi_constructor);
-
 /**
  * pci_tsm_link_constructor() - base 'struct pci_tsm' initialization for link TSMs
  * @pdev: The PCI device
@@ -788,12 +646,6 @@ int pci_tsm_register(struct tsm_dev *tsm_dev)
 	return 0;
 }
 
-static void pci_tsm_fn_exit(struct pci_dev *pdev)
-{
-	__pci_tsm_unbind(pdev, NULL);
-	tsm_remove(pdev->tsm);
-}
-
 /**
  * __pci_tsm_destroy() - destroy the TSM context for @pdev
  * @pdev: device to cleanup
@@ -831,7 +683,7 @@ static void __pci_tsm_destroy(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 		if (pci_tsm_disconnect(pdev))
 			pci_warn(pdev, "TSM connection is still in use\n");
 	} else {
-		pci_tsm_fn_exit(pdev);
+		tsm_remove(pdev->tsm);
 	}
 }
 
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 38b03d71e3f3..e6fe099f2cc9 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -6,7 +6,6 @@
 
 struct pci_tsm;
 struct tsm_dev;
-struct kvm;
 
 /*
  * struct pci_tsm_ops - manage confidential links and security state
@@ -30,16 +29,12 @@ struct pci_tsm_ops {
 	 * @connect: establish / validate a secure connection (e.g. IDE)
 	 *	     with the device
 	 * @disconnect: teardown the secure link
-	 * @bind: bind a TDI in preparation for it to be accepted by a TVM
-	 * @unbind: remove a TDI from secure operation with a TVM
 	 *
 	 * Context: @probe, @remove, @connect, and @disconnect run under
 	 * pci_tsm_rwsem held for write to sync with TSM unregistration and
 	 * mutual exclusion of @connect and @disconnect. @connect and
 	 * @disconnect additionally run under the DSM lock (struct
 	 * pci_tsm_pf0::lock) as well as @probe and @remove of the subfunctions.
-	 * @bind and @unbind run under pci_tsm_rwsem held for read
-	 * and the DSM lock.
 	 */
 	struct_group_tagged(pci_tsm_link_ops, link_ops,
 		struct pci_tsm *(*probe)(struct tsm_dev *tsm_dev,
@@ -47,9 +42,6 @@ struct pci_tsm_ops {
 		void (*remove)(struct pci_tsm *tsm);
 		int (*connect)(struct pci_dev *pdev);
 		void (*disconnect)(struct pci_dev *pdev);
-		struct pci_tdi *(*bind)(struct pci_dev *pdev,
-					struct kvm *kvm, u32 tdi_id);
-		void (*unbind)(struct pci_tdi *tdi);
 	);
 
 	/*
@@ -69,25 +61,12 @@ struct pci_tsm_ops {
 	);
 };
 
-/**
- * struct pci_tdi - Core TEE I/O Device Interface (TDI) context
- * @pdev: host side representation of guest-side TDI
- * @kvm: TEE VM context of bound TDI
- * @tdi_id: Identifier (virtual BDF) for the TDI as referenced by the TSM and DSM
- */
-struct pci_tdi {
-	struct pci_dev *pdev;
-	struct kvm *kvm;
-	u32 tdi_id;
-};
-
 /**
  * struct pci_tsm - Core TSM context for a given PCIe endpoint
  * @pdev: Back ref to device function, distinguishes type of pci_tsm context
  * @dsm_dev: PCI Device Security Manager for link operations on @pdev
  * @tsm_dev: PCI TEE Security Manager device for Link Confidentiality or Device
  *	     Function Security operations
- * @tdi: TDI context established by the @bind link operation
  *
  * This structure is wrapped by low level TSM driver data and returned by
  * probe()/lock(), it is freed by the corresponding remove()/unlock().
@@ -103,7 +82,6 @@ struct pci_tsm {
 	struct pci_dev *pdev;
 	struct pci_dev *dsm_dev;
 	struct tsm_dev *tsm_dev;
-	struct pci_tdi *tdi;
 };
 
 /**
@@ -163,10 +141,6 @@ int pci_tsm_pf0_constructor(struct pci_dev *pdev, struct pci_tsm_pf0 *tsm,
 void pci_tsm_pf0_destructor(struct pci_tsm_pf0 *tsm);
 int pci_tsm_doe_transfer(struct pci_dev *pdev, u8 type, const void *req,
 			 size_t req_sz, void *resp, size_t resp_sz);
-int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id);
-void pci_tsm_unbind(struct pci_dev *pdev);
-void pci_tsm_tdi_constructor(struct pci_dev *pdev, struct pci_tdi *tdi,
-			     struct kvm *kvm, u32 tdi_id);
 int pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev);
 void pci_tsm_context_put(struct pci_dev *pdev);
 #else
@@ -177,13 +151,7 @@ static inline int pci_tsm_register(struct tsm_dev *tsm_dev)
 static inline void pci_tsm_unregister(struct tsm_dev *tsm_dev)
 {
 }
-static inline int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u64 tdi_id)
-{
-	return -ENXIO;
-}
-static inline void pci_tsm_unbind(struct pci_dev *pdev)
-{
-}
+
 static inline int
 pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 {
-- 
2.43.0


