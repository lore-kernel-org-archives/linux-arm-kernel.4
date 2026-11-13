Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C9606BDAD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X5zmNPL+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bI34F5OW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QUYBNBZj+lW+OPNvW2qKBQAyQ8N2obK55MwOVcAaI5E=; b=X5zmNPL+pIPyKv
	Wenx7+LOhm7Rm3uKaFGL28YEqP/nXgG5La+PshB5rs0zD7y75M3EgL2EVjdYYiT9ucUzo9X/9v61o
	tiOd+AS+FUh3oB419dpVqbXodWYzD7zTsGS2zwnaV7a1MTiUHCGGzftxmPK6Tdo+GaVhWE6L/uymS
	hW4caGfYcdPXDenKKbUUQMYk8aljBFEp9cLGzXVOSP3qF/jnFG73bqjSl10zwAGzF+IYXvQ9cYDSx
	aNHV6F7uvVU83MYTWgT2BbfQ+SCSPCmRVoLaBlR1Mri7Z5kjvxsX4KTvLJGLS51j+ZeK8rbqltVEm
	NDMqr7/W58rK0brpsZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRow4-0000000CQNx-3lGC;
	Fri, 13 Nov 2026 10:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovy-0000000CQLN-2gPq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:55:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E5F1BF3;
	Fri, 13 Nov 2026 02:55:02 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1813F673;
	Fri, 13 Nov 2026 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794567305; bh=PcQuDLM+ZyjAtHUeLq4+Pe+fYs9lcsAwvJZO4FQEXHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bI34F5OWssnZ1R6O+UisrYaLXA1gzTBsCX1pYgHc19eZYJwjrVgQMHlt+dJnG/gqt
	 H/V3xdvbBYbfhVtpHRy7KzM3pJT6imwueHIrOLcgK3123bO8l6Nq7LZC9iOGgtpofi
	 49ATo9KkZE6e9inu4PZiIo5wUnpNoWWGd83GEXHw=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Nov 2026 10:54:52 +0000
Subject: [PATCH 1/3] perf cs-etm: Initialize the Thumb instruction buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Robert Walker <robert.walker@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567301; l=1422;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=PcQuDLM+ZyjAtHUeLq4+Pe+fYs9lcsAwvJZO4FQEXHg=;
 b=eh8Mpnhp/Gw8xKFd1DU0kzymunaq3Q280Cqkf9l5gGrIGlfcoEZFxb0b+P8pCaIhLRizoSQ6y
 uFbrLqp3lnfDRChJ3UQerndIOGW78D65sdxX3LMfKYfzM+kuS7BvKTP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025506_730742_072DD2A9 
X-CRM114-Status: GOOD (  11.21  )
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

cs_etm__frontend_mem_access() can return zero or a short read without
fully initializing instrBytes. cs_etm__t32_instr_size() nevertheless
inspects its second byte. With CORESIGHT=1 and -O3, GCC 15.2.0 reports:

  error: 'instrBytes' may be used uninitialized

Zero-initialize the buffer to avoid reading uninitialized stack data
when instruction memory is unavailable and fix the build failure.

Reported-by: Ian Rogers <irogers@google.com>
Closes: https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/T/#m64fb81c665214b79883d9be815b40ac5f6669628
Fixes: a7ee4d625ede ("perf cs-etm: Support for ARM A32/T32 instruction sets in CoreSight trace")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3e01b401ca6f3a08f44bb69204317efaf2fa18d0..25f12bd110934a204d79244f45317085b7a81666 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1369,7 +1369,7 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
 					 struct cs_etm_traceid_queue *tidq,
 					 struct cs_etm_packet *packet, u64 addr)
 {
-	u8 instrBytes[2];
+	u8 instrBytes[2] = { 0 };
 
 	cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
 				    ARRAY_SIZE(instrBytes), instrBytes);

-- 
2.34.1


