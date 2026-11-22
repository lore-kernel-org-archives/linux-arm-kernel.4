Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0MuySEiT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=maMOa9AH;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oKHNHEkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=; b=0MuySEiTsU88wmvKaMvBW4xdLI
	riCQ2iZ5SLQf2N0Xjhx+XMf8qIfnPmuBUivnZeNRt/0kRMlfxChZrH2mE09/w1Pww0aDAfZwVOK69
	JaLWqrCAX1SKB2w2Mz7XEcWyWnsbG92MSpMVMiX5/uKIerAWM2A1yzK570y9zcWY3KS0OwIplSsM+
	H3sVaE7Bv0lVpTYPeitwPOLvM8EtVs3v4TpvpJ6wX2XjHMs0Xzzw+yx+RH9BLrxHm38LHzT0Gvhd4
	OtCzYH+5Qob2kkqskNoVgOSa35P402ESrpafSfH5Gig4QNCBdNuELHoufbD3LPtmVIfPeoFXMy9nN
	LMZHMrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ1-00000001YdQ-2ToL;
	Sun, 22 Nov 2026 18:45:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYr-00000001YTf-3jvQ
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=; b=maMOa9AH9kVHIT8+QSCttAuSvN
	Hvj1KLWhFYctpRxCA7l7MVtWhxTSCXXKFR2KXz6u4h4RSJfuGkwN/QbYkM0TqydNqwjj+1xpNFm57
	m7vA1d7fZvYHPli13mcVwwQMesf+KMValj14eEw/mqPp8lZA60NXnRpUR1z80VTw1/DOtOqWsGcGZ
	LKKJIM103kvK1vHmMGaFnUwa8o6ji0yFBi+3U3gtUCuxT+lJWFhVvhckBINq4LX/fGIzJYE1Kp00m
	mNGKJbjCZ6j/Po3POgSQiFASfre3NozRAQkv6i+73lXA8eyYO/bJQc0cbGoHGBuXh3e0mwjnZyTTD
	REDpdZVg==;
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYp-00000002RDO-17qF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:12 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so4198856a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373109; x=1795977909; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=;
        b=oKHNHEkg/K6m/Cp00XrJzNYrWxE7JYUM8GhdCMtBAyz6uPLE2wrNHglxI9xvF21Fjn
         0nSQ7ubCR6NlDz3TFk0lghdQ8qSGopvEFRQtUGRYWnkZCv2Z3EmXqM0vN4+EqRdemUcC
         v3xE2EJVJrQ70syRyKJyjwa5A6e/K1mrMea79HrtcdXL/49IHr19iNqfATirlQlIoMOW
         NPSpgXe6AR01fvyJ9x3ckRaXjU2ZOjNy5vylRSngeypxIRx6ZaWopKB1LY15Dwi16oAZ
         FrvkqgWRxiDhTWhgtpfVnSej9mi7NQGCCvuku29lCJu0CRN7NsudSs6FAjR00aHLDrp4
         JgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373109; x=1795977909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UO6lsBJ7c54oQdvfF5gDh+eGlBppWPfqiUT6SIqJiU=;
        b=ziqd3qs1YxfBVmZ4HpfcGzr9trg2JULD9KnHyMwgF627CNgrpx9Pe9UE63USWpagmh
         GWFP1YPuFapAIumIti5mpYwgCK6CfjuQmdSez01msG7dFstjF0cYClavee3lk+q7UPZD
         fR6s2IpluYHDMvsfZq5wfdGiUTS+oT5HeD/9wj8MlfwKL7TvXFdHM5QD8pREHZcjFOY3
         +vmOOkyMVdfvQwp3SdDwti3VPAH6ZDIR6LXjswp0MAUF9mXMhY2Hk0HVRvE9GjULqoTB
         l3x1ElZ9znbb4Jd5lL8zhqwLN/6beQYJcYy6FAvsyGfofyc8+ztRpAu/h9ylOMDd0xig
         1sQg==
X-Forwarded-Encrypted: i=1; AL+hErEVEClk/Ookzqjxpwpp7DrwwvtafLMzXRlQWmaXrrJpVoeFDxOLbm9lFOJ0+mW1TsBRWzfX+iQsrEmWVfHg6IKc@lists.infradead.org
X-Gm-Message-State: APuU4Z+SUkDDRmGyBCU+7u4xx61mi/YHId+Ieq5cMJeKRzKomz2ziPbF
	YH/m4D9t8e50e1S39RHS609o8un4dz8lUaljUSWX04mZHahFHd83MlXWX+tvi96PFQHQyyj5G/F
	/f0gAyZSjbmIHCa6MtmgWBg==
X-Received: from pjbie6.prod.google.com ([2002:a17:90b:4006:b0:3b3:c164:f1d8])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr8960448a91.53.1795373108395;
 Sun, 22 Nov 2026 10:45:08 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:43 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-10-jthoughton@google.com>
Subject: [PATCH v3 09/19] arm64: Add bbm_through_af capability
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184511_276621_F4D008DD 
X-CRM114-Status: GOOD (  20.69  )
X-Spam-Score: -7.6 (-------)
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HVO requires BBM Level 3 for the block -> table transitions when
optimizing the vmemmap, and it requires hardware AF management to avoid
taking page faults on the !AF translation that is installed as part of
the RW table -> RO + new OA table transitions.

Call this requirement "BBM through AF"; i.e., all CPUs support BBM-less,
in-place TTD updates. Model this as a system feature, as all CPUs must
support it for the kernel to use it.

It may seem odd to check for HVO support directly in bbm_through_af().
If this weren't done, any system with mismatched HW AF will no longer be
able to start late CPUs that are missing HW AF if all early CPUs have HW
AF (and BBML3).

This depends on HVO enablement not changing after boot, so select
ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 33 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 40 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9b08b2457a55..4cce60c2de66 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -61,6 +61,7 @@ config ARM64
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_TRACE_MMIO_ACCESS
+	select ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e3c8a1493dc8..b9106b5a8dcc 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -909,6 +909,11 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_bbm_through_af(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBM_THROUGH_AF);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c9c9a6889455..d241638b5143 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -76,6 +76,7 @@
 #include <linux/kasan.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/hugetlb.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
@@ -2044,6 +2045,31 @@ static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
 	return cpu_supports_bbml3();
 }
 
+static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/* The kernel only enables HW AF updates with CONFIG_ARM64_HW_AFDBM. */
+	if (!IS_ENABLED(CONFIG_ARM64_HW_AFDBM))
+		return false;
+
+	/*
+	 * BBM-through-AF is only needed for HVO. If HVO is not in use, don't
+	 * penalize systems with mismatched support.
+	 */
+	if (!hugetlb_vmemmap_optimize_enabled()) {
+		/* Only valid if HVO cannot be enabled later via the sysctl. */
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO));
+		return false;
+	}
+
+	/*
+	 * We need BBML3 to support Block -> Table transitions without taking
+	 * faults, and we need HW AF support to support changing the OA without
+	 * taking faults. has_cpuid_feature() checks HAFDBS >= AF, reading the
+	 * local CPU's register when verifying a late CPU.
+	 */
+	return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -2953,6 +2979,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_bbml3,
 	},
+	{
+		.desc = "BBM-less TTD updates via Access Flag",
+		.capability = ARM64_HAS_BBM_THROUGH_AF,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_bbm_through_af,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, AF)
+	},
 	{
 		.desc = "52-bit Virtual-Physical Addressing for S1 and S2 (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 3125695122a0..25292233ecd4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -15,6 +15,7 @@ HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
 HAS_BBML3
+HAS_BBM_THROUGH_AF
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.56.1.809.ga0b61035b5-goog


