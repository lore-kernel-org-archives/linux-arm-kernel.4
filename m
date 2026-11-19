Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F76071A44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G89M+KlO;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=VelI673h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdNqgxVTrHwzK3UypYrP+k9e1+c/IhLkWJbjY+uMgSk=; b=G89M+KlObGB9Tj
	3Pp6VDgf0OLlfegyD0CwV3O/eccNqAmPbRdpFv+VGPmFMWI+H9bMJQWaqbcawKo9u/nVuJ5yxGIce
	+wpXgPJhbYDogFiKrADRDPzUvE3slj6VSjiiPDO2wXCAlaTLkwUZGv+VtZFszSZt6DJIyGgoE8PR3
	X5mlLugSwO9WgVdIDx2CJH0kGVIaIlwpsHS/1L2FYWYMlx1fMuCiJb4SSrDhkbLFv0SXtNkeVbmgf
	quNlfa0NX60mKEDt3HIVdK+7ckHyKG+yiICxNJ62SxEiix45QK5F7W9a28OJeLLWoiUMdLvuWojbi
	TNpudN5Yx/kukZzWQyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8eF-0000000DLEl-0Vb6;
	Thu, 19 Nov 2026 20:22:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8e7-0000000DLC6-1QC5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=mdNqgxVTrHwzK3UypYrP+k9e1+c/IhLkWJbjY+uMgSk=; t=1795119735; x=2110479735; 
	b=VelI673hNjwRt1YNaCsD0Fe7UIwEvBMcuCHQINdr2iOOXJ+uVWsuRShTDLC7xMd+Zl6ybzxJjtn
	9deEUdtdvO2y/8fMv9g2C8Ix8cQ77bz4edSp/8tMCvlsHIKt12EJr5Ox8mMkj3JUJf+QB43ZEKkwu
	Bp3/2ct4W8zgA6VRtaExQ7qWQeFw/wyw1Hm1oqDSK6zgaszKnyFMi3jU//72QPigPW5LtxJfyxGa8
	8sby22UlyDjYHaUim8391Vejv3q9QdcS10f5UZrGVJsWbLuCGm1YohhvwVGB36ydLBMVvkn7OBS6P
	ut36aiCqIf4PzlmR7yKqtjw5hHwuI27tlaYg==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU8e2-00000001cIK-3K7n;
	Thu, 19 Nov 2026 21:22:10 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 19 Nov 2026 17:21:54 -0300
Subject: [PATCH v10 04/16] s390: Use the common syscall table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-tonyk-syscall_table-v10-4-a7c9ebd900f6@igalia.com>
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
X-CRM114-CacheID: sfid-20261119_122215_386907_7F893312 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Remove some of the duplicated code by using the common syscall number
table.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/s390/kernel/syscall.c            |  2 ++
 arch/s390/kernel/syscalls/Makefile    | 12 ++++++---
 arch/s390/kernel/syscalls/syscall.tbl | 49 -----------------------------------
 3 files changed, 10 insertions(+), 53 deletions(-)

diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
index bcc0b76bd868..d4b5c30e1cbe 100644
--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -40,6 +40,8 @@
 
 #include "entry.h"
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
+
 #define __SYSCALL(nr, sym) long __s390x_##sym(struct pt_regs *);
 #include <asm/syscall_table.h>
 #undef __SYSCALL
diff --git a/arch/s390/kernel/syscalls/Makefile b/arch/s390/kernel/syscalls/Makefile
index d5fca0ca0890..4b4490f80467 100644
--- a/arch/s390/kernel/syscalls/Makefile
+++ b/arch/s390/kernel/syscalls/Makefile
@@ -5,19 +5,23 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
+syscalltbl_common := $(srctree)/scripts/syscall_common.tbl
 syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
+abis := common,clone3,memfd_secret
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis common,$* $< $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) $< $@
 
-$(uapi)/unistd_%.h: $(syscall) $(syshdr) FORCE
+$(uapi)/unistd_%.h: $(syscall) $(syscalltbl_common) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
+$(kapi)/syscall_table.h: $(syscall) $(syscalltbl_common) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_64.h
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index 1b45e68a217b..ce6d15260dd1 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -350,52 +350,3 @@
 400	common	msgsnd				sys_msgsnd
 401	common	msgrcv				sys_msgrcv
 402	common	msgctl				sys_msgctl
-424	common	pidfd_send_signal		sys_pidfd_send_signal
-425	common	io_uring_setup			sys_io_uring_setup
-426	common	io_uring_enter			sys_io_uring_enter
-427	common	io_uring_register		sys_io_uring_register
-428	common	open_tree			sys_open_tree
-429	common	move_mount			sys_move_mount
-430	common	fsopen				sys_fsopen
-431	common	fsconfig			sys_fsconfig
-432	common	fsmount				sys_fsmount
-433	common	fspick				sys_fspick
-434	common	pidfd_open			sys_pidfd_open
-435	common	clone3				sys_clone3
-436	common	close_range			sys_close_range
-437	common	openat2				sys_openat2
-438	common	pidfd_getfd			sys_pidfd_getfd
-439	common	faccessat2			sys_faccessat2
-440	common	process_madvise			sys_process_madvise
-441	common	epoll_pwait2			sys_epoll_pwait2
-442	common	mount_setattr			sys_mount_setattr
-443	common	quotactl_fd			sys_quotactl_fd
-444	common	landlock_create_ruleset		sys_landlock_create_ruleset
-445	common	landlock_add_rule		sys_landlock_add_rule
-446	common	landlock_restrict_self		sys_landlock_restrict_self
-447	common	memfd_secret			sys_memfd_secret
-448	common	process_mrelease		sys_process_mrelease
-449	common	futex_waitv			sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	common	cachestat			sys_cachestat
-452	common	fchmodat2			sys_fchmodat2
-453	common	map_shadow_stack		sys_map_shadow_stack
-454	common	futex_wake			sys_futex_wake
-455	common	futex_wait			sys_futex_wait
-456	common	futex_requeue			sys_futex_requeue
-457	common	statmount			sys_statmount
-458	common	listmount			sys_listmount
-459	common	lsm_get_self_attr		sys_lsm_get_self_attr
-460	common	lsm_set_self_attr		sys_lsm_set_self_attr
-461	common	lsm_list_modules		sys_lsm_list_modules
-462	common	mseal				sys_mseal
-463	common	setxattrat			sys_setxattrat
-464	common	getxattrat			sys_getxattrat
-465	common	listxattrat			sys_listxattrat
-466	common	removexattrat			sys_removexattrat
-467	common	open_tree_attr			sys_open_tree_attr
-468	common	file_getattr			sys_file_getattr
-469	common	file_setattr			sys_file_setattr
-470	common	listns				sys_listns
-471	common	rseq_slice_yield		sys_rseq_slice_yield
-472	common	fchroot				sys_fchroot

-- 
2.56.1


