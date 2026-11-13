Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9089606BDAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=alqWyH4+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NxGoUR8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0Xoy/+JkhOVy2zZs+D9jW0FH/gOoj/AzGHpxhSOnZug=; b=alqWyH4++rzCwbw5iVTDfnKLh9
	4NH3JXXyLhx3HZ3K6VjLEBgbdVEdxLSda2dxpI8n7q3vW/e6zHVjJR5hSYgH23a1nmsZp6YzaHz3g
	VI7IJ1vmHEzElJj185fMA35epP4fDcmS9lW7wkaAOwIt6jO6fR+kGzbx684I6ctjN4/mfdh17yFN8
	3UbfOzl8ntzbLc5pByEj1RPyS7hcgIZvURZoBzcr48UyEgiAMw00WR3WSQzA6lv0peZS4U677ZjjO
	55d8mklHpmfv3zByg834teNCn9bwhYS3z2fXgd+M9G8n+iM1XsQ1G8HI8SvU9i87hK3IZ2SeLV+BT
	7wQAiz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovz-0000000CQLj-3OOr;
	Fri, 13 Nov 2026 10:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovw-0000000CQKM-28NY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:55:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7681AED;
	Fri, 13 Nov 2026 02:55:00 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E53863F673;
	Fri, 13 Nov 2026 02:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794567303; bh=7GXvv174N+KlDiwy/lVoFVjQ8KSC6/JT940zg1WRQlA=;
	h=From:Subject:Date:To:Cc:From;
	b=NxGoUR8CRNO5Ua1FLCH/1EWsTUJaVPRzNnls7Ex1WmUbH60nflWMtCGvBWPMrPKKy
	 zKmUQPkMRIQWP/zpy7U5fVLLPVFFrCH5YXQgUNUNypvJcfBWlLo7b94NqOXT0xgD78
	 R7+RQbSFSruF48C4ICk9RD0lnltK9fCn4DyDqEMQ=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/3] perf cs-etm: Fix GCC 15 build failure
Date: Fri, 13 Nov 2026 10:54:51 +0000
Message-Id: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHvs9moC/x2MUQqEMBDFriLzvQWnRRGvsixF66sOiMqUFUF6d
 4ufgSQ3JaggUV/dpDglyb4V4E9FYRm2GUamwmRr2zKzMwc0+iiXn0PgxsdB1r/CMBxb50Z0taU
 SH4oivePvL+cH3zaWDmgAAAA=
X-Change-ID: 20261113-perf_fix_gcc15_failure-1e31233be802
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Robert Walker <robert.walker@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567301; l=951;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7GXvv174N+KlDiwy/lVoFVjQ8KSC6/JT940zg1WRQlA=;
 b=dtRlrnLklDGuAhcLzDRmbJ0gy2YDYiFMthhgs9oxG/teWg6IiuSw9z/2GdTSzlcXqewr88LKC
 B3F5bFKWu+2CWJunZveop7XTidTy8NGIlaoa1kMkVVLJtHzXyNzr9cL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025504_596110_837EB209 
X-CRM114-Status: UNSURE (   6.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes the GCC 15 build failure reported by Ian Rogers [1]
(thanks, Ian!).

Two follow-up refactoring patches use the packet’s recorded instruction
size for stack events and centralize error checking for frontend
instruction reads.

[1] https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/T/#m64fb81c665214b79883d9be815b40ac5f6669628

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (3):
      perf cs-etm: Initialize the Thumb instruction buffer
      perf cs-etm: Use the packet instruction size for stack events
      perf cs-etm: Check frontend instruction reads

 tools/perf/util/cs-etm.c | 83 +++++++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 32 deletions(-)
---
base-commit: 4af65363b11fc4fe65fcb497f68bbe4f3e3a4d2c
change-id: 20261113-perf_fix_gcc15_failure-1e31233be802

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


