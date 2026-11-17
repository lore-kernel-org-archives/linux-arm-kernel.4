Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hp2HCkZj;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FBzZebEW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8KeZeMT8SHMlsK8Z+7IOrB32VJdaUSkm0FqyQNP5AM4=; b=Hp2HCkZjpTQOGCNt0d7NrKcNoD
	cHQ6Zdcdy8Bzu0ky8DU+RbyWVE9tvE4DEAgMZvgFz/e5Cb+9g8PZDApnuJQ5MIX3FNFPE9ZQtELit
	IlzNc41uXKgVIwPuG3nqzK78A+VmxAjdfaBRan8Fit4DZXTGzfB1ke0jfvN2u3lVXNfjq+JTPwwo8
	nUBKQnBcks/GjuDuMTWiXoy/4OKq8PVg1UAOq2G8c7KMyTN3MnU4rbHWlv7AkMbfynyfCKP5ZR1hM
	SyCiNVFZfeGJxTfCmwY2KVydiZZb2h7qidgX2yhMEL5r+M4t0if0J4Hhme9mASgKxgFVVOnoC/aRP
	XSUpAmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNF5-00000006eiq-1H6f;
	Tue, 17 Nov 2026 17:45:15 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEZ-00000006eB5-0Tz3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:44 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso16618f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937481; x=1795542281; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KeZeMT8SHMlsK8Z+7IOrB32VJdaUSkm0FqyQNP5AM4=;
        b=FBzZebEWzDR7QVe94ztPjxXzXvT/X2XwyUqhXOGPmAjyUq33BXr5fHGLqWpTrgB7CA
         LbrcZZTm7lXxxZQXHnC02vAMTmBaExnBMo9UM3jZrd95HSLPuiEQIvryIZYgD/k6LRjV
         ujdAmeQASwtUkIYrFO310quLRAZu+CquOaeG382+thJ3tR8kBOhXqwy/7Or9NaHgPJ16
         sDzA09zSDmstwrPlb6eS7CBzYsDhXojAGfX0mqrUmPcLKUXvEIE6v330kIVFC2GJSHvm
         Il/UQmtr/4VLLxRlrxB5FU+8dHA7plrFDjdz6jkyUUrgYAtGRTFx8Cb8GNprIH8u+04Q
         35rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937481; x=1795542281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KeZeMT8SHMlsK8Z+7IOrB32VJdaUSkm0FqyQNP5AM4=;
        b=ktlNLNRup29JucsihEXHEDzP35rd/mIFTCUD3lI64l2EruBj88MLnJRXVfuvihR2tR
         P+0GcU0yXexUIFRnPllhKxWyWtR49/Lec67FHlhqo8j2DTYcrJhskWa3IVXJ0ZT6bnD0
         7DJIfePKopFbPzhuwrAcmCKfCtB0gLQMat+Zj7Kn/t0QPmuBkC31Dk33YO0DQdCWFEL3
         k+0J7Xg21cot+CC4TpzjSmk9QHz1DAbPj/3kQqzK8DaFHbvL0SCd52jFvR5PHSyYzthA
         4RHFBARhu3qcaK7tEPMlNaXQVdYaGGXLXPDtlKaCJhN6sOnBwtLWnoWHhbUkEvR2ARNJ
         +dJA==
X-Forwarded-Encrypted: i=1; AL+hErHJERXVfwF+xGxDoIAfVB6kSSDgjorhECy1RC32sT3zd2gdOZHPxGyykpKcfjdlYGGwFLUbnEzDS0sgd3B//TnS@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZSZbmDAXw1gMf7a91mxWw/I7S8FyAdVERBekFF8G4tl/nAco5
	fIA0JSHIl7PHZAX35WCyiFtBvyTUv0hF+w9yStL7eYyK9GEKaN+16Rcue9TbSA8WF3BTF2fdqf6
	Dld23eUy8LBgUx1wMCIrWrQ==
X-Received: from wrws8.prod.google.com ([2002:a5d:69c8:0:b0:495:fb6d:33f2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr309539975e9.14.1794937480619;
 Tue, 17 Nov 2026 09:44:40 -0800 (PST)
Date: Tue, 17 Nov 2026 17:44:01 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-23-vdonnefort@google.com>
Subject: [PATCH v4 22/23] KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to
 host sharing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094443_197160_E4C1D610 
X-CRM114-Status: GOOD (  15.14  )
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

Pages shared by the guest with the host are annotated into the guest
stage-2. If the shared page is backed by a huge mapping, we need to
split it first.

Raise a PKVM_HYP_REQ_SPLIT for the host on the guest HVC MEM_SHARE, if a
block exists (-E2BIG) and replay the HVC (by rewinding the ELR).

As the guest HVC MEM_SHARE is single-page only, MEM_UNSHARE is ensured
to find a PTE-level mapping and does not need to request a split.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index d92f4da1c180..25d2f69db261 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1169,16 +1169,34 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
 	return ARM_EXCEPTION_TRAP;
 }
 
+static u64 pkvm_request_split(struct pkvm_hyp_vcpu *hyp_vcpu, u64 gfn, u64 nr_pages)
+{
+	struct pkvm_hyp_req *req = &hyp_vcpu->host_vcpu->arch.pkvm_hyp_req;
+	u64 elr;
+
+	req->type = PKVM_HYP_REQ_SPLIT;
+	req->split.gfn = gfn;
+	req->split.nr_pages = nr_pages;
+
+	/* Rewind the ELR so we return to the HVC once the block is split */
+	elr = read_sysreg(elr_el2);
+	elr -= 4;
+	write_sysreg(elr, elr_el2);
+
+	return ARM_EXCEPTION_PKVM_HYP_REQ;
+}
+
 static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	u64 ipa = smccc_get_arg1(vcpu);
+	u64 gfn = hyp_phys_to_pfn(ipa);
 
 	if (!PAGE_ALIGNED(ipa))
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, gfn, 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
@@ -1189,6 +1207,9 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		 */
 		*exit_code = __pkvm_memshare_page_req(vcpu, ipa);
 		goto out_host;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
 	}
 
 out_guest:
-- 
2.56.1.708.g77570a6a1d-goog


