Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0RreN+n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6wSP717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+H3fJiooJtrobZUq5IZDuY+VD7wcPaQFZL3FGcl9WNQ=; b=y0RreN+nnzFjEm
	2wRyGOymxqty8IqdFSzX1bqOdToY3Wb0+zSjPTS90rakv5egX2Ie1EESzPZheBDKtFDCT43OmZsRx
	KnhtgxwiLg5T8ETuH3BCMI+Ae+StTQgzRUYn0BSOHpkFSxT2L0zbYaftSCJOMmatKdjjYiRkC+Ycm
	HslTiKRg1t4vj7u3ffW/DaIAAC67zOBVUHwruuUSZzZ6rfpU3M6Xl7O2rRqeo/m5CBbJ0d+kgSlDH
	GJe92ArQGF/gJlM9betIYDdDcVOuWfmkNMP1GMs30r6Mgqs/WEazWkIKY/1ifB4JwRHP0LQG0EAOy
	dfplJ93atBhgoeGK7N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrwX-00000001Xdk-0v2r;
	Mon, 16 Nov 2026 08:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrwW-00000001Xcz-3fUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4B34623F6;
	Mon, 16 Nov 2026 08:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857AA1F000C8;
	Mon, 16 Nov 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817199;
	bh=+H3fJiooJtrobZUq5IZDuY+VD7wcPaQFZL3FGcl9WNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I6wSP717X3bwqEfjDHEj38tLmak34ZyAjweXUkG+7V3JdQM4WvzLG+jdjSD+pP6Vu
	 1JSz5JIFC6n3p+gp5Ix5h6+ajzwP/vcwC+EVsjmUztjcXOq5tD9mfEjAivTRxXiP0H
	 bP6n+Lg1VvhtjaurVz4YgY3IEzjdfjwqTVSwICap3grdw75PWYYN0CAmfblmlU+f7t
	 q4H0FQUl5gRVjLnjKxDKy0x6Lt8iurgyefNTa/y9DHyuuAPn9FV6WRCLBK2ZETuKHx
	 hzYi5mxqAasF5aR6qp7U1XyshSkBdy91qwhBRRyZuBkQVLcRH3gn02qE2u79QU1/Fv
	 l4nF/OuBZG/uQ==
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
Subject: [PATCH v9 01/13] virt: coco: tsm: Require PCI operations when registering a TSM
Date: Mon, 16 Nov 2026 13:49:23 +0530
Message-ID: <20261116081935.85372-2-aneesh.kumar@kernel.org>
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

Reject a NULL pci_ops argument in tsm_register(). Every registered TSM
then has PCI operations, so registration no longer needs separate paths
for TSMs without them.

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-coco@lists.linux.dev
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..03894c5663f1 100644
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
 
-- 
2.43.0


