Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36692606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGxl+NVc;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JWrkVUaa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cLNv6KB03osHSU+M3lnGSWebTBLvoLozA4OE+uFZgIc=; b=gGxl+NVcNeB6PV
	CpWLj50WNzT+I3iu3xAVdUqociZIN04xxdCaFPlj6rOZYolf4R/ZqYz2gAH9k5PGf6LPDca++qw53
	80bs/gLqF6dGOR8vMNkJMEPLcb1XkuHUjJeqTpSIRlF5qcfArAa6TgEA8llDi0axjZ6vEjB+EvLSl
	WY4BlgTWkhfvzIk7jcs5WgvshHZKRgJYJX94Iwx+F27Qgm1BuPSX/zT988EEM0Y1EOfZw2h+tWdC3
	co2jZHOO1zdgXJ01BYPd7JdsyWdRUwXRzZKnpt7aSt+ank/tvj8ODjr/Ztm2AH6hjTp7gkOgJp2Wb
	lkbyZ3Aiod6xgy0VCyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUx-0000000Cy04-1EPZ;
	Fri, 06 Nov 2026 16:09:03 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUg-0000000Cxa1-1EgJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:54 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FE79L2935677;
	Fri, 6 Nov 2026 16:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cLNv6K
	B03osHSU+M3lnGSWebTBLvoLozA4OE+uFZgIc=; b=JWrkVUaaI8oxLZhBKciQFN
	Yl91f0mgTP129QxmDUfEo2K7UywmMMOSFXfoU+4ZaYuGi9dIuyUd0egaUrWQIShj
	3XrFpCsFlo7MHaV1F41h9URdfIjzGRPlXr4yiQCIQDb9PSEsZsTaD7VpaYAVGIn7
	OEbEGz99Q9RqBmE8ERH6HZDDt/kdYLtIthxpGNr4ZDOX2oN2MbZu2VcrUkbiT1t6
	YWEXrgjwu4ZzM3o/pC5fTpE9oTl/sit2wzAeZEOte0Jrr7LGFQ1KGznJqKO1GysZ
	GksthtniTwFQbYXBrpauYRJ3sK15tpNVdzvFO8kYgUgId+ax85NGsxXYH5he1V7w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rcdhfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4sZc3476003;
	Fri, 6 Nov 2026 16:08:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hrmress0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8LcT32833870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 727BB2004B;
	Fri,  6 Nov 2026 16:08:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 144742004F;
	Fri,  6 Nov 2026 16:08:21 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:21 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:51 +0100
Subject: [PATCH v3 18/23] KVM: s390: arm64: Use QAAF init save area
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-18-75e95980fb10@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: eHKh99oN5WjtldWd8hk5q8lnjL6vieAy
X-Authority-Analysis: v=2.4 cv=A635rKWG c=1 sm=1 tr=0 ts=6aedfb7a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=4v_MITeQBDqVJkbHs2kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: eHKh99oN5WjtldWd8hk5q8lnjL6vieAy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXwiH1uOHfmWB4
 /DdsBiRwM87iqtJhv56ElN3inqt5uZ+8wDCCRV1BxZ0Aoji0k45iVGYnUL1wUH7XQ1qvQRJPnXn
 qUF+E7Uh0TTwMJq+P0E/ix3IoqAd5D2Xj2zs81IeDzhnEzcCawm20NYJH2e0wnVy1ETo9kUsz9w
 uo1dbq4fhrk2/HQrKtiXzwtEooyrVvydi1n+gCPNZ0UbTOfJXRKgJRqA5WMfuEle5HFNgDouI0u
 03LFsXIMsRD0PvnNfYB+lfTt4NTlWUkFqpd79Jw2XE/+qo716cReRnh3lUU8B8iweczDxPfh2Ah
 NQR2BjgIAr0g7zSyziSyLuwcA4LmkUhrbd3InyJEKvgAxzid3/75Noib6HCfaNfMeVaNEaV+yp1
 EoRYOujr0o4HrP+OEhKYX+wBLilHMjRJ1NEuuRPGP0gNJvl45MpviE3/qnbfvqjvLLfmyZc9ybQ
 sh8EPdGTkIFm6QWfX3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXzEV2EJrKObBA
 qk9Le1jLi8Ktd1PRfZMNb8QRCnjbvSfyq5K/Cd6ewqGSUeUfdB2nlLCo7OfTcu1brfCJ0riOYS2
 SxvLind5rqeN8HqD8iDjdCK/f/EL0fo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080846_493028_DC12D441 
X-CRM114-Status: GOOD (  14.79  )
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

Use the (cached) result of QAAF fc2 (Generate Initial
System-Registers-Save Area) to initialize the Save Area.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/arm.c   | 1 -
 arch/s390/kvm/arm64/reset.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 62fd71af8968..4de0f17052cb 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -371,7 +371,6 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	int ret;
 
 	sae_block->save_area = virt_to_phys(save_area);
-	save_area->sdo = virt_to_phys(sae_block);
 
 	ret = kvm_vcpu_set_target(vcpu, init);
 	if (ret)
diff --git a/arch/s390/kvm/arm64/reset.c b/arch/s390/kvm/arm64/reset.c
index 0339901f5fd0..dc00bf398b15 100644
--- a/arch/s390/kvm/arm64/reset.c
+++ b/arch/s390/kvm/arm64/reset.c
@@ -3,6 +3,8 @@
 #include <linux/kvm_host.h>
 #include <linux/fpu.h>
 
+#include <asm/aef.h>
+
 #include <arm64/kvm_emulate.h>
 #include <arm64/kvm_nested.h>
 #include <arm64/sys_regs.h>
@@ -79,6 +81,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	if (loaded)
 		vcpu_put(vcpu);
 
+	memcpy(&vcpu->arch.save_area, aef_gisrsa(), sizeof(vcpu->arch.save_area));
+	vcpu->arch.save_area.sdo = virt_to_phys(&vcpu->arch.sae_block);
+
 	kvm_reset_vcpu_core(vcpu);
 	kvm_reset_sys_regs(vcpu);
 

-- 
2.56.0


