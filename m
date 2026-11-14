Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C61606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nz4cxl8a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBH/HQl+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6y9QE6jrL4hwSU15y6udJxlINtEcQ9mhA2x1WVNSoNo=; b=Nz4cxl8aUD4yS4nPiajSVwGQ4o
	IMES/yDwC7S/ou4SIloZcn23FtTHlhlMtDJRU2MFoLg9SeDL1IrXC6CyWZW7zZv8M2+KQi2rOTatH
	LRHr14u7klxmv22g2fU6qmgJveLVSKyApckH55joIpFU/oARI8T0njTJmzUL3KFA1Q9++THlmYGwX
	cHP/PnkHy/NCQtUgy7kv4uCC+0iPlUufyw+RmidmwCFAvnhYSHd4sk+89IQgmMMrR9sZRO9tTl6bp
	QmyIDoquXu/zpG+TxQ/6d2yjudEZbN7WM+tl3vq4QWoFcmD6XPWBS/ttKE0ls/Fstjlj6omK7XuKH
	Zr/PqvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tl-0000000Esyv-29SL;
	Sat, 14 Nov 2026 00:18:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tk-0000000Esyl-0J7m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:18:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE4D7409E6;
	Sat, 14 Nov 2026 00:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815B91F000C4;
	Sat, 14 Nov 2026 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615527;
	bh=6y9QE6jrL4hwSU15y6udJxlINtEcQ9mhA2x1WVNSoNo=;
	h=From:To:Cc:Subject:Date;
	b=iBH/HQl+hnAa1Q0SwQNKcQJ2kuRKBwgvwknCObI4/plivGobr6wfJnHn7jX01FEHq
	 mU8ZVgjRL3ZED9xj7PPuMfjXS9ldB1wm7opTb2bTeVtGTZA/FQy4VjAPWtqrjmoYUk
	 aFSZRjQA/YkVTXl8nzKSyvSIDZ0gKdPjAxR217hFQXBkW7MeldjLIXdKSNdqvO9CW9
	 3yrA8gnDVxjweP6tLFQ7n0YQppG7OIuJjX940V8X1CUqfEzpP4zCp+4O4DlMhO8ttG
	 x+yNN5VfTZe+jE/rasvYofrSWwcRQN1IGqizPzSv6KSQBFvmkpKpUCn+EQgJI6VRNn
	 2uDaq/QX1GSng==
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
Subject: [PATCH bpf-next 0/3] Fix duplicate caller frame in arm64 stack traces
Date: Fri, 13 Nov 2026 16:18:43 -0800
Message-ID: <20261114001846.873499-1-andrii@kernel.org>
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

Andrii Nakryiko (3):
  arm64: perf: Don't report the caller twice in caller-regs callchains
  selftests/bpf: Add stacktrace_ips test for tracepoint
  selftests/bpf: Run stacktrace_ips raw_tp, tp and fentry tests on arm64

 arch/arm64/include/asm/perf_event.h           |  2 +-
 .../selftests/bpf/prog_tests/stacktrace_ips.c | 67 ++++++++++++++++++-
 .../selftests/bpf/progs/stacktrace_ips.c      | 18 ++++-
 3 files changed, 81 insertions(+), 6 deletions(-)

-- 
2.53.1-Meta


