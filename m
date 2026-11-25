Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E596606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAEyADp+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qsbwDFmE;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=if2vgB9P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=; b=CAEyADp+mEtkIcSW55jLRKx4JS
	sIFxujVk/WQWz8FslD+RXHd6p4Z5CMNJ+aKNR0T3+++8MfqlV/N/DK69P4DGAPffKfIQF3EIbRD5U
	/1q1wlcmU9o2Pm5plG80tXFYp9C4bO/ANCjjL3cNpHPx7wFGDl4abnj+79FhEVYSfebOoyZzP4R+Q
	Us0F0JBej5E3z+GZn0ts68u+xz0BFReA5hfMhyTmBGkhXeBo4cx1nogIanfOIBwMuuurfjcWO4hr3
	njy1KvCguOR3QoTKeLO8NPmyhYj1VObsWj55JhMaMWshSc+5SvD79iiyI7Rq0dPJ07kUlm+FRC2tF
	dZprnmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JV-00000008ZTs-3yVS;
	Wed, 25 Nov 2026 06:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Iq-00000008YmO-264r
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=; b=qsbwDFmEuW69KtnuAuMkH7Uguv
	SHzlSmovp17HRxhZaTvLwJdn+XCi3JHkNGFS6cJ68/CrxXC/Tow0OdLPRgH8woJyVUR0w2ZPbwOIf
	gRna6R9aXXaFbaBEabPSTJnIG3iJ2Zf7RKLESf/BRAu8QUTjrnvX53uE2lc0zhNW8Bo9DUaWdKq41
	wdSaEqrthXSb2VRdhX1bn+jgBFmJySNpLIEKJXP1nfQ3t38mCFj1wnAcZo1TT2kENMYhhUYRU1F5x
	63sf19a717f2VEKkARIH2JsX4NkRa0QixYVZaNlbsyLBBwShczIuSHdcnF+zeju1Fo4BNg/AmjWaK
	ChMcpC5g==;
Received: from mail-dl1-x1248.google.com ([2607:f8b0:4864:20::1248])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Il-00000004tpg-3TMp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:23 +0000
Received: by mail-dl1-x1248.google.com with SMTP id a92af1059eb24-154e9d2d94fso393079c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587375; x=1796192175; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=if2vgB9P28m1A2s7oV0V5ntAnpc1uhpHWJ91YDWsAViftR2EfclQXJ4AIEpmY2d71T
         NLfCRVhDsVkRZ6UBJ68PUk9vbAf3GQbvor03VRVYnOCd9yPn2WbpsvuCbR98QHRl65P2
         ABcP8TwGycBgiyYJj0ve6xH4v26Dh71PKvZhR1r0gY8jbDYYideu5284DO1/wmTSLyTs
         LU530QHkks4ilh7Vgv0dFcZqAmAhiyc5YtQWe1hbxOyl4J6MrgmX1A3erUCXf1Q2GhdO
         xt1voSLbSMzTjOBJNuUUD1VZWSM1gAG8m/2sbdYNr7A+kPGmeQS+JcuwM6nGiP60BK6B
         VSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587375; x=1796192175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=Bf0yz2LHj4T7bVSrr0foj2Qvuw0g6G9YqSHGdWAJIg9QPios8IdB7mE3qKXTZaDk2Q
         /djJC35xcddi/uvDdmk3rJW3+/oZqHIzdvujDty8NpqJ9rt7wmhYJJlQMiJID4/vzWBL
         Z4xRDEz0ZtjnzB0BX9h++kibP0DEY7NjBme3jRONPC9pzU7Al2FQfcfU4ziwkRrLF5b7
         av1U4oNjlhQCB55BxnIANPYUiyPRERWob1kxJ25sYwhvVlWN+YrD7/rKXUryOI6/qdTG
         6TRmCND+t6hqIpKDtj4GNQQnYIiebzHlrXDTGLfbFDfcKfDQ8t4RHpM3cmpiY2cA0RrF
         qQRQ==
X-Forwarded-Encrypted: i=1; AL+hErHbh5mKzMkDEFhFnWB4HaWKElgAJVwOwm0ij2sEB0Vr1v152SanwK0KOP9pgDpryobuv8QVAqVMGkdAv8Xm2qBa@lists.infradead.org
X-Gm-Message-State: APuU4Z9UccJ9gtMChy8MEBDfpYwi4GqNAerz4bQ4G58rEwfcOICC0kBG
	8kNP65RFNSjyUGoW2av0H3UVkEQrbdXqAP2D+l7xc8XyX0FUC1YdVPq6OB0V4yxfEXSZynT7xw3
	HgcBp+PxsCA==
X-Received: from dloo27-n2.prod.google.com ([2002:a05:7023:a5b:20b0:1b5:8761:cc11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:1a5:9abb:fdd7
 with SMTP id a92af1059eb24-1b556877a2bmr15589113c88.9.1795587374885; Tue, 24
 Nov 2026 22:16:14 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:02 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-10-irogers@google.com>
Subject: [RFC PATCH v2 09/30] efi/libstub: Disable unwind tables in x86 and
 RISC-V EFI stubs
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061620_148774_45AB6427 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pass -fno-unwind-tables and -fno-asynchronous-unwind-tables when
building x86 and RISC-V EFI libstub objects so enabling kernel-wide
asynchronous unwind tables under CONFIG_UNWINDER_DWARF_CFI does not emit
unwanted .eh_frame sections into the standalone EFI boot stub.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..19c2822eb302 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,7 +19,8 @@ cflags-$(CONFIG_X86)		:= $(filter-out -mcmodel=kernel \
 				     $(PADDING_CFLAGS), $(cflags-y))
 cflags-$(CONFIG_X86_32)		+= -march=i386
 cflags-$(CONFIG_X86_64)		+= -mcmodel=small
-cflags-$(CONFIG_X86)		+= -fPIC
+cflags-$(CONFIG_X86)		+= -fPIC -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 # Nothing enables IBT while the stub runs, so ENDBR would only take space.
 cflags-$(CONFIG_X86)		+= $(call cc-option,-fcf-protection=none)
 
@@ -29,7 +30,9 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
+				   -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.56.1.831.g720f3f5937-goog


