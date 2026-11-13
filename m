Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lj4r6+9h;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CToyPsbK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bev9nuTA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=; b=Lj4r6+9hxPvFPH
	jn5XBKcYBje/PFHhk3oxHpon8zNJAwoJy3n2/47jcdH2PJqhT+Hh4dt1aGVtJ/4ZyM/mfOI7xDaUD
	fh3Ga+TBek6MKOVeirpLemTCLTXxb5rRUJ7oe4bH65FuqVsMQoqGkM5b96DseIR3g0YafdbnpZhtE
	8TFrY1QIDw/G+SLix9KtoiqXnbJo0Qh1Erphjz3Fe3ONpSMN/P4f2WZh4v5dIYNEjdsIOa1N852Iy
	kZ67OgDmpJJnECK4mjW83gT6QGm0vI1m/a31NFguTXkM4tZeFHlbSgX5UCgC6e6aED87jrTSAJtMM
	XlsENEF3xfOuBXvQ2/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNH-0000000BWC6-13Ym;
	Fri, 13 Nov 2026 02:50:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNE-0000000BWBT-17GQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:50:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KKDu4120584
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGiFHSQcrHd
	3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=; b=CToyPsbKFCoOPs3/EIqjX3Ihiap
	I+wwiO3W2C5kUeqHrum6+bapQ5dtJMede6vqUi472f3aaJEeugYRF5+ZqNEyG8Z1
	MJQb2yJ5OvS7R2DLuB8Pc7qlzFFbDkMxF/VdwPqqMjq2+ZIXO/eKkUVupsERuZeE
	wL/L+EEkA16OywuXuXmdWVVPQZ0NZaj2/n4Xb/51Ruc9bPtpbdzqC83YV9rah8n6
	pZSb5D3nHJqIOyCJ77GWZA7Cwwb2sPP9gHMMuzbOECJAgRxXuF1hA3kENNJghQrX
	1PQnIKA/gnLQ5bNA1OaJMnEDO2WuNNiOhRBKFEtBZgu6M5i/7dfrEUiH7LA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so6903565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538243; x=1795143043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=bev9nuTAeQ8yRTYwtnHCqQofvrHMMFILjb6nn3KpMYVDTKT29BRjDrj9LwcLUQ6Qkk
         kI1IZImSZnI4+HNmUnHzGTwxq6L13pmSAkeoiqCf1gMKOjf20bU4bTn9RnSzjFNJdUo3
         9RN3ZP9WBciNTSsNCmkUc7s7RDYrsNY7ScOb0NyHpGgUH7BZbwzkCSrZOu7o2ZJssXsc
         iVGlklHSacTBTXXJVWn6CEjIkRqDKChznLlOeg6mW1Xth6QBfKxE4ltctAGyo9PjQs1G
         5kz/CiyjuIcmtFyCMEMmwJd1i4L0W6s1lWcC2iBvxOSSAcmX0NaXzqVkvpo9kVuKvNMG
         Y+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538243; x=1795143043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=B/uX3sMPYKPuqLX+/FXe+UzMQ8QmkEGcugvwaT8eV13dmrkJpRdcvG5P3Eoa0C/G7i
         dZnzrB3zdZOA6jfng3WAM8N0Mcb8PIfwpwk06OlIpyrV2hun9liozRd2v+S59WxtUaZj
         efkFEGQply0haQpu2Z2PInzeIDJNnBPZgbEFsszfIKb9KH/VB8CUsDH71Umu07jyO8Uc
         t5x5/8cak6+2XONsNGnsFcgGwzN8IjwRuHi55QAZFTZqrJYpAFs0s6Xp4a6/WLUzh57f
         aLdsn+iIymAYOsF6YmSRFDzOSHKb2jum+17V3qAeO/9CcPxyx8ibYu3i2XBlVmV4iCyq
         rdmg==
X-Forwarded-Encrypted: i=1; AL+hErHl9EVqcAPWkMHivkLEFv4P3RaFjW+MU0OUg59IM1MayTTSNMaLud3X5/Gl+wWpmDnCDVBIZ/x6RbEilmV1Ktt+@lists.infradead.org
X-Gm-Message-State: APuU4Z8flKU9Ow+9XXoRA5ib6lU1cTyc8NQjxHBP/0FcxQn696yy/Q6w
	xP06j6WyFW/Z1OrC7Do6aeq+Hxhc394N41y91M01uXex5X7VWs4r8wQXjDX+jZCxMbXP5uG26P+
	clCPAvq20l5McBuqOAzpD3Z5s5VCxC+iGbMoZTnz6S5BGM/L5tNSgrtlV+jRKL/rEsUPgrTdJXW
	nTSQ==
X-Gm-Gg: AYBFou3QaJe39vdYIrXqb03aOXwS60dC0yrnnEn3ACi54T9qV5yXeJzIwoJs4kjr0k9
	SbYaG2X318Nx+6OhPIeTijHUIOQtCX2wzOE7cgQVtNGE1SkoLMa6VHbfFvD/e19jMNsiqf/MsOG
	Lj7UTlZZ3X6MdZq2F22uLw2WB0B0KiT/YA4sLqoAMCmr5F6DAGKdcZbqFkPd1jJcwegOAKUanX2
	hvB1wUZp+pJiD/jDJB/s8dyvMrQCkgHgQ1hEGqLvpHue0OKgNsFgxGheYpJOGrWXJxc5QIym7P1
	YANdupbE3q5is03jDBpTQXPEEcM5R6tAgbsmUkY4rpE7QjrerH55Mqcs234nCmuml4vsQJpWkNx
	dEjXUapG7TVu4Mpad/lcxEZPjsnGuXssI0PIp3v0huqKcKL/XVHtSBAbgus3PyRpYtAFemUA/Ti
	kgKfCMslw=
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990745ad.59.1794538243018;
        Thu, 12 Nov 2026 18:50:43 -0800 (PST)
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990515ad.59.1794538242578;
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:27 +0800
Message-Id: <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67b03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=-8ZncIIG5GjyyUODfMoA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX7moRsQWy4LgC
 B9yyqsuDBMWFybEiREmh/+9Meqke8F0ZiFoVNyOhTT8PZ0Od3Za02TYFd4PqLJU13ZrXbo9/2gC
 GeYq8HffcQDQp7oqvmUHcueKP06Y72V+jOr1mRB04ONaDRS2OKfJtwsiOAj0+U/LW2rHHVUzZG3
 xPf6YD/ILW7MCZ4DWwBbSZhbLZVvAC+cPLX10FhbY6919yB3SAL1smlthUS97ULvHCN+GxEpmu7
 nQHk+iUlrbCgEIxlRpwn8m7Ru+1dGdj8K5nrLw6epw1Af//CzUECUHC3x1vj9ayCllYN675is+6
 eOMB6v33Qu8iX4OxITIGP/rxHT0FKs+I07r0OYpTIbOcAMmLTxTV4pNF+S2FCCS1mkbe558oQ/N
 69U5AU6sEnagk03m9ZDEgNYe7TdrUOJ+NYgjbKIZA8IcNsjdPg9AW9oiGREOakoW3gbwD3jlyew
 QInYJRr948OHmrEId+w==
X-Proofpoint-ORIG-GUID: coLF5Z43n2YiGbZTITutdCNheJv9_jz4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX6s7qzQdpEzl7
 +XhEs6lVWwSQEA+yFCuSdTFFjGWgPqrwWro3/lUXoJkiTR7B6l9YNSRofo75n81WawTGDNgKDU+
 1G6LTpUNH6zAJQc9geAAOdpV1UlAU/Q=
X-Proofpoint-GUID: coLF5Z43n2YiGbZTITutdCNheJv9_jz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185044_311288_036FCB01 
X-CRM114-Status: GOOD (  15.96  )
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

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
 include/linux/coresight.h                    | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..0d3f6229b282 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_ITCTRL	0xf00
 #define CORESIGHT_CLAIMSET	0xfa0
 #define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
@@ -116,24 +115,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
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
index edf2a2fc697c..0168f6abffaf 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -35,6 +35,25 @@
 #define PFT_ARCH_V1_1		0x31
 
 #define CORESIGHT_UNLOCK	0xc5acce55
+#define CORESIGHT_LAR		0xfb0
+
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
 
 extern const struct bus_type coresight_bustype;
 
-- 
2.34.1


