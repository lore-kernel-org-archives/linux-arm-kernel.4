Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0A1606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjQ59kKK;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ia1Ne+rw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lKqTvjfVAMuV2tixJjKzEjlDg6oeaFaEwcBN1UQ2ZBQ=; b=OjQ59kKKYimvUC87fvPtLVitgO
	YU8NJ1fMNxigxTuaQeG7bOariq8hEsROz/wyhx0LYOrKXp2gvPoDfW8yqYTr8MRSSOWNsCrqLErss
	8TaQHHiDhHX+a2pX7GZ7kDpMZfq/+xxMhNlotY1YHGIYB1uTSgpnR8DA9lIHky3wiHQt5Z5QQbn4Z
	BdH/27Mhoese7usfuMgViQE47L7QDdmvLYaTmfL2zLwC16jcq9uIpDC3uGRVUj0F3rKwX5sm52isG
	VUZMFEoWm+or2fIH4yhbE0A4W2YnodtgM8yEK2mvDx6lfdjO0X5wuDEy4Egy5YPUwgktTq9YZ2Is+
	k3jU1Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8e0-0000000DL9f-3CUl;
	Thu, 19 Nov 2026 20:22:08 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8dx-0000000DL8D-2EIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=lKqTvjfVAMuV2tixJjKzEjlDg6oeaFaEwcBN1UQ2ZBQ=; t=1795119725; x=2110479725; 
	b=Ia1Ne+rwxMBUxfxtzx5qRBcTK7dZYZdLsspaMev4hUpjg7Smc6hfgFUa+XpgMTrnLOcnRNM6ANC
	/60jMO2oFrryoofT5JC675WpDV4F+JjjwJ2DpR6m65H2b8yH9oAqIXkPpfK9cyY8faAqSGy1VkddU
	hEXtZOM1o7cLg7QpMKuOrhG+BSdFW342CHBGIcEEmQIWIlUxC9vDf68I6pjSdZyt6XxmIBHFBp9FX
	ze/p2FPCCCXuRZ+bk8UJHDQEAuR/E84235h2jCf1H+hHOivSz+sYIfXPUpwaXr/vyIaunRXQa7055
	P+ujqe6RLvRsqvWOrGxuOgT0XgcEXv0En3IQ==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU8dm-00000001cIK-1RKD;
	Thu, 19 Nov 2026 21:21:54 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v10 00/16] syscalls: Add a shared table for all archs
Date: Thu, 19 Nov 2026 17:21:50 -0300
Message-Id: <20261119-tonyk-syscall_table-v10-0-a7c9ebd900f6@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Q207DMAwG4FeZck1R4pwcrngPhFBO3QLdippSM
 U17d9IhsaJ0iEtb9vdbPpEchxQzedicyBCnlFN/KAWjdxvid/awjU0KpUGAgqIaRDP2h+Nbk4/
 Z2657Ga3rYmMAnXPMgXKOlM33Ibbp88I+PX/X+cO9Rj/O1DyxS3nsh+Mld2Lz3N8JE2toY7zkD
 FEAD/YxbW2X7L3v92SOmGCJ6HUEZkQG0bIYhWZthfArgvQGwguivZAWuJfUyQoRC4TBOiJmRGC
 gAMYGQStE/gORBeGBIzegvaKmQtQCAVxHVEHaELhEIZVvWYXoK2LYjZ/oGRE+YIuRg6p/gkvkx
 iVYEBohKOptYDxWiPlBGKNyHTEFwcBAS0QZjP+FnM/nL220kPTyAgAA
X-Change-ID: 20260724-tonyk-syscall_table-928bbb1b26bb
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
X-CRM114-CacheID: sfid-20261119_122206_010608_94009849 
X-CRM114-Status: GOOD (  20.78  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While implementing a new syscall, we need to wire up it's number to the arch
table. Since syscall number 403, all architectures are on sync regarding the
number (except alpha), which make things a lot easier but more repetitive as
well. Have a look at commit b36d4b6aa88 ("arch: hookup listns() system call"),
with 15 lines of mostly:

  +470    common  listns                          sys_listns

There's already a "common" table shared with a bunch of archs at
`scripts/syscall.tbl`, but due to historical reasons some archs will never be
able to move to this table and share all the numbers.

The generic table starts from 403 (clock_gettime64), the first common syscall.

I've compile tested for arm32, arm64, s390, mips, sparc and alpha by comparing
the syscalls_*.h and unistd_*.h files generated before and after this patchset.
For most of cases the files are identical, for the few cases that they are not,
there's a note in the commit explaining why they are equivalent.

This patchset depends on recent alpha commits (from "alpha: fix saved registers
in page-fault oops dumps" till "alpha: use generic CPU device registration
until") that can be found at:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Thanks!
	André

Changes in v10:
- New patch for synchronizing perf with the new common table
- Fixed missing oabic entry for sys_syscall
- Reworked --common-offset option to make the syscall numbers look like #define
  syscall (<offset> + <nr>) instead of the final number
- Rebased on top of new syscall alpha patches
- Link to v9: https://patch.msgid.link/20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com

Changes in v9:
- arm: get arm32 back. The local syscall table entries was splitted making
easier to deal with OABI, OABI with compat and EABI.
- Link to v8: https://patch.msgid.link/20260918-tonyk-syscall_table-v8-0-0e2d60cad13e@igalia.com

Changes in v8:
- syscall.tbl: Fix clone3 entries for nios2 and openrisc.
- arm: Dropped arm32 from patchset for now, till we figure a good way to deal
  with OABI issues
- mips: Removed common file (syscall_n.tbl) for syscall_n32.tbl and
  syscall_n64.tbl
- alpha: Fix __clone3 entry
- Link to v7: https://patch.msgid.link/20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com

Changes in v7:
- mips: Fix rules to make it rebuild when tables file change
- mips: Update unistd_%.h rule to new table files
- arm: Add back syscalls from 403 to 423. arm can't use the common table
definition for those syscalls, because the common table defines compat entry
point for some of them, and arm32 does not. On arm32 with OABI, this will cause
linking issues.
- Replace mktemp -p with mktemp, to make it more portable
- Link to v6: https://patch.msgid.link/20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com

Changes in v6:
- Rebased on top of 7.3-rc0: new syscall fchroot()
- Fix compliance with POSIX shells
- Add $(syscalltbl_common) to the prereq build files, so the build is triggered
if the common table changes
- v5: https://patch.msgid.link/20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com

Changes in v5:
- Add archs lists to Cc
- alpha: Change custom alpha_syscall to __syscall
- mips: Use "common" for all ABI tables
- mips: Kept it as a single table for n32/n64
- Fix bug introduced by mixing --offset and --compat-offset
- v4: https://patch.msgid.link/20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com

Changes in v4:
- Replace cln3 with clone3 in the ABIs
- mips: Get rid of custom mips ABIs (o32, n32, n64) and use 32 and 64
- mips: Unify n32 and n64 tables
- Add alpha to the syscall party, along with it's adaptations
- Remove --no-compat option and define SYSCALL_WITH_COMPAT() macro for archs
that need it
- v3: https://patch.msgid.link/20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com

Changes in v3:
- Removed x86 for now, let's wait till x32 is dropped
- Added much more archs
- v2: https://patch.msgid.link/20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com

Changes in v2:
- Managed to move to the real first common syscall: 403 (clock_gettime64)
- Added -no-compat option to be used with x86_64
- v1: https://patch.msgid.link/20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com

---
André Almeida (16):
      syscalls: Make --abis parsing more robust
      syscalls: Create unified partial table for all archs
      scripts/syscall.tbl: Use the common table
      s390: Use the common syscall table
      sparc: Use the common syscall table
      mips: Remove duplicated syscallnr.sh
      mips: Get rid of custom mips ABIs for syscall tables
      mips: Use the common syscall table
      syscalls: Add an option for offsetting the common table
      alpha: Define entry point for set_mempolicy_home_node syscall
      alpha: Use the common syscall table
      syscalls: Avoid matching substrings in the ABI parsing
      arm: Reorganize syscall table and separated the ABIs
      arm: Use common syscall table
      perf: Add an option for common table for build_tables()
      perf: Synchronize syscall tables with shared table

 arch/alpha/kernel/syscalls/Makefile                |  14 +-
 arch/alpha/kernel/syscalls/syscall.tbl             |  49 --
 arch/alpha/kernel/systbls.S                        |   1 +
 arch/arc/kernel/Makefile.syscalls                  |   2 +-
 arch/arm/kernel/entry-common.S                     |   4 +-
 arch/arm/tools/Makefile                            |  15 +-
 arch/arm/tools/syscall.tbl                         | 153 ++--
 arch/arm64/kernel/Makefile.syscalls                |   4 +-
 arch/arm64/tools/syscall_32.tbl                    |  69 --
 arch/csky/kernel/Makefile.syscalls                 |   3 +-
 arch/hexagon/kernel/Makefile.syscalls              |   2 +-
 arch/loongarch/kernel/Makefile.syscalls            |   4 +-
 arch/mips/kernel/scall64-n32.S                     |   1 +
 arch/mips/kernel/scall64-n64.S                     |   1 +
 arch/mips/kernel/syscalls/Makefile                 |  28 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl          | 735 +++++++++---------
 arch/mips/kernel/syscalls/syscall_n64.tbl          | 707 ++++++++----------
 arch/mips/kernel/syscalls/syscall_o32.tbl          | 827 ++++++++++-----------
 arch/mips/kernel/syscalls/syscallnr.sh             |  26 -
 arch/nios2/kernel/Makefile.syscalls                |   2 +-
 arch/nios2/kernel/syscall_table.c                  |   1 -
 arch/openrisc/kernel/Makefile.syscalls             |   2 +-
 arch/openrisc/kernel/sys_call_table.c              |   1 -
 arch/riscv/kernel/Makefile.syscalls                |   4 +-
 arch/s390/kernel/syscall.c                         |   2 +
 arch/s390/kernel/syscalls/Makefile                 |  12 +-
 arch/s390/kernel/syscalls/syscall.tbl              |  49 --
 arch/sparc/kernel/syscalls/Makefile                |  12 +-
 arch/sparc/kernel/syscalls/syscall.tbl             |  69 --
 scripts/Makefile.asm-headers                       |  11 +-
 scripts/syscall.tbl                                |  69 --
 scripts/syscall_common.tbl                         |  84 +++
 scripts/syscallhdr.sh                              |  83 ++-
 scripts/syscalltbl.sh                              |  46 +-
 tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 153 ++--
 .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  | 707 ++++++++----------
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |  49 --
 tools/perf/arch/sparc/entry/syscalls/syscall.tbl   |  69 --
 tools/perf/check-headers.sh                        |   1 +
 tools/perf/trace/beauty/syscalltbl.sh              |  38 +-
 tools/scripts/syscall.tbl                          |  69 --
 tools/scripts/syscall_common.tbl                   |  84 +++
 42 files changed, 1875 insertions(+), 2387 deletions(-)
---
base-commit: 17ef53bb8c797a1a9a60021355c636bf63c46886
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


