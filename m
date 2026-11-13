Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEBC60A263F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HUn+JKC2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHeTCftV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=; b=HUn+JKC25ghqS4
	vEGYvRoHpDEYU/yZye+CNhjVFfsfW2GmnQvlPYIaHz64w7hraVcy1pJpVdurWjCxcm8psLHVY1cQ0
	VzEBoBobgbXLWXV8aD7tq2fb+sdbeMwYCHVEWtCGDoDfVguvCZMk5Ue/2DkrYs34hokOm4gzFnAMJ
	Slkh9QSyb07E+pcO2d/UcHaLQyDZWCQeKTlts6n7pLB/idXaBO3gb8fo0lbPUWfx4i507tNyFwuZD
	OYgL/ens72S4gM9LyIs1NEcaZBOJRgp/88vqzX2Ty6kD3CAdXwPAs4WwejU8my99HWtufs8CxRGjK
	sv/DN5r/0hrfar4pVKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRex4-0000000BICC-0Wt2;
	Fri, 13 Nov 2026 00:15:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRex1-0000000BIBA-2loe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:15:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so336579e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528929; x=1795133729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=;
        b=fHeTCftVWbBCKSEzEn9cBPF+47bS203hmVMaXtWx/NxL5KCt9X0cUDEXHvGiO/wOtQ
         CVzhiCRrfdxMhbiMGUuxJu8hJeny1ycP3VfWHpycqcaR1JrWPh/9KN2pVFectDwj6hrP
         rYi1NzIv2jFmecyLMkkDv8Jd5xGNphxshmTo5/Y5QN8e8nQa4YeTAJoHR9Qe4kr69rDG
         EAsvBRGk2/Y12/cJ3NfPSG4yOvX46OKmmZaRGzpVs6Bnc3Kt6oEpFplVI1bb/Zi+XqaK
         q9KEkmqbEtLWbOpHu8gmUCiBahQK3/kPGkEFYMlheWg1aB323WP0DvbsKri1t2RUxR4b
         ++zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528929; x=1795133729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=;
        b=dTpwSvGYbwx2OfXVKnMwoSHoTNFdd7/sI50gW4SuymD6r5M2SeVUaHZzoUOsJg+MPk
         JQUd4xKiN9XfgY/Jo724gkPdPhuZ2s7vM3uJXoizhwHsSmPyuhRwr4zH6vvof+bnOfhD
         xG/y4qYE5qq2Fy+gJWV+SmeXRgJa2iXqtujXX0XhQTu8bc6C8uljuZkafT4p3N1Le5cP
         fhaQcBX9RXbtwOIABerOafr111N9K3nbdFaYooIie2WnZaDQNgV6wgWv0J7CAVUOqk9l
         k/qhn+7mXB/B0QTjV1teeP52ocsk8giVdc6aryyr2AsCF4pyNejifucIlliATxNrME2e
         fksA==
X-Forwarded-Encrypted: i=1; AL+hErGA3rgfDGh7Swogcl+qOJz6RMWfik75zM3FRkJJ+Q9DlRmG07JSqbxG4xQ5SoJZ0bQMOTJDaDdV6bkg88A2YSP0@lists.infradead.org
X-Gm-Message-State: APuU4Z86fnv2mFdEHWeOca3N1XEUbinTc+cZJF4YlKL0N4Y+0WjHxovm
	xDkLm26QRJ1ELQLSXreO6wB4nxsP+vtsDxYEyIhlGRSfCCBBZamCbfEO
X-Gm-Gg: AYBFou2vVAL6MEjAn1goFiX2B+H73N9SAkk8O/gBRpw0nLU0Y/qStrDHLpOR8/RlDr4
	cpK/hcOrJBn7nmJsRhtiWZJrt3wHRoaooZZ2GkL6LvgoFIe9FGKfpWNs8wXochPoFPpR5ukmZ7p
	MJN6F+T1B+vS2mOEpEDVcTkKQrIdBHm2shvMZj+q5p+41XHlrC3iHWxmCyNrwrARpMRjRyAcdDV
	P0UdsLkDsATKh18FH+yatE7cEJkJPSSerFjddkYPcv2COvhirDa1YApxrS6u0mQDw1qjYjx7PUa
	wOulaktuYxuB+XFv/M1JC8NbrVp14xiJNBYpb8d38/tSu5S44y62zUFZxjHi4BGG3oM87/dQQlO
	MyLBbUGUZIyWvEUJRoyHmHmxQoPAvwY4hZvASTCPS4xXqMtO5dmK3gyKhFW6NC0MZkB2nIwC6+T
	srgtUUqQJdW2G8zmoN0aMns7zxHk8rDOPi7isD55DaHr8exk+jKOmm92KrIsMhpzKG3YgI+55W/
	1MH9RFCbLm43y1kMzAf4bdnLWqf1rU+mfiZvZOiLgf1yXbNmd/Bhqva0QM3RMA/56/gSzGfgBfT
	D7e9M+GM8NqoR7yIyWtjOIprw3pFOYywmsxPO2sSOe4x9kFJk9z1X35o1mTNSHXWiBejZKoOCXQ
	oQ8Fvko8w0Q==
X-Received: by 2002:a05:6512:668d:20b0:5c1:56f2:fdb0 with SMTP id 2adb3069b0e04-5c1709ca3e4mr259536e87.34.1794528929374;
        Thu, 12 Nov 2026 16:15:29 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/10] drivers: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:14 +0400
Message-ID: <20261113001432.128201-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_161531_739001_25B2CA4B 
X-CRM114-Status: GOOD (  11.98  )
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

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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


