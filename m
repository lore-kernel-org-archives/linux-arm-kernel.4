Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U++r6LyQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yetf21mU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T2bCjECa1u4pdZVtPe555q3XaHwui0u6s9nFTO9GxZ4=; b=U++r6LyQn/10se
	RcQYfDn4KmgLmUqaCdl/R7K/ORBSH9OsXZqv3AtDiWWHuNNVOXXv73GrAuVFXN+68lRyIe28lvA+9
	Vh1BWZEtFKJz4edt9/mWNeU9LdCld6G+il+LpBJJL6tmH0lUMEQ/RTmvVqJHQ3sRMNbeEvTOffm2H
	wgKN791/ni39Y2vETm/7Y3dnfg5M0hp+0JdfifVfBwqO413F3S9/KTNyJcSrEYkRiNjLUus7eb5Sw
	NCBWLqBm/uYiRXc4hwOEvicejTKe8MS8C8yomDWdEzKrd18KyJQHZXdrrZF97xY7w78T0eQuaq1AC
	2hZ3ORtfo80S3vrhC8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiv-0000000G0Dv-3sqY;
	Fri, 27 Nov 2026 12:06:41 +0000
Received: from out-36.mta0.migadu.com ([2001:41d0:1004:224b::24] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuij-0000000G08F-0Wc4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QcWWByewpEJMJeeUiQ7pExsRgynUVMZElP1xyHkt8XM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781185; v=1; x=1796385985;
 b=Yetf21mUrQs7UuH4zOJ+YR63/d71jitj6JqXWQJdD5kYK/aFQ1f0sKOgAjrW2zwdo0G7IgEX
 Vg0Qyr9ZUk3CnwWFeDlxm3Ars9IMkP86X4yt2QJXfd7kAngWlYc+kFCvkjfQRXsUUgDFmg8hMfD
 kiZ7bcwSeyU7pfj9RTLj1nkQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 26ae72810054a870;
	Fri, 27 Nov 2026 12:06:25 +0000
X-Mizu-Trace-ID: 26ae72810054a870
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] irqchip/gic-v4.1: Clean the vPE table to PoC
Date: Fri, 27 Nov 2026 12:06:20 +0000
Message-ID: <20261127120623.891129-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040629_309418_10D30A75 
X-CRM114-Status: GOOD (  11.09  )
X-Spam-Score: -2.1 (--)
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

On a GICv4.1 system, allocate_vpe_l1_table() sets Z and Valid in
GICR_VPROPBASER and points it at a freshly zeroed vPE table, but leaves
the zeroes in the CPU's cache. A redistributor that accesses the table
as non-shareable reads it from memory, where it might not be zero, and
the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z, IHI 0069H.b
12.11.39).

Clean the table to PoC unconditionally, as the driver does for the
pending table. Testing rdists_support_shareable() isn't enough, since
GICR_VPROPBASER can read back as non-shareable even when the helper
returns true. allocate_vpe_l2_table() already cleans the level-2 pages
in that case. A vPE table inherited from an ITS is cleaned by
its_setup_baser() when the ITS is non-shareable.

Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 9900c6a53526e..6932dd0a02c42 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3007,6 +3007,9 @@ static int allocate_vpe_l1_table(void)
 	pa = virt_to_phys(page_address(page));
 	WARN_ON(!IS_ALIGNED(pa, psz));
 
+	/* Make sure the GIC will observe the zeroed table */
+	gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
+
 	val |= FIELD_PREP(GICR_VPROPBASER_4_1_ADDR, pa >> 12);
 	if (rdists_support_shareable()) {
 		val |= GICR_VPROPBASER_RaWb;
-- 
2.47.3


