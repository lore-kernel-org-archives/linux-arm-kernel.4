Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D74606B1B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ow3zmZUy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iD6lmQZ2;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eBKpafd0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2yY4+KSg/jq2p/o8BUuPNm3QW1RUhmZvGM6xdFZKEZk=; b=ow3zmZUy6SYhIy
	U5hiBhikN7MpkUy/phZy5/KJF9a7UZP2/iwvNYBt+ka5VagfvA10QOhbICZb7WCjSnu8C0atPKgmU
	dxGs8pHPBy1/CGl+bAYH46qxH9C+E5z+KGNmay2pmSKlJxgWCV+qvyGKPXwGjM/tsuhspAQr2r9yQ
	8Iw3jpIawwPSe7/PrzKTwJN5J+ZKpQCsj6TdRNMxJEdV8hkRi+dUtM2DYX3dXV2+RCHIw7xtxq4YI
	BqQC8tOuY7Bo5vCjvF3cJS8U6tlNUGhiHMdBCSn6ZT18zYvpcHFVd/Xa18qzOTRVrSAl1NsxnB0CA
	gGGSyytTULJ07K2Q6BfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsX-0000000GOcP-38b2;
	Fri, 27 Nov 2026 14:24:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws1-0000000GNao-2zS5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2yY4+KSg/jq2p/o8BUuPNm3QW1RUhmZvGM6xdFZKEZk=; b=iD6lmQZ2SeW2ePjUVyJIx/16dg
	GJ6rYLfh3FOmLi6LbBPgs0vv9lND2QszIw8nGP+Kh2gRGM6kWQvnk4LlESBdHrcfRBA/D1Z6gP0sY
	c6dTYxXrCS37+fZ0uesfEFbHvBTRUaXN67Dt5qaxn0fLDgyE1xDmn6TaHOHEGz03rUNpr7lKxMn88
	iqpqcuJ7+zE7n/x5PkprvhWwLQpsGIA6MTKefX2+4bZyK9RBYXqD2xHU06r7QIUzTEYvyz/rFclwz
	wA+c12r6zanbcc0uf/YLml3E9Jm1BhIB8jKuaNoLepji4z7mj0WyzO6rsjgefzsU+soxpHcVhvsRI
	KIIaRW5A==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrw-0000000FWGz-2GQN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:12 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4Xgl3419262;
	Fri, 27 Nov 2026 14:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2yY4+K
	Sg/jq2p/o8BUuPNm3QW1RUhmZvGM6xdFZKEZk=; b=eBKpafd0Qgopp8vpPB+z7X
	nbzuVc6npFIfnD63TuMDafUJl9PWnZBvzcHvqrelATHhfpIpj/quh3vtWhv3nWK/
	Jdz/L6WCpT49FJti+o1pDQhwjexCjLFERjTxSBLq8Pkl04iXhrLpY6gh3iiRtEZU
	GeCkvjHQuonywOXYEGtITDkDEbOSK51dZ5tIftmqf2Cbo23j63COtf6j/vMDep6y
	ObOOY8vFBhkRImmRxSZ84Fep/UVnIObDtC21gtwmJo5JruhJ6EUM0pgaecPXRDJm
	YR2nUYHDv10q2uweEpGiRWHP2D8Hq0E3Btm96EXcp19JNzVVIlK67E08L57dScsA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fap8n1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4M9F2819332;
	Fri, 27 Nov 2026 14:23:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfaahm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENQFl36176178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B8652004B;
	Fri, 27 Nov 2026 14:23:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CDF120063;
	Fri, 27 Nov 2026 14:23:26 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:26 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:28 +0100
Subject: [PATCH v4 25/25] s390: Report AEF features to sysfs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-25-a6318d18aab5@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXx0Ap1RwuEcei
 xDhDyYJ2s2Fhl8BXtiJ4YtfSLSWodYsBmzADcZ+w8nOkhEPSVZOaarZBEhAmc4gAGINVbMQI9xh
 7p2tbOPGWl+IYByfXHbaGor1WTHNckOFdE1K9slsW0XRLwd768lSta95ycNlZm0txxWQPzC0cJ4
 n2vq1c/V8TWxZSHSSczDV3fKXeKmKwwIVBYwSAm+CJxn5q5b2w8DSdz0V852Clyc6482cJxEt93
 00G4xTn7vvAd5lhXQ0Rv2ONku7sk+DypwL1Mp52AnWWvvOFvAY0LhVKN5t2sicDaxXL68u3n4Uh
 oY28arMKmnjBH7Stpn4xy6C3J5JhgN92Kqu62PnwmNOGhWUYA4HE1P6TTLVDmqEtaVEt2xP0QcO
 VisUMswHGX7eJlMUGeWbgkMTk4BIEsB0iWPvbCbTLQ2+lqoaoxxBR+XQ1/beyPq+drvSx+3XBQ9
 PKrbXuP5NgJPLoCg0yQ==
X-Proofpoint-ORIG-GUID: 0ipviGYf6wMAP-U2Wt7gzMzS4_q-djeg
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b099264 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=qFodYCUB0ekClddl8igA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0ipviGYf6wMAP-U2Wt7gzMzS4_q-djeg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX5lgaz9Lg3z2A
 3vdrMf+NjBGy2Ut3LjCcxijoba5eW1IYyCNQWVLkUHD1/ROSPDzY1+QCUSQNqQl61C/lxPQ9/Mb
 lv1v+eASBCB2mwkybCJ7H/eHeQPaihc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142408_949368_85EA7BE5 
X-CRM114-Status: GOOD (  23.44  )
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
 Documentation/ABI/testing/sysfs-firmware-aef | 51 +++++++++++++++
 arch/s390/kernel/aef.c                       | 98 ++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-firmware-aef b/Documentation/ABI/testing/sysfs-firmware-aef
new file mode 100644
index 000000000000..6da06cf9d293
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-aef
@@ -0,0 +1,51 @@
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
+		satisfied by the machine, 0 otherwise.
+
+What:		/sys/firmware/aef/query/
+KernelVersion:	7.5
+Contact:	linux-s390@vger.kernel.org
+Description:	Raw machine characteristics as reported by the QAAF
+		instruction.
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
index 31e18953d7b3..7e5538b18eb7 100644
--- a/arch/s390/kernel/aef.c
+++ b/arch/s390/kernel/aef.c
@@ -11,6 +11,12 @@
 
 static struct qaaf_qmc_block qmc = {};
 static struct kvm_sae_save_area save_area = {};
+static struct aef_info {
+	unsigned long arm_guest_supp;
+	unsigned long supp_state_desc_formats;
+	unsigned long supp_save_area_formats;
+	unsigned long max_num_vcpu;
+} info = {};
 
 const struct kvm_sae_save_area *aef_gisrsa(void)
 {
@@ -38,6 +44,58 @@ bool aef_usable(void)
 }
 EXPORT_SYMBOL_GPL(aef_usable);
 
+static struct kset *aef_query_kset;
+static struct kobject *aef_kobj;
+
+#define aef_sysfs_qval_attr(_name) &_name##_attr.attr
+#define aef_sysfs_qval_def(_name, _fmt)					\
+	static ssize_t _name##_show(struct kobject *kobj,		\
+				    struct kobj_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		return sysfs_emit(buf, _fmt "\n", info._name);		\
+	}								\
+	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
+
+aef_sysfs_qval_def(arm_guest_supp, "%lu");
+aef_sysfs_qval_def(supp_state_desc_formats, "0x%lx");
+aef_sysfs_qval_def(supp_save_area_formats, "0x%lx");
+aef_sysfs_qval_def(max_num_vcpu, "%lu");
+#undef aef_sysfs_qval_def
+
+#define aef_sysfs_binval_attr(_name) &bin_attr_##_name
+#define aef_sysfs_binval_def(_name)						\
+	static ssize_t _name##_read(struct file *filp, struct kobject *kobj,	\
+				    const struct bin_attribute *attr,		\
+				    char *buf, loff_t off, size_t count)	\
+	{									\
+		return memory_read_from_buffer(buf, count, &off, &_name,	\
+					       sizeof(_name));			\
+	}									\
+	static const BIN_ATTR_RO(_name, sizeof(_name))
+
+aef_sysfs_binval_def(qmc);
+aef_sysfs_binval_def(save_area);
+#undef aef_sysfs_binval_def
+
+static struct attribute *aef_query_attrs[] = {
+	aef_sysfs_qval_attr(supp_state_desc_formats),
+	aef_sysfs_qval_attr(supp_save_area_formats),
+	aef_sysfs_qval_attr(max_num_vcpu),
+	NULL,
+};
+
+static const struct bin_attribute *aef_query_bin_attrs[] = {
+	aef_sysfs_binval_attr(qmc),
+	aef_sysfs_binval_attr(save_area),
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
@@ -71,6 +129,15 @@ static int __init aef_query_info(void)
 	return 0;
 }
 
+static void __init aef_info_init(void)
+{
+	info.arm_guest_supp = sclp.has_aef && ptff_query(PTFF_QAGTO) &&
+			      ptff_query(PTFF_QAGPT) && cpu_has_edat2();
+	info.supp_state_desc_formats = qmc.ssdf;
+	info.supp_save_area_formats = qmc.ssaf;
+	info.max_num_vcpu = qmc.maxncpu + 1;
+}
+
 static int __init aef_sysfs_init(void)
 {
 	int rc;
@@ -86,9 +153,40 @@ static int __init aef_sysfs_init(void)
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
2.56.1


