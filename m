Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93260A2614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rm8k9RDO;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NE5oGAnJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2UfKmm1rlwWeoTJyJCxbXck+Y2cqe3nU35QL6TPmrrk=; b=Rm8k9RDOUIMgJIH56BOu3imQR+
	IVWFgAjT4qBuh1g3uk1ZfZijYKJqaxZ+kTzzIxwRsdwYrteTE7YXDT+c9Qo1VloC67SrK6vJduTsA
	ZwGiNBHUmC4LenIqXK0zko1IyAT9qEfACRJ8CWKkJnI18xyJrbWZ6/VJrYq/LWN8M4GtBTH0m6QMB
	6f67q0PHK1hgQUMJUlWfDeMF/pi8emRQ0C2Sp6QRM7wVfW2ySPTDiaujIt6PklyB6FlMKVM1gIusu
	ySSf6PRvcPQ5d9E5RTIhp3Z3LjLe//I9vwyTnkaWxt4c95oi61M3P58a2zrv2VyfZ/s3YmqukrFFb
	SQvZts+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToe-0000000FzoK-0TIj;
	Fri, 20 Nov 2026 18:58:32 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTo7-0000000FzdW-0hvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:58:19 +0000
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHISHn1244287;
	Fri, 20 Nov 2026 10:57:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=2UfKmm1rl
	wWeoTJyJCxbXck+Y2cqe3nU35QL6TPmrrk=; b=NE5oGAnJ8dtHvW8cbPBfKntiD
	HoiVEtCiDmAwLJmiJWCcJVl3fTqFc3aaH3VSvsrDLdQ/uuuqcRqvhLS4D0ND0vO1
	bRMURxOe50flnYVsF/mQFfw5SeSaPctaAfggTq3XhI09Axudax60TBd10osFE57D
	4Ppf4jpT8Qajzo2pGexVXTC3bBSnHj4RXDmHPaGcOl6Oz+52aXtCZRG35DKuFa3Z
	YPGgcdXNCMlFgMDNU4Z0RnPoUwVKBYiJ3Pe3y3aLKYTJN0LTEwYh/A61uTyGAoWS
	EiRUjJPtUqLuZROLjSBNezCB/tF1qgyKQDavhO/w+WmaKmlvhIKO1KeSQfJUg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tg80tyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 10:57:37 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 18:57:36 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/4] coresight: Pulse an ETM external output for a PMU event
Date: Fri, 20 Nov 2026 10:54:30 -0800
Message-ID: <cover.1795196854.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfXw4V/1/1QH09E
 /NKk9roZFTRcmnEGjg3VVAesvsQn0PjQmXyqTnR7v7VMWqpJlz1aynDCrNX6b/hpqcFbpaO0JUm
 78ByWL9Tax1kwy8fd91Ry9E6G3P4kIA=
X-Proofpoint-GUID: 7I4La9n2MpzEYiJYkKLfhMwc_4KEOByM
X-Proofpoint-ORIG-GUID: 7I4La9n2MpzEYiJYkKLfhMwc_4KEOByM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfX/dn0KYZrF9b7
 5MmQ6yKXvmWMxzVrJrHWe9CtcH2K2pnSp9kLbyeRWCtbhenLs9ftfBrQZsH+4fteJJ72qVhHJbD
 q8Efq5N1ClssiFzdGjpEbvjlP/gfgIcVXEDEMP1SXh0NtMHzwYDoYgnbWbkdvn3773yzNNbnNAt
 FBNuRmElvf/EV0//r9qLfTSIcB5BHq19sE5ENjbY1IrxmLPm0c0RHIKL8vWFpxUzvEBVhERIV38
 z0IDCsIbKTBxLvvoLg4JR27ig51UsGLk3zs5TZIaPUsa7rD725sm3kohx+7yAPO+TvS5yef9CFu
 zohHFungbgI+pNfcK1QPhzjF4Xf0/OvNQem4AkvW5zLLwOP+9wnniKpXkZlv1Be2h5F9uEzgnZM
 Wu8Z0WZy7pV24OwyBUVZeXFF1cIfjjMHyAwNoytriIayjC6BnM+dz9T97q/fzFxPk10ctCEmJUH
 h5YbOeEbGb5Fjtr3tNg==
X-Authority-Analysis: v=2.4 cv=YewodARf c=1 sm=1 tr=0 ts=6b009821 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8
 a=wEtC9GN4mDrZAtQvkpoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_105800_761878_F10B13AD 
X-CRM114-Status: GOOD (  11.99  )
X-Spam-Score: -2.5 (--)
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

Add the pmu_pulse configuration to drive trace-unit external output 1
with the always-true resource. A separately selected consumer can count
these pulses, for example to pause an ETM AUX tracing window.

Output 1 remains fixed in the producer configuration. Users must select
the matching trcextout1 PMU event separately; this series does not check
producer/consumer pairing. Output 0 is avoided because it is the trace
trigger and a detected trigger can stop TRBE capture.

Changes in v6, addressing Mike's replies and Sashiko's v5 reviews:
- Keep generic configuration enablement a successful no-op on devices
  that do not participate in the configuration (Mike, v5 2/7 review).
- Add cscfg_csdev_can_activate_config() and exclude unsupported ETM
  sources during AUX setup, retaining mixed-device participation (Mike).
- Validate requested TRCEVENTCTL0R event fields against the decoded
  producer event count. A one-event trace unit cannot load EVENT1;
  malformed descriptions still abort instead of being skipped
  (v5 6/7 and 7/7 reviews).
- Drop the PMU capability probe, pmuv3_event_implemented(), generic PMU
  header inclusion and capability-matching plumbing. Producer resources
  are independent of whether a PMU counts the output (Mike), and the
  ARM32 CP15 header boundary is unchanged from base (v5 5/7 review).
- Include the preload declarations in the pulse translation unit
  (v5 7/7 review).
- Drop the unrelated unused-flag cleanup and update the documentation
  to distinguish producer admission from consumer support and routing.

Patch 1 is Leo's unchanged event-count prerequisite, retaining its
review/test trailers. The materially changed patches do not carry
forward v5 review/test trailers. No ARM PMU API changes remain.

Validation: ARM32 (V7M, CPU_CP15 absent) and ARM64 CoreSight object
build with LLVM 24. Passed assertions checks with ASan/UBSan harness.

Link to v5: https://lore.kernel.org/r/cover.1795182850.git.aaupov@fb.com

Amir Ayupov (3):
  coresight: etm4x: Skip features requiring unavailable events
  coresight: perf: Filter sources lacking the selected configuration
  coresight: Add pmu_pulse/extout_pulse

Leo Yan (1):
  coresight: etm4x: Fix event count decoding

 .../trace/coresight/coresight-config.rst      |  6 +++
 .../trace/coresight/coresight-perf.rst        | 30 ++++++++++++
 drivers/hwtracing/coresight/Makefile          |  3 +-
 .../coresight/coresight-cfg-pmu-pulse.c       | 39 +++++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 .../hwtracing/coresight/coresight-config.h    |  3 ++
 .../hwtracing/coresight/coresight-etm-perf.c  |  4 ++
 .../hwtracing/coresight/coresight-etm4x-cfg.c | 47 +++++++++++++++++--
 .../coresight/coresight-etm4x-core.c          | 13 ++++-
 .../coresight/coresight-etm4x-sysfs.c         | 29 +++++++-----
 .../hwtracing/coresight/coresight-syscfg.c    | 39 +++++++++++++++
 .../hwtracing/coresight/coresight-syscfg.h    |  2 +
 13 files changed, 199 insertions(+), 20 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c


base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
-- 
2.52.1


