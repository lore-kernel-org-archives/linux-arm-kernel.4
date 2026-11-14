Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUqFyxmM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAquq2I1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eF/qvGIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=; b=LUqFyxmMQlDCrOaJao3hcRvR2/
	awj96K81EOU+Euxxw7ohMeRLWcdzKuCxEHRokw0ZL5LxJdXobXuVqlt4P0XuvT8Jul8bzaysutils
	/WXTtPoEECcCqJ8gs+AypTOSyc1tX6PGu+GaOSmCZWNauWZFhGi5rVD6OSxuQElPpS5c/VkTbXL0K
	L9g7iWxuFv5efFTnxZYCihRKUw7tUzQqaEApkRoUdZe2wUIG6kMWx51rdsOB0dg8UdrJ4C+CV0WUh
	6YjdlsYpxSMwjBcDpvuhn9kSren+bxyRNvkaZUmU8RxFtgSd3fTcKsTtbHG25U0MhvQkDXsNZo7cc
	UM0fzsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNVY-0000000Gtjk-2vtT;
	Sat, 14 Nov 2026 23:50:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNVW-0000000GtjJ-0GgM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 23:50:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AELGGix465278
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHt
	KeqN1hXc=; b=OAquq2I15Qtfs2s6bq3u7oU9WDcwHyUcjcTee+tBnhVkaZ2ADq7
	T+RLDOp75nORBbyaPSZoj+U9othw4bqKr8lMflze/57EDnXMML2T/6e5gIxgWeWq
	l+zFn1IbjPI4opea9RtsMAddnLsIDT4Bgi4Peu5yMr63FkGp56d28e7g8IzRAPNT
	ShUQAHXYy0y4IhVLthjMWSfeeEVGYqtGmJNb6SM4ktwsEqOxrg5Om6rE25kNp8Nn
	X//HtzNL/sNEnLi/uCNKsoEWhtTb/AjgvcGeQw9Tot6hsVCSYr++RO1McwAJCe2p
	bpPO6UlwzpVWUlEcocK0FKxKtRSIRocDssg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqj14f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:50:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so2982264eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 15:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794700204; x=1795305004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=;
        b=eF/qvGIkI5TWgOCbzbwUeHLgETCsoblsPSZ9XsiAtWyJZ3YDK8lcMiR5JGfpCbXwll
         5Mkry/q1SyyQPGUT9B1E0zdSp6Ca5uq5Dt233rTmIJYzThMLkewB3f3bxWwPVSpLmx0x
         SDQHufdbLZfuhZ3vvVqXA0gEWsrKgaO+/tr6/go13ymtfQa9glEeJDVCvZPPCXWhDVsf
         oKFwodeqcX34QI28vZAs+a+6nQ/mgxjPtQ6UrthhrHDShetjegs2rdOcXr8GfOPDKuC8
         iXIVwnxaihrCtI2DO1jxlBQKbSPTh6EdpKFseylIkNE2nsyjjVJBABV7FdrrTDms7mak
         7wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700204; x=1795305004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7geNsF7T4O0mTVMJaLXXou2YLhZ7jg1pGHtKeqN1hXc=;
        b=z/+ZDXWZD4vLkM3SYrBM7BqUsdPWtbrwyD2ggPzOVnMk0X8FoQyWWaMc1aG6aSHVtk
         tTXQBa20saWBMGZ5usykFT4m8xpzAhyNpWZQmEQggLTTWea/mf+R5jqulihp7PNbUiCs
         uzOp6XO5F+9jjiQqwQ5jUqldwGyhPF1H0HBfknZvNcNR/YNwHF1NlEcY7tdSYaEo3/QS
         BqNg03Xi6IKGfXtMGv4sSVp2JeKW58jT1AOSJSi9NQTPFaIgl9zw4QkMbW+o/tnzuLNF
         GJc46auShcBs+vUPqkzyaotb6/8FTV0eUx7XNaScO+YKUc2djTQlclAVkBtAL/MBLXqH
         Rp0g==
X-Gm-Message-State: APuU4Z9247OvxC87s0YjaaYgU5drd2z/m749OiVcROJeC3euzt9/r2Ds
	cnzU4Of0J1Jkg5n46OJJIsyReXT0USOR/jVsXZL9d097CQbakWNBpb015dePzGAKTYJJrGXBa3d
	/QiBEBGpVtwT3z9pRkZxwxp8Qm3lXA0QL/eVJWLeo4RiYLGCy8QAUAHFwqsFTeHooHwfzIcIEuD
	5kEq4CKKb7B+g7
X-Gm-Gg: AYBFou2vA/u/NcOcRcEyoKf3jeO/oZ3GutuH0pZFXd7Zfb0qW5SuyzzAdqWpuxNJ11m
	Z6iGg2ApSO3p1oxfXIGejHZSZ38sACZrGcWpREGXV3e7AapDcV20XHi0OEHuH1kQ2TuKyZk4ZwI
	txIc+pGX6A+uXdFMXg9UfdGtm+VnB6Im6a0xNomJwY8n2N+AypK+RRR8aWfawYYU6pdZwyVleRy
	JLdfOcMG6aJQIB6W+tKOoUkluVMJOBR9Vvjt56s8pFK3zjr9d2xqNP8fV4/R75b0XKpV5OdHASi
	VwV74abl814wnl88Lra2zeUC5z5rfbdxwv6XO5iU9J0/M0qdKhAJD8a5T00ExoPbrC4AGWbeybS
	uy8aeKafyIkahnvos05whAJmaVaF0NS12K/KITC9MJX3NAMDo0UDM4FxXvhHsm8zvRCe2YiUqVL
	Dt+I7ASyg1x+MDV0biyi1lMA==
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr2530339eec.36.1794700203824;
        Sat, 14 Nov 2026 15:50:03 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr2530315eec.36.1794700203064;
        Sat, 14 Nov 2026 15:50:03 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm39456313eec.20.2026.11.14.15.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:50:00 -0800 (PST)
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: "Linux ARM Kernel" <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Vladimir Murzin" <vladimir.murzin@arm.com>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
        "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
        "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Liaochang" <liaochang1@huawei.com>, "Marc Zyngier" <maz@kernel.org>,
        "Radu Rendec" <radu@rendec.net>,
        "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
        "Ashok Raj" <ashok.raj@oss.qualcomm.com>,
        "Sathvika Vasireddy" <sathvika.vasireddy@oss.qualcomm.com>
Subject: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and show NMI counts
Date: Sat, 14 Nov 2026 15:49:44 -0800
Message-ID: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af8f3ad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=kooc1xV3sY2Plk4Jpm8A:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX0rmadWTnBgVy
 3fYBpyIE+J6+Vi/Jj1FyXiFghNZwG1+WceakaYpKKsxzPWxFZ/9ykclpzfNO3SQYM0hklQ7VDJ4
 dp98ig288vngTojbEGgepQddcgeIpDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX0zgNNTaFnc/H
 SiDUUvNT8MAOpvfMq3hxeT8aKEF1wlvLzos4Q4F4isjCd7cR7s/A/mXj9WYl/aUQGrErFnb9Khf
 FpYFEBPBWjwaGyd0KAUszYSMdBVqpktWrQm/smO5Z7cHdYXjliHxTx8oKJwvia2QHDdAxsmIEbh
 OWDHg5/0KQdxUYebxqjIkjLGr+9xYhHuwcjI83ZW6o63JzzBUTCh7d+fPQ7LDHAyZcYA96JFiGM
 sMV6EZy+OJAZ3PqZFg0a1e9Xto8hDQJWw1pe8Tz2PTloHwPycAEvMMW2+khTkQsDuSrTTJNtXNh
 GdzCcZQRMydZFF4WFvy/QnHyNYB8Y+GUQqDeAkpb0XaPZHRJa+Gw+ovAT0BLxN2zzSRNPXUKVy3
 V193x/zTCzzbUJgTONZs6vRgexNcYDIK4VoPc/BBPIGEVE4RzsLveWd6iPccfWkna2YWuycdzAf
 GuUicrwAc5iBIP9Tf6w==
X-Proofpoint-GUID: xxNbiZYtb61hY28ak4TIKK4W-C0V4sJC
X-Proofpoint-ORIG-GUID: xxNbiZYtb61hY28ak4TIKK4W-C0V4sJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_155006_254658_B7AE7025 
X-CRM114-Status: GOOD (  13.08  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

request_nmi() currently models NMIs as per-CPU sources. This does not
represent a globally routed NMI source with an affinity-capable irqchip,
which needs to be rerouted when its target CPU is offlined.

This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
for such a source. It remains excluded from normal IRQ balancing, but the
generic startup and CPU-hotplug paths may select an online target. The
second patch fixes the related /proc/interrupts display: NMI-safe flow
handling updates the per-CPU counters rather than irq_desc::tot_count.

Patch 1: Add the migratable-NMI registration mode, validate that it is
used only through request_nmi() with an affinity-capable non-per-CPU
irqchip, and add IRQ KUnit coverage for registration and CPU-offline
migration.

Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
kstat_irqs_desc().

Testing:
  - ARM64 changed-object builds with WERROR=1
  - ARM64 !SMP changed-object build
  - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
    validation and CPU-offline migration
  - local downstream GHES delivery and migration validation for the intended
    consumer topology (not part of this series)

Base and dependencies:

This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
[1]. It depends on that series' GIC NMI support and is therefore not directly
applicable to mainline or linux-next as posted. This RFC is for design
feedback; it will need rebasing onto the upstream form of those prerequisites
before submission.

[1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/

A separate GHES Type-4 series is the intended first consumer and is not
included here.

Feedback is particularly welcome on the IRQF_NMI_MIGRATABLE API and its
placement in the generic IRQ API, as well as the NMI accounting presentation
in /proc/interrupts.

Ashok Raj (2):
  genirq: Add migratable NMI registration mode
  genirq/proc: Show NMI interrupt counts in /proc/interrupts

 include/linux/interrupt.h |   2 +
 kernel/irq/irq_test.c     | 141 +++++++++++++++++++++++++++++++++++++-
 kernel/irq/manage.c       |  33 +++++++--
 kernel/irq/proc.c         |   7 +-
 4 files changed, 172 insertions(+), 11 deletions(-)


--
2.43.0


