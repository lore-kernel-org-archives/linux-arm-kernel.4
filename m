Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eWkH+HKo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boNgOmR2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=; b=eWkH+HKouj5iyYxso1b5n0Gqxe
	vsB20wzl5n915v+SLwfsbYInLcnmsxknfkp8KCwynRRUAsc55bWKAZdY4ZoC8JOwqEqBveyRNoime
	nfiHL9RcrAWDIvrtm7F3VuO/N762cG1KOdnItmMIVhrgnP4o9ZKcNyx8fBqIU9APB6l7p9SdSLnjw
	+TNn5VawdMegStbN+VChS4KCYBgN0mW5o77ljDbvE9OhBq3yVJgEKXObWnA9x7Z72uT55spFu7uf1
	Mc7qpE+Kk/iafIm8Hd5UeEfwWIZcPI+Tak601CwvemGZwQFFG9vrlJ2xUrqNkLYmDb4WBCqJjRZ0J
	GdkTe17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsaq-00000006uym-1g9e;
	Tue, 24 Nov 2026 15:38:04 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsan-00000006uyG-3ysI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:38:03 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-862b3938d98so2328743a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534680; x=1796139480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=;
        b=boNgOmR2T6s+VYKPJyY7wVUlW4Nmv3JJsm4XdtDtXgFrP5ncnUASoerDQemNOATpGa
         SzjNzUwkXEbhNmoKIkrITI8gOhj8gjDK4eRVMWiZwKNUYckp+F+nRAnBy02O4MNtVKfP
         zfgr80KO9/NVhPqAt4KCIjWODzpxf9p4F3ChdrhyJxGTz9mPCy1DQQrMU8mk7092TMKQ
         NiOr43dMHMB8VskAB+s1Fuh4vJM1TlA5C4G4YFMKe49xG1KrKaeQ5dNzkVAOEHxHiivt
         xNfrm9QpgG2HWY49fGSiEVlaTTSkhzBLFueyCOW1NftiylZDxCs5Giq+O54dfq0nHkAM
         tnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534680; x=1796139480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=;
        b=C/KByAaRHdRks/Na0fs6jv+5wlaNULzSveK7+VJx7sQ6fXjMtWhu3aqMmhBER6AbHB
         RyA4PMtsxTiGzIYaABznTLGiNNn5Wd0jbwdfFK8ZX7Yd903st1gUNt37hogc2EvLDktl
         4LgzgCoKPq6p2lm9KzFxEZ9HYf872KB3zy3/KiJqX9LIXDwjHI6lGsrFc5K+vPMDDz6O
         w7u0+2hOiTZOvSjXx6Vpm4uUa8rgDtuSJqfPrQR1ETEpoFeDWuaEDKZnOBmwzJ0s6iYp
         vKBOgVX2Xp/tE7fdUohtGrkIGjhLaK+/pcPZs3xPsL1rGNYh40vDnvy5dJK9MDrgrVsI
         +Z+A==
X-Forwarded-Encrypted: i=1; AL+hErEY0/j1by7+UIz4J9KaTxXKQckC9tMUybvLK9kmE0ZAs7yMW3WhuO9APnvkaVawV+7qk3MOT2fkYPf8Uvl+JNr7@lists.infradead.org
X-Gm-Message-State: APuU4Z92VHBunsED5rFrqAgMw8nbeZr8vRIUJxQPcoE3ix97UUwl8jEL
	Qr6uqmpAuihpMGoBSt4oQhGlVCou0cqLF+9nr/kVoh2ZMdiAUp3C1JuN
X-Gm-Gg: AZFdTZc4xt484JlZyCQAsDo80S6YRL+Z+uMc1TSh26a1oBGyc+e0G1b3JM4FKu3gVIu
	7rUyQoeQKDIKCoJOgpM6ybBcHDuswegynPA8gETrcTcZPdUpkRUIIhF1vYVXJY/6J5t3V4XS8gz
	ZEeibVPQqLbfwPkss5spSkzeGI1Zxh6KvG6Mf5kqdmW5zXQHxVhmFN2IK8xG7lEiJh9omsF57I1
	5PkErRsy2TPEVNi2XcBZJXe/LtxhFPMawQCNpL8davsPn3BvQ2OnOjRbd/XeWfx3fYUOW3I5O0g
	+Ou5z227nAkRnyiBdX459gndV6DW7VYYcmAAdU5ZFUZifBER3gBYVP5Yt9hxQIgz6IpocvDdvx8
	V+FRNysR5XYL8gZQyxEh8gLcIKxcvOTiT7cDJraHyg++w/DcIwCfFzuxdwzIuihIHPbUeTkgSoF
	l0KkVHaY/NTAWsqPaQMIVqHkMLaqzOlyYPjXKzIn8mPUNRlDlEDTLG39wZnL0ueKRvFfDDfAGNk
	u77zTFs/FBiBm3epJGxPL+YqtgY3A/A0slN4a0I7ipeVbgc2l3WB+DuAtSdhkifBlSt4NrUwpij
	auVJ4puKygdNoV5IPlTYqPFGtRy0EW6JYqJ6sLOopLjYwnHVfnflM2gp9+6zjNJmwuFqsCZ3tjw
	H/OkqSgH0k5h82o1Japx0vao4fW3otc/faIp4Uro8gmWWQohHTw/bqvW+kUQnEB8AI3QAIPuL1p
	EjPITUT45P2JRm
X-Received: by 2002:a05:6808:4fe1:b0:4fb:bfc2:1a64 with SMTP id 5614622812f47-57a0b44cd17mr16836640b6e.31.1795534680520;
        Tue, 24 Nov 2026 07:38:00 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a347636b9sm11718810b6e.7.2026.11.24.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:37:59 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: vexpress: Fix device_node reference leak in tc2_pm_init()
Date: Tue, 24 Nov 2026 15:37:35 +0000
Message-ID: <20261124153755.338370-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_073802_188316_9B5E3992 
X-CRM114-Status: GOOD (  14.35  )
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

tc2_pm_init() looks up the SCC node with of_find_compatible_node(),
which returns the node with its reference count raised, and passes it
to of_iomap() and irq_of_parse_and_map(). Neither of them keeps the
node, and none of the function's exits drops the reference.
tc2_pm_init() runs once as an early initcall, so this leaks a single
reference at boot.

Declare np with __free(device_node) so that the reference is dropped
when the function returns, as is already done in vexpress_flags_set()
and vexpress_smp_dt_prepare_cpus().

Fixes: 11b277eabe70 ("ARM: vexpress/TC2: basic PM support")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no TC2 board
to test it on.

 arch/arm/mach-versatile/tc2_pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-versatile/tc2_pm.c b/arch/arm/mach-versatile/tc2_pm.c
index 0fe78da0c109..0e471a76bc98 100644
--- a/arch/arm/mach-versatile/tc2_pm.c
+++ b/arch/arm/mach-versatile/tc2_pm.c
@@ -202,15 +202,15 @@ static int __init tc2_pm_init(void)
 	unsigned int mpidr, cpu, cluster;
 	int ret, irq;
 	u32 a15_cluster_id, a7_cluster_id, sys_info;
-	struct device_node *np;
 
 	/*
 	 * The power management-related features are hidden behind
 	 * SCC registers. We need to extract runtime information like
 	 * cluster ids and number of CPUs really available in clusters.
 	 */
-	np = of_find_compatible_node(NULL, NULL,
-			"arm,vexpress-scc,v2p-ca15_a7");
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL,
+					"arm,vexpress-scc,v2p-ca15_a7");
 	scc = of_iomap(np, 0);
 	if (!scc)
 		return -ENODEV;

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1


