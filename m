Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB8E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpE94u1S;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r+60sCpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KjKvUvAawCFU3bWit+XhkHzMO764c02htnZw5tUtqR4=; b=GpE94u1SnQTs1/
	a2bXvrH3bwWXtdgeR0FJJxWxOyCzJ7MXSurn3yAZ+gMeaNnQPAeq8Ek9ut9MLiRxjNrYKP+DagRgE
	bIUwCiJwGOm74AlTC8EFEiDqrTiWnZ57JopH2PsB0sodlIE0seCf4vlWZsb7QRVmu+uKrhP9dfLb6
	eDa/nC0gNdhlda5MFarc6BbjlWW8PMU7gBZBm2/zHuBFvqgphZEQxkAoSwQl6lLJ7olWPmSPm4FIp
	RCa9LYArljDVSobIzUH/TZhbSSS031KVU0vlhcD7MfUHdhM5/pKdjLXA6zPFi4CaL9d/twueCbBqW
	kX9Rf9ugSzqAVD+qyk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Oz-00000003l8a-0jzm;
	Mon, 16 Nov 2026 19:30:05 +0000
Received: from out-56.mta0.migadu.com ([2001:41d0:1004:224b::38] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Of-00000003kzA-3A4Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:29:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j2loqvL1J6sU3mGKb+Ta5KdRoj93Xc6W2nwaFZdNjTk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857383; v=1; x=1795462183;
 b=r+60sCpwzus8z6EhMTEqtmvtKUYks/gaKHrkbT5gYYM0V8zdisIxM4QB31RCfUISFASsnh9z
 rVXNgNk102dJg2a8/UKwqNHyE9fb8v+pLuW3Zex2ZpYSFqNTgPO3L+66n0Rz676h+gMqFuzVqWV
 NCj8bwMurf2OBh9ZJi/4nw4s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a0ec9ac2fa47d2e1;
	Mon, 16 Nov 2026 19:29:43 +0000
X-Mizu-Trace-ID: a0ec9ac2fa47d2e1
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
Subject: [PATCH v2 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Mon, 16 Nov 2026 19:29:32 +0000
Message-ID: <20261116192933.3266502-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116192933.3266502-1-fuad.tabba@linux.dev>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_112945_948327_354B1771 
X-CRM114-Status: GOOD (  11.81  )
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. The pages added to the pool are zeroed, but an ITT freed back
to it goes to the next device as the previous one left it. MAPD is then
UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
zeros" (IHI 0069H.b, 5.3.10).

Zero every ITT that comes from the pool.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5756ffe4ec13e..33aa8a355ec65 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -270,8 +270,10 @@ static void *itt_alloc_pool(int node, int size)
 
 	do {
 		addr = gen_pool_alloc(itt_pool, size);
-		if (addr)
+		if (addr) {
+			memset((void *)addr, 0, size);
 			break;
+		}
 
 		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
 		if (!page)
-- 
2.47.3


