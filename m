Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577A606C2E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=etYdQRPg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hqWCA2tC;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G8vveRO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LxGg80roB/T2VMVa2JS/xSUiJuo79We2YYLICTkZtcA=; b=etYdQRPg+IV1uJ
	DXEXbeDWailwQ9YbSRUWvTY9LYeH+mL5sTuNxR2u2LwUdP/3PGza9/mX0EC4BOghNa0eNypuEyHdq
	PGtawGuUOoA8xmRzQpFWQKxxxprNgYUVAlJIVMlB9BJwEHcNnWa3nb0KBjhpKup3CNFO/99CXXdnj
	cyjSUvIHMgkq/3u4XP/0GKlD56VKFgKuKdvzcSz8ubRe48GMmhnuF0FUW4TzOixAl7jRT3SM8jH/J
	DpoNKkk4HZlAYlHx5DSpxB0QKNmjcuKxFDrxZ7OMBNLSjuNlKLFVhFMEzlp9qrw987xTh2vy2tz3s
	u2jahJqRADMP8tJ1S8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsa-0000000GOiS-191P;
	Fri, 27 Nov 2026 14:24:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWws4-0000000GNdQ-1gvt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LxGg80roB/T2VMVa2JS/xSUiJuo79We2YYLICTkZtcA=; b=hqWCA2tCUZlan3vUARwCKdybdB
	7YUmaoK2nwyL9EYzrhhTBBJ7DzkEP0LeBUfRuLp9d+2Z5cWPXMupNqKOzD1cS8jCR68qpI1Sl//MH
	SD+cT0bIsjmfwz7KCoOhLncxJJy5vgUXeSUiBh8hqc3OvWJswDq/uGY1BV4YzR6ezJmihIIGbEH6U
	Ns9McvTrnVCymECiKN5+VqUA9KvQwgqzEtmPrFquoSZy2jRwt1WuL2v88ui9kVJlXcRbodcKGKUeU
	ELaw7dtXyB7UCtL08yOU/Dt8W18vje2+cOkkJfs53r72HKj8qtvK708O8A6RdKUDjOx/4hngdm53l
	qmPsNqEw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwry-00000007mRz-2iYS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:12 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4oQs3234409;
	Fri, 27 Nov 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LxGg80
	roB/T2VMVa2JS/xSUiJuo79We2YYLICTkZtcA=; b=G8vveRO04FM5DbJVODFcyk
	ZLiY2NiHrXOOLq0Or86nJ5oyUOmZmL5ZammqefYlcH6LQyQmoI/WxGswS01jM9+m
	yl8mLXHiD44KVAPKfUVxax5PwoS4VtUSBmfkXXFeKura5Kln/NUqMOwHwXtGcVPI
	b+hD35Y3PrSr04/oxV1BhODWNhXI9y/qECHvBOVfySABWfyXpTdNtsSvj/OjwB5B
	QXxWT7Ua4Dr3FIc5IqyoNfU56KksHzZeCEVmcqN8jvd+XjgcIr3Kw+qtRwv2B/PK
	8DdhbU6LjTlUg/IT30xfiKV0uGRe1jr6zpFxhY6OFVmyqcEVFBMYKZ/rEGq2uvZA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvng54-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4JUH861635;
	Fri, 27 Nov 2026 14:23:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6mjg4d4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:23:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARENGDO38863292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:23:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EC0A2004B;
	Fri, 27 Nov 2026 14:23:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A58920063;
	Fri, 27 Nov 2026 14:23:15 +0000 (GMT)
Received: from a46lp73.lnxne.boe (unknown [9.87.84.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 14:23:15 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Fri, 27 Nov 2026 15:22:08 +0100
Subject: [PATCH v4 05/25] arm64: vdso: Define ARM64_S390_COMMON=1 for all
 vdso builds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sysreg-v4-5-a6318d18aab5@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b09925b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=sEnpHoJLZwujkWsBufgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX3fOfNI7+7rip
 0o+RAlv1e4zvd5RQzGZGRIn9FDylravuVjzRfI71MdlKAEu+HqQPYBpBHWw+TiF7p8KiY9a7FiI
 sBoVW5KbJ31rE2pRJYaaVg8Grn2Ss7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXxg3Wj/i9l+FJ
 tcg2XSPue0aQ4gCTQs0uS58inBNqy8BOMyQeu/VWAjmA9NEkOSXeKPobFZhcDTlAF/fS2Rmh1Jz
 UfWX7MOWV7cpggxb7LxV+qHGK7XrWS3DSLBGUnYSlbx9zZxxSzLTIwATeMNS9sJcvhd3sJdWIms
 JMlDXhuzDt+TtlxRPxf+HtvnZ4+6Cb81WJ7xLb4wKmvyig/ZLSmzygVmxxe9ciikWhpMle0kl8+
 /yahYi9nYXilcpRTdselbbCi27kN5LUAHW3eVFr6LdIWyH1zu1CseFxNJQWAjRZd9U3yApqXLH2
 J0atGJX8lgmirblClS3Fh4f+c8FFIF8gQm9eEk3ZG2MZDWGAiHfqHwyEuKhCwDQnp68GWziXDJb
 EuzODoZ+wZCyFk0aon3DXq7yFZDy/6qveFyHp4Q8Ez66sFi61xqVoIBAQAq2sR+jYTBS32orhPH
 y6rp43bnU+Yp0H2K+qw==
X-Proofpoint-ORIG-GUID: wtQB5fvhxE1Jo9lMUpt16acEWMNvE9r9
X-Proofpoint-GUID: wtQB5fvhxE1Jo9lMUpt16acEWMNvE9r9
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
X-CRM114-CacheID: sfid-20261127_142410_784788_48C51F8F 
X-CRM114-Status: GOOD (  14.74  )
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

The compat vDSO builds with LINUXINCLUDE but without KBUILD_CPPFLAGS,
where -DARM64_S390_COMMON is defined. Future marker in e,g, asm/cache.h
will hide definitions or break the build at the prepare stage if Werror
& Wundef is defined. Define the marker for the 32-bit vDSO build as
well.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kernel/vdso32/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 00efdc5d2354..880449ea36d3 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -33,6 +33,8 @@ cc32-option = $(call try-run,\
 VDSO_CPPFLAGS := -DBUILD_VDSO -D__KERNEL__ -nostdinc
 VDSO_CPPFLAGS += -isystem $(shell $(CC_COMPAT) -print-file-name=include 2>/dev/null)
 VDSO_CPPFLAGS += $(LINUXINCLUDE)
+# arch/arm64/Makefile puts this in KBUILD_CPPFLAGS, which is not used here
+VDSO_CPPFLAGS += -DARM64_S390_COMMON=1
 
 # Common C and assembly flags
 # From top-level Makefile

-- 
2.56.1


