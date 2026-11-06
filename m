Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53AA606D823
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQ3I1Lmp;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i1584vgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aljBCf9/MmrTLX/Ccg8ZLrEoj6cKNfroAB+y0foXNJE=; b=RQ3I1Lmpm34UZU
	W3jYUsI5shGGAxUpoyDkpnpxkmp2cf0iTJOAdKkFTzJpTzqm8q8mu9RqJSNB0zS1LnNrvWA7f9CZg
	36jB5mk1IV4un4td+xBL9iLYaHIK4Ktu/Suj1ONQjXUl4wTPrAKI78sbDjG8RQLBguUemChNjWn6O
	LiYajIGCT3fbR5ZHevrCKpd+ZKrORkKPdZQX5JoOY0C292FWdgAD0uzPs7mwGX2UGKh6/LoVa/QJ8
	P68OkHGms5D8+Jfxk0cqjbmVg6wwn4nTesuzofkJ3FNrSVQlATzZh2jQkE/1YRLIdfaRghAJOWKhH
	T80asVo7FYnp7Qs/1XmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUa-0000000CxRd-04Rr;
	Fri, 06 Nov 2026 16:08:40 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUX-0000000CxPv-49Az
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:39 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FEKhB2656491;
	Fri, 6 Nov 2026 16:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aljBCf
	9/MmrTLX/Ccg8ZLrEoj6cKNfroAB+y0foXNJE=; b=i1584vgLDNnIsuCIFXD2fo
	1wZMi6H3d/AYRxHZbqExqi4xCW8XmahpJogKPOBVB8lG01z2XU5zte0L+SbfQv9g
	fH6eZ2gcA//akwPwWzi+sD6FPgt1UXwLelb1uJVicjz7JFB34PHIbbCFyqYn4BYf
	N+NDzdlkzjxrLmUJ5aUTf/ivCwWb4pxsVGPo5/Ll61CumHHLqIR3zS1E6O2P23qr
	0XWRYA8VV/etp6idk8MWXLB+rrrfPOie5EPXU+VyEhXD+MUMFQkqUUpUt5O1VVIp
	65eka0M+8xdIs16A63FJ0lYhgcZgw8Nkyi4hov7zM413l2H7qS3SJW3ASntYBTXw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rc5esv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4xUJ2390175;
	Fri, 6 Nov 2026 16:08:18 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h13wds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8Fd652494794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 265922004B;
	Fri,  6 Nov 2026 16:08:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDCD22005A;
	Fri,  6 Nov 2026 16:08:14 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:14 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:36 +0100
Subject: [PATCH v3 03/23] arm64: sysreg: Convert OSLSR to automatic
 register generation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-3-75e95980fb10@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXx7H/w9GaMmvC
 wgKjs+HR7dhAyHENO+GdQFOat5SREYxDz9O5rPqdwCgFNuFUGnlTCdSg1r80ZsnRxznEj0twbYp
 cko3wZaAtPcfzs/r952L+3LIi8VcZB0=
X-Proofpoint-GUID: xFcc7uGqZ-HYK0UJbpgCHve9C9pcjYKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX5jg/b7IN7rGs
 faYNdYhVC4YQCKnxMBn23kpjHTub3g22+J2QL3X5MXWz3VneOJapiOCQV7lNc6QFOo4/Ph1tzbP
 9cbD5+7a5ucrgFm4PfxPCgT9C8CfFtl3YEJpYtWofPffVMPOYXBR/orXBsTzhGd1LOk3ZtJXGXc
 5PE62NwDej8l2gKLUlfqa8Zre3LB4F4zM1dCGTFjd7iby1L1agu+jycE+fQxbf6hBZB7IRgluL7
 SQEQhaLXlZUu7mHf8Ru+1UChX4cwPJIHSd9KQMeu3s5nm1hqfJKiraSPjUOzU6ZtOmpg9eLNJDr
 Q8IZRYU9+elZBg5Rm95mmlBsWIvhv5ghtEOWW2u65BedwPyxmgAVA7jv7bzYOXLEcbL4iuCH3Xr
 Han6K9p2CgVLctxtkwaixMe+Dx9xc/STC4bwTGAchGxxzDMPm41CUfjgBc6FAm0cbXCgR2V82wY
 KsizHyymRZh6vmhxXFA==
X-Proofpoint-ORIG-GUID: xFcc7uGqZ-HYK0UJbpgCHve9C9pcjYKs
X-Authority-Analysis: v=2.4 cv=CY+dd7rl c=1 sm=1 tr=0 ts=6aedfb73 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=uoKN2WSkVIwsLX3wBB8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080838_152160_1FC651A0 
X-CRM114-Status: GOOD (  16.12  )
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

Convert OSLSR to automatic register generation as per DDI0601. As
OSLSR_OLSM is a composite field using bit 0 and bit 3 the combined
values are still defined manually. While at it rename
OSLSR_EL1_OSLM_IMPLEMENTED to OSLSR_EL1_OSLM_IMP to be consistent with
the rest of the system register values.

No functional changes.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/sysreg.h | 12 +++++++-----
 arch/arm64/kvm/sys_regs.c       |  2 +-
 arch/arm64/tools/sysreg         | 14 ++++++++++++++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index e3b60ee03023..2ec9ba9cd896 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -186,11 +186,13 @@
 #define SYS_DBGWCRn_EL1(n)		sys_reg(2, 0, 0, n, 7)
 #define SYS_MDRAR_EL1			sys_reg(2, 0, 1, 0, 0)
 
-#define SYS_OSLSR_EL1			sys_reg(2, 0, 1, 1, 4)
-#define OSLSR_EL1_OSLM_MASK		(BIT(3) | BIT(0))
-#define OSLSR_EL1_OSLM_NI		0
-#define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
-#define OSLSR_EL1_OSLK			BIT(1)
+#define OSLSR_EL1_OSLM_MASK (OSLSR_EL1_OSLM0_MASK | OSLSR_EL1_OSLM1_MASK)
+#define OSLSR_EL1_OSLM_NI						\
+	((OSLSR_EL1_OSLM1_NI << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
+#define OSLSR_EL1_OSLM_IMP						\
+	((OSLSR_EL1_OSLM1_IMP << OSLSR_EL1_OSLM1_SHIFT) |		\
+	(OSLSR_EL1_OSLM0_VAL_0 << OSLSR_EL1_OSLM0_SHIFT))
 
 #define SYS_OSDLR_EL1			sys_reg(2, 0, 1, 3, 4)
 #define SYS_DBGPRCR_EL1			sys_reg(2, 0, 1, 4, 4)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 2b28b929f9f3..8c91de6a4097 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3309,7 +3309,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_OSLAR_EL1), trap_oslar_el1 },
 	{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1, reset_val, OSLSR_EL1,
-		OSLSR_EL1_OSLM_IMPLEMENTED, .set_user = set_oslsr_el1, },
+		OSLSR_EL1_OSLM_IMP, .set_user = set_oslsr_el1, },
 	{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 997c62ab72e6..5d38f115bac1 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -122,6 +122,20 @@ Res0	63:1
 Field	0	OSLK
 EndSysreg
 
+Sysreg	OSLSR_EL1	2	0	1	1	4
+Res0	63:4
+UnsignedEnum	3	OSLM1
+	 0b0	NI
+	 0b1	IMP
+EndEnum
+UnsignedEnum	2	nTT
+EndEnum
+Field	1	OSLK
+UnsignedEnum	0	OSLM0
+	 0b0	VAL_0
+EndEnum
+EndSysreg
+
 Sysreg	SPMACCESSR_EL1	2	0	9	13	3
 UnsignedEnum	63:62	P31
 	0b00	TRAP_RW

-- 
2.56.0


