Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E16073171
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D2nrf79d;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZ1dkcdW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B71Ljk+UIM1gXp9I8DKkVnuHdcZAuyllvZTiO1ZgbS8=; b=D2nrf79dAqHblvsg6FunJDgNP7
	2K7KLOgH3+bWdacLkSKyLBCuMikI9pp55RE5zRtD9nVrhKjby69+I+Ie1ii1TvwpoRzD3HwdCaM8i
	Wsw/r3eBNtzJPO+bXNWDU5oOEKVBsHJ9es3oq/8Mgfcvd8kvqnI9WNUbgElJKmwAFYgk9ND2SW9b9
	XWvJ52oxSHgp6qAOO2d7TShLIsFH9i1c8YItdkkBL6dUyhd4OqaWAsTjdaW9wosnXapoSvt90JWml
	QlL7lZvm+wH97LmlmiZ3PjDWCzwbOVe2cF/442UaMNWxjyuTlDlMpHArxPS7OYNP4P3ZySLVsx2Q6
	Y/5pshIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FL-0000000D40W-3Slz;
	Thu, 19 Nov 2026 18:52:35 +0000
Received: from mail-ot1-x345.google.com ([2607:f8b0:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7F9-0000000D3ot-2mPG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:25 +0000
Received: by mail-ot1-x345.google.com with SMTP id 46e09a7af769-847e2926d94so279573a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114342; x=1795719142; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B71Ljk+UIM1gXp9I8DKkVnuHdcZAuyllvZTiO1ZgbS8=;
        b=gZ1dkcdWQt42wbTAjpr5LrHalP7VBz/50+2sr9z1GEtIrxmZi5Q5fcoH3MwQOGfkC5
         8e9h53FL5Yy70d2mLWb9OpoRoMlZQH5mo/fEBL8+3rQiirlRWf2pGTklrIxVBYAhvTVo
         HbEs+SQ5LhaBccqWuX3l0V0jFbIhX74YgOyo+nemc7KjajqhQSnIlF2da2sSvfKR8wBf
         drPVJcelLhSL+rGEPvNfZjvto5UDSRWTPB0on5WR76TvAgTtZrnkcC3gjhPEqqfEByKY
         0V9iTTJEHhrJS6yRz01TXClmwwc7ddUVHjf5yEpmDLgGaN7OL+Ql8Zi4y5tNcj8JehKA
         fYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114342; x=1795719142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B71Ljk+UIM1gXp9I8DKkVnuHdcZAuyllvZTiO1ZgbS8=;
        b=naFPxEfIvE7cbZnhk+HB1uVHYpSFl9lmtYstJzu7wV5KX6DV+ziNYD6fRtVCRbvNJZ
         wTExnjT+TQM5HtwKL98ckRkIZy00ZgZZMp2GwhoHyEJZUbQdiWZ137pXy6355zWTSK82
         FSbN1UX4h0xIbcJcE3TFA2UVRk9CJKa/9tSKWCHSX0E6mZHeKrG6Smvdt1vFcnsF4IJR
         ziufKEKX6Ba6RGv9oGnWUOztuQKyb8CDmIyhfrYo9X3iGGpIkq0lZ1LIz53zZ/z4FnYn
         ShkJh6dzq0C1Ez49DKvuxhCdyThSxwbypZqE2muSzxH/zfX18p65kVBrrSYrjLJhDyvB
         Vctw==
X-Forwarded-Encrypted: i=1; AL+hErEr4GzBsxPlUlW5wJrLjkxCk8rYXRrcl9GlX95EiPrR/ONQFbsiBXVB7zSB47Hy1u+teUwpNOdoiOJRikibaErK@lists.infradead.org
X-Gm-Message-State: APuU4Z+cLEhKKMsSdPXzcWWAD5jkge5QM2jkZcHQpbobe4V8q6K1YeOf
	AwRt1rUiyIeJL9S/VvXo5IwafPJ3MCAS86gJH5C1nBDRP+cTHnA9RTOKnMpkMV74iFHemrFWLf7
	Srlpkx9l/4ajupDGxp4YDYzesKg==
X-Received: from ilpp13.prod.google.com ([2002:a92:d28d:0:b0:53b:ef4a:649b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1b87:b0:576:217a:6740 with SMTP id 5614622812f47-57a0a60d756mr914272b6e.22.1795114341585;
 Thu, 19 Nov 2026 10:52:21 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:48 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-7-coltonlewis@google.com>
Subject: [PATCH v10 06/33] perf: arm_pmuv3: Generalize counter bitmasks
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
X-CRM114-CacheID: sfid-20261119_105223_745107_1EC1E6CC 
X-CRM114-Status: GOOD (  13.28  )
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 tools/include/perf/arm_pmuv3.h | 12 +++++++-----
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index fbd631ec71a65..4a6c1f3bcea1f 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -535,7 +535,7 @@ static void armv8pmu_pmcr_write(u64 val)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -771,7 +771,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a27..fd2a34b4a64d1 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -224,14 +224,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
diff --git a/tools/include/perf/arm_pmuv3.h b/tools/include/perf/arm_pmuv3.h
index 1e397d55384ed..d045b0f3b93fe 100644
--- a/tools/include/perf/arm_pmuv3.h
+++ b/tools/include/perf/arm_pmuv3.h
@@ -226,12 +226,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
-- 
2.56.1.708.g77570a6a1d-goog


