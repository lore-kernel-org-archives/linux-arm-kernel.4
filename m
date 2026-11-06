Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D32606A9A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bcpkUNf7;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fpAY2ft2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X63IZzZheOdrg6qDJSPKMNQvpa1xKEbFz3i9APvG6ho=; b=bcpkUNf7bTkDSk
	opjJ9i03WO9niihPIcm3ACm2WycqY7NVXcPRvTsLxNFFMJHK/+Q02wLdMVs8FaNLK6VSogMuOWxFs
	jXI7PFi8lzwowAL9dIoojPQ8ySh9x0tiPXrNcWc7IENJER9aRnX4fwzs7syVJ4a5Ef5eu6cICc5pQ
	55qNSc+aTt1+vU+cdcXF7wPweafkqOW3X5Skk50s9cvj/ey1FkOMtJp7ealnyimf4KwEa9tBnOQk8
	x19Mm0x0RorzyCiNIHnmnM+xzK+N0frCgtT8AIHF8R9mlG4PU8+fPT3E2jmXAR2AuiJ3VQq3+Z7Sl
	CU8xZFYn2ACIKoJWFiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUq-0000000Cxmf-1iQ6;
	Fri, 06 Nov 2026 16:08:56 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUc-0000000CxSh-2OVq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FEEdZ1544351;
	Fri, 6 Nov 2026 16:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=X63IZz
	ZheOdrg6qDJSPKMNQvpa1xKEbFz3i9APvG6ho=; b=fpAY2ft2FtxPoRiObry+DD
	lGC7fKq+yhpW4dJ8LHW80LnMX70QdeREV4oFosjX3ldoorq3kk6f8uXcywbyS3Sx
	s8LBHR0LlUC8C0cE3IDiyvJ6268fhgLQ/w5XELPWd4XS/4+jMAjb7oMizoPhGofk
	2RGstIp44Zz4/OJTEZdoP+4Y89ARGrfejGONHCvhf+414PHJx731PEQI5YOPxeGK
	L3mYvBP7QlDGMVma7ctBw7qgsJbjX4zJ9GcLP9Ist+8bGngota1C8T2DQMIvcmEO
	3cstg0kneABRPe6GILZDm+tQs2sqtPlA7b51hsF60PaqIKa2Gx6eFo1KWKuzV6gQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3rbwf0a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4vxf3617218;
	Fri, 6 Nov 2026 16:08:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hrdd7ukcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8JlY16646642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4F9220063;
	Fri,  6 Nov 2026 16:08:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49C2E2004B;
	Fri,  6 Nov 2026 16:08:19 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:19 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:47 +0100
Subject: [PATCH v3 14/23] KVM: s390: arm64: Verify machine feature set
 before loading
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-14-75e95980fb10@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: vCRx0Qew_klhVdlZSfdhXdccJwNGYSA5
X-Proofpoint-GUID: vCRx0Qew_klhVdlZSfdhXdccJwNGYSA5
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aedfb78 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=AT7rqknK4rqI55-KZpcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXwecC2Xi9Vb0M
 VQGX/7EekuaLRKidMa/iXpj08xzymqIGdCzNZvuCaGUcMI9gxA8PE9mf0gNNpic95PWBMLaKSpG
 dzzC4GA3GIt6ndpI7vhWNXHDAJO60YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX5f3P/jzU+mx5
 kk1fxbMy7CoWhH/XoOLpPet8DUOss2cnqIcnsuxpEqsqB6JBiS9VzHe90drDsgahLkUGfPKrTC7
 nh6mftJSTj3J8qbj/XGnAbiUtHLaMymHnjlupZ/kJBDCY6LM2zTWZEkMl5Pl6cAPhXVE8UWxDth
 91P9N+alQxVrN7BCP5GbzhV0Ho7p3lW4ihQSBhIdvVA2JgKZrTdSgqMGElrAPiF54tLgdJ02/Ax
 Qnj/n7V2ZCzFyzHMCcOsUq+r0DKlPfD2umo6qTUGvdJdYEceN5BDbPRUU9fS216gkDKg9elKzGs
 PVqcZ9R80MLiNguf7swYmIguZnUjm4rwmy8/xAKX+VbtPNQ0ARd496OAPZegxiXQgrpvnG9awbq
 rNpcvhZDI31hm4gwGCEAV/oAEshv6BI9luZrzWjFv6ya/x+az1Grb0jPCG5L2beyvzUFw6uTLgf
 MIvMnUZdHRl8nc2VNpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080842_767795_441A7DD7 
X-CRM114-Status: GOOD (  15.78  )
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

Arm guests on s390 need more than the Arm Execution Facility alone. In
addition, the PTFF time conversion functions are required. In addition
the guest mapping relies on EDAT2 for large pages.

Verify that these features are present before loading the kvm_arm64
module. Every machine having the aef facility present should also
support those. Print an error message if this is not the case.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/arm.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 62c2b45599b9..3af0b47b8377 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -741,9 +741,28 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
 	return -ENOIOCTLCMD;
 }
 
+static bool __init machine_supports_arm64_kvm(void)
+{
+	if (!sclp.has_aef || !aef_usable()) {
+		pr_info("ARM Execution Facility not available\n");
+		return false;
+	}
+
+	if (!ptff_query(PTFF_QAGTO) || !ptff_query(PTFF_QAGPT)) {
+		pr_err("No ARM time conversion functions available (unexpected machine feature set)\n");
+		return false;
+	}
+	if (!cpu_has_edat2()) {
+		pr_err("No EDAT2 facility available (unexpected machine feature set)\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int __init kvm_s390_arm64_init(void)
 {
-	if (!sclp.has_aef || !aef_usable())
+	if (!machine_supports_arm64_kvm())
 		return -ENODEV;
 
 	kvm_init_qaaf();

-- 
2.56.0


