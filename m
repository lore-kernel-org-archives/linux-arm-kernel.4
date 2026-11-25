Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30196606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VbUfBjT2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AUAMMum8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HaDpLlZO77/PfdtGsOMSJUUh5Y4j+J367j2Kgogf+tM=; b=VbUfBjT2i9bGY1
	5YyOPmDDQb2jUUEUn1ePoTGNNCmyabiRBxb2xgbaj01Fj5nVKydvvmml/z7cnA7Km4LuLxJI+ukOH
	aeiovqdtN9VPht6sDD8EchKk/RfUQxoJO6buNnpk0KjEee2OxYopMJ8nHFTXjZz2ai9guir+h9haq
	3Gm1MMmQrhJZPs5iTfC+QpYCdpbksrYks4hvf11R0NExX1b8WEPtaY5GxFIPgBw2/CNLfB04yH1Ik
	UqtXYRqpskDTyYNlP+ezheagPz7Q7JniALNuM8qxL/QT/tRde73zqKpHqot4xgoZql5qe+pPrRDAB
	B4adtI8/fK5JL/vzccrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF73-0000000AOkb-3Sc7;
	Wed, 25 Nov 2026 15:40:50 +0000
Received: from out-72.mta0.migadu.com ([2001:41d0:1004:224b::48] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6C-0000000AOIr-32Pq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:40:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GlzUdZprJRkl9i8HWXT3FIkXmSaEpIUlQmDVtwXNSuM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621194; v=1; x=1796225994;
 b=AUAMMum8C5V/yzYIzbsSmtIcur4UF37a2pxl5ZAI1XD42u3BoF1NRUXz1MGszxEzV3emLB8D
 EZmliY6jPmUJ6iaXtAlr6XlH6uDFxB+s3rw1pPzQS1024DxwbA4fT54NysiqtzRCC3WN8UwwE/E
 58oCXFxred/kG27tpOTXM1mk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id deebcfd6609d8edf;
	Wed, 25 Nov 2026 15:39:54 +0000
X-Mizu-Trace-ID: deebcfd6609d8edf
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/20] KVM: arm64: Report an incomplete feature map with WARN_ON()
Date: Wed, 25 Nov 2026 15:39:00 +0000
Message-ID: <20261125153911.106793-10-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073957_901979_2BE3C1B8 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

At init, check_feature_map() reports with kvm_err() any feature map
that doesn't account for every bit of its register. The next patch
builds config.c into nVHE hyp, which has no printk(), so the check
would need an #ifdef to keep it out of hyp.

Use WARN_ON() instead, which doesn't need printk().

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/config.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index c65cf1dd27330..eef5ca50fc382 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1409,9 +1409,7 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 		if (!((map[i].flags & FORCE_RESx) && (map[i].bits & resx)))
 			mask |= map[i].bits;
 
-	if (mask != ~resx)
-		kvm_err("Undefined %s behaviour, bits %016llx\n",
-			str, mask ^ ~resx);
+	WARN_ON(mask != ~resx);
 }
 
 static u64 reg_feat_map_bits(const struct reg_bits_to_feat_map *map)
-- 
2.47.3


