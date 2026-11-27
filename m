Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40DPlxVe;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoEqQhQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsBQUtxgAOdXNM6+hYX+FjucLoCWCFZx1UKl5XWecsE=; b=40DPlxVerOAnyS
	ASr19BDw4/SApm8tQhs7mx4mRVwFkianxpDzvvN5klrRcZNwjuZnnw9U8WJkWa/OsUpChoqgf8GYc
	IuPBsYl83IZST8K/pr08asjXon+2M0eF6qVbLBLPnCVjappSi/ay+2+wrvmWsHWMLAMkGxDZa3Yxj
	Nq1PWrVLy3LNqHr1ba7OtOo8sjOTKBsbjZz9J4kN8h8aO8kII44l77zD+5paDOSNPl4E/VaySrOEW
	ec4ICxghLEjEWBPD/Fi2oGRI4a4Hzk6lsLqGh1cEfuNyiLJxSZJGxBE0vhsDeeukhDZ9A1OG5tudp
	CDLSAfqSPJFkNjToxyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWujL-0000000G0UV-0WBq;
	Fri, 27 Nov 2026 12:07:07 +0000
Received: from out-2.mta1.migadu.com ([95.215.58.2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiy-0000000G0Ej-1k9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ckIsWJI8b5glm/Oy2u52CdLm/UmNwIJw53MyJRcmQtk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781202; v=1; x=1796386002;
 b=GoEqQhQf2ghocMm33nHa2HR+K8WrQFUrS0ETIgq8sYZsHgx9fjA0WTSviOFRFLaqgOiE1Osp
 BzT94gHWUFcpUyM9OSgzWHVnWM8xwhQnU1oXjmw5yoefSZcWm5jcE+eTbHd+g3i28OL/HBMla9+
 c5DtdMihtkowT4XLFY59uVc0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a2e2d766782ee690;
	Fri, 27 Nov 2026 12:06:42 +0000
X-Mizu-Trace-ID: a2e2d766782ee690
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
Subject: [PATCH v3 5/5] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Fri, 27 Nov 2026 12:06:23 +0000
Message-ID: <20261127120623.891129-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040644_626233_9FCBC5C6 
X-CRM114-Status: GOOD (  10.83  )
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6eb2dbec5f0ed..cb352ce69147d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -279,7 +279,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3


