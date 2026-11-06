Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A04606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjXDs+PK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k7Os2cwP;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eX9WNVkQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dGDN+ejzVWmWnw33Kx8a6S3Ziw/s9YTkRedQx7DCWZc=; b=qjXDs+PKVxLWeM
	eYaWcY+klvRFmFA0Jm8MSe7H00UaHadzlq3rNiLXbxAOBhg4y+I5d5OBcGK0Hf12ZLNkk2X1JB7cG
	JvNVrLJWyXrLXAPjXIHv+RDKbVFl0StXJK8vj8GJ34ZMHwdahWFgGFUCerSAg/a5uOoYxpJoRfNeC
	w3yMW0mKbbKScAkAad6FOgNBPXZzoX3hcyaDoZKpckKEcPlDKokjL58dOGjCgRjMahuzfDS8pJf8r
	XzF1ylnWyTkPCAhC+gfImGeRxXASZk8VUL8XmRh4y86TWjmf4ILdLQNaYHLcrQcIOjPVvCsz5KlLn
	UQVEPtcZMxn7Z+d11NwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMVO-0000000Cybs-3n8D;
	Fri, 06 Nov 2026 16:09:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUr-0000000Cxnn-2ci2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Nov 2026 16:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dGDN+ejzVWmWnw33Kx8a6S3Ziw/s9YTkRedQx7DCWZc=; b=k7Os2cwPEMZTRYNs6GzU5n904N
	hBTR0kMBiVWGJWr2JWznSnox5wDK3It1AIe29ShGOe5XE3Ec2InNyB3wKSWhj9bsH6kbWWpsj8Ytb
	c6g+cC3LX/rhh1H3VP2u5MeVWLIRFqE1m6QSQxDkFMx4IsZsOzVG8vlLkz8cxRWAfidvBmaUCaq05
	axaOSSoW6DIFB/uZK4vpZGDnIRsghw8voV8HOEHMKrJdkoM+zMIYoFth2rhk2NPa1nwvnhGPS1F6Q
	gkne3W6vr70E29w5SysloS3JOP+yBtkTbTlYTadUeXpvHy/xAQFEnDRzN2hWp+bmiqBvhgR4KVZ6A
	MKd1shLQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMUo-00000004RWw-3Ikt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:08:56 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FE9p02726715;
	Fri, 6 Nov 2026 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dGDN+e
	jzVWmWnw33Kx8a6S3Ziw/s9YTkRedQx7DCWZc=; b=eX9WNVkQ/3/ie6Y5uJS7Lx
	1x1rLN1veqmAM1J/oosmdEcbWKAnPr2Yh7DCQCM1ugBXzvvc4oyQEBVNaIdqn+wJ
	2OuxfsaZBcNi4vO6YbzAnprtr0RA2Vosic9eeYBy8RY8NjrbafC0pFqSwqQqyYq+
	QGQVk6pgL5zyKhXqQ2+vx3xaMad4bULklg1sdgSMZJBU6Ue9nglawTn3WI+N15mP
	mV6sCr6tiXaFmN5Gpq76ssSC8pxbHeMltEdRmxTkrFEmGbRGAL2V2sL3RjaPMvpa
	fD+ooyPvdeuBpeFDMLDP+0FmhXb054YtePgrSqShoNI+aOcnpDtnqeNRdTaT1YpA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hs3r9dfsg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F4rXF2390066;
	Fri, 6 Nov 2026 16:08:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h13wff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:08:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A6G8Non52298170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2026 16:08:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9630D2004F;
	Fri,  6 Nov 2026 16:08:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30B3420063;
	Fri,  6 Nov 2026 16:08:23 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Nov 2026 16:08:23 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 06 Nov 2026 17:07:56 +0100
Subject: [PATCH v3 23/23] s390: Report AEF features to sysfs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sysreg-v3-23-75e95980fb10@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=LKHz05W9 c=1 sm=1 tr=0 ts=6aedfb7c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=_1njvoj5cknMIrGAsaoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: iQVpJlq1zs5IykuTBq1czgHeqRbR3N3j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX+nyt0wLabR8k
 fdlG0UDBqx/jLx1JepradORtV2kje2VUzLUA1JUETM3u/gIIfOpFvo91Lse4wp8rVaTptXyeRJw
 JMlwk+I2aFFAAZddkWVEzL/C1Zxu6lY=
X-Proofpoint-ORIG-GUID: iQVpJlq1zs5IykuTBq1czgHeqRbR3N3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX7PYJIloOxfgn
 RhKY9VG1LfO474GkztipExgWMVsTEe9veRXy606mxY+YCDjG4JCl9E6yHFATcXG+DV7zbei7fdW
 iuP3OYdK/hotJ85zT0w7fOslFe11LmtYoECy1ajL44pziko8TOyXLi0ppiQY+7Bz1coa8JwhtaA
 3smOtpUBtngJ9Grnl8YOwLaBH+NExRxdiiAYkc8TF59kFnT1XrdX1q8OTwBeEylD3MRVTpimoyx
 9ZQxBVcn9rsyCVt5FDw/m5GeZnS5iSUWUDidYyKKkIQRHVT835xHTZmK4ZzZDKyb0eX9n19MdY8
 agu+JSNSSRuQm5cY8Co7zvZwbvWBibtJD/AiOgG2C+Okk1/74f05sJXQXB4HGcqdr4zKB3vOIts
 jxjFvTV10ahcNIlyzZ1vjE5CnxbWmC97if5k7SPlxuEcwNA7+pWW08VySRceMcdMXPN6BBS2kg1
 MA3Ovokd+tbUIg+wjTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160855_076091_2F2D44B2 
X-CRM114-Status: GOOD (  25.68  )
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

Display various information about the Arm execution Facility (AEF) to
userspace. The files are located in /sys/firmware/aef/. Show if the
feature is available and usable for the host, which formats are
available, and how many arm vCPUS per guest are supported by the
machine. Additionally, provide the raw binary output of QAAF fc1 (Query
Model Capabilities) in the file qmc and fc2 (Initial
System-Registers-Save Area) in the file save_area.

Co-developed-by: Janosch Frank <frankja@linux.ibm.com>
Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-firmware-aef |  70 +++++++++++++++++
 arch/s390/kernel/aef.c                       | 113 +++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-firmware-aef b/Documentation/ABI/testing/sysfs-firmware-aef
new file mode 100644
index 000000000000..6ccd8491a017
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-aef
@@ -0,0 +1,70 @@
+What:		/sys/firmware/aef/
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Various interfaces to query information about the ARM
+		Execution Facility (AEF).
+
+		The directory is present only on machines that provide
+		the AEF (SCLP facility bit).
+
+What:		/sys/firmware/aef/arm_guest_supp
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, decimal boolean. Reports 1 if all requirements
+		for running arm64 KVM guests (KVM module kvm_arm64) are
+		satisfied by the machine, 0 otherwise. This is equivalent to the
+		logical AND of sae_avail, ptff_avail and edat2_avail below.
+
+What:		/sys/firmware/aef/query/
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Raw machine characteristics as reported by the QAAF
+		instruction.
+
+What:		/sys/firmware/aef/query/sae_avail
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, decimal boolean. Reports 1 if the machine
+		provides the SAE instruction.
+
+What:		/sys/firmware/aef/query/ptff_avail
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, decimal boolean. Reports 1 if the PTFF
+		instruction supports the QAGTO and QAGPT subfunctions.
+
+What:		/sys/firmware/aef/query/edat2_avail
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, decimal boolean. Reports 1 if the EDAT-2
+		facility is available.
+
+What:		/sys/firmware/aef/query/supp_state_desc_formats
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, 0x-prefixed hexadecimal bitmask. Bitmask of
+		the SAE state description formats supported by the machine.
+
+What:		/sys/firmware/aef/query/supp_save_area_formats
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, 0x-prefixed hexadecimal bitmask. Bitmask of
+		the SAE save area formats supported by the machine.
+
+What:		/sys/firmware/aef/query/max_num_vcpu
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only, decimal number. Maximum number of guest CPUs
+		per VM.
+
+What:		/sys/firmware/aef/query/qmc
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only binary attribute, 4096 bytes. Contains the
+		unmodified, machine specific QMC response block.
+
+What:		/sys/firmware/aef/query/save_area
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Read-only binary attribute, 4096 bytes. Contains the
+		unmodified, machine specific GISRSA block.
diff --git a/arch/s390/kernel/aef.c b/arch/s390/kernel/aef.c
index 31e18953d7b3..96a6d63b2695 100644
--- a/arch/s390/kernel/aef.c
+++ b/arch/s390/kernel/aef.c
@@ -11,6 +11,15 @@
 
 static struct qaaf_qmc_block qmc = {};
 static struct kvm_sae_save_area save_area = {};
+static struct aef_info {
+	unsigned long arm_guest_supp;
+	unsigned long sae_avail;
+	unsigned long ptff_avail;
+	unsigned long edat2_avail;
+	unsigned long supp_state_desc_formats;
+	unsigned long supp_save_area_formats;
+	unsigned long max_num_vcpu;
+} info = {};
 
 const struct kvm_sae_save_area *aef_gisrsa(void)
 {
@@ -38,6 +47,68 @@ bool aef_usable(void)
 }
 EXPORT_SYMBOL_GPL(aef_usable);
 
+static struct kset *aef_query_kset;
+static struct kobject *aef_kobj;
+
+#define aef_sysfs_qval_def(_name, _fmt)				\
+	static ssize_t _name##_show(struct kobject *kobj,		\
+				    struct kobj_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		return sysfs_emit(buf, _fmt "\n", info._name);		\
+	}								\
+	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
+
+#define aef_sysfs_qval_attr(_name) &_name##_attr.attr
+
+aef_sysfs_qval_def(arm_guest_supp, "%lu");
+aef_sysfs_qval_def(sae_avail, "%lu");
+aef_sysfs_qval_def(ptff_avail, "%lu");
+aef_sysfs_qval_def(edat2_avail, "%lu");
+aef_sysfs_qval_def(supp_state_desc_formats, "0x%lx");
+aef_sysfs_qval_def(supp_save_area_formats, "0x%lx");
+aef_sysfs_qval_def(max_num_vcpu, "%lu");
+
+static ssize_t qmc_read(struct file *filp, struct kobject *kobj,
+			const struct bin_attribute *attr, char *buf, loff_t off,
+			size_t count)
+{
+	return memory_read_from_buffer(buf, count, &off, &qmc, sizeof(qmc));
+}
+
+BIN_ATTR_RO(qmc, sizeof(qmc));
+
+static ssize_t save_area_read(struct file *filp, struct kobject *kobj,
+			      const struct bin_attribute *attr, char *buf,
+			      loff_t off, size_t count)
+{
+	return memory_read_from_buffer(buf, count, &off, &save_area,
+				       sizeof(save_area));
+}
+
+BIN_ATTR_RO(save_area, sizeof(save_area));
+
+static struct attribute *aef_query_attrs[] = {
+	aef_sysfs_qval_attr(sae_avail),
+	aef_sysfs_qval_attr(ptff_avail),
+	aef_sysfs_qval_attr(edat2_avail),
+	aef_sysfs_qval_attr(supp_state_desc_formats),
+	aef_sysfs_qval_attr(supp_save_area_formats),
+	aef_sysfs_qval_attr(max_num_vcpu),
+	NULL,
+};
+
+static const struct bin_attribute *aef_query_bin_attrs[] = {
+	&bin_attr_qmc,
+	&bin_attr_save_area,
+	NULL,
+};
+
+static struct attribute_group aef_query_attr_group = {
+	.attrs = aef_query_attrs,
+	.bin_attrs = aef_query_bin_attrs,
+};
+
 static int __init aef_init_save_area(void)
 {
 	int ret;
@@ -71,6 +142,17 @@ static int __init aef_query_info(void)
 	return 0;
 }
 
+static void __init aef_info_init(void)
+{
+	info.sae_avail = sclp.has_aef;
+	info.ptff_avail = ptff_query(PTFF_QAGTO) && ptff_query(PTFF_QAGPT);
+	info.edat2_avail = cpu_has_edat2();
+	info.arm_guest_supp = info.sae_avail && info.ptff_avail && info.edat2_avail;
+	info.supp_state_desc_formats = qmc.ssdf;
+	info.supp_save_area_formats = qmc.ssaf;
+	info.max_num_vcpu = qmc.maxncpu + 1;
+}
+
 static int __init aef_sysfs_init(void)
 {
 	int rc;
@@ -86,9 +168,40 @@ static int __init aef_sysfs_init(void)
 	if (rc)
 		return rc;
 
+	/* sysfs failure below does not invalidate the AEF data */
 	aef_valid = true;
 
+	aef_info_init();
+
+	aef_kobj = kobject_create_and_add("aef", firmware_kobj);
+	if (!aef_kobj)
+		return -ENOMEM;
+
+	rc = sysfs_create_file(aef_kobj, aef_sysfs_qval_attr(arm_guest_supp));
+	if (rc)
+		goto out_kobj;
+
+	aef_query_kset = kset_create_and_add("query", NULL, aef_kobj);
+	if (!aef_query_kset) {
+		rc = -ENOMEM;
+		goto out_arm_guest_supp;
+	}
+
+	rc = sysfs_create_group(&aef_query_kset->kobj, &aef_query_attr_group);
+	if (rc)
+		goto out_kset;
+
 	return 0;
+
+out_kset:
+	kset_unregister(aef_query_kset);
+out_arm_guest_supp:
+	sysfs_remove_file(aef_kobj, &arm_guest_supp_attr.attr);
+out_kobj:
+	kobject_del(aef_kobj);
+	kobject_put(aef_kobj);
+
+	return rc;
 }
 
 arch_initcall(aef_sysfs_init);

-- 
2.56.0


