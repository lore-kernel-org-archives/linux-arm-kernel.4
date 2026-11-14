Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83389606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tRYpvQQ4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALMKIsIq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aBla3IJ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=; b=tRYpvQQ4zVnz5t
	n7G+ElcgfdZaOmIRaTq9pq5h4pPFCLqKMD4itrqmJoRJn7U+pBujBW6cCXHwF+/1jWobWmuOYAb5+
	vp4sDNQ4MCA+zAcaMjaiF3/nubcxlMxf0EaP8YzAjkNoV/j0UkOF+BFSKKsRrAqChp5IpVVkgknbt
	xt+Vb2iBmEKTUxryM3F0Ec1ErETJi7I1axYyPLs99Oi+sbTn2lmkhX++es54pDAeTcB93Fn5S+H6U
	GEg+rs17etR4AeoFn7Sik3DAYRHgqUaZmHToEVUdtonQnTTh23u58bjqgKt7jqeqywTaeofcAoyHf
	uEjiaFbO04HlCapKeIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNVm-0000000Gtnb-0JUO;
	Sat, 14 Nov 2026 23:50:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNVf-0000000Gtm1-3RJ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 23:50:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AELG6PS570781
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SHz7obOecCm
	s5SYEVnrbzhdor6lxm5HlXrthgoBerCE=; b=ALMKIsIqCdJo0yIZO9Br3MlT8LE
	solRjI/+vbvXjtY7mGMDdfrVG86VTTfsHVBJpa8g4vbZj5UOzkFmg50VbNYDbfGM
	0GwsFjRDtPVOxLKCMjH+XkS/yClPC/B5b2uxaPofECLxrjsybjE5fbGOwfE41w2D
	mqewlec+MtzV9QutsK8HwpHFk0TG4+2JBBMFbIANj2lBT10GTGJLDVBqbh4dh8TL
	WHXQXvdrDS6+KzPX2E96TSte6PeWIocc/p+737k55lYvC+oInYTD8G961+sZRgkS
	gN0Y3CKTXz8m9kz+vVbIyjjBlYscM9JX2aMGfR+YbV0o28FHSueNecu8iOg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx209v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:50:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2776687eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794700213; x=1795305013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=;
        b=aBla3IJ9SvFVXgZUX7U7EbGKcKZzRFHi/NXMf9sGY9/86EbcaltZ1yKIaBnKVMV46+
         pU9J3GSqgWqO9C/b25vDUsxsaMN8D2uBjhWfWcqcw+48Z2y2C7MuWP+FBjmogD5bjo2S
         W0dvApDOKSceEx5GYMW1WZoI8gpyj6gBH0IjgRA+ZMwGgAbjxG98ebl6A2MGxziEA6Vi
         RBmQX4erO4nk5nb4vR5O1NesyY1POZyHTdqzrhYz6T8V5q6RUmmrw/OcMx+N3KYVk4HO
         Xt51JFZHjKqjtU9OoxR9YgH1HMPXV5NjuNd5Xo7c4ptdj4shFGpYAQgYCVOXOOCKLUTx
         2MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700213; x=1795305013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=;
        b=b//nX9Nxp1+yzqbZslL34CJkljdGVFrOKpBScAIxjfstWAnXyuIVM/tMrcT+slO3sv
         HSnLbz0vWs+Q+1heEv6V4eWxDYiTsJLrwJH24jqvYWW48G3Q4ITtxdwaPbc7rLvpR2sm
         kS8AL1+8UB9WRFAwLmpjK4SGBAk2BQgTJrqsUAh9Hh9dB+QlSOGJwd7clsnahoB0Yhrm
         +psqwtouAlX9A6PqaHt1kaNT4tyfYNnvWaTiYVjv3+3VfT6zih74pStfqx9X8b2Y591X
         FC55r+hLkB7ql7s5Qg/Y5jX/rNV2Ew4SjnPI8s2+mFyWqEWNhKC6STuu9hNyxGb3QiLk
         TYiQ==
X-Gm-Message-State: APuU4Z9I/5Gj9QNlv7DzivsL8Q6TyHWTL2iPTFeS2+oWcV/xXHCxVdl4
	H1o4Mb968y7rdvh4Z+Esco78NQLFveuZaKWoXHPna8oMQu+yf0br5d/qBcp1S2DH7kXtOU3vCH3
	I3YZM1i7/awRcFMvWRj6OGn34rPsiSSMYLb6jCi+UE1yPFE56E96IpyHhd2ekJ0Vk5Q8D+gQkWf
	PVQtn6u8EzUA==
X-Gm-Gg: AYBFou0ULCNHpwWXsHtUwJUSaudYCeAMGz+fw2JsHrwe6pgJqNYiqSy2/KEmUT/PdQ/
	VhyAkTld3xM5f6WD8r9IzRJkbicd5/m1YGEm0KNa3L6K3Z3mPknTQv0bOFcVPBZq0tmPflxuaqn
	HZ2/PHPO5axBBfvEgfdOIu2QjEH/PUpZ+H06NSms0mf52DuC/GZZDc/ynIdsgavz5CnZvlX0rQc
	sFhf7lQQXpBLTVPDyWRS9k3NFkXEeY2ZYL8jsRkZUT05SUBEBuQ2dlpDK7/atckGl2QDrSP4F9k
	FEFlVM3Bg2FraDktiiSFZhNWv1+8r43NbEKsWpjR2g3HfRWk6cZYzDb2SrCyui7PGQWdZGtIUS8
	gUo43U4d8coQ8DMu/aPZbyVO43m35QEsrGV0KgKaUl8rC0RJ3Dxd69PKd/OdKSmYfKc9lg0ovfI
	DiJf/J8IdxeWROwx4Aez4b8w==
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr9239199eec.33.1794700212933;
        Sat, 14 Nov 2026 15:50:12 -0800 (PST)
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr9239171eec.33.1794700212458;
        Sat, 14 Nov 2026 15:50:12 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm39456313eec.20.2026.11.14.15.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:50:09 -0800 (PST)
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
Subject: [RFC PATCH v1 2/2] genirq/proc: Show NMI interrupt counts in /proc/interrupts
Date: Sat, 14 Nov 2026 15:49:46 -0800
Message-ID: <20261114234946.818072-3-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX6hPxf6oysf9U
 Vu0yrM8tP+9i2APYtZG++noV6IH0I6HSy8FZilcHIriC3FOCi6YfeGJ66LlDzjWsQM+ORqziOAt
 uHA6EI52YXu3auwEKZ+8qpGIpgICBJtCTp/zAxpXUSSUndUFBoy8G0bfDj+W/LWUgZ0pqV2hOsD
 hsjXaganJ87ApEaowGmgLJRepnSEj6v+nFpEsdKN84yEY+8edvsP53qS3bV/zsAbUjSSb+9C+PX
 DihBurlvCqXF7m2BORYoHjgPR+eNPDJmaHI9Z3GMi4aAwgySAX5q9bAnUaMKmpFOUKOmgVmg+OO
 AYd3M7wILl2lEuKKrGUtWZ6v9AMC8TY3H2zMey7Mz0zj3fin3g9y6KsHMO02waY4CIQg8+NHsC/
 +wpiIcXCydhUdnAatzvlzprRggWZh3mfyhJZf11xOEIgmcMSytuAO0OendG5WN5WongeVXIoyS9
 Vn3NGSV2g/Psww0mEvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX/uP/z1ikAoX8
 ULnCJhNoqfbMpaU80dvDyEjo8vEV6bUG4pGrbV/l7BG9pR1diycwj/GLiOv0kdYAPXoJNsocZQp
 dioErMraSoeDmSK7f1BoodngSQT6DIg=
X-Proofpoint-ORIG-GUID: JlmniEvul5y45zqi5bSO2_vWzPb6fN2w
X-Proofpoint-GUID: JlmniEvul5y45zqi5bSO2_vWzPb6fN2w
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8f3b5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wU795yvDvLEqae5DVKgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_155015_986932_B161F495 
X-CRM114-Status: GOOD (  13.00  )
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

NMI flow handlers update only the per-CPU counters because
irq_desc::tot_count is not safe to update in NMI context. As a result,
/proc/interrupts shows zero counts for a non-per-CPU NMI.

Display the per-CPU counters for NMI descriptors, matching
kstat_irqs_desc().

Signed-off-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
---
 kernel/irq/proc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 0c0df16de581..490b2df9c105 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -559,11 +559,12 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	seq_putc(p, ':');
 
 	/*
-	 * Always output per CPU interrupts. Output device interrupts only when
-	 * desc::tot_count is not zero.
+	 * Always output per CPU interrupts and NMIs, which only account in
+	 * per-CPU counters. Output device interrupts only when desc::tot_count
+	 * is not zero.
 	 */
 	if (irq_settings_is_per_cpu(desc) || irq_settings_is_per_cpu_devid(desc) ||
-	    data_race(desc->tot_count))
+	    irq_is_nmi(desc) || data_race(desc->tot_count))
 		irq_proc_emit_counts(p, &desc->kstat_irqs->cnt);
 	else
 		irq_proc_emit_zero_counts(p, num_online_cpus());
-- 
2.43.0


