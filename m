Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF9E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWy6XnZO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=McviBrH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+FFYtcT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=bWy6XnZOpkYYuo
	V1FNcauLT+wZDXtJPuX6mEAeAf0sXT2CfksUsRIEmiXTKTFta8PLHIbi1Nl2K+FORVhYr85emdoo+
	7F/0U6PusCfmOFVSaZpYv2rX19d4TAxmlC8cPr6IqCaZMTLSS0sHUHN74ymtPbFKqoVo+m+j6+rGN
	d1OzvTyMkSk8mksRN1Raz+ga8ukuED2V1WK9j4JcPdhAKifN8v52pn5IisMjdXBQDv+Q8tU5evkis
	idEQCisX7XS+bc0VtJqFPGQUDg1lg7ajOkuIVH6BJF+C0G2XEprkBPHqAt4L8H80/ePDNadgvSm4K
	SMVv+6HA9TNqZukucyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhD-00000004mwg-2biE;
	Tue, 17 Nov 2026 07:33:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDh2-00000004msL-1unn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:33:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aFPF200038
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=McviBrH5ot36gVyf23ER4mCOgxt
	0YYd/02r4EpvN0INqsDq1WaPFGHhYo7c2pODJIJRbRoqaLVfXC8oHOgH0rEow9uZ
	cLbGDg0N2KHIahNMZmJfRYiG4uh7x+Usa+Bw8+dI2Vlf9fu0plaYD1rinISn7kdN
	6rshjFaWax3TSEia06b/HwQqsLzdA2PlTt0cdRnz7aiT5+5eW9l+f+Xx/CyZgFoP
	qNWniOsHaJgCDDUhLsXXXoNlPfTK8MM8yZtB0W3TpeKTsVXwrOI3e9wRnd1vjdf8
	0gvZmepVTpmW30KStzzAThf/x8v+4WvvHv//MbS44UVavDetcJbt18p3maw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbk0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:27 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so8824866a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900807; x=1795505607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=B+FFYtcTgMrJ5Y5H+BQVJQ7qwKgwMgNa8SLwXYry18w2atB9ZoGmDbXvKfqOQV5Mz8
         AZ+ysT1TAYFMjW5U18T41+g+9m/T05lqMOx2B7FmOTRZNEjzH4yyVVGbfUGIBQRvOj4V
         w9gtqdurStb1KcKOqsNEP9MJmMQdbBxHR2J1TAKuy6D+ot2p+8P5zcZmI0J/7JgPI1KN
         bD6DSClFdE28+y5GLbr3/DL9y9+FCK7o/EvC7dKPGkfPYocUQaQOLMjLBolTREFeWoPe
         sNmvNcPLOVEoZI2Wq2w7vJT9w5AuPFrYBXflnaOGTOluUSYqCIqdhJCvogkO/wFXQMbJ
         g51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900807; x=1795505607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=nijrmYJ6qJ/K5C9C0Qo9XLerpIsIhUDClf5Srw3zXWakI74wkusxWe+jR996i64PL0
         p1w38s+GPCROoSOlFXt/g4WjpiNAnLOch18INDSVVadyqqTHzKikDc3vbp3HTa9KOmrT
         LjagbxG803eqX+ZwWJXX+ozLPn+TnrcqxQxwiybFZlZIkzb1/xtQKtm0zQjRNw+p9BgF
         H8KTN+ci/25/htTklyXerE1c359hWupasFer9zW1fYl7h8yQ1ig9KJorIK5DwmrDoGIG
         pIAnwk643bLDSLMSAqcpImjd6cRnPTpGKvaL6tHDl22VIMATbrgVF3YwABcHUkFnAQ2U
         QICw==
X-Forwarded-Encrypted: i=1; AL+hErHFxsLoPzrssBmbiPzqf7Z2OjTSI5oIK0TOD/yII1QcFARanF/tr9DoZmeqm0Oh+RmZdy1kCwC1OusYVYpNVMjD@lists.infradead.org
X-Gm-Message-State: APuU4Z8D/ejCo7UQKP6s8co1Eejm4/vQ3EOtBhF8okRvHVvDSL5bzDuE
	ary5cWLU3iG7fdqFGGAA06N4LmYmJcVhYmFwbYOJ7Lkde8Ys4PYCAnXL1z9hXDq30MzTiyND31s
	UbvaWRq/avnyJHK1p0S3ANPV0CFre9nAA51hyjH3e4VVQNVf2KLcqUMXNwQnWl6NciQj4XUL+v8
	cUnA==
X-Gm-Gg: AYBFou2b2TU16ynDTpTHSu4r2/MlcmSbjf3TSlZYDEiuSacEr8YtPt7ImEWx5Id9lut
	6wpKkoIkKFPCJw0LZ5Hb0rIVNTK8tMoxAvZQYEYG+hoj4wPv5nv3CKrc2OzZbaML0BeWHbbqqio
	zEpkWRJk9BYm0HuCBI40Nc5VC1NlrieRXxyj1lrpSqpHjPLe+ffyVL/7cUM9Tw5eTAMRY/zvKZc
	8bmB9L5wTvMOOLDqZkXo4Saqi/wYn+9IHUcUZ/F6bB7N5AqIrtQXi8NskJctV+u/3Pu3olAYfiG
	uDYO0ZgflWy1VTHYvoU50KlN9PA4lb1WYXU2kAikCU4jBkOpde9As3+eI8PV9EyjzimLCidOkuA
	MLf0DH5RkQ8lRmJp2ZpMx26HaciMmf/W22lNQjheIXZms58xvz2B/kPGcK+Sei+KB4P0UmNBn+c
	nbBLMJYEth8xRJXX742bxlV3OcZrbN2fbbHw==
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933549a34.30.1794900806781;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933538a34.30.1794900806329;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:25 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v19 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Tue, 17 Nov 2026 15:32:59 +0800
Message-Id: <20261117073305.3854951-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX9fkq6roDBJul
 xnXJYKOb+F+eQf9pwLeraDET3gYSWw3NEEDwx/12uPUfg3++TZ6J4+dxoDD5Wmd1bI6jnFj/6nn
 0DMjUpWVGzWn1NmBjZNq/9G881k3H0DU4wDHaDrXT+iZ1SWUddTrn4iwu8qu55AlErS0g4QwCY3
 052AQzlHq9u/F/krjhKEQqjryMA1JvzufuBBALgTLKoiFWHyc8vK93+F8AazjTaoBYRxZYPw8bN
 342hno7nSAQhiAprYWI6mtxY2Res94pSWdp/uNDOLnpiolYr9V99z/UZzIkgRaqni4Oi29KLK/o
 OxyafPuI/FXhl73g+5gyVGdbn/X65p5m2QhgtPVnkJXITAUeSjl/8h446Cg9+fmaw10wc5TAniM
 g71H6AoXYiulNCK31+ziiXFTC9Vvmn5rChqUq2qOIYEgM5MqSyLzUi4gu7OmsqWMXddHx7aRfoa
 keNisTiiLH5UivOWrPQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc0347 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=EyFUmsFV_t8cxB2kMr4A:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: jvfkBVoay4uGoK4Ywtjz38-Q36PdWdPj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX+bQICQA7Jm/Y
 b04COsJjjX3CLHMsE5SDl6grX/zyamzDosa4WMJeXCR5MNpIdi3K+bvCCv/xu5GUiH9S50pSw82
 eP7uRWejoFlGH29/aXpB8T1tR8zkmxg=
X-Proofpoint-GUID: jvfkBVoay4uGoK4Ywtjz38-Q36PdWdPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233328_549792_71A5C3FD 
X-CRM114-Status: GOOD (  19.91  )
X-Spam-Score: -2.8 (--)
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

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

The remaining CoreSight management register offsets (CORESIGHT_ITCTRL,
CORESIGHT_CLAIMSET, CORESIGHT_CLAIMCLR, CORESIGHT_LSR,
CORESIGHT_DEVARCH, CORESIGHT_AUTHSTATUS, CORESIGHT_DEVID and
CORESIGHT_DEVTYPE) were still defined in coresight-priv.h, splitting
the 0xf00-0xfcc management register block across two headers for no
good reason. Move them into linux/coresight.h too, next to
CORESIGHT_LAR, so all of them live in one central place.

Also add CORESIGHT_DEVID2 (0xfc0), which is part of the same register
block but was missing; it will be used by the upcoming Qualcomm TGU
driver to discover the number of implemented timers/counters.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 34 --------------------
 include/linux/coresight.h                    | 34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..c365cd881e4f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -15,22 +15,6 @@
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
 
-/*
- * Coresight management registers (0xf00-0xfcc)
- * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
- *		  Trace		registers in PFTv1.1
- */
-#define CORESIGHT_ITCTRL	0xf00
-#define CORESIGHT_CLAIMSET	0xfa0
-#define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
-#define CORESIGHT_LSR		0xfb4
-#define CORESIGHT_DEVARCH	0xfbc
-#define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
-#define CORESIGHT_DEVTYPE	0xfcc
-
-
 /*
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
@@ -116,24 +100,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
 		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
 }
 
-static inline void CS_LOCK(void __iomem *addr)
-{
-	do {
-		/* Wait for things to settle */
-		mb();
-		writel_relaxed(0x0, addr + CORESIGHT_LAR);
-	} while (0);
-}
-
-static inline void CS_UNLOCK(void __iomem *addr)
-{
-	do {
-		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
-		/* Make sure everyone has seen this */
-		mb();
-	} while (0);
-}
-
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..1e2ce7861ce0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -14,6 +14,22 @@
 #include <linux/sched.h>
 #include <linux/platform_device.h>
 
+/*
+ * Coresight management registers (0xf00-0xfcc)
+ * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
+ *		  Trace		registers in PFTv1.1
+ */
+#define CORESIGHT_ITCTRL	0xf00
+#define CORESIGHT_CLAIMSET	0xfa0
+#define CORESIGHT_CLAIMCLR	0xfa4
+#define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
+#define CORESIGHT_AUTHSTATUS	0xfb8
+#define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVTYPE	0xfcc
+#define CORESIGHT_DEVID2	0xfc0
+
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
 #define CORESIGHT_PERIPHIDR5	0xfd4
@@ -36,6 +52,24 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
 extern const struct bus_type coresight_bustype;
 
 enum coresight_dev_type {
-- 
2.34.1


