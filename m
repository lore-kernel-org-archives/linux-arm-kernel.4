Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424E606E4E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRitMcN4;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=nJzL253S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U107zihLSeqN90jyCtOXfgC5pV3gPuR6JZHF6FXulvI=; b=qRitMcN4U0dwGf
	UQNlnNttG1o5aEwvRwu6kSRnKuxF54E5o7E4YlpfumviFlCv9eD0ywdMRDlhEid+HRnPrVsIlZvrT
	usdrHRu+6gby7V8dwvNRu034zrww2CPXtMFVuO04ZqS7NMruL5AIkU0qZTQ1FmQ1CyEaQOfl01Vnq
	Pq9FIIXPoCTunWNm7UJXkC68QNs5AFA5CuemcAH3EwdMJYZUJFIKxlDGXZf+8kxwVtJuKRqo7UU+T
	ge3Ak3chuJyWKb3vrPdr7wn+LvkEe55ENo+hd0aS86Kzcve1CeHjQpvN7AWGV3nDXNjclu7wCv7o6
	UavN+7ZKP19T670ZA34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8ee-0000000DLWt-1tFg;
	Thu, 19 Nov 2026 20:22:48 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8eF-0000000DLEB-1XVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=U107zihLSeqN90jyCtOXfgC5pV3gPuR6JZHF6FXulvI=; t=1795119743; x=2110479743; 
	b=nJzL253Sbt2q+6/hLdTnwxMu4V/9bHtbUN3kmYF6VxD/uFIRKvFKRpM73lrvVL9MJmYk+RQM9U3
	XQKm3h5lnsRP5RhzlNqG29NvRCeTGPi2yQU1D9WpZGZjahJq2D00yPzku1yeo/LseDh1upGkDaZwW
	FEOG0LlmpmTTBCDurnWPkPBWMKFfkTAHq3c2juZm7vzzxVi7WThugcAe34vf2nfNc88cZfB482kbM
	APOV3TKZNWkxv0M+saS5E6POaL7hCMsa8TXFMHAZywupjNbtWjrT9+k2Vlk95wE7huuDSVXw6b+Q2
	LlCrWIREwY9uQ5YUnxoQCiJOfcP4ilQYORpw==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU8eB-00000001cIK-07Zf;
	Thu, 19 Nov 2026 21:22:19 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 19 Nov 2026 17:21:56 -0300
Subject: [PATCH v10 06/16] mips: Remove duplicated syscallnr.sh
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-tonyk-syscall_table-v10-6-a7c9ebd900f6@igalia.com>
References: <20261119-tonyk-syscall_table-v10-0-a7c9ebd900f6@igalia.com>
In-Reply-To: <20261119-tonyk-syscall_table-v10-0-a7c9ebd900f6@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_122223_421876_BEB3DECC 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common scripts/ already have a script for generating the numbers of
syscalls file. Use it and drop the custom script.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/syscalls/Makefile     |  7 +++----
 arch/mips/kernel/syscalls/syscallnr.sh | 26 --------------------------
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 56f6f093bb88..1bfc2346d100 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,16 +5,15 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syshdr := $(srctree)/scripts/syscallhdr.sh
-sysnr := $(src)/syscallnr.sh
+sysnr := $(srctree)/scripts/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
 
 quiet_cmd_sysnr = SYSNR   $@
-      cmd_sysnr = $(CONFIG_SHELL) '$(sysnr)' '$<' '$@'		\
-		  '$(sysnr_abis_$(basetarget))'			\
-		  '$(sysnr_pfx_$(basetarget))'
+      cmd_sysnr = $(CONFIG_SHELL) $(sysnr) \
+		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
diff --git a/arch/mips/kernel/syscalls/syscallnr.sh b/arch/mips/kernel/syscalls/syscallnr.sh
deleted file mode 100644
index c190bbefbfc2..000000000000
--- a/arch/mips/kernel/syscalls/syscallnr.sh
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-
-fileguard=_UAPI_ASM_MIPS_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry compat ; do
-		nxt=$((nr+1))
-	done
-
-	printf "#define __NR_%s_Linux_syscalls\t%s\n" "${prefix}" "${nxt}"
-	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
-) > "$out"

-- 
2.56.1


