Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 05:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LKRgjq45;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7P2LBFF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=; b=LKRgjq45E2qhewL5D8uZjbS5ci
	XkECehTQS0JfWqRbCq2o/moVg3wrMyJUlarpF1gJ3QRL+Hgs+OwkRabob4KpQR26uJYupAlvXNLk1
	VPqCa7Zou+LpwBzY1mhthJjaOeMc/b9yx1SP97GawdoS4ufqTc8jv5WpHUtcoPJIjw4yxbAQBFZP9
	0SLJnlz/dSXz2grXhrkrgBSA3immnJ6NTsNE6pkO3jt7mfAAzxe0P8jFahUQw68BTqu2xVg/1+tPu
	mk7mXc0xRcIQ1dV1fCUTzeholOypUPEaFpydxR7ExvTlPd93cASWTW3TotQVlcwa9ZWVsW5fwy7pU
	px/hC5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5AL-00000008RHN-1axn;
	Wed, 25 Nov 2026 05:03:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5AI-00000008RGo-3cR4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 05:03:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2934937b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 21:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583009; x=1796187809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=z7P2LBFFfS5gtddmAGX+GCJAMyayfkebZCUiiRvMN1NFfqoRjb+IkGcVYMo434o3YT
         m3WkaibIO1HZi4ebLj97FY3FvopvHFCYMCNutuZvsUE3MDrC5MpsF3radDpYHV+sqsgi
         63w1uUauveQim/K1guNu8UM1mPuQWuOwHegUS56xFuQAdkbeqRyLLRWQ7wVi/TP4Fd4L
         vaIoFkmmq4NkdUEaXM9vG+IA+0AD6Et2kbixbL61zZQ/b//W4DXfWT5Kvtl/NHB7G2xB
         1IrYfHsxAjC116i+RRwhSoJ9tTcb1mrYsJCF8UlTzget4gplQGrNvr3nKUiCvBdXkgRG
         DT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583009; x=1796187809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=0n9moexbfjrkGj6IK3xyfbAoDVSbcHUBh4wK+X/kaoJ5NJ54x1Wef3KjFVkZn41jiS
         dYFN0KycCv9c2EB0WU9zxzuQpPQukjQ8aQR2kPAL67i0qE7KGH417LGiSyoBTe5Bt2L+
         MaU4oXlsuaPB9nxf8pZqF5vC7eGa2sZzKSxn96wgTh57jcMQQpsfD0UeXJIGoLb0OQ/h
         nzM/OSrpsRmhFBCELcK8Bplgk5X+BAYFGzgn49MrSenkDGJ1pNvY1aoT98PWY+ky2HvA
         ac7Vgoo3jTshehKc9DqBY7XYI68kyZ4r4vT5vXie0BbrVbEkj0RakxGV2ez5TXX6wWye
         uJAw==
X-Forwarded-Encrypted: i=1; AL+hErH6RnHB6yhig58kN0CZ/BEitt6eUtIkKrXTjCgDmOER1gFKZp5GUKpovArXtFHSDxhwy/FwnaG7bd7wBVjnoGCE@lists.infradead.org
X-Gm-Message-State: APuU4Z/ld0FqELVZqQSr4HjlSB9NKuRoH5Sq92LxPNDR0UEBhe0kadRW
	uN82n03fc8wt9m9KWrrj5OuAwhNCcJnTpiwhfjRsbEzP7Ci3x1j0DCls
X-Gm-Gg: AZFdTZea07Q7dFPdlDk/cFn/xMTZ+fte08qaHb1w3k7nt89QAlgimv1j+s5KzhpnbKK
	ksLcoSKCVdSK+b3iOGg5IPI0TTv5YFbARpsdI7RWqzsthVSu5Jd8juaAfTclPCelq4WVX3W1GBF
	k50dUHyBAMNjNkydt5TVKpvxZSdm0m3I1DCf52d59PZd0OMCiW/eBYhxnZBBnI68/Q1bF2xZWAY
	fwmbmpeIkVNALMROvTm9po7OVmpxbpQR3phXmVWzWj22r/y6ZBBUzDxWi70Cap3darLVHaV4TBm
	dQcKBeQQOEW4QHZU/UyB/ZS9bKBUQ8k9djMmceu8Q7v6REQ59YsrJK/oLpHW0aWKo77UdEodbFt
	ViU5LGkxiba2lqOFsl9KukcDfOv4lBKg7LcDdibo54il7MCEHid/WkzO1H2sxDYyiDg8lppxUDe
	BSEtJPKNeqM8CnC3aannjTSbAmgDa9RR0ceDc6I9S0SiPJH3XN+n72aXk/DkOoB5gKkVo8DSH+C
	YHhHf5Lmot3ny7yfD9bd/SLHFApbzG8EGCqUudNR0yvWObNlU4Ff4xXVMh4zzBz56XGjWf2g34u
	FAKAIy5i5PNdQykFjBIkCne8SEbKe1QQL3s5ey96usKTi8gul1cVpVpEDt/gXybCXLCqpWuh32N
	XKfzoW3hEuLfuX52UWLpMJLcnKF/MCshRdnt6UMoM
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:9dee:42cd with SMTP id adf61e73a8af0-4014bc4e175mr17405476637.36.1795583008860;
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm8180394b3a.15.2026.11.24.21.03.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] clocksource/drivers/exynos_mct: reject malformed local-timers property
Date: Wed, 25 Nov 2026 13:03:23 +0800
Message-ID: <20261125050323.83620-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_210330_923113_A921C246 
X-CRM114-Status: GOOD (  16.69  )
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

The samsung,local-timers property is optional. When it is not present,
mct_init_dt() should keep using the default local timer indices.

of_property_count_u32_elems() returns a negative error both when the
property is absent and when it is present but malformed. The current
code handles any negative value as if the property were absent, so a
bad samsung,local-timers property is silently ignored instead of being
rejected.

Check for the property first. If it is present, propagate the parser
error or reject an empty array before programming the explicit local
timer indices. This preserves the default path for device trees that
omit the optional property.

I found this issue and reviewed the code change that OpenAI Codex
helped draft.

Fixes: 47dbe4eb9822 ("clocksource/drivers/exynos_mct: Support local-timers property")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6..aee3d88ad3 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -645,10 +645,13 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	int nr_local;
 	int ret;
 
-	nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
-	if (nr_local == 0)
-		return -EINVAL;
-	if (nr_local > 0) {
+	if (of_property_present(np, "samsung,local-timers")) {
+		nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
+		if (nr_local < 0)
+			return nr_local;
+		if (!nr_local)
+			return -EINVAL;
+
 		if (nr_local > ARRAY_SIZE(local_idx))
 			return -EINVAL;
 

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)


