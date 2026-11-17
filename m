Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02765606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vtIqAE6h;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gWhfIHkV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cj4h9vHOPKG8KzftPAKBz87rLwe/ZFLBFwOVzEp8Bp0=; b=vtIqAE6h0jpQcPN2cBORX/fnjz
	NH5vn6UVHarfYehorIrPxhrphyAYxyHVmtTQSWfZa9P9TxtfohfI21o7rmeRLsX1azyZL94XCnzxz
	b/24XDzG+/8Rqq3Q0MVa9rBiZXPGbIztEqVtgFCtcDfbSIsAFiRitLy8LEkN5c5DCGAWOJ2SQ4Crq
	N9IsqTJQ8NqvyLfvbquJKP8yYnDYPUYDKr4cv4KiqiYJZXupYkHcdOXBx53TjXpbDCBFQQGHdkJuh
	g8JJgQV2lKaRoeJdF1kTp16xDw5wdOdjjBknNvfw7legmf3QhhoVNKR/QALOAXaqNF0I1sLofBX3M
	hIJf5K9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEJ-00000006drS-3JH1;
	Tue, 17 Nov 2026 17:44:27 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEE-00000006dmo-14xZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:23 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso505405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937460; x=1795542260; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj4h9vHOPKG8KzftPAKBz87rLwe/ZFLBFwOVzEp8Bp0=;
        b=gWhfIHkVDiJH8C9a5EzIsEkeRniWMiT7jwEXpTIwFb2kvm4Pd5TBbXbx3Bpe/AVLPF
         SZ4zQO0Q/kcYoFkqCnYd/oi5FX9v2J3SBALUoEhYO+17E73xqk4FmCNcvw/ab6V4nCuE
         1eOyOypZb+blEaN9YtlKuyQy5CGdoGpL5210CVyd0BBG3lK+hJXgKiZoFZYYv1InyLBE
         3WeiUzjKvFlphZ2rILumZ62zOlNNmmDZNipRfWiJM1Sn6tvDKTO2OQbvhkTYvrmpH9HY
         XW8Uy+/gbNHP/88WJNXOfRAvOb43/FAowoofjucQSABdoS6ugbugxu1o5WXuFIw+ZD7j
         822w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937460; x=1795542260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cj4h9vHOPKG8KzftPAKBz87rLwe/ZFLBFwOVzEp8Bp0=;
        b=Ptkmk0Bi5fzN3YqhkdodWbnE2LMeeuWOSd/rWBwJTsI5J1obUhBf6XU0AA+E4zwkvb
         h5fOntqHdU5SLOo88ySg1jiCXrro0LIQucATQAfLm+3yNHFkGWLiKbisdLU6WxKEHxKR
         HmIgd1wEIvQKztRULjp7ettfP/2Ld1Ia8hpa4VyKPAjdwC0qwMt/AYoDf/eff999hZJQ
         c/EuU+mOTCLcTSU2VYy4YGWNbaWT/d2sQ++/JcN2BW/RB1iHAenn9pRITm5vg+pYRXUB
         c8NkiZjMrjbFd9OaMz2+kZXX/ZuG8ERyRAKia5AeoJeXIW4nBuvVAS+e3+qi0pVMu5jT
         WG3g==
X-Forwarded-Encrypted: i=1; AL+hErGewuoIKMjzt3MoEVDsiH69Pi/SI3OOHW5D0uKjr4zESGDMBsYPwJueoZLCkRg4eF30FGMef3f9Lvzq4+B3GXtP@lists.infradead.org
X-Gm-Message-State: APuU4Z8Nja/duktdRdWrEvr6tS7oQ1SyMSxIjdvGf94yHMfwUs1iisDg
	+Pt367SOEXHd2BdlKb1SJXvN3FKqd2Pc96UOpWUwD+oADqYVcbJSSrO5Kj7xZaHHYX9xZjfj5z9
	Co2Cq3ztn/bRgVOUnk/R7/A==
X-Received: from wmqu18.prod.google.com ([2002:a05:600c:19d2:b0:4a1:d8be:ba51])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr211547735e9.2.1794937460026;
 Tue, 17 Nov 2026 09:44:20 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:42 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-4-vdonnefort@google.com>
Subject: [PATCH v4 03/23] KVM: arm64: Allow block-level stage-2 annotation
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094422_302353_F51EA724 
X-CRM114-Status: GOOD (  10.69  )
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

On host to guest donation, pKVM annotates the host stage-2 invalid
entries with the GFN. Now that the host stage-2 preserves annotations on
block split, we can allow these annotations at block-level. This enables
safe support for guest stage-2 huge mappings.

Allowing block-level annotations also reduces stage-2 fragmentation when
unmapping a huge region, and reduces host stage-2 memory usage by
avoiding the allocation of intermediate page tables.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index bf5c8e75dd52..abd32e94f6ff 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -949,9 +949,6 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
-	if (data->annotation)
-		return true;
-
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -1180,8 +1177,9 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	struct stage2_map_data map_data = {
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
-		.force_pte	= true,
 		.annotation	= true,
+		/* Pretend ID-mapped for kvm_block_mapping_supported() */
+		.phys		= ALIGN_DOWN(addr, PAGE_SIZE),
 		.pte_annot	= pte_annot |
 				  FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, type),
 	};
-- 
2.56.1.708.g77570a6a1d-goog


