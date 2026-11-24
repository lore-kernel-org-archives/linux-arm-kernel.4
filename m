Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0FB606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZNcIO4r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdHpSHge
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=; b=hZNcIO4rjHsBBvslH3MRHGE/Xz
	AODHRpPBP7gbmbVzp7Oji+Vc7QgkMpSjYkA5vGQqDLYylJ/TrTR5e2aeaB3e1dtUTlL6DV2sacYqF
	SkrR6TcTCXBsZ4aHoApQk/3D4TQxTx2oqDyLgPeeANo6Omy/pGq90a27a+LtCqHFCqKWnnJdZflGM
	IqrRU+lKl7wYxwPEkkIXlowIHHOPc6HgVK4qgAHsD10WDG2sZPi8XpQUzKYdBf5jUsB/EHgdLliIj
	hqiWMGx4eZ53nvHtAzo5EyfO81wap66S3o/0YaPTfP2ir5s6E73XrJmANFwUt2RhjXt7DdWffEoX8
	a6PEovzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsA0-00000006qvO-1hqr;
	Tue, 24 Nov 2026 15:10:20 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs9x-00000006qth-0wX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:10:18 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-451a49abd8aso4665918fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795533015; x=1796137815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=;
        b=fdHpSHgecDjQyVNDdvQTNSKVbOMGfDEHRHcAgxvpDno8R+hQn18qrfJyPkPgZZ1k05
         E7q47H7XJPpFqWEbDYxi2s71vmhTyeZ9gkKbskjUgl+nuathLnXUxuorUqeX6VbGaD5i
         KmnUcIlrKEJq2tGt4+gyWpq2x+DCZv9jr/gNe0YdJzTjTHDhHkDpimDeyF8IFkW8f2Os
         tg81isxCjLi0stz8BGY/OXOeJtP4XNRWN9Iu+oVs21AZRDsHKl9M5Y2Vw2lzwG1VgKBV
         1b0FZo+s9cPsg9T+7/QS/vXsUobdFeXN9qoH1DJSZK2LX/pdM0iDNyFYsbjm4c6mA0UW
         aHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533015; x=1796137815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=;
        b=U2SkQWYe2bxgF6IO/+6ov18yrmRnvleN1t1X/1A+1X/r1IlvG+XLaU61V0JPDjfiJj
         UDd2GeapCrObNAw7aanMorIa7mVOmblEikds1HWWKl8BzABQGQp4fjWhfQuFer6OjHiA
         kq0Zn/xMbQacWrDstprTPf1lDVbHeAl/sm7ltcs8c70vTAd++EFL4TFyOxGdzWmiyOsd
         Hud7wu7ummthOQUnu0cNa7ZGeyagsrJvu678OjEjylWB3LYmUqNEBK2RY/z5YC5t6ItD
         +dZ3r/BKvMkvbSThjgMXX0hfZ7Lp9kOKBRPgcr0ocFKv2noALW85Rt7sTfb8FMLVprzp
         xlqA==
X-Forwarded-Encrypted: i=1; AL+hErEHJQDI7wsXwURe4xUpDl4z4HN8sn544airuZyi2HcToDCaH+Kjsc7O4nKT0VZA5m9BdhLP80OCfbS0YFgtWRLC@lists.infradead.org
X-Gm-Message-State: APuU4Z+d+ctcGhBPLaDC/UmK1AdDDpcW4oWNjINUJaU/76z+VE6ZnsYp
	x0LaNhZX/VYF3pgiBxXAyIAtdKWIUSS5UGAhb5wW7b4I5pCEFjxdExOE
X-Gm-Gg: AZFdTZc++/71dTDMHhKW2ne/EgfQPzKRU26NcdjBFAxiYsdnXwLp3jFtvwwJFnxTIyq
	gFOFKGGvGOdr6DSj855O/52fc2T2tLeTDt3clf3zauU1/Cg0pT2Q/EuQ9LV9Y/pNQIipRkWFDOK
	UfA3O8LGS8oqrIwiIg6Cus2J2F6BZrVteSOEZx/X8mWvckwiNQpDdKRKY9I4eCKhg5+OZXLqnuN
	ovP+prbNDJIrVrfUnbfRtWA7wwQOEBvXqmaJHsTqRVCy41VXtcE/bq2WNkYpvuz2YvEeYo82TpA
	zUnWa7klwECEl6LiXo4YygeoJN3kFcr/k11+ual0j/7dWTnVxKLE1pnCMj39JoRSKF7q2vwlRVB
	G8SLdpWYUw/oWsduS76jBCpahRXlOoAF601hR2gEe0yi21izOhmsBzWOqI+Y6JTxQtV+R/9sA5H
	3Dq67eesUjBv0pgwn8yHJ/K4igbA/CIoy8HDb40T987rI0IHN6k9YL2pmHEC2oUU/Zn8cs8W3nn
	HMJ7HdIVgQBID5oH4QcHX40040xg4auS/Q4P0hwxXAKiG9YRs6/u35dyyAxbbQhrbcvH/Gpp8gy
	UcLXcYcVEzENUH8fmh/uDLUZJ0wH+mwWokRzzUYTSVl4AGG8QXB9AQpobayMs9B8VLANJ9g1qGM
	s7OSa4lMeuLE35clyk6BLjdID3ONfcP0y90XiPquOeIqCcUigNQ38MJ1/1/PWn97oWyg=
X-Received: by 2002:a05:6870:b0d6:b0:43b:b245:30ac with SMTP id 586e51a60fabf-4bc81aa21f4mr13572490fac.16.1795533014780;
        Tue, 24 Nov 2026 07:10:14 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm14404091fac.16.2026.11.24.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:10:14 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Pavel Machek <pavel@ucw.cz>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: OMAP2+: Fix CPCAP node reference leaks
Date: Tue, 24 Nov 2026 15:10:06 +0000
Message-ID: <20261124151012.333306-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_071017_294540_FC130547 
X-CRM114-Status: GOOD (  16.66  )
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

omap4_cpcap_init(), cpcap_late_init() and omap4_twl_init() call
of_find_compatible_node() to check whether the device tree has a
"motorola,cpcap" node. of_find_compatible_node() returns the node with
its reference count raised, but the callers only test the returned
pointer and never drop that reference.

Put the node right after the check.

Fixes: d44fa156dcb2 ("ARM: OMAP2+: Configure voltage controller for cpcap")
Fixes: ccd369455a23 ("ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC")
Fixes: 7397daf1029d ("ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM omap2plus_defconfig, W=1). I have no OMAP4
board with a CPCAP PMIC to test it on.

 arch/arm/mach-omap2/omap_twl.c   | 10 ++++++++--
 arch/arm/mach-omap2/pmic-cpcap.c | 11 +++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index d4dab041324d..e103088bb34f 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -213,11 +213,17 @@ static struct omap_voltdm_pmic omap4_core_pmic = {
 int __init omap4_twl_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
-	if (!cpu_is_omap44xx() ||
-	    of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	if (!cpu_is_omap44xx())
 		return -ENODEV;
 
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (np) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap4_mpu_pmic);
 
diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 9f9a20274db8..2f487ad41685 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -238,9 +238,12 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
 int __init omap4_cpcap_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
-	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (!np)
 		return -ENODEV;
+	of_node_put(np);
 
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap443x_max8952_mpu);
@@ -264,8 +267,12 @@ int __init omap4_cpcap_init(void)
 
 static int __init cpcap_late_init(void)
 {
-	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (!np)
 		return 0;
+	of_node_put(np);
 
 	if (soc_is_omap443x() || soc_is_omap446x() || soc_is_omap447x())
 		omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1


