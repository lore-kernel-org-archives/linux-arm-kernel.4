Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D54606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hvbTQ1je;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EtuBOIjW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2MDi62zSrUcHu3jIKja7h0mngHAeGSbDpYPRSVAWgbk=; b=hvbTQ1jeFPqb6c7pF2SahE4hdq
	i4PEHi/tVJhWv+wd+U372g/vMzDwn8THofTi0b25HRwcnyYaTF2r5fx1nLbRMbRA+sZla48bHRc2X
	/fUWEo75XiKwAiahEdHP34mK6hIWD7GzcvnSQqURJw2x51gEWiNtHmTmCIByw5xFvw8Th5cX8UZIc
	6THquJ6rquH7LNeScaQ9EWQxrmktwNfv34RjwMy1KrSCv3Gv07ILwL4r/2dR69x0yIiCN+YqgxAAK
	6eTHGV3EtV/RIF59CL20gbVslsxQh9sDrZRSWc/CWrtigttsaAPnGJsvhLJ6ko1MqiPVKupo3uXn/
	CcJFucSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOJ-0000000E0fY-3XLh;
	Fri, 13 Nov 2026 18:52:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOG-0000000E0eN-3sNL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:52:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF58143D;
	Fri, 13 Nov 2026 10:52:43 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 290A13F673;
	Fri, 13 Nov 2026 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794595966; bh=LmDTb5gajHHD2PRP+VluaoNil6RAYYnV0tkAZjWtwU8=;
	h=From:To:Cc:Subject:Date:From;
	b=EtuBOIjWX1OobRGrYVOS9JSxIrN3DhzJ/ppQVVbFMWaa+1b0Y9/oPLH+6Ejaddpc2
	 plRKB/EWMABFESSlx64g2Me4w4mwqaafKAdukvOoSx4Sx/dMpWU4m9py8xzIbwR5NG
	 FNtWFZJy3ScjUqBvq93OytCicqBAjF2Tv4eXx7NM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc3
Date: Fri, 13 Nov 2026 18:52:41 +0000
Message-ID: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105249_300302_87CCD9B6 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Please pull the arm64 fixes below: hugetlb write fault livelock,
permission overlay and GCS state preservation across CPU suspend,
cpuidle context tracking during system suspend, GCS mode handling on
signal return, AMU counter errata workarounds, kexec loading of images
with a non-zero text_offset and a spurious ptrace warning.

Thanks.

The following changes since commit 58c1eb84e97701c583605ba2fd553b69afba2245:

  arm64: sdei: Preserve the interrupted context's exception registers (2026-11-06 17:43:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to ad3fc05c7e65009355effeea06aa629a687acef2:

  arm64: suspend: Only track cpuidle context for idle tasks (2026-11-13 17:12:34 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix hugetlb write fault livelocks caused by stale read-only TLB
   entries after another CPU makes the page writable and only performs a
   local invalidate. Unlike the generic fault path, hugetlb has no
   fix_spurious_fault() fallback

 - Save and restore POR_EL0, GCSPR_EL0 and GCSCRE0_EL1 across CPU
   suspend

 - Restrict cpuidle context tracking in cpu_suspend() to idle tasks,
   avoiding context tracking warnings during system suspend

 - Ignore attempts to change GCS mode through signal return, which
   updated the software state without updating the hardware. Changes
   made through prctl() in the signal handler are preserved. This
   changes the documented ABI but no known userspace relies on it.
   Allowing mode changes through both prctl() and signal return also
   creates confusing interactions, with signal return potentially
   undoing changes deliberately made by the handler

 - Extend the AMU constant counter workaround to additional CPUs and
   add a core cycle counter workaround for Cortex-A715/A720, treating
   the affected counters as unavailable

 - Avoid CMA allocations when loading a kexec Image with a non-zero
   text_offset, fixing an incorrect entry point and a memory leak
   when freeing the image

 - Remove a spurious ptrace warning when setting the syscall number
   of a task in a non-seized group-stop without siginfo

----------------------------------------------------------------
Beata Michalska (2):
      arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      arm64: errata: Add Cortex-A715/A720 AMU core counter workaround

Chris Down (1):
      arm64: hugetlb: Prevent write fault livelocks on stale TLB entries

Jinjie Ruan (1):
      arm64: kexec_file: Do not use CMA for images with a non-zero text_offset

Mark Brown (3):
      arm64: suspend: Save POR_EL0 over suspend
      arm64: suspend: Save GCS state over suspend
      arm64/gcs: Ignore attempts to change GCS mode during signal return

Uladzislau Zhauniarovich (1):
      arm64: suspend: Only track cpuidle context for idle tasks

Zhao Gongyi (1):
      arm64: ptrace: don't warn on missing siginfo in a group-stop

 Documentation/arch/arm64/gcs.rst            | 13 +++------
 Documentation/arch/arm64/silicon-errata.rst | 12 ++++++++
 arch/arm64/Kconfig                          | 44 +++++++++++++++++++++++++++--
 arch/arm64/include/asm/suspend.h            |  2 +-
 arch/arm64/kernel/cpu_errata.c              | 28 ++++++++++++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/kexec_image.c             |  7 +++++
 arch/arm64/kernel/ptrace.c                  |  8 ++++--
 arch/arm64/kernel/signal.c                  | 22 +--------------
 arch/arm64/kernel/suspend.c                 | 11 ++++++--
 arch/arm64/kernel/topology.c                |  3 +-
 arch/arm64/mm/hugetlbpage.c                 | 21 ++++++++++++--
 arch/arm64/mm/proc.S                        | 20 +++++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 14 files changed, 151 insertions(+), 44 deletions(-)

