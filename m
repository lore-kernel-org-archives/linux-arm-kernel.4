Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C960A5BE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GkhFcc+7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLU3byo1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6HGWkCDBHmlGJfJwDjjX0Ph1nyw6UI7RFOL+RhCg8RY=; b=GkhFcc+7FmPhGd
	vW9iN1A/F15I0omEivq6GUo4PPEvJ7/2FiP6Shn+/leJG3m4H0gX7qewH0Mihm6WWjh4dyQqpAW4I
	fHwSamWCqxCwbq1qcjeOaKPPaswLqYHLTrj1g0Ezfu6fNDHED7JdZt2jJsdSFXpYQMC7bVr4+fVPD
	KjEe6AUQB3TE1HfQ55Vt7r+AIzVM9nmQtHAPG0nSIVrjbr31GzHfyFUrGfwSdurcCuCr71cyl4ykq
	WioIHoF5F6AGnjQ791gfPTUI5FYuuQO22jRDhp22Le07xPkHirC7zGP5stRmNQU9eM7e7vWpx1UMm
	vqLdjPCJ+RImc14dRnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsrH-0000000DJ14-1jO0;
	Fri, 13 Nov 2026 15:06:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsrG-0000000DJ0b-0Um6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:06:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66149627AB;
	Fri, 13 Nov 2026 15:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0A21F000CB;
	Fri, 13 Nov 2026 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582389;
	bh=6HGWkCDBHmlGJfJwDjjX0Ph1nyw6UI7RFOL+RhCg8RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OLU3byo1mdgmz/XiNroAWEmhpC9vNhR9qoz7+z/VUH0wXtPe1lRj1oKCw0teXreqx
	 Xs805ovqFWTJNCywUghr3gwOLstucn8dyGzP18SGVZIInnx4fwm/20dZCtnJpV+wpN
	 ZkNiqX8Oavin41KF7T6AGwgawdaXpMSKlmV21OYIowhqNLnvnzCC/qD/SxIfwnLa57
	 DbfYFueNfB9YUkxZuvpQO1UGLFfySNAxqhYymwpmVTgCsY4ws1elaff7HUJcURAPvq
	 jFhpLEbq2zwF5t6LInOjMrVCSMZkyvse6hnLXHy4zvSe+6LmdSfeudTeZF9Y2zb4mi
	 Vsd6g3OhzElsQ==
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Clark Williams <williams@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Leo Yan <leo.yan@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Robert Walker <robert.walker@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 09/12] perf cs-etm: Fall back to the recorded instruction size on a failed read
Date: Fri, 13 Nov 2026 12:05:50 -0300
Message-ID: <20261113150555.1163049-10-acme@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113150555.1163049-1-acme@kernel.org>
References: <20261113150555.1163049-1-acme@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnaldo Carvalho de Melo <acme@redhat.com>

cs_etm__t32_instr_size() reads the instruction bytes from the traced
program's memory to tell a 16-bit from a 32-bit T32 instruction, but it
ignores cs_etm__frontend_mem_access() failing, which happens when the
DSO or its debug data is missing, and then reads the uninitialized
buffer.  GCC 16 warns about it and build-test fails with -Werror.

Use the instruction size recorded by the decoder, as the A32/A64 path
already does, when the read doesn't return the full two bytes.

Fixes: a7ee4d625ede4f62 ("perf cs-etm: Support for ARM A32/T32 instruction sets in CoreSight trace")
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>
Cc: Robert Walker <robert.walker@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3e01b401ca6f3a08..5d53ed74ae8835a9 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1370,9 +1370,12 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
 					 struct cs_etm_packet *packet, u64 addr)
 {
 	u8 instrBytes[2];
+	u32 len;
 
-	cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
-				    ARRAY_SIZE(instrBytes), instrBytes);
+	len = cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+					  ARRAY_SIZE(instrBytes), instrBytes);
+	if (len != ARRAY_SIZE(instrBytes))
+		return packet->last_instr_size;
 	/*
 	 * T32 instruction size is indicated by bits[15:11] of the first
 	 * 16-bit word of the instruction: 0b11101, 0b11110 and 0b11111
-- 
2.56.0


