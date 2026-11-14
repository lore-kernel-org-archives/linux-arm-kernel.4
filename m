Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A32606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTQZHZTN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS23o6F7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=; b=uTQZHZTNF09hPx
	/3B6xatU8HmSY330IJuxHOmSm9uYiyY/WRlHovnmUK9SNtikYqRjUUbJk/bzgpufthMTYNAm7+oa0
	WUK/oG6jrq4YVk3d/B21dak9cVAHzwltUTyC9vC5IiyKF3AHDh6WHBIpJPULlK5LQyDzIYFZDpFY4
	3tNnioylZOyZxJLlHAOgoNEIklkxSbPtuGJfNcomRwp97iCCcEs/YjfphLgoUeRziPPEf92lCR+XT
	PibPQ/MOwd3JNmnp0ZJnVzpb6cmoJRbe1GqaJ3uqTJ3CFYl5fBXJlRj5XGnHW2xYuFKRKrhM68cwi
	fzB8w/GpjvPw2eQJXT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3K-0000000GUmc-2mGV;
	Sat, 14 Nov 2026 16:56:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3H-0000000GUmE-3VaE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 16:56:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5c151178f0cso2217548e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675389; x=1795280189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=;
        b=qS23o6F7LNv9IjhAq3zEu0Ybcr/yLJPMf0eZoz6HyE2xqhdZPJ21daugNeXxYAyERT
         sSYmqrJ0/YLPzSorZcPuIKgUMSpAH+16XnEG87s6d/ZskipV8S8xI+iNU3whhmwp0wEP
         nxri6NmSOj4keEgq+ozIra/ASdo8xmPamdoy2/A2ICSCvdOC9RJs2wSadyyVQt+YMx5+
         E2NPzcmk2HDwRbv3dmVl2mzy8gWg2+ZlC9nHDwkpTaTFeC0l3leWhUmUhhBeglwfuW7o
         V5D3+FZRtFBTISQwp05ccEo2+Q64U1NlyO10sJn6Q0425r9Qr9QRHSLTGm6lpRtv7EA8
         eJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675389; x=1795280189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=;
        b=MSzw4filasgrY/oV9fGArsB2ehS12kj2QSm7xTrAdlVZruPtn0V9589eyfhziyDPlZ
         aecqSOf+pej58XJjNahzhEC6iAd2d9gZAhrhO03FaWLgd9AMe+6dZ/5lBEyQuQeaBDNr
         ZVN7lYTkH665R+JEkSi714l20Ih52IA+A2p/gMKtR9EW/1td0vNaGKruXL9CjXPee3CP
         1EK+TNX9bwdqYaRwUxdVznrplfPMnqJ9jbQm/RWBQyCK3O4rIk+2ctByQlYiAQlaj1Q9
         X49BUIlHx80BjssQ6IGOZWrrHAIOwzPtj/woTkN4mKWS3mYHv5g7EcfK0pF7sZzi6zww
         ksrw==
X-Forwarded-Encrypted: i=1; AL+hErFd9G7ko1odBwCkf90lCdWkNyDvT8IJvcOcXKYvi91Kcj4HfrcIbSM/LxnXFGo3agG5arsl4Hx9zMPI2e9piBvz@lists.infradead.org
X-Gm-Message-State: APuU4Z80N2nTwwxU/bP5mHKsTwmsUOBZx02fR0IjomS4T1GBELK93PWg
	tcbXYZSQC/Pa5r7/ZNAOE5bzo03LO6Xut22wlLFmV1aR511Jq1MsjfteB5oyjAZPdktgkw==
X-Gm-Gg: AYBFou1d2bNWV8RB2dAjv2H3zFasMCa2BUhX3raE54h9N3reSOuzx+yvRfh7H5MLcG0
	JCCXW1rbdWgrNV2Rc7tt+jdvPdwRrT70+Az5HEH0AV7iKhuug8gkpiC1cBmUnOepZPwOEG4cVMv
	pR1AqUXeVR78NAz8kPfxrszvhbQvI9KICH8HgstnM2MHGz0aMu6OA3gmeV6y6sM/5Jmz02qKLyX
	L3Izxf+0qt3MoPFljNe8Me9M5MUjQ0xSmqWPWCrz96u7umCB51NVycvTx+HV8W1NtcNzkuNBVse
	ipRTR3jMnckkLgH33Vf0h3QG0+MLxpEnUfnBqoJ/jRkG2sYB5Z9BRpDYSivalY5v3oCBKpWBM2t
	DZ6Uw2IKgRYNj6VttLQnRRHh8o9E9WirpVtiarLUj7TNv28LcGcC5sjlvjwjZDQUm5y3PCuyKk8
	7SSBNaXHXGmGQEIjY4GRTLd99I6Gvqnh8apIxLRZoRaolGlS2FOxiBs43kXQne6RMXmo+Qe/tpi
	3Zb3nvWoxCnf/uYtrOK3IXUGRKQIVqu9OPUc9Nw4WTUdxVS1vx7EPf+K+5Y0BF7S/IKBHiNcwMT
	RsGt0YLWKQXrw8dUx9gVyR6pgSKZknG7G+YiH0wQXiEzJeNt9NbDG6kI7ixOBrjplN8urZ3mm4i
	eV2de5bkk6pB3ML6QqsIfrxCIlOlOwCQ=
X-Received: by 2002:a05:6512:3da9:b0:5c1:5b79:de99 with SMTP id 2adb3069b0e04-5c1707469b2mr2133629e87.9.1794675388881;
        Sat, 14 Nov 2026 08:56:28 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/14] ARM: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:41 +0400
Message-ID: <20261114165612.368785-2-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_085631_918282_0D594EB4 
X-CRM114-Status: GOOD (  13.16  )
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


