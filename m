Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4EC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LD4HbS8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrw8qz7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yhb1PMKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=; b=4LD4HbS8lSUYcRLxYhsgQrMJQd
	8sXvTqtAL75xWEpP40s5KjltWdbqjReJtJg2HrOeNku2WgkZoM9+/UFxBn0cP/6IkV4Wcbj9J7mM1
	u9Hjy8LABJSU4WdjoBvgNvPdTwnCJlQuEgFXlotnpvjpM5auYWbe/YBTm2KPpALjKVYcjDcUTlU/U
	98Fgip6hg7E0JxEytn5TKN1ItcyfWoDaDs1lvdfuywoAAiT54mv6358roUxinvPPE5e5IP8uXUnGF
	YANkIJY5FlIP0rOIFp0VV0NJ8VW99RHFNhJRS9WHAzuCu1aCZD0OdRmsQxEZ+6b8HuaD/oypGz9lZ
	zIgj5X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDPM-0000000A3XT-0wbP;
	Wed, 25 Nov 2026 13:51:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDPH-0000000A3Uj-3a8t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:51:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mN9W555516
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9Xgvibc
	Pxadi8NA=; b=mrw8qz7VJsviWHPggc/MnckouP9kLpy4wM3ID+zbWiqixOTp9nB
	R6rYFdgJCd1Pu0BinrYzcN31/dtipILpujVSHGRhtAuJR7rBtdfDbStVM7y/04YT
	Xix0uBww7/A4TP4BZ3kxIexEFYKm+9+3w/75QZIq57/GuH++L3ZkHgQKPUp5nfxT
	VJ3OBYR+jVJ/vLPij9tNhMFkhQbMV3QUC2SN0Tg0ylUiKKR2u4UCOCgDtxKEPNqH
	YOoa3rhzMxBFKo6qWAGwCn1qtxwxgT0Xg1py6LQE7h+6pvIPrcBA9SLo+VbhGAim
	fyNsHdn8EykbBNalgqVaqhSKC8IdZI/WcPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvns2wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:51:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3662814a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614689; x=1796219489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=Yhb1PMKLqe5oCRppGfwl8A3Y5/hxQm8WZPmEbgogMIx7kza3/G9+qntlkq4nN6Gy8b
         QZpqbmMTGYwljn+9zXJj3bC0qnkg0qsYvm7oHBW95H2CdVpk8jt8/NHFJLDtDh+HKAdk
         ARKxRFdHCJu/ZOMf0opsxNe3q8y49lruQK3h5zxt9GJWAwTBsT5t5gW4YZeECezLUarn
         sNpdVLzElYkj1cNr5cM2y2qsJZHzHngB9EXSxVpOaD++HyNxj9GTGff9/QNWl6UYISf9
         nP1dkDzktYi4TvpY7IiWRq56DP44gIN697f22WOcFdLKqbvilaXsibve+cvNQYESgu/m
         dr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614689; x=1796219489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=OoMn9+dooHIrpjdH6gfP+LOfHLKcoSwEmIbOqVQnOr0Rr32XBNyheq6S/Vlh8SYqcv
         uIMIj32XEggYgEq1JtJW+LFGEoB50BY+Agon3xSzIUWPdlBRH7PESqz1CI5jL56sbGFD
         +9skWJb8RNSa8/TdSn6U/b8UjbW/tJtFs8ZRlFIvuW1CXF4GOe9jyeMH5Xqf45G+x1l5
         LYi36bTz+7bo0DEFWCeVSLvjShjKGBBvzuRIWd4LKBqim4t7Du8dyDgUxY9akjUR21OB
         xzRMsYUPHGf1dwTDd8faoCCu453o/ENueUjSH4LVM5fxNmjaTPp9rovhTZcCs+ojlyv1
         /Ekg==
X-Forwarded-Encrypted: i=1; AL+hErE7+xAQvLdd6eIAhGekDkephDlxljRkXbjGHdPd7yY/5xgC4lis4shWbgb01bbe5DO9qtevGP7Tc0FKdczaoQky@lists.infradead.org
X-Gm-Message-State: APuU4Z+YNEZLZ5f2ukvghseZPCRwnnt+d24MtgUzc5MGenkXoz1Pd5eq
	4I3b20tEbPQl7HWtS6zNOEH+5IEEBuUPYjow/XTTlP2zsdaHhiaV5iDOd6aFtQOR7rxQmPGbJYc
	1vh8+rk0vymBoO8PO4EIWIlPMNA8h+OmtxL8gl7Nr9rjuTNNYgP3u4wjda7ombk1jdpM0rjeHdg
	13OhmBzS66Hw==
X-Gm-Gg: AZFdTZe7ScSE7rvUenI0vBc9TZSHRygra4v2GSV37YJR0LqQ9g4zthYqCGBVv00U7y/
	DkI2hrk4SMeEPxIM7lfUq+U6d7eaUo+N6nd4Z7m/viB+alGssWA4tbZiM4fB4OG7YrBwUh3YvoK
	3S6CO13zFmbDwrSmO41aP7efQAuLpkqQycZLFlunW6C56eGXqPw7aLf04V1ZzBnkOwl/YCMjrKl
	aejdRWvDKQGfR9pPZg0jSaMP3Z+HXmsNprl34YP6uOZwR2Ckq6gjRGCjUwfQUq8N0p8HfusH/2L
	VP22HDqZb0gkA1QlfNddLzwuee67GU+plaj77dw1+WKFtbrb4PpOxv/QHIFgidFhFuAeGPIQ76k
	mtupkdKS9W+TZPmd+cegdChEHjW5kq2Tb6nUMkDsPlNFFPD8KkCo01b3NJK2vndRbFAaHVUl1ZO
	lITzkIXoQ5DgC/fykq8nOnD84sCaABmspM63p8pgThX1WuW1wE1Ul3Pzzc9bSIPadu
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507418a91.51.1795614688908;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507383a91.51.1795614688084;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm27710815a91.4.2026.11.25.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:51:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com, m.szyprowski@samsung.com,
        honghuan@amd.com
Cc: joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] Revert "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
Date: Wed, 25 Nov 2026 19:21:20 +0530
Message-Id: <20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfX/pmjJ/oiFF23
 4BVHfuhtFvjzm+cqYv4hefvhnbI4JqgZ03fdZLQ6qbUgzTC9kr2QNJbkIVoIAW5JnwkJM3wyIhp
 QpSanH0xbfuYNg1AX5KMX3QM3JaD28Zqs+STjc6eJwbAyO8hEZXSfaN31PH5tdMQutNnLH6COL6
 2Jd0bV59++zK4pbAKc/KI8Hh9DEODrC4RG+0N3eNMbgKR6fHEP0oV96I87Pj2SJw3w6iH6OmoqY
 Y5dMX9/sudWMcl/igeFQRg26l+NCDNf9mFS9UpPBUEjYlaucfNDxqMbwWzqdL8k8R1wrd1jD4v8
 lgcuWRb0NAfOjrP51HRMYPETZzVfNipP2OjunE7alREG3g/qUajuXxxot9QtqlStAul4cBZiZlR
 RzyopDBhV91/XmIVDhoXAa5vWdowM8QQidy+ucMgwlTshEelGUif1QoAirJBFWZwV5zdBwlOiwI
 zEy0qLc06wb0x3xhlRA==
X-Proofpoint-ORIG-GUID: xgePC9VMiq-6RyOrj6nUt1cysmclen0N
X-Proofpoint-GUID: xgePC9VMiq-6RyOrj6nUt1cysmclen0N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfX9ADQLHSnZaDe
 2a7v39+IcBJ/l7mwmGAisOAK/awdSd8rN+IMpsiKZBtc67WzF/lDqaSBCW4FjH8VGRjEL4eowZc
 aBjdEQxSHzQI4TRJmZplE23cvYHrh9w=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e7e2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cR5wH3shGYeZUv4u9kAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055132_006615_10F25976 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -2.8 (--)
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

This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.

Before this commit, dma_iova_destroy() unmapped through
__iommu_dma_iova_unlink(..., free_iova=true), which set
iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
and freed the IOVA with the queued gather, exactly like
__iommu_dma_unmap(). After it, dma_iova_destroy() calls
dma_iova_unlink() and then dma_iova_free():

  - dma_iova_unlink() never marks its gather as queued and always calls
    iommu_iotlb_sync() after iommu_unmap_fast().
  - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
    the IOVA goes straight back to the allocator through
    free_iova_fast() and never through queue_iova().

DMA-FQ domains therefore get strict invalidation on this path. That
includes the block layer's blk_rq_dma_map() path, which NVMe uses for
all data transfers, so iommu.strict=0 has no effect on NVMe I/O.

hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
	       4K pages; NVMe SSD on PCIe Gen5 x4

Fio sequential read/write numbers:
  Domain                          seq write    seq read
  DMA (strict)                    2694 MiB/s   2693 MiB/s
  DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
    bypassed (this regression)
  DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
    used by dma_iova_destroy()

Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 57 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b66e83cfbc5f..e71a10e14c36 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2101,20 +2101,10 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		arch_sync_dma_flush();
 }
 
-/**
- * dma_iova_unlink - Unlink a range of IOVA space
- * @dev: DMA device
- * @state: IOVA state
- * @offset: offset into the IOVA state to unlink
- * @size: size of the buffer
- * @dir: DMA direction
- * @attrs: attributes of mapping properties
- *
- * Unlink a range of IOVA space for the given IOVA state.
- */
-void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
-		size_t offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static void __iommu_dma_iova_unlink(struct device *dev,
+		struct dma_iova_state *state, size_t offset, size_t size,
+		enum dma_data_direction dir, unsigned long attrs,
+		bool free_iova)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -2130,13 +2120,35 @@ void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
 		iommu_dma_iova_unlink_range_slow(dev, addr, size, dir, attrs);
 
 	iommu_iotlb_gather_init(&iotlb_gather);
+	iotlb_gather.queued = free_iova && READ_ONCE(cookie->fq_domain);
 
 	size = iova_align(iovad, size + iova_start_pad);
 	addr -= iova_start_pad;
 	unmapped = iommu_unmap_fast(domain, addr, size, &iotlb_gather);
 	WARN_ON(unmapped != size);
 
-	iommu_iotlb_sync(domain, &iotlb_gather);
+	if (!iotlb_gather.queued)
+		iommu_iotlb_sync(domain, &iotlb_gather);
+	if (free_iova)
+		iommu_dma_free_iova(domain, addr, size, &iotlb_gather);
+}
+
+/**
+ * dma_iova_unlink - Unlink a range of IOVA space
+ * @dev: DMA device
+ * @state: IOVA state
+ * @offset: offset into the IOVA state to unlink
+ * @size: size of the buffer
+ * @dir: DMA direction
+ * @attrs: attributes of mapping properties
+ *
+ * Unlink a range of IOVA space for the given IOVA state.
+ */
+void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	 __iommu_dma_iova_unlink(dev, state, offset, size, dir, attrs, false);
 }
 EXPORT_SYMBOL_GPL(dma_iova_unlink);
 
@@ -2157,13 +2169,14 @@ void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 		unsigned long attrs)
 {
 	if (mapped_len)
-		dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs);
-
-	/*
-	 * We can be here if the first call to dma_iova_link() failed and
-	 * there is nothing to unlink, so let's be more clear.
-	 */
-	dma_iova_free(dev, state);
+		__iommu_dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs,
+				true);
+	else
+		/*
+		 * We can be here if first call to dma_iova_link() failed and
+		 * there is nothing to unlink, so let's be more clear.
+		 */
+		dma_iova_free(dev, state);
 }
 EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
-- 
2.34.1


