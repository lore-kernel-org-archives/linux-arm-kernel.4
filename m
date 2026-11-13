Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0TseDAG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q/vXRJt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=; b=P0TseDAGk7kGSp
	LVKXhLGuIdB7q2ERcKYlss20u7bngL+7b1JbpYGWhpSbv74jaSISiSsyKpEkF/4QK3g2OhNGnhz4f
	9px+uvjp+FQ529OuHbEQ1HD34l0auek/yQCKlVdjUuhwYyhdKRhgNyJB4sFnXOB//TKZlLnm+v8/9
	5U2Z4vQekS8LzIWSylAFIxDr41aFQFYjXL1a0s95/fIDzy8frH54LdSnF90BAxJ+CoMT/NnkadQHJ
	+HVI/RLfVjRXfYt+0VwSKXcs8jxUE9IQi5MsChIY+Dkozx0ZLXptBUgOebJW3JMrut0gs4IkEvXlf
	EGZqIPAom1Aq51AxCN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfkk-0000000BPLQ-0mp5;
	Fri, 13 Nov 2026 01:06:54 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfkh-0000000BPKt-1Xjp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:06:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so4222171fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532009; x=1795136809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=;
        b=Q/vXRJt42RdKkbjmAAmyOmMqk7P+WfFn7keGDCVmU1eKxwPO/U4dRLSmIjzwJ+/2J+
         P17ZBb93Ai1X2QTtEqQLg6ChLkhxTqlUbX7qfhmJDrPhB1i47y3iTn8vTgooycbFMV4Z
         Jg9Ry4F9vGgXBmoF+ceWBdiTk2aQL5jyAuNysI4mTgncuvmfeF9tmQoYzz/+a4artbI/
         bebyl3TCkfQhcEONhE7JcEQJhsJOjjydrotvEQrdzH1lm8vkNk7D141yeCpWVmnm8prP
         RMlxQBPv4XtW2hBcE/coed6nwQT9PSWe7CuS9udsMSzoQzVCnNpnKa3BN2Y7v9C4BJIc
         s1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532009; x=1795136809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=;
        b=G82CQdU7Hou+0X8rXMKgNSZylDboomh3viInz8tyqmp38ktl/f46IK+uiyekLDmLEu
         LTNjvQ/+v/j0yniJdNCL0BFy/K5iXGBR6SXhSoHMxgG6umbhkOsA29CZAAKO3bqhCotT
         8E3zIQDYr7+XMqjT9Zd0z+Hf3ufz3EX1gDf4bFzTgbgssNVQtckRoBJoERdsnfN45pRA
         2nfv3HmzCQpP65gvMvX7smJe6tIS5gmfNZAGjvopeiPy2KtdG9YZD95vtC7c23djAcxR
         TqbI8oGBuDEt/kkSSo6Jz5SWWwtpI3F2O0d5RnL+VjAQmccV+2QX2SYn4EpREayME7Fi
         MtzA==
X-Forwarded-Encrypted: i=1; AL+hErGMbUFMyUb0+3J+RRV/E9grMAWJ09CvZi/jzJ17tLanq5WG4Q91YVKknKppW4d9kxjFySonZ1zE3SVsXJdAm6RC@lists.infradead.org
X-Gm-Message-State: APuU4Z+efXpJXcne3RPCVravAOJydaaQqjOqGc8ehCV3eWuKWIMI123x
	q2dsWhKiXJfOOUQf1yPT2wj0gXv50B2VpNzxZ7LQW3mwi4sqgMBRnpgAtP6ZKTnUypc=
X-Gm-Gg: AYBFou2dcwUPKSYNeIKXOa6kVINsiwWnQe9E8Nk9qux8K3OQmz19chZ8U2IQdWp1qRX
	AP0TaA7VBtBa9RHJ3dlh3JjeKtylUN9nlU8MF/9o/kQbA6drLcMNpDyNLafF6f0PUnkCGcqWqS2
	XjOEzu8CsN8TxHZtF0NRpVqX9+8RVF19+PUhYYeUWQxu2kTcT/lusTkGX0o9Jrt+wNj1ZeqCguI
	4JBLAeMk+YgBgxHMhhPvJ3xoNf60wkGfPbyk/2QbgwUbsLBpMLDlWsQtZkLORVaE1wr35LMcroy
	L59woSjRTdB/8eXTZrYp2SjD4o/7iTdNiMsDFSKqcRGr7JTV/C3F8AexTb/N4vFL0VPeHjf2Y/v
	xCJjI18s/wqWS8UQoIdyx32LTQhgMm0Yzt/WmDS+DsYvGP3aLBrmww+zltGHFv1G3R2Df8azfX0
	P80L+S7oci9+i8wYlclh1BtYLWzekYasIsw3uGDeyfeqc7rYg8SDNDnhZ2FRTtEcQuibjhlENjc
	9iTUovy0CGxwhOIJsQfX3li2Kp01lY+HQ5IzTcZhHbC4KD+qKV2A+hNtvQJFRtWyyWL7h6eEaLX
	4PBXFhkkeUS7O654rLiH8+CT4HXk2gEZAM3HmlhGl3P9Xa6ECaw0gpIKxU8gFXBNvJREKUAtvN9
	4NStWqnLopw==
X-Received: by 2002:a05:651c:41d4:b0:3a9:8167:62a with SMTP id 38308e7fff4ca-3ae2b53f3d3mr4406631fa.28.1794532009135;
        Thu, 12 Nov 2026 17:06:49 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:47 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/10] ARM: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:06 +0400
Message-ID: <20261113010631.139191-2-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_170651_499031_7C9190BF 
X-CRM114-Status: GOOD (  13.55  )
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
 arch/arm/include/asm/bug.h     | 2 +-
 arch/arm/include/asm/opcodes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index ba8d9d7d2..985857d65 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -82,7 +82,7 @@ void hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int,
 				       struct pt_regs *),
 		     int sig, int code, const char *name);
 
-extern asmlinkage void c_backtrace(unsigned long fp, int pmode,
+asmlinkage void c_backtrace(unsigned long fp, int pmode,
 				   const char *loglvl);
 
 struct mm_struct;
diff --git a/arch/arm/include/asm/opcodes.h b/arch/arm/include/asm/opcodes.h
index 38e3eabff..afa29833f 100644
--- a/arch/arm/include/asm/opcodes.h
+++ b/arch/arm/include/asm/opcodes.h
@@ -8,7 +8,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/linkage.h>
-extern asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
+asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
 #endif
 
 #define ARM_OPCODE_CONDTEST_FAIL   0
-- 
2.56.1


