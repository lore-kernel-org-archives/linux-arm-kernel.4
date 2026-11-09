Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40A606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vc5+qv3N;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxvv80tf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7QYMXonlT1X/OPGysSVGx2KIKbzgu61tqS/KtO5R6L4=; b=Vc5+qv3N5bZSWuEwOZg7Eh0WV6
	SrCz8eNXnN1NYpMyKcDV8IMtJ/V3pj9ekgf+S9fCQYyNJsstNmxf4vZX519z1XzqW+G+UuuTtxKGj
	x8K/1nMeS8Dm35+NpYSiIO/FLLsMzvverHtyb6dxqWcxEMWfHd9vsoz30hiPOru+vy8cQaWUmUrny
	fx+nvyON8LJB0LcTZCqDbUPKKCoWu1mK0tPMjMtnZ4NbvS92ds3BovzLBNIFH+T5psGicJfxi9lh9
	BvcsM0Jfta7Lrv/ThwOoU+nMH6AHivGVzJJkiEnt3gGyo9tOOOka2dGpE6frNeb2cfyJ5MXuKuWOF
	qtfT5WXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7f-00000000c0H-2GPb;
	Mon, 09 Nov 2026 12:05:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7e-00000000c0B-0AI5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CE0D630F7;
	Mon,  9 Nov 2026 12:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8725E1F0089F;
	Mon,  9 Nov 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225912;
	bh=7QYMXonlT1X/OPGysSVGx2KIKbzgu61tqS/KtO5R6L4=;
	h=From:To:Cc:Subject:Date;
	b=cxvv80tf4aXmD9C43/MEHNe9zk/XOvqolhWIiXZdZMbWuItd64Qt+Eec5f3n8l3TH
	 bEeXEYYcf2FECsC4387/eB7cZ7Dzz5R8a4Y9NITxgFw57Fx4q2uUiCx0XlzoyIkFIe
	 e4OdrhnHbZHoyCSKGEcTrw7Dn41p6jBtM2nkI1URQFwSoTPAQpiDoR3y8bh7nl7ETf
	 FrVXkorB2YhV5Hk/fN7tPjhceB2XfaRA+04R4fYULh4TrbRlGfGhRTBDxzWqnxOy4B
	 lxEGLabfYbu7mcX5Pt+8TBuKYaf/YydINE9Tke532vWOT8D3B9rOVXXVa4YrzkL2Nw
	 zs9k3s1sFuN0w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 0/6] arm64: Fix instrumentation escapes from noinstr path
Date: Mon,  9 Nov 2026 19:44:53 +0800
Message-ID: <20261109114500.20298-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Code marked with noinstr can only safely call other noinstr or
__always_inline functions. When reading arm64 source code, I found
necessary noinstr markers is missing somewhere. So I asked AI to scan
the arm64, this series is the result.

Since v1:
  Mainly address sashiko review comments:
  - add always inline to per cpu helpers
  - use tif_test_bit() instead of test_thread_flag() in sme_enter_from_user_mode
    and sme_exit_to_user_mode
  - a new patch to mark kasan_hw_tags_enabled always inlined
  - a new patch to Disable branch profiling for architecture library code

Jisheng Zhang (6):
  arm64: percpu: Always inline helpers used by noinstr code
  arm64: entry: Always inline helpers used by non-instrumentable paths
  kasan: Always inline kasan_hw_tags_enabled()
  arm64: stacktrace: Always inline internal stack boundary helpers
  arm64: lib: Disable branch profiling for architecture library code
  arm64: alternatives: Make branch and ADRP offset helpers noinst

 arch/arm64/include/asm/cpufeature.h        |  8 +--
 arch/arm64/include/asm/entry-common.h      |  2 +-
 arch/arm64/include/asm/fpsimd.h            |  8 +--
 arch/arm64/include/asm/mte-kasan.h         |  4 +-
 arch/arm64/include/asm/mte.h               | 10 ++--
 arch/arm64/include/asm/percpu.h            | 18 +++----
 arch/arm64/include/asm/stacktrace.h        | 16 +++---
 arch/arm64/include/asm/stacktrace/common.h | 12 ++---
 arch/arm64/lib/Makefile                    |  4 ++
 arch/arm64/lib/insn.c                      | 57 ++++++++++++++--------
 include/linux/kasan-enabled.h              |  4 +-
 11 files changed, 82 insertions(+), 61 deletions(-)

-- 
2.55.0


