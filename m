Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D560A261A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUT6dFj7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfylJ/TR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=; b=GUT6dFj7SwZuo3
	yTZ0ZHM2sK1p7mbWDxnlBtXEZd9owckXgZUitb5Bpj8LJXoktCSFTd9COwYAbAhNtPNtc0U1rZbkI
	enbAnwqWimRfjHJAY0gQFhUNPLA7gxXuzyLYbRg14/XXmhjBjIYXOrejENDPDUqHNkRI6OCP7eukb
	r9S2d1MDEbS6h12gevtezaYc+zJ0os2psfOj8qKIEM43/5THJdIkQU1tCLusV+NUcp29isBtM8w1q
	r1wLYq9Yo5tZY9CJKDdM4hiDr7iwbMIJZhY/y8IIO71g88GBGrZAHJGg5lCbIv+4xpvoTiEmDMC9Z
	vFLldZZUBDTKzUaA8g8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRflG-0000000BPQp-26cq;
	Fri, 13 Nov 2026 01:07:26 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRflE-0000000BPPa-2NJV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:07:25 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so14274821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532042; x=1795136842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=;
        b=qfylJ/TRCBBGNSP3Gfk479gGJLafZUkerRcwiZfPb8dv6ybS4XbxV0Eiy1fdINzlIO
         dIbEDKwHLdQf2zQXIDPMhI18R5xU+TrZGSwy6tb05WYN4mEBtk/Vr7uP3lwFB+nCTYFv
         ZkR/pQDX9alGtwhHdhqgt5mWoK/XYIg6mNWR/jIX5umB6l/uak+Y33f7LCyzISAoQ0c7
         d7vdU/rQCcv7DHQrVmdgJsLExlJtlpgxbRHAXQNVRcs0u6RQwkGZR3wTQxldVEkNcKae
         jgoqe1NEPS+aECF9JkUZ2A8dQCigedAcOTzBCf6zZ1gmK9uPwVNp2ePT3Orulz5XjE+z
         4k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532042; x=1795136842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=;
        b=MlUdsS5U3pLJSRiTjGtGt1ifjvbEAhaWq3MsmdLsRL/+cH9mPOqwqq5ZT65djW/giF
         MQEPp5n/QQ9gkt8hrAOmKfzs4pOg6Ul/VT9i8/jA00OAxDTjiFQG2Uqgw2I1+96FzJ20
         wR3R5n6Apwfpmrbfjdf9yr/QndWlg+s91BIgm8ilYxiTFL3ZG1Wyr0o5fUUj9y4ddZwV
         OPOHWsNOdT3HSyEJRppFDwNy3QJDmq6UcYe9NkXZNl2eQEscOFmXXZzPcv5q4df2rNXU
         NUHxmayJg6IlKK75sqa7QK0asIcxjjLKdk7RQzQggjb3J+20zV8sSQAQNJJQtC9I7dXQ
         y+DQ==
X-Forwarded-Encrypted: i=1; AL+hErExMgwuZAYzc6gYRXJzvpy5t4yPxCtBeicMu3Gd7Pacn+7vS4F11cZGodfbip64h7n2m+5aWDA05xiR68qK89GM@lists.infradead.org
X-Gm-Message-State: APuU4Z+x6Ncv5hkzwowhnhEzOdCY/uIrshskoncwLda/eKhHU9nWy/Rj
	P8fOIMjMZe9TtsD5DsMwsGipzWJ/pQycYrh2b15EUsvIVsjkMS1TT1Dr
X-Gm-Gg: AYBFou1EJSpo9gMstWvOE0bvd3IAUJu6m1eqXEG83FBISrr8A8RC1R/pZiXVrt30+gd
	msnadeAVPOOCVFVg9guU4D957fHhQUPy2pMrs2szEPkZdvomTioDqwDXuh9942QdN2BJ9FfEfQr
	aXBlQMgkX1EpVCCj4tgf11YLzQlhc5bu3nKmhu5JymZl6ZzmeVCvxFwv5YCG+ZZqD1aV+q/AodO
	RKAIp+x+feWM/2er8IV54INo4B+sCgose8+DH94bYOSgIpBTKwQOqQsDatoLbyYqcsSb7RNiR1o
	zPhKqgChxl5x7c4FRscgUaeeuMJgcdchVVB7lwH98skcLG+jGCg5qZBqdCnIxHLmg6nxD9C5zFB
	3FpYAC/m00HzC+VHnHQFrBgbwJrWVMPxIqqosiBV64gIupKfsRK2c3vVSRThJ3bsUkGd8RHfqqI
	dhp7m2F5xuiQfuU87wVW5H6XrRlvfcArtYIV68ge+WDRdskfKTHZZeinAQ0cc2NLwL/hSUA69x/
	ROePJ4x0meeg3HO5J4uqPPhRmr4xzJLn5ICtlaAYgp5RKjyRthUwfkDnmqQh2lA8zrmzeNRls+c
	v9XqSpwJYqKregOwW5iMyE5QFpYwXajhSgCrETHyZmOnh0RhyCVdsaksreghpYPqZ8kYrs3FuRy
	4iteaf6YBWQ==
X-Received: by 2002:a2e:be24:0:b0:3ab:4e70:6959 with SMTP id 38308e7fff4ca-3ae1c0008bdmr10989291fa.19.1794532042255;
        Thu, 12 Nov 2026 17:07:22 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:21 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/10] drivers: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:13 +0400
Message-ID: <20261113010631.139191-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_170724_622159_21D0D392 
X-CRM114-Status: GOOD (  12.44  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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


