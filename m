Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE71606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1VTypkfm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMNGsFvI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=; b=1VTypkfmt03emM
	/50pRZzgEoXO7Uv2maUl4aBt9X9L20F0OilY3MvbsIj8TuGXmRwAYFy4NGlxOkyc+jIlrVXqyFy3i
	9fzD/RNjBX+zp0+PhMFI/tSINyydocU615e44TbAFr7eCh6Fp+b++mt4Rzb4KFuCWbTX+4l/4YlqY
	OLCtw6FNLtvNaZ4sqaWSgbSJSXy9KKb0J5lW78YDuUlJl6eragLjF5VB6ah3QhUfNAEbMbprOdI5l
	fInmdj11BVYEpqE8QyPC/+HW4O+Su/LMMCTJ3FZ3RvAQJqOW+kFpGwMJ1eYyu7wSpWEgKQYU2+obg
	LpwdPSYqjPHmA7oQxIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRewf-0000000BI6y-3AFB;
	Fri, 13 Nov 2026 00:15:09 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRewc-0000000BI6Y-0B7K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:15:07 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso4231101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528903; x=1795133703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=;
        b=OMNGsFvIOYD8KOpas1AMqN3YVmxtTvPkP8vkn8LJ7qGCRVnCZKqgDurZ7QggSDlarK
         TVZ6h5RdH2G2teO+Q9lRpnmTfBsWiJpcqKNtJ2lxFgPld1y/sOGJ2qaVlnbeVPpKfdjv
         zDZyac+ewkR2W8PzbXNjJ59wTxnX/gO8jDx8mRGxCZsBpcrKrshkPF/BZRuuPU/9Hyz3
         Nk2hxSouNXSKVJUGmmAH0KRZjCsn+Bko8Z3llpXzf0hsVo23dLe6fTLkTkvqrT8kbE7J
         tqt8AlIb8+M6kb2vfn3hgGl7qjdiTbz3BIQQeNceOKajOVGCwsz4rL1SnqhAaVQjb42T
         yzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528903; x=1795133703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=;
        b=DaXGs+r2f/BbkK22B2UmvOFUdku6FpjnStc3FHovebGfDK2b01z/wC76o2mVOUh0EU
         lBSe+U40UD+UFSEP6zBgokLsGzhtzHhHp5tVddbuWSclJ07VqdRfsJzkst81VAEFo9mu
         +TyVdVkZIheqhNRVU+ez0UZM8qsdzbHGahRRqT2CNUxf9zF+dXQfCfkE7nsvVJj02IEq
         cviS27wtcCCrw/LX1FLAsF5DvnoAW+F/Tds6soPtB78wP5sxh0Hz25bHrenCvkuF4f1G
         N/mqn4CirADemdKE7ObVjgrHzrUF5W40fri3wM+MEnpc62U8Ur/MgIF+WholWrr+ROw5
         IIMQ==
X-Forwarded-Encrypted: i=1; AL+hErFn/nruiR8WawnybAOR90ixMBpsiVDKQPTuFc7+vzDfIJmYgp+1XUTTsH5h7wInmHoGYrGMu9bo/ZiMOwlaiKzL@lists.infradead.org
X-Gm-Message-State: APuU4Z9+KzG7c/3dWXAcBbSYbexm0QCg8DS7vh1F9KcIO/2BZ13wHUUp
	HLv/RXYMO47Li6BncicMAPK8VBLx/rP+QkfSwoDVJc7R1kPmeR/8aIs0FtV1a0UKNCM=
X-Gm-Gg: AYBFou1W8HQMvISjcUDsGE1ZzNtrwBpJLDsrOBYG7MDjPuwlI9QEQ4zNyxuJXZU9ikS
	B/lZAb243Wfyo9Zi0sBSr6hfo0sJ0QpH7ud2WlGNuhWfp7EYY8qptuOmsQTRmYdR1Uq95v9MGom
	Ztsu0NnP4zWCIQ9FOGoN7dMSd/+MXDpANcI501rM1sXDgfJPTiQ0lCfQTtsGO4zB6+nKSKmnQXG
	9fnE2JhofpgLxnhaBJ3gQqKqqWY5kI25J3IsTRx5YU7W3d9bO2GnQ5b5xUA8sCp54ZieZZSJSzE
	jOdobwzCMEEV9BnRzZ50c1RuHU7rtOrdGGpAiRWt1NJw8OeIi5Dg4ytthYPFO0OvwDhY7K52R/o
	HvGMo0oEq+vEv///m84sCIu5TDdy2aWbw8WEy9VruN12Q+h5iQhx00E8bFfarQZMwaPCjxLqfhL
	XxcTdWTj2CwcIFm3/uvhnHY3XwcLZ8wVBciD1ALH/vRmzgJZ5W9BQxd59/bNNjoKyeOfbpFDVle
	ZWwVYJsrwRoSLcNHvSTPTlm12xS6kDk8XX20jAneCkZW641voDtHGoGsaFh1uRylKZ0vOgFfhTz
	SR5jxo+fAcLapDOExLqUcjaDGVvoTn2qG28zAbnSCEuYah3dIEKKfaqy0BTGEJyPueS3/LuDT92
	i5eauikvCXQ==
X-Received: by 2002:a05:6512:2302:b0:5c1:4974:c150 with SMTP id 2adb3069b0e04-5c1709c44admr353851e87.51.1794528903101;
        Thu, 12 Nov 2026 16:15:03 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:02 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/10] ARM: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:07 +0400
Message-ID: <20261113001432.128201-2-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_161506_117226_F168D6D2 
X-CRM114-Status: GOOD (  13.20  )
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


