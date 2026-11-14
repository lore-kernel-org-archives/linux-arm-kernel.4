Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3863860A2614
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2cvt7kW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckBje+Ih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=; b=U2cvt7kWkvAQ2+
	LHzb0wG0tx5KgUcNb3g7esAX+Qx0hvG44rJ1W4LnggjajAlMXNcy8bSXB7GqlEGHbJNe/Vmu6hQ6b
	o9dlutb5plnXNjyRoWMtA3IUe1Z96RQsuxYZ07vQZhL7sC4cAqASAP4mEKkZ+Ud9hjFhhCr+gCezV
	OL39qZoSGKpuneCJF9aSzMZ1B8V8kNZMthPTgmMcjtrJBXwIbiDusq1lGlVd0pmYFMe5dJ4hgl21E
	JT7Z5EeEAqcldQZFWizO/0aklFH0m3OcorN1EdreQWc84GCGmjGyp8OilUahGkwbmrGmzDFsfW+nm
	7IacC5Xk9CrNuXDHL58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3o-0000000GUtF-0Chz;
	Sat, 14 Nov 2026 16:57:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3l-0000000GUrv-20DL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 16:57:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso2812193e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675419; x=1795280219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=;
        b=ckBje+Ihw21bRMIR4EGsDgqa1J4ulvkoJMNmuBCRmMOxGJAOU553ioUsHpVvDvDr88
         CwlXm8WMRmdfRzm1W0GbWKA0/NjWpxd7wxLNZ5x6ca32KVVAUxaSoDG+11pOGIEreVyb
         +ZWcWWctkCXDloc9XYPQ+IuMD3eb0ked0MiFnVZVYvY0bW+lJDsVsGJJiYOVf13pIyay
         i1TqvSKwCKPA9jFUeb8hTWxNGHfFJNP42EV0FkerLn9aWtUK8NN8CnHQuxIoypppRWOg
         eADHmWcZrTsu5OAf+OFs2iHevJkDqM4sCzTv0A33bzfJc+eqkWBIMHU2/GCBVp1LCCjj
         GYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675419; x=1795280219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=;
        b=IlK0cKXpNC7j3N+IfXjVRMwCzMVnHrF7ItVl1YOhIb5ie2lz0QFl0PBLZeRALcEvfF
         iPsvo/sKg5rSE9K+o7d9tkZzhUJxVQRIqKoF+MvGpYVdT9deyOLwm+n7s3uQQmhg7uTf
         V8Sy2FVr5Vq9sEhpF7RsuLCvW/f5Xl+EeRoklOWryp9+yshFtXKhgOn5A4BKggea5D4e
         zj8R0rAnxlFT3a7XGnRlLWxZdxXl8qCgP10zIHro+Fdz9ubK692M+unmFeBkTxXU0mN7
         jzznZwbDPZ4rwr3OSmqkS3px4ZcfsjUGJ9IDEJQyzUGdsSktotBQFkMwPJzxgj5QEhl+
         Wsdg==
X-Forwarded-Encrypted: i=1; AL+hErFSnrfRMcBb2miudg8NZfMFTaE+6IwVqE7acBTCRFIPZGuAOfC5w5Q1QVGLA2inuQmZvqZvz6X9kHdLu/hv1v74@lists.infradead.org
X-Gm-Message-State: APuU4Z8QqXROtYCDcXP1Fpi7gL+8ugV3JEWgTKtMExIkeHhBwZSsd2aW
	VGLogXbbzrR7f/rCf20eSaPo2caTsMF5I4IlbBH/6v+0IuxtZkx0jsPn
X-Gm-Gg: AYBFou2UwROtkf8b9b5wRTysAH3msOA7BxOx7LcUmHYNB2r8BOu9AVcnCM8MdluNxUd
	vlpEZ/NCGh0s/mdDoRvCdnPAWECIujzK/AHHGJ+hj5YIdpq43xGQF6I1uaL3Jv/r7K+yGPMH0m4
	CyVmtLaaquGeq1RIq5YGvWOwRR4U+pqgmB5NzovqAZ80XbPWkriKMf50H2tSENrEE8j81FM+yfj
	r1CYu+qkNuS6FKVw7S37ka44veg2CrPBD7tkMrXKuqnsGlDE4b6M+MTUNJ2GQJgX4ENpXxHjjHy
	kon1DJbwoBAKFIHdxPGAFHM8hI48WWVWJAT/RmMUGjnWRv6G0CJ4MclFO/8CW/4ip9yu2YqG3t3
	Uc5NXOAN7QH3FugoFLla314/uxgQUl4K+7E8f3NPPgKmrSsaFrUJG1bIegKqnERcc8/HgqNUKJ1
	QuutgZUgk7NwxjNBoAA5VL0nQqBRn3C9uDkkSPKs/aW9gR2OAXPuctgx2W6JdqP1JsTLaXKSsvi
	6o/YznDRwnBiAYvqIZ7zFbusvnG43UycF+s2OGnOX2ve/EIzjcNpsx9/+5XccAhJimyXbh+/CWK
	OTqHZn9K+9xhEwNZBgx9zaQTZEqz+EGwxFElH046TSK/YYeo4+C7C7uiLn1Eqc63MebAruaYF4s
	8cA8F51dnJQ==
X-Received: by 2002:a05:6512:3d0f:b0:5c1:5457:a147 with SMTP id 2adb3069b0e04-5c164eb81bemr2979307e87.32.1794675419237;
        Sat, 14 Nov 2026 08:56:59 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:58 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/14] drivers: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:48 +0400
Message-ID: <20261114165612.368785-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_085701_542725_03A10387 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -1.9 (-)
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 drivers/soc/bcm/brcmstb/pm/pm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/bcm/brcmstb/pm/pm.h b/drivers/soc/bcm/brcmstb/pm/pm.h
index 17f7a06a7..041b7ae96 100644
--- a/drivers/soc/bcm/brcmstb/pm/pm.h
+++ b/drivers/soc/bcm/brcmstb/pm/pm.h
@@ -64,14 +64,14 @@
 
 #ifndef CONFIG_MIPS
 extern const unsigned long brcmstb_pm_do_s2_sz;
-extern asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
+asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
 		void __iomem *ddr_phy_pll_status);
 #else
 /* s2 asm */
-extern asmlinkage int brcm_pm_do_s2(u32 *s2_params);
+asmlinkage int brcm_pm_do_s2(u32 *s2_params);
 
 /* s3 asm */
-extern asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
+asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
 		int dcache_linesz);
 extern int s3_reentry;
 #endif /* CONFIG_MIPS */
-- 
2.56.1


