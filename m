Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E4606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GlfQGKvX;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SclAdnv4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VKGLjo32bMdnomDTo8+8lMyR22PPa6k2iDZbJHMGB70=; b=GlfQGKvXUlZC3I
	Swjk8TQpxR5MjL2yZpNk3WdmQFJC4IfFyo0HV5ciq/4n2xhDGM/aRIpzG1BKSnh097bp7sFcyiAEc
	2+RuFAYqV6tT1NwtQt2REA9aOlCCdmj8CwEDqyjFE02yeh9NxhG3rqMAeIiWuEux78iK51yqPdFYF
	02jBWALUF859abDhGBb3026fRuAJ73UAq9H/ayUy+3YxhNjI0x4ka86JmkUgmCTY5g3wFVgu21EVX
	aig2ceFvs6XWwysySmJYxzo1TPTJVx4tGIcjLQaD5+zXkf1I5H6WDfY45YTnVTtfgnB+0ayao1q7J
	0KgMxUVTgCQaoAEcYf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMVP-0000000Cydm-2lB6;
	Fri, 06 Nov 2026 16:09:31 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUk-0000000Cxf1-3dRN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:59 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FEEdY1544351;
	Fri, 6 Nov 2026 16:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VKGLjo
	32bMdnomDTo8+8lMyR22PPa6k2iDZbJHMGB70=; b=SclAdnv4vKYp8w3S6jZO32
	F5fLwViGCZr0jEILyiZERQFz3UZrbZqebKCeYz/DD9Qxuk8FTsSuixS0b/iNPTxf
	MpYlhvmgtl4wv0quQ+bpEJGfWYSRPVe6OPtYMt9iq93dSaH/WLzKwMRkdDLEnUgO
	5/zFnkDQY/aWINNl7vMZiL2tdboVpliV0LT5oocQd/3V9nSHTEJB+VxiUSlN6xQT
	Piw5wsz+cjUXfCvn1wroUPZ3Hocp8vQJFQ5G5WWlBYMQrSc4ZqmubAOXQUYKsXHy
	Hz/kVslgWfRPg3EVPm5nkCnvTyPNt6a8Y7eMOsDfzLu2XvehG3SlenuoEzKAghJw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rbwf06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4sli3476011;
	Fri, 6 Nov 2026 16:08:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hrmress0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8IFj51315034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC56A2004B;
	Fri,  6 Nov 2026 16:08:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7246620067;
	Fri,  6 Nov 2026 16:08:18 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:18 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:45 +0100
Subject: [PATCH v3 12/23] s390: Query arm guest time
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-12-75e95980fb10@linux.ibm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
In-Reply-To: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YQAwABA0bfFqg0dH5igsK8TdtE1ZYxB7
X-Proofpoint-GUID: YQAwABA0bfFqg0dH5igsK8TdtE1ZYxB7
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aedfb77 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=m6ce-YdoQendD5wNNHUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX1i2ru2gwoA5R
 PlUTzFqc7LJuVe9Q1L0K5mUXXKubv1EluWWQrO+Ys/ms143xbGQXcQvNg59wEjyNCP6l7l5JWxY
 pnZIMapZkGuZqHMNkBxD4ot7Hy8NJAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX2U2fWxu6ueMh
 KGcjHh6WwWUKwBRqfWQNfhZIoJLn11BZ3Vpul0OGDhxdGwV/4JLpMYp+0lEt7GICROFLwwVObBL
 lhv/ppfXepyh0q/vLNIYu7idKaFMeWQ8DcacutvDBUeyzijzhrhxLO8teIw4/ASLThsrZKiikE2
 ZiwQ59MtItvCAx1PejOWT+X0LEU3pQtz9RI6n2lQrO6BE0weUr/IJNkDIY3hbTG0Hta/WXfwym4
 GV+JEK5rKXvJHCLzoOKOyX+9/0le81djZKRKAUpNyLIIHNwpghWHPXwQw6pMtVD9JSQ80waeKEQ
 O+yBi4zS+DDiQKw4REhimkSnR0+mm8sexThu+Q/tZBEO7x/UAdHpSQEzzO+BwS5+KpuYo7/MhEV
 TcJ3mRh4rBt7H6vjF+nVRcboJQl/KVs72Q5I517Jgxb8gaWTG5Gmplz4oVc6aBrQNd8jwF7wU0z
 1kfCuRBPIBX5YUKptlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080851_054286_56D39033 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add functions to convert between ARM guest time (LSB0) and s390 host
time (MSB0) using new ptff function codes.

Co-developed-by: Nico Boehr <nrb@linux.ibm.com>
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/timex.h | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/s390/include/asm/timex.h b/arch/s390/include/asm/timex.h
index 23421b6eb225..8ee69fa3c3a1 100644
--- a/arch/s390/include/asm/timex.h
+++ b/arch/s390/include/asm/timex.h
@@ -81,6 +81,8 @@ extern unsigned char ptff_function_mask[16];
 #define PTFF_QSI	0x02	/* query steering information */
 #define PTFF_QPT	0x03	/* query physical clock */
 #define PTFF_QUI	0x04	/* query UTC information */
+#define PTFF_QAGTO	0x10	/* query arm guest time offset */
+#define PTFF_QAGPT	0x11	/* query arm guest physical time */
 #define PTFF_ATO	0x40	/* adjust tod offset */
 #define PTFF_STO	0x41	/* set tod offset */
 #define PTFF_SFS	0x42	/* set fine steering rate */
@@ -118,6 +120,17 @@ struct ptff_qui {
 	unsigned int pad_0x5c[41];
 } __packed;
 
+/*
+ * Query Arm Guest Time
+ * used for:
+ *	- Query Arm Guest Time Offset
+ *	- Query Arm Guest Physical Time
+ */
+struct ptff_qagt {
+	u64 in;
+	u64 out;
+};
+
 /*
  * ptff - Perform timing facility function
  * @ptff_block: Pointer to ptff parameter block
@@ -266,4 +279,44 @@ static inline int tod_after_eq(unsigned long a, unsigned long b)
 	return a >= b;
 }
 
+/*
+ * ptff_qagto() - Query Arm Guest Time Offset
+ *
+ * @physical_time: Arm guest physical time
+ *
+ * Converts the Arm guest physical time into the Arm guest time offset.
+ *
+ * The caller must ensure that this PTFF function is available,
+ * before calling this function. The condition code is discarded.
+ *
+ * Return: Arm guest time offset
+ */
+static inline u64 ptff_qagto(u64 physical_time)
+{
+	struct ptff_qagt qagto = { .in = physical_time };
+
+	ptff(&qagto, sizeof(qagto), PTFF_QAGTO);
+	return qagto.out;
+}
+
+/*
+ * ptff_qagpt() - Query Arm Guest Physical Time
+ *
+ * @guest_time_offset: Arm guest time offset
+ *
+ * Converts the Arm guest time offset into the Arm guest physical time.
+ *
+ * The caller must ensure that this PTFF function is available,
+ * before calling this function. The condition code is discarded.
+ *
+ * Return: Arm guest physical time
+ */
+static inline u64 ptff_qagpt(u64 guest_time_offset)
+{
+	struct ptff_qagt qagpt = { .in = guest_time_offset };
+
+	ptff(&qagpt, sizeof(qagpt), PTFF_QAGPT);
+	return qagpt.out;
+}
+
 #endif

-- 
2.56.0


