Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D507606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBNZL4Ef;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BPvyWHEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q6t84Pka6sjdVDTSiJiZNZc5e4fjMt3grSTxqNeIf7Y=; b=PBNZL4EfbFNjH0ShgGwJlQlvtR
	Thp91in1EKyANwLMWD7jIWjTNW35DePmiNQYbJdKBuAWXKZ2CGbpX80O2ftjBuYrl4trdvXkXu5ld
	lTC/LOFifriFAluKOVlYbupnC/PSO9b9hO9zvtA93Ro1zys+dAwaeNaR1y8m6C3JKIxtTFfwlHoXD
	BRTrWlUmGXIvoJjsabKRSE2sO2bUk+vFoc6DSbgQsC6dzVimtDtYdeziVUmIGqnoz3at1IL+mjZ0C
	aTlZpK9nN936JsGSn1LT+s9o34vUm07vIJkwWoE8IrMSHhHsAS9TfAG257tXkHVhWX2tlkz2qqWxX
	PNc6F8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEz-00000006eXX-1MO7;
	Tue, 17 Nov 2026 17:45:09 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNER-00000006e1i-2TJ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:37 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so831305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937473; x=1795542273; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6t84Pka6sjdVDTSiJiZNZc5e4fjMt3grSTxqNeIf7Y=;
        b=BPvyWHElWQUcFOpE+HsbKACe1R01//MUSo1WgGjBORMF2qnqQ366vxkrqyl6O/6UnR
         bR9x6yQ753L9OKx0LPca0edsh6ef0BhtLOPFivIs4rebxdY8BLTMvgmGLBsODi13jO9f
         h9h9uuD3QR17sF8WpxWXeXtF7hiOgcGRRUHqaB82MRX0Krcadizihm25gjhCYEjTgyn8
         BJtkMnJk22u5y8IHR/mZJcY0eknptDhgdUsRI03QM6476VfhT/xIsOjECHnAgFMK++tn
         BSjycFy4CchE30PiL3MM/FRZaIlpFS2V6emtFTaKIEd22q6jlOgNq3fWGLGCFlNNkxHq
         LZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937473; x=1795542273;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6t84Pka6sjdVDTSiJiZNZc5e4fjMt3grSTxqNeIf7Y=;
        b=d02n9BifTk2oaUfNycxnsh0w2YZInhQji+nq9bgxNw1yQRtZMFNKL7fNU85pZl/iRy
         UmNXg7T7yp2SdvzRQEZcF9/+ODhpzMORrAzWI6xJ2F2fSCOgJeOyzVInn8qiUOIjcexs
         URNjCZfXEaz8RgqGGrevhaPhGbwRCnv8ebzOX7qfwjRQ9aVjIE5DDHbADA0I0M5xV2tr
         eVKKtvEDqBG8vonS7wkIBtzCCLFjjAtYjaWKiita7pLV09RZCTFTSVW3CvwCM8tIuHY9
         9fh8ZrGvieephOSavZiNOLCiJ7IBYypp/Z1DG5CpoyLhWHK8MujT7+9OPmwjMkz1+uhj
         czog==
X-Forwarded-Encrypted: i=1; AL+hErFRypXjcMw0Cd7Cz2n47+P8ZBLyDioJLPmvKauvdEE04j35oMONiMijNQsyulvXfkxlwnjUoS2WgEpVnjIDujvp@lists.infradead.org
X-Gm-Message-State: APuU4Z8mmvT+pDXHdQVNo0o3YqCgNu5RM1i+1aVq3fph9CAdgph5PGZK
	fUULErsnL2q9NUu2j8Lh0FC1VtSs0pnytuwbkhIg4bFNbz/8TxkWaT6641rvLhhhBqHiIQyOI96
	CRVAVeVY0cJtp3EsFKG7wrQ==
X-Received: from wmbid15.prod.google.com ([2002:a05:600c:a18f:b0:4a2:966:8982])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr317113965e9.28.1794937473114;
 Tue, 17 Nov 2026 09:44:33 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:54 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-16-vdonnefort@google.com>
Subject: [PATCH v4 15/23] KVM: arm64: Add a range to pKVM ownership selftest
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094435_880354_DC82EC60 
X-CRM114-Status: GOOD (  13.53  )
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

Extend pkvm_ownership_selftest() with a nr_pages argument so that state
transitions can be tested with both page-granular (1) and block-granular
(PMD_SIZE / PAGE_SIZE) ranges.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hcall.h            |   2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   9 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 214 ++++++++++--------
 arch/arm64/kvm/pkvm.c                         |  37 +--
 5 files changed, 148 insertions(+), 118 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 201d58907109..e54a4631a378 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -157,7 +157,7 @@ DECLARE_KVM_HOST_HCALL0(void, __vgic_v3_init_lrs)
 DECLARE_KVM_HOST_HCALL0(u64, __vgic_v3_get_gic_config)
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_hyp_alloc_selftest)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_ownership_selftest,
-	u64, pfn, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
+	u64, pfn, u64, nr_pages, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
 
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 3fb55899be6b..a991be3d4c9a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -76,9 +76,14 @@ static __always_inline void __load_host_stage2(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
-int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages);
+int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			      unsigned long pgtable_nr_pages);
 #else
 static inline int
-__pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages) { return 0; }
+__pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			  unsigned long pgtable_nr_pages)
+{
+	return 0;
+}
 #endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2621a4ef7e1e..c322ef4432c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1314,9 +1314,9 @@ DEFINE_KVM_HOST_HCALL(ulong, __pkvm_create_private_mapping,
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_ownership_selftest,
-	u64, pfn, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
+	u64, pfn, u64, nr_pages, u64, pgtable_pfn, unsigned long, pgtable_nr_pages)
 {
-	return __pkvm_ownership_selftest(pfn, pgtable_pfn, pgtable_nr_pages);
+	return __pkvm_ownership_selftest(pfn, nr_pages, pgtable_pfn, pgtable_nr_pages);
 }
 
 DEFINE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index b9b591533b30..751f76d3ec39 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1787,14 +1787,19 @@ static u64 selftest_ipa(void)
 	return BIT(selftest_vcpu->vcpu.arch.hw_mmu->pgt->ia_bits - 1);
 }
 
+static unsigned long selftest_nr_pages;
+
 static void assert_page_state(void)
 {
 	void *virt = hyp_page_to_virt(selftest_page);
-	u64 size = PAGE_SIZE << selftest_page->order;
 	struct pkvm_hyp_vcpu *vcpu = selftest_vcpu;
+	u64 size = selftest_nr_pages * PAGE_SIZE;
 	u64 phys = hyp_virt_to_phys(virt);
-	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
 	struct pkvm_hyp_vm *vm;
+	u64 ipa[2] = {
+		selftest_ipa(),
+		selftest_ipa() + size
+	};
 
 	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
@@ -1818,7 +1823,8 @@ static void assert_page_state(void)
 		assert_page_state();			\
 	} while (0)
 
-int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages)
+int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
+			      unsigned long pgtable_nr_pages)
 {
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_RWX;
 	struct pkvm_hyp_vcpu *vcpu;
@@ -1831,7 +1837,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	if (ret)
 		return ret;
 
-	ret = __pkvm_host_donate_hyp(pfn, 1);
+	ret = __pkvm_host_donate_hyp(pfn, nr_pages);
 	if (ret) {
 		WARN_ON(__pkvm_hyp_donate_host(pgtable_pfn, pgtable_nr_pages));
 		return ret;
@@ -1841,10 +1847,11 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 						pgtable_nr_pages);
 	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
+	selftest_nr_pages = nr_pages;
 	phys = hyp_pfn_to_phys(pfn);
 	virt = hyp_phys_to_virt(phys);
 	gfn = hyp_phys_to_pfn(selftest_ipa());
-	size = PAGE_SIZE;
+	size = nr_pages * PAGE_SIZE;
 
 	selftest_page = hyp_virt_to_page(virt);
 	selftest_page->refcount = 0;
@@ -1853,48 +1860,48 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_page_state();
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
+	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	hyp_unpin_shared_mem(virt, virt + size);
 	WARN_ON(hyp_page_count(virt) != 1);
-	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1902,116 +1909,125 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
+	assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, nr_pages, vm);
 
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	selftest_state.host = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + nr_pages, nr_pages, vm);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
-	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + nr_pages, nr_pages,
+								 vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn, nr_pages);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, nr_pages);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = PKVM_POISON;
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, nr_pages);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, nr_pages);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + nr_pages, nr_pages,
+								  vcpu);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + 1, 1, vm);
-	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + nr_pages, nr_pages,
+									vm);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, nr_pages);
 
 	/* This also gives back the ownership to the host */
 	teardown_selftest_vm();
 
-	WARN_ON(__pkvm_hyp_donate_host(pfn, 1));
+	WARN_ON(__pkvm_hyp_donate_host(pfn, nr_pages));
 
 	return 0;
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 4c80e0960154..ae53c701206a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -333,31 +333,40 @@ static int __init pkvm_drop_host_privileges(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
+static void __init __pkvm_ownership_selftest(unsigned long page_order,
+					     unsigned long pgtable,
+					     unsigned long pgtable_order)
+{
+	unsigned long nr_pages = 1UL << page_order;
+	unsigned long page;
+	int ret = -ENOMEM;
+
+	/* Page whose ownership will be tested */
+	page = __get_free_pages(GFP_KERNEL, page_order);
+	if (page)
+		ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest,
+					virt_to_pfn((void *)page), nr_pages,
+					virt_to_pfn((void *)pgtable), 1 << pgtable_order);
+	if (ret)
+		kvm_err("pKVM ownership selftest (order=%ld) failed (%d)\n", page_order, ret);
+
+	free_pages(page, page_order);
+}
+
 static void __init pkvm_ownership_selftest(void)
 {
 	unsigned long pgtable_order = 5;
 	unsigned long pgtable = 0;
-	unsigned long page = 0;
-	long ret = -ENOMEM;
 
 	/* Memory for the VM page-table */
 	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
 	if (!pgtable)
-		goto out;
+		return;
 
-	/* Page whose ownership will be tested */
-	page = __get_free_page(GFP_KERNEL);
-	if (!page)
-		goto out;
-
-	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
-				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
-out:
-	if (ret)
-		kvm_err("pKVM ownership selftest failed (%ld)\n", ret);
+	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
+	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
 
 	free_pages(pgtable, pgtable_order);
-	free_page(page);
 }
 
 static void __init pkvm_hyp_alloc_selftest(void)
-- 
2.56.1.708.g77570a6a1d-goog


