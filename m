Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNCxQzUB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGkZDv+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=itZNkAQNeeA+l+wxU900XNReI4SQMrZONVH4H/hiUBI=; b=NNCxQzUBhP1ZR1p13SsN472O3U
	3Uzqd/NQWAxCo8EQPpdWNcry29iwPrlv3BSUyfE2MWmESm2IA1jC+9pO9YFO5adrxq64FXLZ3AXc5
	CrNo457/Uf8AE1FYNUU1l2roj7vs/2SvkrUINdI/AH9qj1+vqD9uzPUHodcBbZ8Es9/W1Y2r4ZYM0
	b2bBayY5MJqnhdd0dOX5kRoLpj3Kvc105gFoLpD7wxIQibe828GibTYycXw9Ct/W4iikVaZXgzehv
	r+qRIop2D4lPGMMUS7mC17Se0Hl9PpeSNrO1urc5AGIliFGkPkUuQcRFWJLl0dUhyqwDf+g+yY/jE
	X4hsiN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5TL-0000000CkuZ-1Nmc;
	Thu, 19 Nov 2026 16:58:55 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T7-0000000Ckms-0p2m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:58:42 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso21899045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107519; x=1795712319; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itZNkAQNeeA+l+wxU900XNReI4SQMrZONVH4H/hiUBI=;
        b=WGkZDv+Dn41KI3wzlA1NhIwCyV750bPsqAAJSW2Cv8ny7QHEDnc0481oIEi8ZwFdst
         hlELK/LF5CY6ppMu10BWlv6+r5ZT7swIBT9ppo96xCct4HGx6rveMpaFeJs6+Ft7p0yW
         S5yazgQEkbsudgmG7kOj5PR9b2vVrvjBf9azUgDjxFiLjHyvU6fKbbZ+a+dOWJdQ8s7f
         x9cTtCo1GUPYW3n2RmaZhCs4iohsIdlqN7L0ufvwgQxPSv/9sNRvkI+YbjPdP4mXWIHK
         CLNx24Mr9BtAQQWc95bealYEIYYHA4i37M9TNpLOudyYF+aGabuK6miWtUUXA8Q+VP+v
         gghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107519; x=1795712319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itZNkAQNeeA+l+wxU900XNReI4SQMrZONVH4H/hiUBI=;
        b=voFQUOkiH3rl1TTyZ78/+U1/nOPnt0aCKt9z7Oz4K47irEm4lMeS7v0tIN9l8JLme9
         w6IpDxUSDejlNeYy2vGuzMbBjRsS+ZPfz3KrYN/5erMpAEwr7Z1W7cvYsLkSwdfAy6e/
         MzsMOwek0CiYnHMVU+KFi+mCH9dbF9c+/6AEmakglvkjfLjmIYEsQdS7YnsuIpmC1qsj
         IvHejpUMXFgM0z80ZEXk4R3MIX7RWfoFRxcTUDuy8xprOJbdyWM0foOJlDcKkSZQ6gJ6
         6kgYBlH7Kj1g4Mxtftf4n7/KM1pQQsHHyCaM6nJz/V3pj/j6g6/X6y4PdkO8Cuikg/Ik
         pe+A==
X-Gm-Message-State: APuU4Z8q2btU0agHfjJ4Bm0NNVl/0mQu90AZWndqvnZ7jelDKKc51i7N
	Rr+j7fTQvGkSGKWRU3GkPvu+xM9fz+s/ag1LNkCgcfZ4RaUpaGZhANDCQLDOXZmwVB/v2KgK6+o
	9U/UBOI09p24oygrNfbmiGLCTdYkLutl+aGafXLfKDnOmiTck1tecDC92SYm5VhrRLa+pz38EZN
	D/uos7cR6JWwrJ4M7c3iZKjnLT1CY+7FdSrCVU+4qcV6Tu
X-Received: from wmbeb10.prod.google.com ([2002:a05:600c:678a:b0:4b6:5d12:e070])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a7:6bc7:f778
 with SMTP id 5b1f17b1804b1-4bb88938d38mr1640825e9.30.1795107518397; Thu, 19
 Nov 2026 08:58:38 -0800 (PST)
Date: Thu, 19 Nov 2026 17:58:28 +0100
In-Reply-To: <20261119165825.1793558-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2671; i=ardb@kernel.org;
 h=from:subject; bh=EQIptsb/uh8AfNkI//pMUS99reOipPtgjF+0JdMnpRI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu/1tacz0IqE/fcu9pVx7Gkv/lS9acd5dzbBaMk+ubGW
 IbvWBDcUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZS/4Thv6MSq0LzOjYf3iu8
 f07mLuUzLMz853voX/a9mil71x6P/MnI8PhukIuUS+TWAxrf6/c22/y9m3JIokHKZ1qty4NXk28 a8wEA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119165825.1793558-7-ardb+git@google.com>
Subject: [PATCH 2/3] arm64: Re-enable kernel BTI for compatible linkers
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085841_274646_8EA875A0 
X-CRM114-Status: GOOD (  15.10  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-31.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The compiler is permitted to omit BTI landing pads from static functions
that never have their address taken, but are only called directly, even
if those calls originate from other code sections. This causes problems
for calls from .init.text into .text if those sections are placed far
apart, as veneers involving indirect calls will be used in that case.

Now that .text and .init.text are combined, this can no longer happen,
and so we can re-enable kernel mode BTI under two conditions:

- live patch is disabled - it also needs BTI landings pads on functions
  with static linkage inside vmlinux that were never exported (and
  therefore never had their address taken)

- landings pads are emitted even in pathological cases where the size of
  vmlinux's .text segment exceeds the range of a direct branch, and the
  linker needs to emit landing pads at the callee end so that the
  veneers can call them without causing a BTI fault.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..f0fb2d7ff130 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2202,18 +2202,23 @@ config ARM64_BTI
 	  BTI, such binaries can still run, but you get no additional
 	  enforcement of branch destinations.
 
+config LD_HAS_BTI_STUBS
+	# A linker may need to insert a veneer when a call to a function with
+	# static linkage in the same compilation unit but in a different
+	# section is out of range for a direct branch instruction. Such a
+	# veneer performs an indirect call, and thus requires a landing pad
+	# under BTI, which the static function may lack. Only recent linkers
+	# are guaranteed to emit those landing pads correctly in all cases.
+	def_bool (LD_IS_BFD && LD_VERSION >= 24200) || \
+		 (LD_IS_LLD && LLD_VERSION >= 200000)
+
 config ARM64_BTI_KERNEL
 	bool "Use Branch Target Identification for kernel"
 	default y
 	depends on ARM64_BTI
 	depends on ARM64_PTR_AUTH_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
-	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
-	# https://github.com/llvm/llvm-project/issues/215547
-	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
+	depends on !LIVEPATCH && LD_HAS_BTI_STUBS
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations
-- 
2.56.1.708.g77570a6a1d-goog


