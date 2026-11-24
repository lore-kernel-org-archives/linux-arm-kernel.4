Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n261ZKyD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KLDsE2aO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHkSH2Tv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=; b=n261ZKyDUygdPJ0LXxQC10jDmZ
	2Qcg57w3mOdOy5kt0n/K6XyZziod3w6zV0vQL4dQV810FDMrUDNO4r3+vsoS+Rab83nnjx87TFIYy
	Yuk/rmdRhww4DleH+wBwnYVaSYlEewjrfOwGLb//uLsMXWigcmXOYBlWmYu9dzsACQnUPGeY0KlHn
	Vyr8ZpjtxO5O+6hfB1Bnnr1E55j+As2z8V5fol27H+clZy80q1auATzcDhTs/JstWer1AOPPQJQzK
	KfMyKu7J6/4DtpsAzm5vfK8a/MhbceIH+9J6Iin9KZVma4Zrxe/nPveUfbuRY0t/wMNgPxp9+q5S1
	anA4mp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsv4-000000072aC-2Ekr;
	Tue, 24 Nov 2026 15:59:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsuu-000000072Wl-0E8T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 15:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=; b=KLDsE2aOpW5L7c1nlg51hxrY+p
	vhmQPNPAFvunYll06ZkC6Nu0QqL/tjoadujUP/s5W4pNAdKC8jaXkgvamXdrptrCgQHOCktimmRjS
	WDG4cT6E9t1IpnbxHornX61eLZ1fP5hwUszTrAw2CcUyP/0UNAlTbgCmFY9E7a0P51RUBy76/H1Kq
	tE+nWvH8ZhWRmQlGYI2VYmeJH703JggSiZcPZ5CHKH24LWY65Wrt0uj+XBM4Kxuaxqle3d+dQrvK1
	B9iwM5EY5a3tuNeZ1HwimalIT5QphggDq343+hNodHwp4Ry1Wvz9EZJUyJIu0lj8TateKE862pEvR
	9K/qI9cg==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsur-00000008QU9-090n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:58:47 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-862df509d48so3688923a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535922; x=1796140722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=;
        b=AHkSH2Tv4qohfY6De77WKaHEBPAIClWkOxPnhuRoPq9Bj9goqibvc7kIZQ12JbeA0l
         ykWvzAx1x2qXLs+THFYl0sIemIqq//0jj4EheYbYCWcppZIiZnEVrcsRfcRpaHa1kAMO
         6ezegUzxreR58RZjc1b7cUajRBTCFEOsRrLfZPuyXNHOkqXX0VZK9LmlaKp3tTIY+EbU
         UKn8QK+FF93kBWwz/FPYzoZbXivF9CvFmfNisckgjGbbaOoLAsWP3VYacBSTuGcYz8Yb
         0xGAEaP6J45f5O/vLiXXo6tnk4X3q8m6WpMudXbn6vx+WP6yJRlNs8q/tE1qPPe/V3+P
         /DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535922; x=1796140722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=;
        b=HaHJ9VB5Rxm8EkoPYXhVBOwr9J3TUP2zLXXfX7fU58HUxoErjbo3FxyqaWYoJebWvZ
         iINwVkOiKFVesWIpBIVT4MHhmp8jdQdYQMu+D35DhbJOOpCjpNEQTAor+q4RkiPNzDB6
         PmV7VK0VOMbQA1vNz5WtH3AIoVYhuIg2KGaLXu81vXI1HMDaMCLFi8BbgaUs922rI6NV
         sFMsyq3H8Fu8Mf1Dkh8xALbD5su3RUZ8gCvaF/pDMKC3vZz7mQS8GThvmrkJbBG9vBOh
         Rw9NJgRAhL/zX/mS8ixXQwIZbEPJqYheHekexOstEWjMySdBKHQv1P7Jmaop4vSsH8Tj
         4+AQ==
X-Forwarded-Encrypted: i=1; AL+hErFACrThogPLN2hQpPzVgUqmxpPHKH/8f+8HKtrJ/zN12ute0uGIYZS4aDXfUaYX7UYriyO11x5aqDB8wvZYeHUe@lists.infradead.org
X-Gm-Message-State: APuU4Z+ujchYRTmC7CxLo8xBpsifL3zKInIyoCFVyznqEzVhZfHx4KvM
	qAQoMCTGVd/VB05XhywwpU4IyUQPwd3aff8OuoPy9bJGgXUkWscn7ZJL
X-Gm-Gg: AZFdTZe8CEivCzehsFn6rZKKCRcj9hjPHRbxosBUAA4Q60Dwn5t8mXgwdnZQLBwYi6u
	CKE/nruEU6iYAAGN/nm8AXEJ+Tdi74R1VSaWNhlt23aB7srnaCwjf93Uy3T2oRGpeehW59Q70jx
	p5wrxQC/sOdj4zAw08XW+YJUbP9yRWbk/H0o4RVMxPM4jy4r+bcwVBrWojEhz/xD8jdx6L0pMT6
	/yFPdqRql1N8r4ETlFCB3wlHKfKr/rmjY5hwV+G0YeIdPKF+2bnsLtVp6pO7nFsgr18gYr5cZ5H
	/Qk582f5bKkFiHaYxZbEX8PLhLIoXuZVRAe9zk7Hh9N2PhTlu1Ff8anv2pGtKIavpPAc70o6E4S
	lRk+p7+r2PAma5AUTbUyJbTcgHZgNeA1h2pbj2p9O/wNGuHhoNZBtoY8MyAEwxa3sAmTX3u0smq
	s6TIEdVG4jbrqay66L7N4W7zB68lGQzDXZzbzEkrzqtP0QF/6tTUqbVVwBay5cjKMujJR3eOMYK
	PjoUOfoUpQjaxiEzl6ywzpcZjbukW649qUii0hLJvAvALQ9XHNDhCQx7FhXXRYixK3+ObsQq03Q
	R1jC5kSTNyi/ku0JpGCk9qIEyoYXaVDBVFu+1uBD3pqtj46u4ja3Rx5vS/5fq26q/vjWVAVpruX
	eYRFoJROAt2Py2Q4hMK3UQ6Nh2NsMY21rjEVzVD5loFBhyGDvUCHnZIeagI8IvBtMkn5EtXQkQX
	V1QZ7/dkkjB8D3
X-Received: by 2002:a05:6830:310c:b0:862:8871:5bd3 with SMTP id 46e09a7af769-86309309ab8mr13573667a34.37.1795535922312;
        Tue, 24 Nov 2026 07:58:42 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm11128168a34.16.2026.11.24.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:58:41 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: vexpress: Fix SCU mapping leak in vexpress_smp_dt_prepare_cpus()
Date: Tue, 24 Nov 2026 15:58:35 +0000
Message-ID: <20261124155839.388319-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155845_109343_ECF86577 
X-CRM114-Status: GOOD (  13.43  )
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

vexpress_smp_dt_prepare_cpus() maps the SCU with of_iomap() only to
pass it to scu_enable(), and never unmaps it. scu_enable() does not
keep the address, and nothing else in the vexpress SMP code uses the
SCU, so the mapping is leaked. The function runs once while bringing up
the secondary CPUs, so a single mapping is leaked at boot.

Unmap the SCU after enabling it, as hisi_enable_scu_a9() does. Also
skip scu_enable() when of_iomap() fails, instead of passing it a NULL
pointer.

Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Tested on QEMU vexpress-a9 (-smp 4) with multi_v7_defconfig, on top of
8dac6df92a2e. Without this patch, /proc/vmallocinfo still lists the SCU
mapping after boot:

  8192 vexpress_smp_dt_prepare_cpus+0x28/0x54 phys=0x1e000000 ioremap

With it, that entry is gone, and all four CPUs still come online
("SMP: Total of 4 processors activated").

 arch/arm/mach-versatile/platsmp-vexpress.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
index b810ad50b98c..e373d75653cf 100644
--- a/arch/arm/mach-versatile/platsmp-vexpress.c
+++ b/arch/arm/mach-versatile/platsmp-vexpress.c
@@ -64,8 +64,14 @@ static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
 	struct device_node *scu __free(device_node) =
 		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
 
-	if (scu)
-		scu_enable(of_iomap(scu, 0));
+	if (scu) {
+		void __iomem *scu_base = of_iomap(scu, 0);
+
+		if (scu_base) {
+			scu_enable(scu_base);
+			iounmap(scu_base);
+		}
+	}
 
 	/*
 	 * Write the address of secondary startup into the

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1


