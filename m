Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02755606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EikN4LAd;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QCk2NUNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=; b=EikN4LAdX385HCw8NqHfUTlvdj
	JYl4jktL14ajwCogdO+IsejsAcfcWIqV8/WZ+wdeQXhCxnpheJSOlXsYItjLAizc/crpeway50aNK
	pbkOYJYdAWRVjhZztcvrkvuxTFITZi4BP+RmI0Soq7miKKAQdPrMkztqCU2nLGjuFY9DFQ3+r1AQj
	4LkSZbPlQ4UKjtGARpjjcQYwzG+P9fG7OedJeNgXMVAANA39ERjXeqQ1vKMOwNokljdmD5p8M9Z2S
	XcDx5ndC2/CF7/Fl42ugSoZC+A95nRU7HbsnYd3uPS0fTJquKiVa0iyc6qKJh+O1/83hq6MQ/gCRI
	J9pcMLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gt-0000000D5Vg-2TD8;
	Thu, 19 Nov 2026 18:54:11 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FO-0000000D43m-2Lbr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:39 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4e937c5bd4fso121170b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114357; x=1795719157; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=QCk2NUNwGQIVBg4PlCganeXR1z/uO2aADgIR7QxO5Veb8ntMBkb7T6k8uxuMelLpT8
         HyCiJ0yKp3Crwh+E7NkL02EoZUtoUC9R1cRyMhq1IHq92lbX81a3FFy232QQDa0VXAHy
         /MwIKcrg2mxKRCzIBjAKPDqfpjoRQTOR6VxBQQoZ5Q8XPqpvEvXFS/uF9pnvwoJImB74
         NXpAJ1vmCldpq4f04BmD1emwHUwrqmXwxLcTdyl05+5vCTAtqjf51p9o1blAoO1M/cIG
         8+VW6ymdWLNE5NxTY16LML5MFbVFQGR46d4l6ArbZvN9ClvjniNVj2H2bZEsP/X+Q4qd
         vfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114357; x=1795719157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=BOayCDjp0Nt7FFwv20r66Ir3fWEKau4lXekL2e09g5Q18g/cxYKGQOG86k4gpqJ/dJ
         YTmCToAJvGs9YjR83DpOfXegQAro6fZKMdMp/Pah+2zsmwC8P0VmJBrwcBiEd0C5OMz3
         jAe8ucBqC6anfS9T6Bg5PdfN9d0xg2Qwe0ytsCIuOyULrm7Ykix3P9PVmh7rECH+jMiy
         1nIb0HuqVZtPDmalPY90YUKHZvJUWgid9yFgwe0reptIfUYeaCJ2gpXHEIEeVkeMQYjj
         oshq+lceRPlh6gHRIMBjq0fkv3lhR/UAViytIufhxfNScp/sTKOqQU6+7A9ZsTyOTOAi
         +9wQ==
X-Forwarded-Encrypted: i=1; AL+hErG5SknZUXf7ms6ADVAIlGUeFqTJDAGpN7HfMVvpzPwCAgnoBDEA1FfWo2Of/ypIfuib5tdatNr6ry3h1IWZAzot@lists.infradead.org
X-Gm-Message-State: APuU4Z+zT/p1/ppqeEjfUYGeQR8tjSgKBWkY7qUwW0UP6oZyJVqgax9a
	LG37CuPcLLuZuBTzbOcaBUmDdIiy8dvyHU08u2kTCurfHpJdAXbWnWmzX+Ofao3W4nF89DTPtuH
	UY/gIGe+PUlDWGMislqEUQcpZ/g==
X-Received: from iof12.prod.google.com ([2002:a5d:9c4c:0:b0:9c4:b80b:7605])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1384:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-57a06a0da3amr989109b6e.6.1795114356571;
 Thu, 19 Nov 2026 10:52:36 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:03 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-22-coltonlewis@google.com>
Subject: [PATCH v10 21/33] KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to
 resync filters in process context
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
X-CRM114-CacheID: sfid-20261119_105238_703516_13618260 
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

Previously, kvm_vcpu_pmu_resync_el0() only scheduled
KVM_REQ_RESYNC_PMU_EL0 when called from interrupt context (such as an
IPI reprogramming host perf events). When perf_pmu_resched_update() is
invoked synchronously from process context during vCPU load/put to
reschedule host events around guest-reserved counters,
armv8pmu_enable_event() calls kvm_set_pmu_events() and
kvm_vcpu_pmu_resync_el0() in process context.

Update kvm_vcpu_pmu_resync_el0() to call kvm_vcpu_pmu_restore_guest()
directly when not in interrupt context so that newly rescheduled host
perf events have their EL0 exclusion filters applied immediately.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index dbbe219ac874f..d3fd438a57b09 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -213,14 +213,17 @@ void kvm_vcpu_pmu_resync_el0(void)
 {
 	struct kvm_vcpu *vcpu;
 
-	if (!has_vhe() || !in_interrupt())
+	if (!has_vhe())
 		return;
 
 	vcpu = kvm_get_running_vcpu();
 	if (!vcpu)
 		return;
 
-	kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	if (in_interrupt())
+		kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	else
+		kvm_vcpu_pmu_restore_guest(vcpu);
 }
 
 void kvm_host_pmu_init(struct arm_pmu *pmu)
-- 
2.56.1.708.g77570a6a1d-goog


