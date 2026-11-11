Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8Lhr/Ov;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSMnV9zd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=; b=A8Lhr/OveWIMYAHoVA7ImbmOcw
	pU5MP/IfWWUJLqedcQFzPQV8zqTWuk7sOehjmBL9v3M5vY+NgMk+tFpLI98yzMaQroYH2TA4FRYLF
	gU9dvF3PBuNfscHn4Omw3KNNXWkJul46v3ahDIn5f51a6ed4onCpEdrYGUfofRaf0XWduFfjfe6XV
	7euU3uXQVldxib9vz8U5ozHROaf6w2MORzcAM+QN0R1w9W24kHFOCzBYD7LIJT73VJHYG80oFUg1L
	DyUe4Ympf/9ZWDpA7DiWyku9+xvGcDmyFEm3m3dCZCTotF7T0Cfmd67ODzoE8M7PneAdotTSKIIJ2
	iMEwZMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2aA-00000005rWm-1hNb;
	Wed, 11 Nov 2026 07:17:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2a8-00000005rWS-3SZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:17:21 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1946538a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794381439; x=1794986239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=;
        b=LSMnV9zdzUYLN4hv69DbAA8cwqqoxwWEsJVkDXkfQblFcd+4GEnEInhoqUN1AxKGmw
         77My0aFIo2v16JBDGw9pGmnvBe9k3nf6ZS6eae7KrEC/l/M2sc8xREGiwQw8G1DjQrge
         /s3URqWYMVHEO+9w5vKY/ij34HJv8bHq0Y1syFbCuPUQRxU/Gy/Zw/6ppNcEMy1XDiB8
         7LToKp1sMbaZTGkYqvJ2zKoffx/mGDvEveHKv1FWphIV8R4Izru3LccG2TYAtyn8oPeE
         Yk3Q09ZAUR6CfrCjDkoaJRzaQbgiEahW1ro5C7fDkiypoMGhCEDSKF2JqqiuPMieElfQ
         e1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381439; x=1794986239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=;
        b=oR/YbpwVWcMGa0qHYBBVmp9D0yybI0Y8grwT/npLDoLYQAwrDG4Kb0l6X77ffraVFh
         p33Yzdoeo+CTQuifdfu/G2wLYVfFIt+edkbufzEzRujmZyJqsSq3qx/TphY3HXtwXEsu
         gjkidxCKxsylXF5Q/dmm5r7slK7Y7+tdpLQvE44zlybsz9KpfkzYAYEUMHKYSyNKKFxx
         sZ6UQ+EoeVhMjcV4apaBb3m13He9WOZ8HIow1wD0IHlYgZlFTRwEX0NXmxzbVQdK+iqf
         icAS81MD2+9Hxx1WEG6s+xtKC+T8gOs6U/QjvMK4PIDr83OCYkoGjV47VOpVSqTFMNL7
         3u5A==
X-Gm-Message-State: APuU4Z8UFm6jQ8tX/oUi1Uac3x13LgNZUx3Am6FfpaKdGLFqlVds17Rc
	OpjHJjQ8V4qQ+BNgLWA1NCsF+KFhQ2qcqfAQn8ATS98P8u3fmNueLR5S
X-Gm-Gg: AYBFou3Sf0tRAkR7EUUEnCt7Xk0/JqrcTl03Drw4PYeRlb/w0lMIv9Zgy5w0gUwU50W
	8IeGqFSE7jxI5DUjSpiodfv12R5WCiZYCCLrfxVed4l3wmPeWvISana1tJzy7Mku4QEw/BkFZxh
	mmrAoRKkdJUmKqhtPQxASt3ZO3B7ubcbiwS4LojfB69/Z5FnBB0RjlJ7SzNNHnEpGseWtD/CKHJ
	FotQmUxORVsbiEmQgxmbER5wsE6pH9Sa9CSnWPXKroivwIiAMHKhhBfjtg5SFgb6Zt36yfRU6AY
	ByfoLEAjAPY2P6vtTsO7h1gG3enx0SyMoSOw8HXPIvclhH7X/PJQl9bcsVI4T/aYLf7KuohF1/g
	v+1KoPauHlNAMxW7tYt60gCCqYJV8bqoA7TJf6TKPJ388VkxSYH4OBAmfvZdc/0yG3B6K3ynoRJ
	Kie9Gv5Dt6FqDqD4knFx+cQMU02tnbDc7phR3YxQRRujB3B2bn9QwNT2VGbsOfmWsygMLY4yIkc
	d/5D52mIcclb158XOgoZ3cpDH8MmxN7DakAy2U3wryszxxCsuGpFT04cP4h6/IR3M+F2xbBeXdl
	CesZXwdy5MedZM2n7UGW0R2hjmG0UYOXyg==
X-Received: by 2002:a17:90b:388a:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3b182e94544mr1680100a91.19.1794381439520;
        Tue, 10 Nov 2026 23:17:19 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7d964sm17688565ad.32.2026.11.10.23.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:17:19 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Account for a MBWU overflow before reading the counter value
Date: Wed, 11 Nov 2026 15:17:09 +0800
Message-Id: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_231720_863953_290CDE36 
X-CRM114-Status: GOOD (  16.21  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While checking the driver's overflow handling and NRDY behaviour with
the design engineering team, the following problem was found in
__ris_msmon_read_locked():

__ris_msmon_read_locked() reads the MSMON_CFG_MBWU_CTL overflow status
bit, clears it, then reads the counter value. The counter value read is
where the overflow is accounted for, by adding the counter size to the
per-monitor correction value.

If the monitor reports NRDY when the counter value is read,
__ris_msmon_read_locked() returns -EBUSY, and mpam_msmon_read() retries
after waiting. The overflow status bit was already cleared, so the
retry reads it as 0, and the overflow is never accounted for. Each
occurrence silently loses a counter-size increment from the accumulated
bandwidth count.

The overflow status bit was read before it was cleared, so the overflow
has already happened. Account for it before attempting to read the
counter value, as the cleared status bit cannot be re-read.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 27abf60f4d67..5384c9a4a1ad 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1528,6 +1528,16 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 			return;
 	}
 
+	/*
+	 * The overflow status bit was read above, before being cleared by
+	 * software. The overflow has already happened, so account for it
+	 * even if reading the counter value below fails, as the cleared
+	 * status bit cannot be re-read.
+	 */
+	if (overflow)
+		ris->mbwu_state[ctx->mon].correction +=
+			mpam_msmon_overflow_val(m->type, msc);
+
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
 		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
@@ -1569,9 +1579,6 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
-		if (overflow)
-			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
-
 		/*
 		 * Include bandwidth consumed before the last hardware reset and
 		 * a counter size increment for each overflow.
-- 
2.34.1


