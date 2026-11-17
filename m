Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B818F606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i9ibiL/x;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nDXiD09a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rm5FnpdbPcxusVeuCcX3zKz7f38fZpOGuIKrvxpxFrk=; b=i9ibiL/x8Q+tvWS2IWiZi6x8dg
	ApI7MKdCei1FQ0L4yEplbOt95CEMdufI7/GnIExlSPYGMu/Wuas5voawJzfiEBiQFATdWymCdSo/G
	7yZc5sL0BlC5s/4Dw/gQj2+DGNg90phoz2V0NFcvMcA3ivWGNiNFVNNfkniusUzkb1IpWtWobsGYF
	dYS3F5PEfOb9M7ta9YWmDh6/qMNGVYhQ8RXvMQO9dHAxOW4F7NlCWYxP8S9bOUeZJCmVYqJFB60Hg
	ryxBujg86ucKVXP8y7diZdtuTKG4Oi+tUdqZCe8zM4rWAQA7QnC2WDZ0WVCr8gooGELYg8xq9WZqz
	Ccs/3x5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEJ-00000006dr8-2jZx;
	Tue, 17 Nov 2026 17:44:27 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNED-00000006dmO-2U1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:22 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6b87d964b3fso104877a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937459; x=1795542259; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rm5FnpdbPcxusVeuCcX3zKz7f38fZpOGuIKrvxpxFrk=;
        b=nDXiD09a6J2xQpnfkLpdTb8lxMq/R/QYjU3BM07OZ1THaLyUxKwbWJ418KhWrGFCQA
         +tg7J2bqkIafhSIl0gS7pt21VXttw8t8pjYCVo1y73Ljz0NoNOhw6JjJXZ31hl8u9ZiI
         8QBmI6URGJkXNBAGOwAKSKYcMRxGRzv46rwCvyDP5owRk1S3m7fk6VAu4ZscbpkNRsWE
         xvQDK4c2LRD8K8BFA0FEQ2K5UtG+T1K7+vopK8V8B13/sACbmwmE4nsk1mNJY52nj4q5
         ZHGzZaQ/jxPEp5fjh69Gd1KnZgPFu4deqziTrnN5zde2D1Bmx/B1ulyzPGdJIg1kOR14
         awNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937459; x=1795542259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rm5FnpdbPcxusVeuCcX3zKz7f38fZpOGuIKrvxpxFrk=;
        b=xjWcbNvsbYqIVZq1CZYPWYMaQZ5n/aokWx68blwYvQPIJNC365m5Ijw+gx/8zK3Pn5
         MoEeo+7d5f55vWOjW7TSmcC2X52gy1RZpUVuS9rGLpflaYoU7Oduv8icizYMXCa7FkV7
         /Asm1mOPxqXQDTl3UvBhEo9Kp4ilSDLx4sLdX80qMFhT/cB8CnAyjj5EkKexK9B2qvOa
         yvC2PbCJQG0gan+75AIvxyCDY8ke6hiffUuYplpmoDVYl1erqdGB5+w760tY1PO1Bwvo
         Z7vfRFNRbKj9Gb+Eqzt301xolKgEPz9ex3EHSmKMyJXH/TRvevhm29Psc5XA2++k92M/
         RvYg==
X-Forwarded-Encrypted: i=1; AL+hErHgF4VKMQkA5RY2nrpuHc3SwEeFVdQXvea1xt8nevzO3zV+jAZnCUjUMihes8F+0kQ3aJBsmv9sV8nTYsLS++by@lists.infradead.org
X-Gm-Message-State: APuU4Z8RLo3fMAxwAPunbkQrIZxK5Dp3zKpko1podKZdA6FRb5qxHUyn
	iV0OXJo+Ty/PQMDL50IHfQ3czOcDDEPCcsHg96FEyoCbFJusmm22p0DiJKrxeGlrVMynNX1BQ9D
	Uq6EFZOMbbp+zAYcWxuqBTg==
X-Received: from edad29.prod.google.com ([2002:a05:6402:401d:b0:6b5:5e16:5062])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2113:b0:6b7:221c:beb with SMTP id 4fb4d7f45d1cf-6b8877e3a49mr59953a12.0.1794937458926;
 Tue, 17 Nov 2026 09:44:18 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:41 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-3-vdonnefort@google.com>
Subject: [PATCH v4 02/23] KVM: arm64: Propagate host stage-2 annotated entries
 on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094421_646032_0E45D65C 
X-CRM114-Status: GOOD (  12.81  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Propagate ownership refcounts for invalid stage-2 entries mapped on
block split. This intends to allow splitting host stage-2 blocks while
keeping existing page ownership and metadata annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index dfbcdd3d91a4..bf5c8e75dd52 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1035,14 +1035,15 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
 {
 	kvm_pte_t block_pte = ctx->old;
-	bool counted;
+	bool counted, valid;
 	u64 pa;
 	int i;
 
-	if (!kvm_pte_valid(block_pte))
-		return;
-
 	counted = stage2_pte_is_counted(block_pte);
+	valid = kvm_pte_valid(block_pte);
+
+	if (!valid && !counted)
+		return;
 
 	/*
 	 * Shared walks not supported: cannot rollback refcounts on break
@@ -1053,7 +1054,9 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
 
 	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
 	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
-		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+		kvm_pte_t pte = valid ?
+			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
+			block_pte;
 
 		/*
 		 * Skip ptes in the range being modified by the caller if we're
-- 
2.56.1.708.g77570a6a1d-goog


