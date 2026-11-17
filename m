Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E64606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AYcX4hZu;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DKIAMN5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IzLYVFDyopJUGl8kdEACRtkithMX+J6kXd06oGG1awU=; b=AYcX4hZurrj6wQ6XwrSC0KrGK2
	o6DIbahrU8L1ZrV7eBWXpjRvmw50gbIuWOEdrrLHsI1hvTsm1Ig+abpc11uPIh4DYtC9DAQzPJQs7
	tz+AYMmRkWacH/m/DNsZlxJrgK4wmphEF7pBBMwmoYnHsfDQTBCDH7cpmY9wz7QUkewZlsADLavDw
	LTzOd0+oEDNiWqPLtsfSEXc+1Edwgb+qayadyl3wIGFXozhTGGTA5+meuRexY6zdV8o0W7PZotUOs
	ePYSTSgDoEKq3Ge9LAxip/myl7wNsDjQAlcPVOW2dWra/hfXr+EpPK6J/TweD3fn9NMuUiwOzckVU
	KUlTV3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEJ-00000006dqW-2F9v;
	Tue, 17 Nov 2026 17:44:27 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEC-00000006dm5-1acE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:21 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4915ba023d4so21229f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937458; x=1795542258; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzLYVFDyopJUGl8kdEACRtkithMX+J6kXd06oGG1awU=;
        b=DKIAMN5X/ZsCN+nYttN7CVTd3jKedavaFnF36m11L1bZbbeQA/dGD3SX51F5ob9sLY
         AzfE6ybpBsJHwhUngb57vCYAa+sv2IgOELBDTIK87AbxNNuUqS91qwhh0i2kN4z73tQg
         H/2CdbbVKYJOdPobUb5u2U51ztJf7P7XhAuTvyzYtenE1/5/9iVexNDeu47hGGTuwNGW
         AAraxaY60ZRUPfcU6do+Ct6vbylPwu9xel4JHCCmA4EIYi5r7MqXYaATWAVz/qMLL3B5
         qVdF0SoDGwHlEH9GKt4Oj65L+W4GZP1VfSnpR49Sr8oS6RjwZ+2vO78FcOynhb8TNldh
         q2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937458; x=1795542258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzLYVFDyopJUGl8kdEACRtkithMX+J6kXd06oGG1awU=;
        b=vq6YPuI7KZaC5A1yltRhkTHC/tRGOmYD5Hyf/SmFpBZKFlBIKa6Myvm1+PYenQMCjm
         OUMY5STBXwlvU3Bw2cdz+jhdvribpqLTs0nwcZtePxcQ8JozxkOOd2L+eZ2J6YSbSSHc
         /2QFkDynR7CDfWdCuhLfmM99aELeVFZ/ngD0bQQOmtIVg7cDcXBB+VQVKMzWzn5Ai8pn
         NUkU7Kyf+u/bdlrqIll5O6BUcvX8VaSiIDo9pu74l3X8owA7wL8gkjKYXTMzsV24weQ+
         zqIbMPISPKwoPBWsoHw5qdxbnpXxtUfPXfwODp2uMUtZdWF6o2HYl1mnaeXACLcTZx6P
         OIGw==
X-Forwarded-Encrypted: i=1; AL+hErF0aY4GEJe60fUUzUn8hywviTSemH7JXHBdE2RVQ0W6YDlJADEVOtq9y6vfOzIpmuIrKcVkhG/gK4eOEgZxdVMb@lists.infradead.org
X-Gm-Message-State: APuU4Z+IVmIT2NVXYP28ETUUkA7dMujKLVM4WOnedw6ROEtXybLApt/S
	zKvggHueXY2qevcMWys7EsNE7lYsNhDpIODVD2FGjEMeuRcdiycu3EGQMbSLMQCLf3yghFtwkmo
	5KfQVBW+ivRNlGaunkaiYeQ==
X-Received: from wruk18.prod.google.com ([2002:a5d:6292:0:b0:48d:f8b9:6520])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1619:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-4a63eac5b33mr251344f8f.44.1794937457640;
 Tue, 17 Nov 2026 09:44:17 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:40 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-2-vdonnefort@google.com>
Subject: [PATCH v4 01/23] KVM: arm64: Prefault host stage-2 entries on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Keir Fraser <keirf@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094420_435398_8B59AE56 
X-CRM114-Status: GOOD (  16.39  )
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

From: Keir Fraser <keirf@google.com>

For the host stage-2 that is idmap, we can avoid lazy-mapping on block
splitting by propagating existing valid mappings to neighbouring entries
of the new table.

Signed-off-by: Keir Fraser <keirf@google.com>
Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b184d..dfbcdd3d91a4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1032,10 +1032,52 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
+{
+	kvm_pte_t block_pte = ctx->old;
+	bool counted;
+	u64 pa;
+	int i;
+
+	if (!kvm_pte_valid(block_pte))
+		return;
+
+	counted = stage2_pte_is_counted(block_pte);
+
+	/*
+	 * Shared walks not supported: cannot rollback refcounts on break
+	 * failure.
+	 */
+	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))
+		return;
+
+	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
+	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
+		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+
+		/*
+		 * Skip ptes in the range being modified by the caller if we're
+		 * installing last level entries. Otherwise, we need to
+		 * temporarily put in a valid mapping to make sure the
+		 * prefaulting logic is triggered on the next
+		 * stage2_map_walk_leaf(). This adds an unnecessary TLBI as
+		 * we'll presumably re-break the freshly installed block, but
+		 * that should happen very infrequently.
+		 */
+		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
+		    (pa < ctx->addr) || (pa >= ctx->end)) {
+			*ptep = pte;
+			if (counted)
+				ctx->mm_ops->get_page(ptep);
+		}
+	}
+}
+
 static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 				struct stage2_map_data *data)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
+	struct kvm_pgtable *pgt = data->mmu->pgt;
 	kvm_pte_t *childp, new;
 	int ret;
 
@@ -1053,6 +1095,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!childp)
 		return -ENOMEM;
 
+	if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
+		stage2_map_prefault_idmap(ctx, childp);
+
 	if (!stage2_try_break_pte(ctx, data->mmu)) {
 		mm_ops->put_page(childp);
 		return -EAGAIN;
-- 
2.56.1.708.g77570a6a1d-goog


