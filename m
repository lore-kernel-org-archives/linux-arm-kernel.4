Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqQNYwD+;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R2RHFkUZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+mb9rF6VJRzXR4i4y89PW+yVWJyrkXOWuPHAFuVlX7c=; b=oqQNYwD++ytARNQie2FaUy5Zop
	bFBcf/cgH65JGk/t8duyCJDj1V1DCAHxRXsN8tgmgJ+RwyvPN19fOd8vLe7XRF0pHai4TAgM6CzLy
	4ICyVjMhJrFg8r0L+yhCxP39wLL7JlT8WrUWglpxhQUCeh8Rt3bHN+jS/Z6cEC+vYF06jmiWRW3vz
	REXgZFDWjLFQKzQq/GluKD8+uSeNFgiyQugc6S6Z/EB9JT1ewp3oYSxk7m3aHMMhPZ+Hnv3G01WOA
	MFXpH6FIBbYlAeqOJ/iFU/SVBBecb5QEOIqYT7eLw5vprkxLfmJy8WjJTGXfRN386ZIsiwJAnFRvJ
	Ejqj6TBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3UT-0000000070x-2m60;
	Fri, 27 Nov 2026 21:28:21 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3UQ-0000000070b-29Bo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 21:28:19 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c49df8fe86eso639598166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 13:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795814895; x=1796419695; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mb9rF6VJRzXR4i4y89PW+yVWJyrkXOWuPHAFuVlX7c=;
        b=R2RHFkUZzSzL0/D4o9ykjuQjZy9RHgTtL0vrr4uokvre4/nNZoqdRCsrxNcQLXxVgh
         EikeW6eaLm/2zUQ6UPmuYlZUnJn5J5CqjWhBQZDOvNbnvR/iAK/RhSaYNP746ZA8+AkJ
         OH0Op6MmWmu3JekkzSXqVV1wIEKmRzBjWh1/pe8KGprh05GUfXMqCIfYmkxcNbHZ6qXm
         5NBEyFTLONDkI0Qd1Zie/Bu+3bxgoyHA6cTPJzvcx+Q542d0IRh0VWkCSl7SxAmCXuz4
         1RrSc+dasXFwfVn4OjI6mr8eIVhBPrh3cZy2/rXFNry0g9YKh5N7XfQyhbTYj2SVhBew
         ZcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814895; x=1796419695;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mb9rF6VJRzXR4i4y89PW+yVWJyrkXOWuPHAFuVlX7c=;
        b=BNIsx8mqst2+SVj5DzTDNjuSpCDGmDI6AlLKAKGQLEvlOpyFvuRzBRGDlbzWcFxAj3
         XrfyoJMqM6TnTfALCpYayG35RLj0CZcazZjlbKROA4dmfAwyGnY6tUsSwy3KwtuclC/W
         LRzMPvVuCfH/9CdiRMGVWNZAl4PUbakdCRgTsjzbs2BnaroKPGnBh9RsqCi82e/oHXxy
         aGXfLL8x/xWTS3qsc000UvCfxtFeTm3F7XenHVLsCYOerPrbmq+HjrL3Rk2qrO/2vA5G
         MGeiAq6nzBI1un8P6JaRBQCCoLT5Q/IDQsbFrZ1j5/2MCudA+ynWBMQ4XbtbeAXcF5X2
         cCnQ==
X-Forwarded-Encrypted: i=1; AL+hErGVPjB+46GpZwhjvq2HiqjlsWkh2pdX8KNZEpd/D3A6B+yO63BlrbYDBrGnvlppp+EzgL3y/XXZeOIWT4yS/HHf@lists.infradead.org
X-Gm-Message-State: APuU4Z/HkSgUYE03jsQ4eyD01Yc6l6oKrrDQgsjlw2AYkeD3YH9WjOD2
	74H9YicN1ipuArP8HVjn5ULBpUAfzhlJ1lmGI2ylxUn5f21/Bl4jvWWuAh132d9HWO2vVr48rAO
	AYgaZjgHIzwb6vwu37QL+Bg==
X-Received: from ejbbx9.prod.google.com ([2002:a17:906:a1c9:b0:c50:487b:9fb8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c513a99abe6mr2130168566b.13.1795814895264;
 Fri, 27 Nov 2026 13:28:15 -0800 (PST)
Date: Fri, 27 Nov 2026 21:27:43 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127212743.1139739-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Use CNTPCT_EL0 for hyp trace clock
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_132818_593045_C89D80A8 
X-CRM114-Status: GOOD (  11.30  )
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

trace_hyp_clock() reads the virtual counter (CNTVCT_EL0). Under nVHE
(and pKVM without hVHE), loading a guest with a non-zero offset applies
that offset to CNTVCT_EL0, corrupting the trace timestamps. Use
CNTPCT_EL0 instead.

Cc: stable@vger.kernel.org
Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/clock.c | 2 +-
 arch/arm64/kvm/hyp_trace.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
index f3e2619db4e4..ea4412e6737c 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -54,7 +54,7 @@ u64 trace_hyp_clock(void)
 	u64 bank = smp_load_acquire(&clock->cur);
 	u64 cyc, ns;
 
-	cyc = __arch_counter_get_cntvct() - clock->data[bank].epoch_cyc;
+	cyc = __arch_counter_get_cntpct() - clock->data[bank].epoch_cyc;
 
 	if (likely(cyc < clock->data[bank].cyc_overflow64)) {
 		ns = cyc * clock->data[bank].mult;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index b9404496f977..06d6bd7aeac7 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -510,8 +510,8 @@ int __init kvm_hyp_trace_init(void)
 			per_cpu(timer_unstable_counter_workaround, cpu);
 
 		if (IS_ENABLED(CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND) &&
-		    wa && wa->read_cntvct_el0) {
-			pr_warn("hyp trace can't handle CNTVCT workaround '%s'\n", wa->desc);
+		    wa && wa->read_cntpct_el0) {
+			pr_warn("hyp trace can't handle CNTPCT workaround '%s'\n", wa->desc);
 			return -EOPNOTSUPP;
 		}
 	}

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.839.g22a8290db9-goog


