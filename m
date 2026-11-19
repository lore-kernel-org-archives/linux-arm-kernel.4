Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ljNe9ws;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MoT1W3HI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AHJ6vsYYQy4ZksSL7GxZoPUPCozguL3MZwWjlTE9XOs=; b=1ljNe9ws9i09IRtG+jkveSfSon
	ZbAogcUEll8A7ds6NHgCmhT+9YgUBuuLfxCq1vwcq7YS+NkrzmpVyjC4SD8xctOYgc2Qam3Nmv/wr
	51xqoJIEsNvT88i5TpY7a7BcmU3BUvYyIAlq9h/fjFKugHb33lCTXmHgASbDGqXywv+qIEntIC03C
	qq8SzhzP6WF6MThBj1uLYevNQwMmpjfypxR6rATj2tPHsm3EIXV/pD/XmlM/J0W9Xw6w9S2HrHOVt
	2Ak5+R/oGBriqnOpXf6RfbUdRQfZ4m9UjZizVftkow45VmEYnWC201/bsYnRLiA3KEO7TD2p7DT/3
	8QschEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gx-0000000D5df-0k7j;
	Thu, 19 Nov 2026 18:54:15 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FW-0000000D4Jq-0IeT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:49 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4e937c5bd4fso121287b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114364; x=1795719164; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHJ6vsYYQy4ZksSL7GxZoPUPCozguL3MZwWjlTE9XOs=;
        b=MoT1W3HIQxp+dyffOb2a84XiRxy61YnUPD/SIFU2V6AvW4/ZMXPi20dYtJtsVxzqn3
         DJ9oAvQ0h6ZjuscJuJNpKr7MTe60NDbTOR2BQMaVT2V1ckK1W7eAC1HBZZf8FoOwyhfp
         UgOdu0JcHD/HEbU6z0wj3vCtZMNSwD7Dhj5+4n0Oq9YnVJvUi6FyyrljjGTealmIWIhr
         NXuSN5JFWO2RiVJweI5sYDPLcLhZcxAUEWWWte0EM59nAeOoePP/2EEbBA3DQs4LfMRe
         IdAOnAhfRs9YzuKRhY+lqcYe6Aa9TLOqgjnmZ332N+SWXDoqQlddgYVR2A+B2F0vZpVD
         Zy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114364; x=1795719164;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHJ6vsYYQy4ZksSL7GxZoPUPCozguL3MZwWjlTE9XOs=;
        b=W62fOJClhkzVr9MqHFvySG7hAKj7HKnSwXHHAZtSZG359YIBNy8HABeWTtuj9Cgyz4
         K+WH6qDvYV2bSvhoJilaRFKgKAMtlkqUITOU1azKmT0FGxgPzQgTLBfAStlyX2nYC9pQ
         2XPwOcMe6Zprb+3NuuuC83ZtKOULqdrYjOaEf9n0+YdAJEiTuTNK2LewMKNMffj1agvD
         t79EoO4wpUVdojDQCj4o1A4l8D4rfK1D1Bz6xzfIesEuSp3BUlBIq/a47YfNN65NUJ/P
         +UYHJsANR/TvkCHcu1q+jrT7A4X+bqedwBpnnS8cmfvzRhQwGtGI/N2+UyELNQd6zyyo
         G0/g==
X-Forwarded-Encrypted: i=1; AL+hErEtiEDuCDJAdPT4FeRB0TkYc4iFik426DLWIQJM9FWWQ7G8mpoDB0CQ7vAjQO+SVbEaVCwsQYztAglyAiHL1O5m@lists.infradead.org
X-Gm-Message-State: APuU4Z9WSMcI7oeoTjVAO+KfPFrVPcAjZ+LFMhNCvvNfy5t99KA7Vygi
	8keMPWbeQS2n0trjQxlXBC314YymmW1foUgcx8TzNYY7EgFMHL5Ti7M+3rV7SQEm3sc5JtHWoEL
	X4xjCixuBe5z81HcVcQ/4PyppVw==
X-Received: from iobi29-n2.prod.google.com ([2002:a05:6602:c69d:20b0:9c7:67b2:21c8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:67c7:b0:4f5:98d:d1ae with SMTP id 5614622812f47-57a0bb8d52cmr963272b6e.55.1795114364230;
 Thu, 19 Nov 2026 10:52:44 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:11 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-30-coltonlewis@google.com>
Subject: [PATCH v10 29/33] KVM: arm64: Forward FGT traps for PMXEVTYPER_EL0
 and PMXEVCNTR_EL0
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
X-CRM114-CacheID: sfid-20261119_105246_164971_0E18E153 
X-CRM114-Status: GOOD (  12.61  )
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

When an L1 hypervisor runs a nested L2 guest with a Partitioned PMU
(vMDCR_EL2.TPM == 0), L1 relies on fine-grained traps in HDFGRTR_EL2 and
HDFGWTR_EL2 (PMEVTYPERn_EL0, PMCCFILTR_EL0, and PMEVCNTRn_EL0) rather
than coarse-grained MDCR_EL2.TPM traps.

Add SYS_PMXEVTYPER_EL0 and SYS_PMXEVCNTR_EL0 to encoding_to_fgt[] in
arch/arm64/kvm/emulate-nested.c so L0 forwards fine-grained traps on
selector-indexed PMU accesses to L1, using PMSELR_SEL to check
HDFG{R,W}TR_EL2.PMCCFILTR_EL0 when PMSELR_EL0.SEL == 31 and
HDFG{R,W}TR_EL2.PMEVTYPERn_EL0 otherwise.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 1cd2f42452fe7..9da7e98b4d18f 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1319,6 +1319,7 @@ static DEFINE_XARRAY(sr_forward_xa);
 enum fg_filter_id {
 	__NO_FGF__,
 	HCRX_FGTnXS,
+	PMSELR_SEL,
 
 	/* Must be last */
 	__NR_FG_FILTER_IDS__
@@ -1870,6 +1871,8 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_PMCNTENSET_EL0, 	HDFGRTR, PMCNTEN, 1),
 	SR_FGT(SYS_PMCCNTR_EL0, 	HDFGRTR, PMCCNTR_EL0, 1),
 	SR_FGT(SYS_PMCCFILTR_EL0, 	HDFGRTR, PMCCFILTR_EL0, 1),
+	SR_FGF(SYS_PMXEVTYPER_EL0,	HDFGRTR, PMEVTYPERn_EL0, 1, PMSELR_SEL),
+	SR_FGT(SYS_PMXEVCNTR_EL0,	HDFGRTR, PMEVCNTRn_EL0, 1),
 	SR_FGT_RANGE(SYS_PMEVTYPERn_EL0(0),
 		     SYS_PMEVTYPERn_EL0(30),
 		     HDFGRTR, PMEVTYPERn_EL0, 1),
@@ -2609,6 +2612,16 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 
 	case HDFGRTR_GROUP:
 		fgtreg = is_read ? HDFGRTR_EL2 : HDFGWTR_EL2;
+		switch (tc.fgf) {
+		case __NO_FGF__:
+			break;
+
+		case PMSELR_SEL:
+			if (SYS_FIELD_GET(PMSELR_EL0, SEL,
+					  kvm_pmu_get_pmselr(vcpu)) == 31)
+				tc.bit = HDFGRTR_EL2_PMCCFILTR_EL0_SHIFT;
+			break;
+		}
 		break;
 
 	case HAFGRTR_GROUP:
-- 
2.56.1.708.g77570a6a1d-goog


