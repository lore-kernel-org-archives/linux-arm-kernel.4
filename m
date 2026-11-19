Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF560A2617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3JtHogic;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XeaoZ5d9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=; b=3JtHogicFqiGdrMLf6LgNeECvt
	XrDFX17YbSTjDLEZXxa1Nu9TaIaNZaV4nullTDBiFp1Ur2XjJ+UTN4QevL3TraeUo03nPXwzjaRX1
	tPlHF6AXnIy4Xir2vVQd4pNeJVBD7Re0GF0Qe/VdTIq9Jg/pV68LuHLm6H/Rsd/ZZdrxA2t4KfcIX
	fb2fw9WYXiz0JKBhMTmkuj6QVfMbAFSCfUopY1GUxXN5thDgrf02qNNvnnTxxGZCFVOqHWAhIR4Zn
	IolfuuttCKyB1VE2HTKIpaSXJozBoiW93CZsbJ4VsIPAqZZaJ+UEejCEhZ9RpRZa58dhK36J96QO2
	q1HSj7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FM-0000000D41U-17nw;
	Thu, 19 Nov 2026 18:52:36 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FB-0000000D3qA-16au
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:26 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4b37620eb73so240215b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114344; x=1795719144; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=;
        b=XeaoZ5d9hSTAuc7WjkTueOxdscBHjtZyq8LUgYBs9R+ST+o7ZgHWq2NNhYRawWRxZW
         IAOtN04p8xcVgVp6/gHunPaCApSeo/ep9s7zuL1p4ssgdvpvMfJix9ELAOOyUC7I9TYs
         iNxhhNMNmNzPEM51BsdV5CSfgbeYqMDTLTPZv0QMWjpGbsNkoqMvsZECaalL/RMduU7w
         mhTQKTAvaTF8hjLhT7E5Cznl0EJC3UNmoT1ysTn8KLNFnj69kg0eue1K17iJA+C0iXE0
         Ob9gKEpNQoOrdyQ+WfNF9LsnsxTmu0IVQFhJ62CV8WDF8VSH9q2i3EJR3J3xHSSLNT3p
         OoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114344; x=1795719144;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDyW3lpBDMB0NqyM7GSJ8o96cb3fLFzZmtMS+6iJK0k=;
        b=TVOh+/QDVgeslQPwUs1PzO4gHfcEViJ50s2w+fHe3RWs7GNNB3I0OK6PrffKLvFl3n
         ZOakgkk1UiLVBoeoygxZmxvWz1eWyEBP3X2AKT6GImhIZ+DrGN/GNlOCb2iqIIgX9nAH
         wIt+q1kYBIz6r/XqzDeTbLe0OP+mgp2T+IEhlM0PlPbxN7+2W3OFA5hTZVdGUwkbzsj5
         5JMDtxbbJMHMYk3elCyyQNoYfZtQ5LltZfQhJEJI5N713WFoRTTLQ2XXwWYoXwXs/bGe
         D+KjaoGXCSqqdJIxt+b2ZI2D3i+6XML7U+3iijvWD1k01VYreTIy6qaEK2HSm6c2XiSf
         JngA==
X-Forwarded-Encrypted: i=1; AL+hErGV3vYfmb7UhwNYpD5HDd9cLkKxQPIzFtqDGlWdz2pX4FBd9WycHhiv/NNwjjli8UwG7kstQZ2wVe13uBtbSk4g@lists.infradead.org
X-Gm-Message-State: APuU4Z8JaXadIGWPRK89ZkL7cfB1G1TAodJCq5j4cBkll/3s4+zRjmXc
	4M6TU0dpfdUhRb2shAp/yvFYx8nMNrU2BSsC2laJKioYHW9rbZXSLeqgdumC+LMjy7vGNat9zzs
	RDeVXyWNhkFNlQthtH+27q1IIgw==
X-Received: from ilef19-n1.prod.google.com ([2002:a05:6e02:6193:10b0:51f:7667:1233])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3189:b0:4ea:18f:64b0 with SMTP id 5614622812f47-57a0c19af8amr826925b6e.67.1795114343396;
 Thu, 19 Nov 2026 10:52:23 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:50 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-9-coltonlewis@google.com>
Subject: [PATCH v10 08/33] perf: arm_pmuv3: Check cntr_mask before using pmccntr
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
X-CRM114-CacheID: sfid-20261119_105225_310433_849660A5 
X-CRM114-Status: GOOD (  14.28  )
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

When the PMU is partitioned, PMCCNTR_EL0 is reserved for the guest and
removed from cpuc->cntr_mask. Move the PMCCNTR_EL0 availability checks
(cpuc->cntr_mask and cpuc->used_mask) into armv8pmu_can_use_pmccntr()
and un-nest the 64-bit user-access fallback check in
armv8pmu_get_event_idx() so host CPU_CYCLES events fall back to
general-purpose event counters when PMCCNTR_EL0 is unavailable.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 973d4abcb3a6e..9ce915754b0a5 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1013,6 +1013,10 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (cpu_pmu->avoid_pmccntr)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->cntr_mask) ||
+	    test_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		return false;
+
 	return true;
 }
 
@@ -1025,14 +1029,15 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
-			return ARMV8_PMU_CYCLE_IDX;
-		else if (armv8pmu_event_is_64bit(event) &&
-			   armv8pmu_event_want_user_access(event) &&
-			   !armv8pmu_has_long_event(cpu_pmu))
-				return -EAGAIN;
+		set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask);
+		return ARMV8_PMU_CYCLE_IDX;
 	}
 
+	if (armv8pmu_event_is_64bit(event) &&
+	    armv8pmu_event_want_user_access(event) &&
+	    !armv8pmu_has_long_event(cpu_pmu))
+		return -EAGAIN;
+
 	/*
 	 * Always prefer to place a instruction counter into the instruction counter,
 	 * but don't expose the instruction counter to userspace access as userspace
-- 
2.56.1.708.g77570a6a1d-goog


