Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F7606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXsvZ8Sr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGvq23yc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qNqeDbpxVzyt0D8zrNO/DsvDdR3BesjNRof9Gv3qM14=; b=kXsvZ8SrzneVnC
	3poWwHUGXvGcqsdBT2hU1i0wW14HytdUvoIpTTLdbJ0891JH83ssKdk5UTPgGi045PE19b+WUiekY
	EfvmdkktW2hA36YtyrzxL+9e1jLJR1KLdr/jOlcZFbQ40/o0JVXNWUOuU2OqRUi1SoFfZ5qikN3XR
	Gbs5IdtZqSikzHaENqspkO1NPEJxtUAYMjYf0/HaA+1/xr3tPiYr7NwNOgwtADviW0vbk28JOUew8
	B4DowiG88jxZGgq6gZa8rRQdiIPD9G4PyF8BxymZ6jmHoWhlmh0V4s7CsbBcoEPeyoezyCipRjSTs
	oxmdjwFEXEIcLPekbhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89M-000000090yt-1ujR;
	Wed, 25 Nov 2026 08:14:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89G-000000090w3-1FDv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1176641B0A;
	Wed, 25 Nov 2026 08:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DA81F000D4;
	Wed, 25 Nov 2026 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594477;
	bh=qNqeDbpxVzyt0D8zrNO/DsvDdR3BesjNRof9Gv3qM14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LGvq23ycPLAFWkSCIANStiF3/I1CS8tqcpXJ+2ulG1LLnPfbvqOZZIC8fpQk77//u
	 Zkds3wMYrnFCoi8NuC3h/2iM7PzYAyW6fxJ6eY/mZVpYamEpGb8XUd8DCbZ3moOwRR
	 D2ynW4NWqadyra7eZvsXKT2rDNZXemNtn95kZ9SeIsbh/YgUmUQ+EckQptspjmHeqR
	 Wj70vRVJFUD+Kv52tr7mTNOfyHM44A+ko0g0J8XsbwgCQ7cN7VA99+ZB9p0OgE8iVE
	 rFEwjoAYJBnCrKJz61s0DxXvMI39UKU7iy8+KqE+3hIa247g6DxxGqAHiyILw+nXbM
	 42YFG2opPib9Q==
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
Subject: [PATCH v10 14/18] iommufd/viommu: Identify physical IOMMU backing with a tag
Date: Wed, 25 Nov 2026 13:41:17 +0530
Message-ID: <20261125081121.379481-15-aneesh.kumar@kernel.org>
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

When allocating a vDEVICE or nested HWPT, IOMMUFD checks that the device
and its vIOMMU use the same physical IOMMU.

The next patch adds vIOMMUs implemented by a TSM. These store a TSM
pointer instead of a physical IOMMU pointer, so the same comparison
cannot be used.

Add a backing field to identify vIOMMUs that use a physical IOMMU, and
perform the comparison only for those vIOMMUs. All existing vIOMMUs
select that value, so their behavior is unchanged.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/iommufd/hw_pagetable.c | 10 ++++++----
 drivers/iommu/iommufd/viommu.c       | 11 +++++++----
 include/linux/iommufd.h              |  5 +++++
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index ae62db50885c..859eadf05f1d 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -404,10 +404,12 @@ int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
 		struct iommufd_viommu *viommu;
 
 		viommu = container_of(pt_obj, struct iommufd_viommu, obj);
-		iommu_dev = iommufd_device_get_iommu_dev(idev);
-		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
-			rc = -EINVAL;
-			goto out_unlock;
+		if (viommu->backing == IOMMUFD_VIOMMU_BACKING_IOMMU) {
+			iommu_dev = iommufd_device_get_iommu_dev(idev);
+			if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
+				rc = -EINVAL;
+				goto out_unlock;
+			}
 		}
 		hwpt_nested = iommufd_viommu_alloc_hwpt_nested(
 			viommu, cmd->flags, &user_data);
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 472381b96a8e..dab499d24c45 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -105,6 +105,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	 * pluggable IOMMU instance (if exists) is responsible for refcounting
 	 * on its own.
 	 */
+	viommu->backing = IOMMUFD_VIOMMU_BACKING_IOMMU;
 	viommu->iommu_dev = iommu_dev;
 
 	rc = ops->viommu_init(viommu, idev->dev,
@@ -218,10 +219,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
-	iommu_dev = iommufd_device_get_iommu_dev(idev);
-	if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
-		rc = -EINVAL;
-		goto out_put_idev;
+	if (viommu->backing == IOMMUFD_VIOMMU_BACKING_IOMMU) {
+		iommu_dev = iommufd_device_get_iommu_dev(idev);
+		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
+			rc = -EINVAL;
+			goto out_put_idev;
+		}
 	}
 
 	mutex_lock(&idev->igroup->lock);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 5f5c67b24134..192d46b8ccfd 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -98,9 +98,14 @@ void iommufd_access_detach(struct iommufd_access *access);
 
 void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
+enum iommufd_viommu_backing {
+	IOMMUFD_VIOMMU_BACKING_IOMMU,
+};
+
 struct iommufd_viommu {
 	struct iommufd_object obj;
 	struct iommufd_ctx *ictx;
+	enum iommufd_viommu_backing backing;
 	struct iommu_device *iommu_dev;
 	struct iommufd_hwpt_paging *hwpt;
 	struct file *kvm_file;
-- 
2.43.0


