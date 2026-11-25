Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IwoYEQFM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vLnlv7Ue
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gUaTgT/L9Tda32pEeg/7pqqNZ4XePlobXYyOs+22GMI=; b=IwoYEQFMrOFGzYhEvVjWgyf9+c
	XuXbt2IDKEpX9lR1WCeY7WfCsHGOaYj0HD3jVpzrugVd6d1jXQCyZne4otzHcwvBPMpEgklS42Wek
	txDfpd7/fk3bcgi0Ncg5LmlmxMTsbkULjjDl/IvipcuGKkrmW3Xhzw3bWaiy1HmLf/liamUfH32vy
	G1+y4hHYWH+hcPH1jDZFqotsQ+Tm2o/6hSi+uoztlZhj6+rUgdn8CoV5aw9b4TBIQ8PFbsOFQxJZL
	t/B5gqSafTop39wLZsGTtgSOn68KtycV94+VIin9KIDlNc0V5aPDNvBOdyiIOX4ya9TfD+UawrvOg
	4Kw9k3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHsl-0000000B21Q-1PJg;
	Wed, 25 Nov 2026 18:38:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHsh-0000000B20t-3XxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:38:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4F01596;
	Wed, 25 Nov 2026 10:38:07 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45F0D3FA7A;
	Wed, 25 Nov 2026 10:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795631890; bh=YYDTacQ0zMFUQIMmFtG6l7igW2JccWe5GTb2phppzpo=;
	h=From:To:Cc:Subject:Date:From;
	b=vLnlv7Ue2D1XrX3oZdqk0CIChFL03GOmNtvbxrZut4z7xtWvsymSu79JmTlN3tWm+
	 443ROftGPB9/Dz64pMWtnI1clflZDbxs3FZQO916W3yxkuw4Adq/MCR99fXoBVahvc
	 CtPDD295ihccZnTbBfoSxVc1DIR8Zu4EE1UFGroA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	pasha.tatashin@soleen.com,
	ryan.roberts@arm.com,
	rmclure@linux.ibm.com,
	baolin.wang@linux.alibaba.com,
	kevin.brodsky@arm.com,
	kas@kernel.org,
	anshuman.khandual@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] arm64: mm: clarify necessity of isb() in emit_pte_barriers()'s comments
Date: Wed, 25 Nov 2026 18:38:05 +0000
Message-ID: <20261125183805.1188848-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_103811_929838_5C252930 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -4.4 (----)
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

The dsb() in emit_pte_barriers() makes the pte store visible to the
table walker. However, without FEAT_ETS2, address translation for a
subsequent data access may occur speculatively before the dsb() completes,
potentially observing the old invalid PTE according to
Arm ARM DDI0487 M.d:

  B2.6.9 Data Synchronization Barrier
  ...
  In addition, no instruction that appears in program order after the DSB
  instruction can alter any state of the system or perform any part of
  its functionality until the DSB completes other than:
  ...
    - If FEAT_ETS2 is not implemented, translating any virtual addresses of
      instructions that generate Explicit Memory Effects.
  ...

Document this behavior and reference Arm ARM DDI0487 M.d, B2.6.9 to
clarify why the dsb() alone is insufficient to prevent a spurious fault.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485ad..6101357539f31 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -45,7 +45,10 @@ static inline void emit_pte_barriers(void)
 	/*
 	 * These barriers are emitted under certain conditions after a pte entry
 	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
-	 * visible to the table walker. The isb ensures that any previous
+	 * visible to the table walker.
+	 * However, without FEAT_ETS2, address translation for a subsequent
+	 * data access may occur speculatively before the dsb completes
+	 * (see Arm ARM DDI0487 M.d, B2.6.9). The isb ensures that any previous
 	 * speculative "invalid translation" marker that is in the CPU's
 	 * pipeline gets cleared, so that any access to that address after
 	 * setting the pte to valid won't cause a spurious fault. If the thread
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


