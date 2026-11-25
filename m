Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95361606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBu/SYeE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsgO5m8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M2f6V5AKCbDzNBzVnkSKauxhXMtebYR0SxTIkkQuhcs=; b=YBu/SYeEZJ6H4t
	OsAPsNqjkTMrSRXmivRfoFrOjRKeH7qKcRS3EXV3nuzdjXKNud9Q6kZWROw5HUgi3md8tK0yrtx0r
	GSuIueQaEV/XdCO98I2EIoXT2tT+La6cUGrGeA5ku3AgGdnx9FcW+UUMUSK+h6tFIaJfqYJjo6sSb
	4VRzJ9/h1wS4nWb1la15jwSA+hsVZ0CIUIbkl5bw8QE1C6ZgNUiSjobSCfP7phgZwjpdVPy8SZCYS
	dVRRMVhfR1g/Azq7d4RGgdHPpwxv8GsmZhG/oMmuAI7j7TVKMcY735pOezdS9LbCtX+tQTwdVbkjr
	WjMVWSgq6BtGdH8bgj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8AF-000000091MT-3kD1;
	Wed, 25 Nov 2026 08:15:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89r-000000091Cx-2VQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:15:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF09162313;
	Wed, 25 Nov 2026 08:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD361F000D8;
	Wed, 25 Nov 2026 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594514;
	bh=M2f6V5AKCbDzNBzVnkSKauxhXMtebYR0SxTIkkQuhcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KsgO5m8Bhk1iDuCrve03xp4BI+FtwU/sO8+eEuQzS7ryfWDoglHTWXQD2z5pBx5Zo
	 t739exoWqmlERPhf0pdUzbYs5nBYWnhXH4mMXIHWh3V+477yVpEeOct6+MFDkd8K2j
	 7rEeeH6ZzNYK2etqqEf84jMwV/4IbqCvTdYGKM7igNBGa5u5/nV9yKoj+jdOxawTO2
	 VMk0ZXTfSCn+DQaP8XkegmVoLEiv9YdbHLnajPtVPu7rfgKYjZZxIDLhrc4sC5PgG+
	 ISloLS4rmDqKfjkFpi3MZNJ6Hicu9zciP7v8sRehsYAaoCCoDV0YdYbGxce9H7su6y
	 fyM6YFN5hRdgA==
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
Subject: [PATCH v10 17/18] PCI/TSM: Wait for DSM users before removing PF0
Date: Wed, 25 Nov 2026 13:41:20 +0530
Message-ID: <20261125081121.379481-18-aneesh.kumar@kernel.org>
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

Removing physical function 0 (PF0) attempts to disconnect its TSM link.
If a sibling function still has an IOMMUFD vDEVICE, dsm_context_users is
nonzero and disconnect returns -EBUSY. Removal currently continues to
pci_doe_destroy(), destroying PF0's Data Object Exchange (DOE) mailbox
while the assigned function may still need it.

Reject new DSM users and subfunction attachments once PF0 removal
starts. Wait for dsm_context_users to reach zero before disconnecting
the link and allowing PCI removal to destroy the mailbox.

Release pci_tsm_rwsem while waiting, since vDEVICE cleanup needs its
read side to decrement the count. Reacquire it for write before
disconnecting.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/pci/tsm.c       | 69 +++++++++++++++++++++++++++++++++++++++--
 include/linux/pci-tsm.h |  5 +++
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm.c
index 88e88fc9aec6..b10bf0b2d5b7 100644
--- a/drivers/pci/tsm.c
+++ b/drivers/pci/tsm.c
@@ -9,10 +9,13 @@
 #define dev_fmt(fmt) "PCI/TSM: " fmt
 
 #include <linux/bitfield.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci-doe.h>
 #include <linux/pci-tsm.h>
+#include <linux/pid.h>
+#include <linux/sched.h>
 #include <linux/sysfs.h>
 #include <linux/tsm.h>
 #include <linux/xarray.h>
@@ -337,6 +340,12 @@ int pci_tsm_context_get(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 
 	pf0 = to_pci_tsm_pf0(pdev->tsm);
 	guard(mutex)(&pf0->lock);
+	if (pf0->removing)
+		return -ENODEV;
+
+	if (!pf0->dsm_context_users)
+		reinit_completion(&pf0->dsm_context_drain_complete);
+
 	pf0->dsm_context_users++;
 	return 0;
 }
@@ -349,8 +358,12 @@ void pci_tsm_context_put(struct pci_dev *pdev)
 	down_read(&pci_tsm_rwsem);
 	pf0 = to_pci_tsm_pf0(pdev->tsm);
 	mutex_lock(&pf0->lock);
-	if (!WARN_ON(!pf0->dsm_context_users))
-		pf0->dsm_context_users--;
+	if (WARN_ON(!pf0->dsm_context_users))
+		goto out_unlock;
+
+	if (!--pf0->dsm_context_users)
+		complete_all(&pf0->dsm_context_drain_complete);
+out_unlock:
 	mutex_unlock(&pf0->lock);
 	up_read(&pci_tsm_rwsem);
 }
@@ -409,6 +422,10 @@ static ssize_t disconnect_store(struct device *dev,
 	if (!sysfs_streq(buf, dev_name(&tsm_dev->dev)))
 		return -EINVAL;
 
+	if (is_link_tsm(tsm_dev) && is_pci_tsm_pf0(pdev) &&
+	    to_pci_tsm_pf0(pdev->tsm)->removing)
+		return -ENODEV;
+
 	rc = pci_tsm_disconnect(pdev);
 	if (rc)
 		return rc;
@@ -620,6 +637,9 @@ int pci_tsm_pf0_constructor(struct pci_dev *pdev, struct pci_tsm_pf0 *tsm,
 			    struct tsm_dev *tsm_dev)
 {
 	mutex_init(&tsm->lock);
+	init_completion(&tsm->dsm_context_drain_complete);
+	tsm->dsm_context_users = 0;
+	tsm->removing = false;
 	tsm->doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
 					   PCI_DOE_FEATURE_CMA);
 	if (!tsm->doe_mb) {
@@ -708,8 +728,47 @@ static void __pci_tsm_destroy(struct pci_dev *pdev, struct tsm_dev *tsm_dev)
 
 void pci_tsm_destroy(struct pci_dev *pdev)
 {
-	guard(rwsem_write)(&pci_tsm_rwsem);
+	struct pci_tsm_pf0 *pf0 = NULL;
+	struct completion *drained;
+	bool interrupted = false;
+	long rc;
+
+	down_write(&pci_tsm_rwsem);
+	if (pdev->tsm &&
+	    is_link_tsm(pdev->tsm->tsm_dev) && is_pci_tsm_pf0(pdev)) {
+		pf0 = to_pci_tsm_pf0(pdev->tsm);
+		drained = &pf0->dsm_context_drain_complete;
+		mutex_lock(&pf0->lock);
+		pf0->removing = true;
+
+		mutex_unlock(&pf0->lock);
+		/* An unused DSM may never have completed dsm_context_drain_complete. */
+		if (pf0->dsm_context_users)
+			rc = try_wait_for_completion(drained);
+		else
+			rc = 1;
+
+		/* Context release needs the read side of pci_tsm_rwsem. */
+		up_write(&pci_tsm_rwsem);
+		while (rc <= 0) {
+			if (interrupted) {
+				rc = wait_for_completion_timeout(drained, HZ * 10);
+			} else {
+				rc = wait_for_completion_interruptible_timeout(drained,
+									       HZ * 10);
+				if (rc < 0) {
+					interrupted = true;
+					pci_warn(pdev, "Task \"%s\" (%d) blocked until vdevices are released\n",
+						 current->comm, task_pid_nr(current));
+				}
+			}
+			if (!rc)
+				pci_warn(pdev, "TSM connection is in use, waiting for vdevices\n");
+		}
+		down_write(&pci_tsm_rwsem);
+	}
 	__pci_tsm_destroy(pdev, NULL);
+	up_write(&pci_tsm_rwsem);
 }
 
 void pci_tsm_init(struct pci_dev *pdev)
@@ -737,6 +796,10 @@ void pci_tsm_init(struct pci_dev *pdev)
 		if (!dsm->tsm)
 			return;
 
+		if (is_link_tsm(dsm->tsm->tsm_dev) &&
+		    to_pci_tsm_pf0(dsm->tsm)->removing)
+			return;
+
 		probe_fn(pdev, dsm);
 	}
 }
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 44895c585d75..b6830206e36f 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __PCI_TSM_H
 #define __PCI_TSM_H
+#include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <uapi/linux/iommufd.h>
@@ -104,12 +105,16 @@ struct pci_tsm {
  * @base_tsm: generic core "tsm" context
  * @lock: mutual exclustion for pci_tsm_ops invocation
  * @dsm_context_users: users preventing DSM disconnect
+ * @dsm_context_drain_complete: completed when the last context is released
+ * @removing: reject new contexts while the DSM is being removed
  * @doe_mb: PCIe Data Object Exchange mailbox
  */
 struct pci_tsm_pf0 {
 	struct pci_tsm base_tsm;
 	struct mutex lock;
 	unsigned int dsm_context_users;
+	struct completion dsm_context_drain_complete;
+	bool removing;
 	struct pci_doe_mb *doe_mb;
 };
 
-- 
2.43.0


