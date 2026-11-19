Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A984606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rj/Sytoz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0twXbQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QlaFXh2FSXbQ/e8h1gUNCb/cTAUZrL7gz15TDUrTHDo=; b=rj/SytozZEJkC7BCUkbAzEB8KT
	Nwb+OMDaKCRBX3miuQqJ0QF4y1B2F3f8uRvKN4UtjrRNQ2HKDvDoEARN59YECgJCc12d9agKX4h3q
	tdgsEUFzZCQw57bdQWfxJU/wAtHn7crNszOQN2onjwzAFp2dYR7guanQZdzAYer3MdpN3WNhGsGCZ
	+SQ/nnxenubbvyg4RjTRl9ofeJN5l3lK976zlCZsR28N2SyUX/O/6G2HP3s9shXQIZjE/AY9Tuoyj
	btbLTsl5+ZxK6xMwGoxxTLhz8f1W5y+yDAa2cVfdyfZEp2+7wT5WQV+EbNiwzzCUrCh2FAZTdZJ8m
	h/+F0X4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpaW-0000000AXfx-21KG;
	Thu, 19 Nov 2026 00:01:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpaV-0000000AXf9-1FRY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:01:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A9EB61EED;
	Thu, 19 Nov 2026 00:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B931F000C4;
	Thu, 19 Nov 2026 00:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046474;
	bh=QlaFXh2FSXbQ/e8h1gUNCb/cTAUZrL7gz15TDUrTHDo=;
	h=From:To:Cc:Subject:Date;
	b=S0twXbQr4u2IJOiRn5N+OC9gyAeUuO0PL6Pt1+zVwnEV8sL6rMWgtoqxuWIuduG9e
	 5SbOnLg3KBXCzfSD9UbYIi1lprqaaw8QnWhGzPgC2YZo8tlefEuai3vx+wjJu5Cf7d
	 Qgutj122XMIYlRgY65CMe5Ka6y55/xrq/wBT7EheqI9S9fIX4qHdIvm9qiTZhJM9Fj
	 JL/j7J34GNIlpgOCoGmK/IeyE9aO4qYOpn+xdDq/hzeJO0ChyWPylMhlpFI1Tqhd0d
	 kaJrafb9uCWzoMbQKbY+6oqUF7M+w0b6llOHlmvzrkUHQZg+6pldFPdLu6dXUp/acV
	 /Xe3h9SbcVlnA==
From: Andrii Nakryiko <andrii@kernel.org>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	peterz@infradead.org,
	jolsa@kernel.org,
	rostedt@goodmis.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH bpf-next v2 0/3] Fix duplicate caller frame in arm64 stack traces
Date: Wed, 18 Nov 2026 16:01:09 -0800
Message-ID: <20261119000112.2377949-1-andrii@kernel.org>
X-Mailer: git-send-email 2.53.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On arm64 the caller is reported twice when the kernel builds a callchain for
the current task from regs filled by perf_fetch_caller_regs(), instead of regs
saved by a real exception. There was a similar problem on x86-64, but it was
since fixed. Now it's time for arm64.

Patch 1 has the fix, patches 2-3 add BPF selftests for this.

I'm targeting bpf-next because of BPF selftests and to have BPF CI test
everything. Patch 1 doesn't have to go through bpf-next, but it's simple enough,
so if arm64 folks are ok with that, please ack and then we'll land everything
in one go into bpf-next.

v1->v2:
  - keep __builtin_frame_address(0) in perf_arch_fetch_caller_regs(), mark
    these regs with PSR_MODE_EL1t instead, and have perf_callchain_kernel()
    skip the duplicate leaf regs->pc for them, like x86 does with
    perf_hw_regs() (Will);

v1: https://lore.kernel.org/bpf/20261114001846.873499-1-andrii@kernel.org/

Andrii Nakryiko (3):
  arm64: perf: Don't report the caller twice in caller-regs callchains
  selftests/bpf: Add stacktrace_ips test for tracepoint
  selftests/bpf: Run stacktrace_ips raw_tp, tp and fentry tests on arm64

 arch/arm64/include/asm/perf_event.h           |  2 +-
 arch/arm64/kernel/perf_callchain.c            | 33 ++++++++-
 .../selftests/bpf/prog_tests/stacktrace_ips.c | 67 ++++++++++++++++++-
 .../selftests/bpf/progs/stacktrace_ips.c      | 18 ++++-
 4 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.53.1-Meta


