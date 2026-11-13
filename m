Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4L1GjViu;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ERhw5e7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mDCrY3T+VfZdtZlaxXLBeMjsbFqx3DNTndl6jA165tY=; b=4L1GjViuD+UYQ1X3UFBx0R4ISE
	zOUV4aXQS0Ktatjg0ST9Hda+ORRAUeqXLTB7hSK62smjYBJYmwrjzB1CCypyPjRNRWapMjPcbUd8j
	mPzvp7l6iLr5bxJj8aDAn6ms+8L79cUIijCyzqQ2v183exzS7KwGkMgb/pDx2P35pxNN4wR5bGQYe
	UaqjLslMwdRTNTzJmM37TBU3kx3xs3gUFBrFJHdq9shRXJp/7l1U8TqQ+g+/2DixglIt963smIH90
	u+AN4xJYyfHbVWoMIZq/43Mb8nMXciUVxpOD7bsAz/Xv906/eQmgSSIc/1AVU1Kcw6PJrOSVRR8h6
	qLsdwuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRo1u-0000000CHDZ-11E3;
	Fri, 13 Nov 2026 09:57:10 +0000
Received: from out-163.mta1.migadu.com ([2001:41d0:203:375::a3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRo1s-0000000CHCL-0SM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:57:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lOsW+kFmaNLmxVVYY/0ykrsQLE9+KLi12EdY2vBuJyg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794563824; v=1; x=1795168624;
 b=ERhw5e7XrXdCNhbB0G9amRhzx9HP44fEGZN0/+aNbQxXV3shm5fOYU7bMAhWeniBqoEoI+cn
 P0+EjyXPl1sdFM0vsOw4W/otv2kvhNK/PNt6gMw8wjp26TEF32F7wqdiF4Q5c+RD4e03EYYSfpj
 VfjPq3tKjtAXjTrmqSEs9muI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9aff9a9311754da3;
	Fri, 13 Nov 2026 09:57:04 +0000
X-Mizu-Trace-ID: 9aff9a9311754da3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] arm64: cpufeature: Check the override in __read_sysreg_by_encoding()
Date: Fri, 13 Nov 2026 09:57:01 +0000
Message-ID: <20261113095701.2042858-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_015708_354258_5922EFCE 
X-CRM114-Status: UNSURE (   8.53  )
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

__read_sysreg_by_encoding() backs the capability checks a secondary
runs before its cpuinfo is stored, and folds an ID register override
into the value it reads without checking it against that CPU. A
secondary whose field is below an override the boot CPU accepted
passes verification and comes online without the feature.

Apply the override through arm64_ftr_reg_override(), as the cpuinfo
store does, so that it only applies where it is safe against that CPU's
value.

Fixes: b3341ae0efa2 ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/abwXl35xQ2ze1XwJ@arm.com/
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Based on v7.4-rc1 (6628e7d4c6b2), where arm64_ftr_reg_override() was
    added.

 arch/arm64/kernel/cpufeature.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b4..3980acdd6e1b7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1415,7 +1415,6 @@ EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
  */
 u64 __read_sysreg_by_encoding(u32 sys_id)
 {
-	struct arm64_ftr_reg *regp;
 	u64 val;
 
 	switch (sys_id) {
@@ -1468,13 +1467,7 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
 		return 0;
 	}
 
-	regp  = get_arm64_ftr_reg(sys_id);
-	if (regp) {
-		val &= ~regp->override->mask;
-		val |= (regp->override->val & regp->override->mask);
-	}
-
-	return val;
+	return arm64_ftr_reg_override(sys_id, val);
 }
 
 #include <linux/irqchip/arm-gic-v3.h>

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


