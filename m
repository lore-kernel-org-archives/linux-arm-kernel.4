Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA896073ECD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XpPL986O;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XR8cfLVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4mbmiczFFpidgrYK+TVGYqzAKnw9jrEy+vGtBPKYYRo=; b=XpPL986OVrBnj/n8CgKPCKWHrv
	i2J/VRBR/1C9cEBwEP2linDP/8x9dnuBKWp5wgJL4MmjLAEDs++SFbnmfI+d/n/+YqWVG/DbNMypP
	mMaPhg48+XQOrP7fT3k4yE1/aUJRxMl7dUzCNlkQ96IpOiVUu6mZPIocnogOPm80IpSf76CNa5Xtw
	0FyYUwhOG9NWvu6HM7pXxYNwxFBC8kxfdBZgJYCU+uPN2+wp+AlzMqY610UkZZeGXVZoeMNngn4zf
	SInarDUoBETp5s5c9ayKuX7JBjSNBVYC3n3uGePE6kho0uJ9AEdadXCSI1Szmt7BJtzE5Ku5HwyCg
	Atgmr3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FK-0000000D3xx-1acv;
	Thu, 19 Nov 2026 18:52:34 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7F5-0000000D3mJ-23hN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:20 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4f8281066c4so157185b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114338; x=1795719138; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mbmiczFFpidgrYK+TVGYqzAKnw9jrEy+vGtBPKYYRo=;
        b=XR8cfLVFtz5ZXVK2UFBi9TAyyOnyRgDUoIQ9ZOKbBuC9LBEDnhseQDpF96GUn4kWMI
         D76N71V6HkDhrhvs33rnQ8adiPj/GSO0/QRm4rLDpm0V80Wo8GNZhO43ixGXwQ31J+Rh
         FFvxxmeuBh/WtvlwVpO7TEuUYudj46suXKiVV34GLr9AFSKoyQOI3l5c85j7KKk6Olb6
         XXbYjVqFMiMR/V2iAeShmXryi0aRcvvdTHfFJYXOLsgpocdjTpLRDcsuGFNoyLxX3uuF
         WhY6IiO1f5gwDh5jDUtKCW2invBxZtFAA50Hpsa9Y5Z6YvTc/wHUfZWlOKy2eG9EaF9V
         zrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114338; x=1795719138;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mbmiczFFpidgrYK+TVGYqzAKnw9jrEy+vGtBPKYYRo=;
        b=fNHNZRov+reqyI7E3pUhJaGR9r1MRofRHddi+ICiad9pANUlkQIStzmlNlIDhYQhpB
         P+Vn2aCTuMdJYo57p2YeCcd8+B8F8yCc86ydXty6y16sefqdTMrHoNbErHrR3LauDsy5
         nJuiT47o4j0y9zqQYiqIHevpH5eAJTqhcXW3sf6W5DRsZjgVzcbcPIPALQjDHAp6pKvy
         /t2XzNm0RAtF55s38Bk9HKjOW6J03MCSTG+SpdifhLz6O+Y4xPIV+8qBTMBnziZxRwJb
         JADegD8H03tn6/M7BraR4dGbueGF+AaAx4d9a8h0O0i0JwtVSkLDKPpn1W7dyCC56/We
         /mdA==
X-Forwarded-Encrypted: i=1; AL+hErEdLorFaH/HdpawgIGBoROQBC39xi6XbMY7189854qL+QupN+/cxR8OnPCmUll0GTgcMpy/dn0in5GszToJVr9N@lists.infradead.org
X-Gm-Message-State: APuU4Z+vJ5O1B/Hf2hI5/5NCJf76F2ZEJA6ShBQaJteFlwzSZOxjRtlO
	Tqhh3tyzB0jmOyQ7Da9/p5gnAIsxj02untYyLfuwR0s3Uo87FwpgtNSpaNEyvdVpbWoy2RLyWc4
	nd8pza3ErW6OF4t87ayIx8xLnDQ==
X-Received: from iocow20-n2.prod.google.com ([2002:a05:6602:c5d4:20b0:9c3:a521:d29a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1394:b0:4f3:68d6:f131 with SMTP id 5614622812f47-57a077147a3mr938738b6e.2.1795114337968;
 Thu, 19 Nov 2026 10:52:17 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:44 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-3-coltonlewis@google.com>
Subject: [PATCH v10 02/33] KVM: arm64: Reorganize PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105219_542249_D775C3DD 
X-CRM114-Status: GOOD (  14.64  )
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

From: Marc Zyngier <maz@kernel.org>

Including *all* of asm/kvm_host.h in asm/arm_pmuv3.h is a bad idea
because that is much more than arm_pmuv3.h logically needs and creates
a circular dependency that makes it easy to introduce compiler errors
when editing this code.

asm/kvm_host.h includes kvm/arm_pmu.h includes perf/arm_pmuv3.h
includes asm/arm_pmuv3.h includes asm/kvm_host.h

Reorganize the PMU includes to be more sane. In particular:

- Remove the circular dependency by removing the kvm_host.h include
  from asm/arm_pmuv3.h since 99% of it isn't needed.

- Move the remaining tiny bit of KVM/PMU interface from kvm_host.h
  into arm_pmu.h

- Conditionally on ARM64, include the more targeted arm_pmu.h directly
  in the arm_pmuv3.c driver.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h |  2 --
 arch/arm64/include/asm/kvm_host.h  | 14 --------------
 drivers/perf/arm_pmuv3.c           |  5 +++++
 include/kvm/arm_pmu.h              | 19 +++++++++++++++++++
 4 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88a..cf2b2212e00a2 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -6,8 +6,6 @@
 #ifndef __ASM_PMUV3_H
 #define __ASM_PMUV3_H
 
-#include <asm/kvm_host.h>
-
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..4683281fcc5d4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1534,25 +1534,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);
 
-static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-{
-	return (!has_vhe() && attr->exclude_host);
-}
-
 #ifdef CONFIG_KVM
-void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
-void kvm_clr_pmu_events(u64 clr);
-bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
 void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
 #else
-static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
-static inline void kvm_clr_pmu_events(u64 clr) {}
-static inline bool kvm_set_pmuserenr(u64 val)
-{
-	return false;
-}
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
 static inline void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest) {}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e078301f..fbd631ec71a65 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -10,6 +10,11 @@
 
 #include <asm/cputype.h>
 #include <asm/irq_regs.h>
+
+#if defined(CONFIG_ARM64)
+#include <kvm/arm_pmu.h>
+#endif
+
 #include <asm/perf_event.h>
 #include <asm/virt.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 6b4a118d17ca9..93f41ac77c25f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -9,12 +9,22 @@
 
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
+#include <linux/perf/arm_pmu.h>
 
 #define KVM_ARMV8_PMU_MAX_COUNTERS	32
 
 /* PPI #23 - architecturally specified for GICv5 */
 #define KVM_ARMV8_PMU_GICV5_IRQ		0x20000017
 
+#define kvm_pmu_counter_deferred(attr)			\
+	({						\
+		!has_vhe() && (attr)->exclude_host;	\
+	})
+
+struct kvm;
+struct kvm_device_attr;
+struct kvm_vcpu;
+
 #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
 struct kvm_pmc {
 	u8 idx;	/* index into the pmu->pmc array */
@@ -68,6 +78,9 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 
 struct kvm_pmu_events *kvm_get_pmu_events(void);
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
@@ -165,6 +178,12 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 #define kvm_vcpu_has_pmu(vcpu)		({ false; })
 #define kvm_vcpu_has_pmuv3_strict(vcpu)	({ false; })
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
+static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
+static inline void kvm_clr_pmu_events(u64 clr) {}
+static inline bool kvm_set_pmuserenr(u64 val)
+{
+	return false;
+}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
-- 
2.56.1.708.g77570a6a1d-goog


