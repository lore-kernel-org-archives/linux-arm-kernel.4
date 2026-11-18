Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e6PQaLMB;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FQdPA5Pb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LUqBzoEbICu2gGjrUri7BM8sDQgcxBg8NEGSqd5VzHY=; b=e6PQaLMBcEk7XH
	1CywpV33yXytSGhE3iM+ORQi2xjmtnNVm7Cda0IQKH4Btl4ZlNdb3p9d8D3Oq2UB7L39UV3bvV1gz
	c3iq2UQ2I1QO0uwWDgwdb5oLNSgQDq8riSKKE4XfF9BwpgmGaDJx/aIhFgyfo0YpXqC2ipXyg4yI8
	Ep2Ji93haF7ApML0ym6jLRRCFxpz1h2NhOldPQsudkHyhmWl9VMPATw74h/H7zFsmKP4spwsBc2BI
	kz/k4vy4N0TmPMiq4RXKjfLW+SrHwr47BOuZ4138e6rQ57da7XF84atTy+LdYdmT8fKyxqQUdtyMC
	IyBraRcVEGZY32hL6/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsFr-0000000AiX0-1q2A;
	Thu, 19 Nov 2026 02:52:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsFq-0000000AiWt-1Tdc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 02:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DE4A647EB;
	Thu, 19 Nov 2026 02:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5DD1F000C7;
	Thu, 19 Nov 2026 02:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795056724;
	bh=LUqBzoEbICu2gGjrUri7BM8sDQgcxBg8NEGSqd5VzHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FQdPA5PbR62M2KAUFLRVkIscuP9wUmqDrYhtPCKCT/droV2whyPJ4S+rF3HIVG1/3
	 HZf4fk27zjIkcFnHzezfDhECvkL9QTHZqf8lCqfL8zTDfljgQVeIRScpwNhq5ctwgV
	 mA0FTD62gThyNH651CfsoTB4ptlwsJS/OeA1maPI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Ali Saidi <alisaidi@amazon.com>,
	Leo Yan <leo.yan@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	German Gomez <german.gomez@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.garry@huawei.com>,
	Kajol Jain <kjain@linux.ibm.com>,
	Like Xu <likexu@tencent.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 2091/2214] perf c2c: Use peer as default display for Arm64
Date: Wed, 18 Nov 2026 16:02:47 +0100
Message-ID: <20261118150134.267021741@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118150009.797899913@linuxfoundation.org>
References: <20261118150009.797899913@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Leo Yan <leo.yan@linaro.org>

[ Upstream commit ead42a0f9b93c3447a24be08a9e80941e99b8a50 ]

Since Arm64 arch doesn't support HITMs flags, this patch changes to use
'peer' as default display if user doesn't specify any type; for other
arches, it still uses 'tot' as default display type if user doesn't
specify it.

This patch changes to call perf_session__new() in an earlier place, so
session environment can be initialized ahead and arch info can be used
for setting display type.

Suggested-by: Ali Saidi <alisaidi@amazon.com>
Reviewed-by: Ali Saidi <alisaidi@amazon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Tested-by: Ali Saidi <alisaidi@amazon.com>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: German Gomez <german.gomez@arm.com>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Like Xu <likexu@tencent.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Timothy Hayes <timothy.hayes@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20220811062451.435810-15-leo.yan@linaro.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: 7d0fe18bc905 ("perf c2c: Fix memory leaks on output fields")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/builtin-c2c.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index e6f900c3accb0..75fe1f4c6dd03 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -2602,7 +2602,7 @@ static int setup_callchain(struct evlist *evlist)
 
 static int setup_display(const char *str)
 {
-	const char *display = str ?: "tot";
+	const char *display = str;
 
 	if (!strcmp(display, "tot"))
 		c2c.display = DISPLAY_TOT;
@@ -2776,27 +2776,39 @@ static int perf_c2c__report(int argc, const char **argv)
 	data.path  = input_name;
 	data.force = symbol_conf.force;
 
+	session = perf_session__new(&data, &c2c.tool);
+	if (IS_ERR(session)) {
+		err = PTR_ERR(session);
+		pr_debug("Error creating perf session\n");
+		goto out;
+	}
+
+	/*
+	 * Use the 'tot' as default display type if user doesn't specify it;
+	 * since Arm64 platform doesn't support HITMs flag, use 'peer' as the
+	 * default display type.
+	 */
+	if (!display) {
+		if (!strcmp(perf_env__arch(&session->header.env), "arm64"))
+			display = "peer";
+		else
+			display = "tot";
+	}
+
 	err = setup_display(display);
 	if (err)
-		goto out;
+		goto out_session;
 
 	err = setup_coalesce(coalesce, no_source);
 	if (err) {
 		pr_debug("Failed to initialize hists\n");
-		goto out;
+		goto out_session;
 	}
 
 	err = c2c_hists__init(&c2c.hists, "dcacheline", 2);
 	if (err) {
 		pr_debug("Failed to initialize hists\n");
-		goto out;
-	}
-
-	session = perf_session__new(&data, &c2c.tool);
-	if (IS_ERR(session)) {
-		err = PTR_ERR(session);
-		pr_debug("Error creating perf session\n");
-		goto out;
+		goto out_session;
 	}
 
 	session->itrace_synth_opts = &itrace_synth_opts;
@@ -2804,7 +2816,7 @@ static int perf_c2c__report(int argc, const char **argv)
 	err = setup_nodes(session);
 	if (err) {
 		pr_err("Failed setup nodes\n");
-		goto out;
+		goto out_session;
 	}
 
 	err = mem2node__init(&c2c.mem2node, &session->header.env);
-- 
2.53.0




