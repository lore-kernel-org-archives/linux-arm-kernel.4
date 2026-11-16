Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F8E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGlyAHbh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY2G4sFL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=fGlyAHbhGBcXlb
	6/WudvTfc6V1HxHFUSbmj+Vi3OwgmmoZsrGwbdiYXOKcKu5BQDwa81bRwZDgXBSuqSHGmIJnxG+/Q
	WfTtc5WHqvsHO3Ih/U/PAGW8/5XrkOIzOEmfUowQ/Suq5/ROqdSqju7sCXHJmwSS60l6ANmkOTXai
	3TPXuK9VloGXMh91u/mhjjzlBqhg3eXsOd1byxm+xtaVi7X8iwmEWaP7wzHNCrkvyUm+TfNt00O+s
	qsv0wTq1CvNztAeHxgR3ZrVhIYmx4sPokquLDg1mSN5d4YTqOp2cjQKehOiQ0qREyx7NruCs1Ou6S
	rHcxajChOztzV9dqcXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLS-00000001RVa-08P7;
	Mon, 16 Nov 2026 07:41:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLP-00000001RUE-0xBw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:41:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ekFX4149294
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=fiD7pAi5zEstA8r2Vs44yFkqR4X
	YvvFq4o52bSRYK48HE3aQquJlX6w70anF31TAXrQ1eJdQ0xX84w7A3lTBMyh4uf8
	GDH9NSWhY7V5P44oAiF2I/pzBGcs7KiTkHiZmNyLcuqnqQokHS8jAJflVfG5tAhX
	9Pgejhz7no8XiyEPWmu6DxmFuJ4ezoGWC9bjIkaQoCCo4vL7zLycSIyEovbWPoER
	CWXAsaadk2p/vpIu8+mV3ai1DSR2P6GiQobPkbwPR0WWj+wvLIC5eSd4FSt77ilS
	ixsJdNilDpEsS0dK9FVYg7fPnLisGW/dbJU0MxZ5EdiGe8S238tw+Y3ZNhg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhnb1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so3254611eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814898; x=1795419698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=GY2G4sFLzkGR1Do2oTD65WoD9JVOUCYF4lVWHzOaBP1Zp7aHy9YJCo/4YlSHkQeovT
         LxiWMVgioa469vDGIGEm5r1brw2r67H+mjaYWOqEUv2BxfwSa4I56YhNJOt9slX16cyE
         7mHm5kD9v3Vplq4l+6IOiyaWBzLFCadwrDqVT0QJeyV2JG7ATK9yed9dStOiVedtFToR
         o60jh2qT9hnmneYQAKDPI9sqFRaDz51HEu8RYw5qbV7MVlix4Ke09Ybb99v0f5zBSA7v
         rEb0dRbB3EKRHODS5nqbYC5YFQ5+0TrLReKY/f5Qw0ic3KUBXTVw4gAT2DUSgPFZ4oyy
         69EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814898; x=1795419698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=kCnZ3E58FksygpZKbK8nSYrY+NAdTwTKXCK3JEdGn9wQ+G7GnmsF0Hi9wWeCI5Ovhe
         IVpP7qqadKVG3S/DdapJhzAq2m2gz44nu16eg4IBuVBeKruAd0Yeb3cg46PqP9aN+IAf
         oKG1F/EQIYPhnrmNSYHK3Zwql8R81kkQXMZvD3Tn0YFrkGmmfZDZJEF5Hp2+vb/O2Jhx
         ZlF2n5UKi3+WYXeLo2RHCb7PxyI6KbkdfSrSfrRmxrZJLG5QtjF9a+fI4ul/KOePWIQI
         zPYcHaNzj0gL0y1wEHj4aQEq1EFSpLFoQRv1HU3xURGrlTHFFF/ev56KEE11GbCYN0WB
         sq9w==
X-Forwarded-Encrypted: i=1; AL+hErGF4aR2vHDBPLanT8lbQ/6CcMHgcAA/V4M0ZNigNIcq7hxGypFUUnBkBhVdgV335TObbEeTTDuJc+Fj2eAx0G+D@lists.infradead.org
X-Gm-Message-State: APuU4Z9JHiie4V1ZhnfnDBQZgt1duT8OyC0W6D1NY7tAwynjo6PyWK+M
	tKE7c3XqwHjHgCsOEDJsNusLz0fjc16L4ODHievybaen73R9Kx8idHv1Xr7NgDNAl43hk63tWwy
	+N5vSm/N1SnRHRO9sB6Phg6s/EYsh8dv/HVxgIi+SNsNzV0Zm6bbDHclfsiek9LduN7DkxhxsAU
	2J4g==
X-Gm-Gg: AYBFou2LrjmSFR0AFykTXHNAPMWt35dMMBYQozsLxyJtyYN39u6Lhk0J2kdVhnZmQLu
	Do2Q2eII5MXrYJGQekguUU9KaqHU7rLpUksix7MVBNpeYzTieRG6Cf4gY0hc9HSdvWVnQ7tS09W
	0kYWfQowt6gjSikLpOtyL77FRS/tpJum9E24Ss6CSNKqN/5tltV1xjqeCU27zqUpDoxQ+Z3mcek
	k4NW3Bn/D8yw+SpeDmkf6PQM1ExnVgcoc4t4COHdwa8PiBFbVVZ6dZhJ7cRuhzdNFVqTZ0k0jrS
	7QabR6f7IIfdD5fRKps1EPVvNHilYCbPm+eyuLhFTTfuondAH3ZKA1lP/4Obu+CppP8+xbu+14a
	rR/FVUw4SwNNqwO6yMt7y3rXsxHYrzJvZM54kjGk2goT1TUIAV5oApvELUCjTqSH0y6AERY8UHc
	66DaNDURp9Xzy7QqJ8z/qTSKRltFHSQpwB9Q==
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492325eec.27.1794814898012;
        Sun, 15 Nov 2026 23:41:38 -0800 (PST)
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492283eec.27.1794814897499;
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v18 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Mon, 16 Nov 2026 15:41:12 +0800
Message-Id: <20261116074118.822731-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _7VVMCPy-zsbxw_ZRGap19laWEWaZ7Vm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX8I6rL9lLO8Af
 x89bURHYmEGGry7j7klebAmTHtVSYn+jHmmSGDIO0SsT5WecMcV/JD57/E0/+MKHRZ5gZus7+fG
 qHaPskPxaIs43EnkOUxyoAAkPOl9Vvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX9lB0l/kDPTvh
 QwZ/Fz9B5danHke0lYlCrKhS8tJALYg3hNq/J3eHizM864xohp4EJflp3FCplnijjwIfmVE+j9L
 D/vqmExUcenk7Nmn/NHe8addCfpUFSjIPH+MoPmXdusB7VpTi+85ZaJ0vfpHPTg1yRjLKYj1YUL
 rvM0ASajWlMf1YrzgjZPGGbThfIagFB6TzmLqFlbPVdEg/n6JDg2eCTMC4ezcO2bVsHU9GwVRPn
 ygp6JN0s4DTcloJ8nohCB026IEWy6w1stnkYY6VNGsH0NnGwyyvUXDjWNhklBMCJovhnAPqHYt1
 WWTCKHeTyC+s9KOxCOLtuuOnS1UDVXJXE41g23Cmpnf3OcHxiJMuA5sC2j10dZm1fJsair9PeGz
 bR47zgXYbX0Jm4NlzcEQhWnns1gmTAXvrs4qiIso3aoX3SGXbDjbuTcINKOt0pr4/zJShI7l9K+
 n3jwD3y/aAKqOpaopfQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afab3b2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: _7VVMCPy-zsbxw_ZRGap19laWEWaZ7Vm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_234139_298506_300D08FA 
X-CRM114-Status: GOOD (  19.26  )
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


