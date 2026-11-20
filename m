Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A7606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YzWRPl38;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=SlLn7HHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tvO1v00MKFZbgF6KSCFJYyOa1CwNkFl6XFGg7HJK/+I=; b=YzWRPl38/VApy+kntPyjX+dHBf
	rTeQc7aIbSakmOmyz7LT6HN/uIovq5XkezLxXBV/D1ln0V3NHzgUDVkbHoE1x1ZLlyTdZsVGR29n5
	B94m0RBkJkcbOGTbNT4DJRAlC1S7VssNs5fNfiQJzCImA0XmhdGBJyanm7IuFwYyr6hmEUnjkcKl5
	3rZPOwsuY0qWGDfvQ4/H6uOMAoIA7cHvbq+dzZYfJuZXemLjgv81NyBd9OYwkxLbRYtSWowxfdKWk
	fqqArjSWG8ilp++4Vbc2+nV4Vo0SnyzQgFl/3G03tqSFzO8BD3/DMGYlwUv5NoJAzJaiSj3lyXr5W
	6u++BFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUx-0000000FPcz-3wFE;
	Fri, 20 Nov 2026 15:26:00 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUa-0000000FPMq-0Xrz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:25:38 +0000
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfgql1560959;
	Fri, 20 Nov 2026 07:25:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=tvO1v00MKFZbgF6KSCFJYyOa1CwNkFl6XFGg7
	HJK/+I=; b=SlLn7HHWMtXIhoWFM6wT8gbl4fLmGsBQE7gjKjvsKG8HR/Vyo8Wlv
	Nm7mKmuZhS3Ibuh5unsTkYpBA3uBWMoFNL/Qkm3nGWYFXSFdkDvBleDiEKu6Dqde
	cFjdf21Vzrf3wbb3FBtg4K/oaNgBWiNGsCZubEUpUPX6qt8nBmYFEs+GiseOjT7o
	zltbitq/bx0XD4SVmaaOS62ywmTa36LwMhMTjEZ+83mjS955Izp/OlKhtO4Rlo4K
	ZeAN4zdqYrigjzHvs6mYcKYTQihVrNGoqvwbS9N4a8pDMMZhMQdc4ddzWM15kw9B
	DK+RyQuToMtWwVorpdfd2wI2MNzdHxtzw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j22w7965j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 07:25:12 -0800 (PST)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 15:25:12 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
Date: Fri, 20 Nov 2026 07:21:18 -0800
Message-ID: <a0472c58f855a9bd358f7faf8e88e44207c90fc4.1795182850.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795182850.git.aaupov@fb.com>
References: <cover.1795182850.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ia0Symqa c=1 sm=1 tr=0 ts=6b006659 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=JnKecZnUtZousrUlYMGU:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=Jk1ypKxpNml08E-81-wA:9 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SH3OuBtvwXKBoztDjcU-AJwErOhn10y2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX8+Ep96mHTmeu
 4kRwJdQtHEie2zmmoIQabNPXprSoFeCT/woN2pfvfkQNXSMHMEhd8iGSeJDWYaJixMontDbtKQ6
 fqwFzmQdEJj847m26HAJDjwHaXBwKp8=
X-Proofpoint-GUID: SH3OuBtvwXKBoztDjcU-AJwErOhn10y2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX5yFIGHXnKmkd
 LCGntlyjQFJcovzfEu5Vk1DYx1GG0S9u81maPNt6I4GtdlP1wdYLycb/v+KL3MBn4esCgUTuU8z
 ThAHrq4QDQDvViCdXrz6wMNH64Irpybm+/EWfc5AYCBnQ3NyPJq7KEiVccMOY5koic30XSP/NUA
 ZfUqou9K8EAd12W4PyYlR7/cGcHdlR9bqBNJWx1Eu8PbxTnGF7Ho1clwJhS/x8S0yb7H93KCcuQ
 wwXuSX6NaHQNEW9rfyjLZMFpfC1wi0vZBXGOf3Wudyh5MCmEbRUtiUIVFISLazJg4+FR1GEwWCg
 txTzugATzfV58DM7trVXNHezourwS/LePg5Q/Lym0tQc8+UlwIGap8qk9BzRzXcy6T5gEIMbqcm
 z6Re0ztWwMpnoL0BVlZgRHoq/CH9L4GT4TumXwwKpKbCaiIh3+r60A4E+/y+Pqo02QHMhuvgcst
 XWqS9Y0DtmF6Hmw0alw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_072536_755970_C40F4BA9 
X-CRM114-Status: GOOD (  17.18  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drivers outside the PMU driver may need to know whether the local CPU's
PMU implements a common event before relying on it, for example a trace
unit driver checking that the PMU counts its external outputs as
TRCEXTOUTn.

Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
the first ARMV8_PMUV3_MAX_COMMON_EVENTS events are reported in bits
[31:0], and as many from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits
[63:32] from PMUv3p1.

Move ARMV8_PMUV3_MAX_COMMON_EVENTS and ARMV8_PMUV3_EXT_COMMON_EVENT_BASE
next to the event numbers in linux/perf/arm_pmuv3.h, so that both are
available without CONFIG_ARM_PMU, and include it from
linux/perf/arm_pmu.h, which sizes the PMCEID bitmaps with the former.

Suggested-by: James Clark <james.clark@linaro.org>
Assisted-by: Devmate:Opus-5.5
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
Will, Mark: could you Ack this so Suzuki can take it through the
CoreSight tree with the rest of the series?

 arch/arm64/include/asm/arm_pmuv3.h | 20 ++++++++++++++++++++
 include/linux/perf/arm_pmu.h       |  3 +--
 include/linux/perf/arm_pmuv3.h     |  8 ++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88ab..f6882771ec7970 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -173,6 +173,26 @@ static inline bool pmuv3_implemented(int pmuver)
 		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
 }
 
+/*
+ * Whether this CPU's PMU implements a common event, as reported by
+ * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
+ * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
+ * Must run on the CPU whose PMU is queried.
+ */
+static inline bool pmuv3_event_implemented(u16 event)
+{
+	bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
+	u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
+	u64 pmceid;
+
+	if (id >= ARMV8_PMUV3_MAX_COMMON_EVENTS ||
+	    !pmuv3_implemented(read_pmuver()))
+		return false;
+
+	pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
+	return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
+}
+
 static inline bool is_pmuv3p4(int pmuver)
 {
 	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 02d2c7f45b527d..a90867c9774c74 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -10,6 +10,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <asm/cputype.h>
@@ -122,9 +123,7 @@ struct arm_pmu {
 	bool		avoid_pmccntr;
 	u64		reg_pmmir;
 	u64		reg_brbidr;
-#define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
 	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
-#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
 	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
 
 	/* Only to be used by ACPI probing code */
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a276..5bab0f952fd59c 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -78,6 +78,14 @@
 #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND			0x003E
 #define ARMV8_PMUV3_PERFCTR_STALL_SLOT				0x003F
 
+/*
+ * PMCEID{0,1} report ARMV8_PMUV3_MAX_COMMON_EVENTS common events from 0 in
+ * bits [31:0], and as many from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits
+ * [63:32] from PMUv3p1.
+ */
+#define ARMV8_PMUV3_MAX_COMMON_EVENTS				0x40
+#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE			0x4000
+
 /* Statistical profiling extension microarchitectural events */
 #define ARMV8_SPE_PERFCTR_SAMPLE_POP				0x4000
 #define ARMV8_SPE_PERFCTR_SAMPLE_FEED				0x4001
-- 
2.52.1


