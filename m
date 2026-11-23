Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n5XZWKtR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izcB8oEs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hd4SLQ7MWR/iBTNIr8B5VgmRb7vBJXLkdh3krL32bK0=; b=n5XZWKtRSycnWVWA/AkKmFfApN
	yenS+N9X2sKkhaAd4VlekdabiXW84sRmIMnDvkXDezsaaZQ4SqNUCBoUkt/RZxBR+K2LPnlqoszIn
	6OBKEy7UsYrWNcshtn3e7cap9hChfrHDdDzjHB8sLQ6Z/SLfVDgOfEPrpufgKYznYQcHBo3tPYCkd
	RrjU5WSo4DuOdpEGr+uwggvECpLbf3nZweafO4mcJPbB/a3dzJX4KXCUvF2g/7noAcv5HSqNPblHI
	2nTMxJ2Dvw98f/MQ1uj1QyDJKqmftmV5hQjYukX5aQdryRSPKaxcdlsk2x3HYZoPZFm8KSIp6tZtf
	GYGE6cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYhl-00000004TST-18lF;
	Mon, 23 Nov 2026 18:23:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYhk-00000004TSE-0x1u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:23:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71426621A9;
	Mon, 23 Nov 2026 18:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24F41F000CA;
	Mon, 23 Nov 2026 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458230;
	bh=Hd4SLQ7MWR/iBTNIr8B5VgmRb7vBJXLkdh3krL32bK0=;
	h=From:To:Cc:Subject:Date;
	b=izcB8oEs7g9UOk5t4x0Y8eK6QIcWcO1RzvlZ7/2/8UL9x8EEWa4RLh/TDYixSBGAC
	 NtS534Y6AsvIJrbeM8lf/Cj2LCoLMK2iRzag2rVNXlJd6BPwePcRBFeHto0yX5Z5lK
	 NN8B56PPGGY26DTZOL8s6rcaq8X/ksZV92zPnF6oTyw1S+PNehnu1kSBHPqjEhWwEH
	 gR13YARvaVNmh4l711gGdJmJE206fGFQqFYWBQSedd1hodYfOp7Iu/1w5LJ8dHhJnA
	 hXRC8NatvT38II7kfwfb6ivYZwHBsPkKE1+YH7p10gUZlKnLjXH7Batq7oNzoknMS1
	 /RXr3rBbkhrCg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xVYhg-000000028SU-2ZLX;
	Mon, 23 Nov 2026 18:23:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Dan Carpenter <dan@pereq.eu>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: nv: Upgrade sub-page TTL hint to maximum size
Date: Mon, 23 Nov 2026 18:23:12 +0000
Message-ID: <20261123182312.4842-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, dan@pereq.eu, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Should a guest be slightly foolish and submit a S2 TLBI with a TTL hint
that describe a base granule size smaller than the host's page size,
we take the resulting size at face value and feed it to the S2 unmapping
code. Which legitimately screams about something not being page-aligned.

The architecture allows us to drop the TLBI on the floor, as we don't
support a S2 granule size smaller than the host's page size. But it turns
out that doing so is proving pretty hard (we call compute_tlb_inval_range
from a number of places, none of which is amenable to an early out).

Instead, detect the annoying case, and pretend that we don't have a TTL
hint at all, leaving the size upgrade mechanism to take place and use
the largest possible size for the guest's S2 granule size.

This will still allow nonsensical stuff to get through, such as a 4kB
level 2 (aka 2MB) from a guest with a 64kB S2 base granule size running
on a 16kB page size host, but that's not worse than doing nothing, and
the host code won't get shouty.

Reported-by: Dan Carpenter <dan@pereq.eu>
Link: https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---

Notes:
    Reposting this as a first class patch, as I'd like to plug that one
    as early as possible (and Dan has plenty of other patches in flight...)

 arch/arm64/kvm/nested.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d6..36e4e83badf0a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -714,6 +714,13 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 	 */
 	max_size = __ttl_to_size(ttl);
 
+	/*
+	 * IMPDEF behaviour: treat subpage TTL-annotated TLBI as the largest
+	 * possible invalidation. Don't try this at home, kids!
+	 */
+	if (max_size < PAGE_SIZE)
+		max_size = 0;
+
 	if (!max_size) {
 		/* Compute the maximum extent of the invalidation */
 		switch (vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr)) {
-- 
2.47.3


