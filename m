Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CF60A6F4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SEjdE1nb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FNiRoA3I;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CXu2EVkl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yq1d2a+wSB1ioVQbR6h4uBkPy/b2kLL3saOY+G9hsS0=; b=SEjdE1nbgOop+g
	Ayg/sk8q7lCyEQpPqWVufZUjfL42Eiugrtiulp1Vt460gfJDsZGDQxVpdQSC2BIyX+7x6RjK5E9+u
	7MDwm3OX7uH3gw6Q740bqONwgYn+ojSwtbXOQCjqzARrULjokOLal54BZ9ZU+Atl9r8iA3wbaddQ+
	JU/tw5a5U4pTYh9CFBkjN4Ydz1t+6O8cS2mxuIsADZVu2GX1Z/3nuRjf6HlGI5Dnn4mxlppdDzFdp
	+xguhkNs5eEfzRBO6fxi0GxK/cgkmlwr2mXo9YXwozO3Lnyw6ylCoE/jDyYC0Vfr5JPHRFv9bzSO3
	EWNkyaNoIwR07PtxMYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsC-0000000GNrI-1cSb;
	Fri, 27 Nov 2026 14:24:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrw-0000000GNVI-3LTw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yq1d2a+wSB1ioVQbR6h4uBkPy/b2kLL3saOY+G9hsS0=; b=FNiRoA3Iad6SmA9V1l5wKRDb9s
	0P3j/+c+7Qv6fpa8giNc8cvKObTJyug4CEswZTifdEHaUzzLvNqDHtG+P7F6LrV+ueRDz+Bu++R/H
	L5Mhgw3YsIGkZYw+SAn7UwMqUCyXN6AYuZ0BKM9/dX3KaviTKoJ57YUj1DuIGzXb4RMO5IYYNmeTV
	fPv6xPIs15kdB1O+ywKdPb5yq3q1Q7erf/C1yjHD/7kUC8geABra0N1mpiGugx0OngrI9h5nMXgyM
	sDkN1Dx5EfgwivI2O6j182sVxR1WcLVhCtyQQJCP24sVLHKt6JS9U1tKkLaSH/hueiHgBJdtKnKnH
	HNDPSRdQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrr-00000007mOi-3yJJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:07 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4fla3234322;
	Fri, 27 Nov 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yq1d2a
	+wSB1ioVQbR6h4uBkPy/b2kLL3saOY+G9hsS0=; b=CXu2EVklyIkxALhz/NxQL7
	KM0VRcP9FcycSvNQkqF+K9W6kXVEjSC2wZ4vGZXCCHXnlkQVVHQZbUz+oCZK5vlL
	mbQ9THochDycl8byc3Qf9XjBQXjLs9iw0gQdwsXJrIcYbtqGSR6aCdN7PUhttJBV
	6wcRAId8gKAmL5wSTWdQwl9SwseZH7+vu0XDqyU/AYn3FDerIk7lQMuKnTCJiznK
	UgEedo1RED0efbcKGlcNTNznj6G2PwppNRTXnqI3OHnq56A7ogux41X+FPOtL10i
	m6ZmQp+rzQqr2XoQQ6aBBYaH9pZhW5VF1slDt6Cdmrmma11WM5iPMVfwGf2pxkOQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvng5g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4FZ71180986;
	Fri, 27 Nov 2026 14:23:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6rhckj8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENKHL33161650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4AD72004F;
	Fri, 27 Nov 2026 14:23:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 603442006A;
	Fri, 27 Nov 2026 14:23:20 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:20 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:17 +0100
Subject: [PATCH v4 14/25] s390: Query arm guest time
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-14-a6318d18aab5@linux.ibm.com>
References: <20261127-sysreg-v4-0-a6318d18aab5@linux.ibm.com>
In-Reply-To: <20261127-sysreg-v4-0-a6318d18aab5@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b09925e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=m6ce-YdoQendD5wNNHUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX+1yBc43zlEAv
 DcYekWXUqiDpmfCrX03Zcoo4L2+EYrdM/fBsAAKW2aOh9tz060488bF0bVuCIKV/QC/L1jRyWGj
 6weVBadfNhbdOaVQd09p2F2pkmIzapM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX6AblJOSwEY7j
 98RNuAByCrNYcSgpCqyBm1YJookGwi4w26TFCwOdQjsd2BvlLnuSJ8fBh0sgPWroKFMnQBPAfWA
 ovGEWCtracc4XQRkzz+HFsrTNTllNuOCBBTOxIcHTGKShnAS6aYVl3gZ13uUQA68T/r5eJYRPGJ
 zaJGYwXcc4SrQHWZGD63TYmL72gutM/lqm41xEVV9Fe3WwzBVWcFapf7mODZZyebnMUEL5e8p5l
 H8snCe5xZjrLZkgOwgEkXqw/UdnEWSFa5wv/uCamOa1YiV4waMAWonhMaEYc/YwZddubhU/HsSP
 6AQ/NHEHr4iFwRCAxOrCUrsYrwRd35hS3gjtOPg+SrWO94ZftU7ZrI0fiPWX9ROJAjKgXG/VXJJ
 CZV0DqxTHdzlh+yjG6Or35pkoIjsKqKw5t9PycgeyRQZZG5TeoLwQ/vB6jbRNSDR1CQs57l2lrq
 bFLXtkhDRcgb3e2b7yw==
X-Proofpoint-ORIG-GUID: wE3q3bIdUgn1P2Jf1Qz0QM7XOpezY5_B
X-Proofpoint-GUID: wE3q3bIdUgn1P2Jf1Qz0QM7XOpezY5_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142404_194688_065F29E9 
X-CRM114-Status: GOOD (  16.81  )
X-Spam-Score: -0.7 (/)
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
2.56.1


