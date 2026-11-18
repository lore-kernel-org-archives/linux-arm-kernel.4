Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4D3606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATRjObAA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGD7mkyb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N1sGH4N/SXZ2PEylzDQSbka+G8mKbWTDfMxnhcO/bOI=; b=ATRjObAAumg8CDUIDbyM/QSbkx
	tK3YpkmwyhhmgAlbuLIgLNx+VUqaj8UekBmLogGnfbIJ40V2qMlZRBB+9RGBCSEo6R6PYNv7t120A
	6AS0siNAPGqhn+XMWvvOJH01xy/dZ3b1jYjXetPswNAZLddRKD1mxjspkEnyvsqb92ravZUji3FZk
	ANw2U9WsIO0QArVPNI9fhbOa6zumjMapWmjnryFI4sheVmDa47eLDCQpLgQZO59hdUk6jhp0HBiT4
	Wedx9aU/CtrqpmD4neBqapgOAzicMBlkAM8kGzUwEsszJL1zB1n6dkxbR5VWMlLSXSCNTwCE6yC/U
	BAvb9qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbHo-00000008Ct7-3FVk;
	Wed, 18 Nov 2026 08:45:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbHn-00000008Csg-0Fdd;
	Wed, 18 Nov 2026 08:44:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C4C0405DF;
	Wed, 18 Nov 2026 08:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C501F000CA;
	Wed, 18 Nov 2026 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991498;
	bh=N1sGH4N/SXZ2PEylzDQSbka+G8mKbWTDfMxnhcO/bOI=;
	h=From:To:Cc:Subject:Date;
	b=dGD7mkybV8hQ9Llilny4jnyX3zQT0Ep2HY++G1vuIMeixLzwoyK9sNKrxLwcrKWQN
	 emllvu4pbdquNod7Hx9FgiIoOU9Zd+4skmIOVpQTSWxXveVf2yN9WeFzDATL5KrhKS
	 MgjoZsAeS5Zxh01cDqv3SR3Wv48Wxwza3jqYT832xXOtKqvbB6GUeFtf2ZrLiSLaUZ
	 /UHzPCif2KRBYmQQvehes3R7fSGJPUFhT0O33gF+7buYD5RzICjcbUwiuBCG/8YKKf
	 QdLfBN6Kj1BMYKCzIpb72hYCwqwixDKEWPhwx3Cs83oya/cvb+Fo04xbCgfNB8ozCq
	 /PcxyBMVA9WCw==
From: Jiri Olsa <jolsa@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: bpf@vger.kernel.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	rtm@csail.mit.edu
Subject: [PATCH bpf 0/2] bpf: Limit writable registers in uprobe context
Date: Wed, 18 Nov 2026 09:44:48 +0100
Message-ID: <20261118084451.12590-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,
a uprobe BPF program can currently write fields in struct pt_regs that
are loaded directly by the architecture’s return-to-user path. Some of
these fields are restricted by ptrace, but the BPF verifier does not
apply the same restrictions.

This series limits uprobe context writes to registers that ptrace can
set to arbitrary values. It adds architecture-specific writable-register
checks for arm64, riscv, and x86-64; other architectures default to
allowing no writes. Reads are unchanged.

The second patch adds verifier tests for writable and read-only registers
on x86-64, arm64, and riscv.

Patch 1 fixes the issue reported by rtm and is marked for stable consideration.
Patch 2 adds the regression tests.

thanks,
jirka


---
Jiri Olsa (2):
      bpf: Restrict uprobe ctx writes to the registers ptrace can set
      selftests/bpf: Test which ctx registers a uprobe prog can write

 arch/arm64/kernel/probes/uprobes.c                            |   6 ++
 arch/riscv/kernel/probes/uprobes.c                            |   6 ++
 arch/x86/kernel/uprobes.c                                     |  15 ++++
 include/linux/uprobes.h                                       |   5 ++
 kernel/events/uprobes.c                                       |   9 +++
 kernel/trace/bpf_trace.c                                      |  10 ++-
 tools/testing/selftests/bpf/prog_tests/verifier.c             |   2 +
 tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c | 196 +++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c

