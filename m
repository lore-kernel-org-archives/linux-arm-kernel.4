Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0719606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HSDRcuVv;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cTwEr1R6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q/V4IUszpazd8BoTzUiOrvt4bOc1nZAchjVHwkWLl8s=; b=HSDRcuVvNGo6EIzIT1fZ32gMWl
	NFYN5LCEBD7qnrKCIrmnPKeKTQoNYrrGXQ48lgAlNsG93O/IPL4TPo0x34cGJ7dsCqZv34iR/R0hR
	xAAmVM/amrzblq3bQ8BJhbdRSiagU0un+kJvuCDTKjCPmdGjjR8qHYb+e/9kTO1ypWJ+KtnfcwUVH
	4sg2Uc1jkXrfailEUzQhBXV64GUVkwbqMyATH9AhCxfwAd6tZcwth3SdNffi7PPJeQYsDUacfH0Fs
	zMenSyP7P8o0rKVSKe4+SYBvkM+nMC8N2dd8usLwqzFIVkKphP96U+9DlftpJJXUAlda5tdsCZA61
	TYJ9Lkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUUC-0000000CLKJ-2Wva;
	Thu, 26 Nov 2026 08:05:44 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUU0-0000000CLHO-3gwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:05:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q/V4IUszpazd8BoTzUiOrvt4bOc1nZAchjVHwkWLl8s=;
	b=cTwEr1R6Yi7F3BNvJDxreEUGdbVfS9VlYIBiouaPVMBBLfLPlbFH8FHa8EIQztVAxqypki4ip
	YvKt8hTQGE94N6GOWUJ13eAKZHbIJikMDd8Ra3wAmpR3sBErVROkvoDjCO0b/Vd2uTcduBgD9kd
	QxTyqxTOu4/QiLNfkylC8jA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZpwx0L5vz1T4Fv;
	Thu, 26 Nov 2026 16:04:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 21E1240561;
	Thu, 26 Nov 2026 16:05:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/3] arm64: ptrace: Fix two old bugs
Date: Thu, 26 Nov 2026 16:05:11 +0800
Message-ID: <20261126080514.1523978-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_000533_747415_A30BA4ED 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As Linus suggested, extract the two ptrace bugfix patch and related
selftests from the patch set of the generic entry patchset[1].

The bugfix were found when switching from arm64 to generic entry, the
fixes are simple but there are many selftests:

- Drop redundancy spurious pseudo-single-step for
  PTRACE_SYSEMU_SINGLESTEP.

- Check whether the syscall is in rseq critical section before
  reporting syscall exit.

- Add related selftests. Because there are currently two related bug
  fixes from long ago that lack self testcases, which are commit ac2081cdc4d99
  ("arm64: ptrace: Consistently use pseudo-singlestep exceptions") and
  commit 3a5a4366cecc ("arm64: ptrace: Override SPSR.SS when
  single-stepping is enabled")

Very welcome any discussion and feedback.

Changes in v1:
- Rebased on v7.4-rc3
- Add real hardware test in commit message.
- Fix selftest AI review issues [2].

[1]: https://lore.kernel.org/all/20261111114225.3977243-1-ruanjinjie@huawei.com/
[2]: https://sashiko.dev/#/patchset/20261111114225.3977243-1-ruanjinjie%40huawei.com

Jinjie Ruan (3):
  arm64: ptrace: Fix spurious pseudo-single-step for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: ptrace: Check rseq critical section before reporting syscall
    exit
  selftests/arm64: Add ptrace single-step and rseq syscall-exit tests

 arch/arm64/kernel/ptrace.c                    |  16 +-
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../testing/selftests/arm64/ptrace/.gitignore |   6 +
 tools/testing/selftests/arm64/ptrace/Makefile |  15 ++
 .../selftests/arm64/ptrace/ptrace_common.h    | 159 ++++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.c  | 197 ++++++++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.h  |  22 ++
 .../arm64/ptrace/rseq_syscall_pc_asm.S        |  45 ++++
 .../arm64/ptrace/single_step_signal_handler.c | 121 +++++++++++
 .../arm64/ptrace/single_step_spsr_ss.c        |  79 +++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 103 +++++++++
 .../arm64/ptrace/sysemu_singlestep.c          | 141 +++++++++++++
 12 files changed, 902 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/.gitignore
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c

-- 
2.34.1


