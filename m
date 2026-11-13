Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942860A383B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3FsFZCn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QLgt6um/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=; b=C3FsFZCnC+zOyj
	hGpeoANFhsnVDmr1tRV9FmSk4e6s9bvpggXi55f2Qkkklq3+0XV6+lALj5czlhgQjMbSagIySQNol
	cLV2tTQptrK4sidzgxJbshEq+R0f08YqPg3QbM46dyWVH/KWXq+eTLZ6GtzonLKHeS+gCw6NcRl3h
	cTG7QJPjzhQcuXCmD9W2PBdwDsReBrE5IT3SPkkqGqgOTbKB2uf/UHNdq+bTdcjvaLHDmpjPe9uK0
	fkAdY/HliPLBoqmfZ7aZehjP4NB+vd/D4OW4jh1ZF05pSY2laXuIZhzuMhyS4dvvKxNuXRSEOA66G
	VIQPSNP/R/4MYgdIL7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOX-0000000BWbH-1ay3;
	Fri, 13 Nov 2026 02:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOU-0000000BWaS-3l1X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:52:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K0nL3273472
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x5yFA/n9nxv
	Gq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=; b=Vpp+Hz02BVWXrRiiEbQnuboyziD
	ZbkneievJBqeDJgMqu5EI4OFJ4zP14AMNOP5wxl6qW2GmCNbEuav8Q76TywHunH5
	D+latF0oPT5M+S89PNtLQlPgDSAI5U6Kiz453JIVCSaHc/RQrVY9pFQfxW3Zhv+3
	5DhiOquiTN0HU6Y6JMksegrh+LnKtpXL0+b1Vci8AJZaSWdUsXDM4Z1UMhnerl4a
	6rJRLevnZrSg9UhOTzzCk+jBamvb/7EdsSVTVO2fQ0me4hFqIeJtBLd6htksPNGj
	+7QQ7yakt4mt5wEjCE2myu4DWlAxtA6spbOnnG/UPEyEto9PJy3LLGGHcug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgda0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso3343045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538322; x=1795143122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=QLgt6um/yCbu3jIstf0+5K15urtyvLbQjHv/Sqwl57wd/kOvSUyAdpPZikHR2a+GyS
         jI83U4j+v3YD9c/gLDIHajhPP2xEAbNzGdhh7tzcHB2EiW2Q8o2EET1BPLGUoV4A48fs
         AQuRti87vqrSw9QtvoMX6bMZAIVQ7RhmIkSB1IvnnXns2tSshibOox7LqgQwkn0klF6J
         qXgpoS78cIZQH3QrkAaJN77MYr4eJZRWfXhqQwqwxa+nbXPugpFQaY0BEZW16RYNoUvv
         bazYyRnHVveR7gNbZ0fPxip1JTUk6OUoU3IE71SXWHNR8ZJxVwbSBVtXhMb+G7qe+ACJ
         lbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538322; x=1795143122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=vd4Fd+Nuec26xKQZ/ixFY+N4tbLzSpoiOO1BAusJhxM2KvsnvN6fiezzXuQKFd6DvP
         d6M72ubROY34bG5IaPd+/ndbLx8DGuvYzqKGcqVRAQ2AE8pH7jIZeK5BjpcT9komvfyY
         U8+VMsCgN9FwMx0kYSze3NRHtUrA/OM2JUdHwK16AqFwwbbCuXvkgE/ZLWs7oii++D3x
         J9Lqwaa/Fg2eexAasC0mipIAy7CnMTOGLFxEnM6FfucndNokJx9FOZO79/K+9BPnISE5
         eIwyP0aozaPmeUnqT3a4BydIy117eVqmbPBx07/Vd0ncolSF7bZ+T2ANKzbHOP4nppj+
         9ndw==
X-Forwarded-Encrypted: i=1; AL+hErHv4rdw/talOBkfbXUDHUc2Paz2Cw2Lm7Vnonrg9Nenl/IXdX8YeFoXEETOJyXj1Zn4UlvjE5kOXjtOUD0lYGOp@lists.infradead.org
X-Gm-Message-State: APuU4Z+KhAcazKc53+6/ROQe7wn39MTFH6X7Ms2O4G/X/DgmOi3vSuKA
	6YIi3mYRNLprgkNrcFyFCC9CsoxQ5dQKSBRT36C/hqsfn4cSC5bn3lVil5JmmSYWGom4dNvtFK1
	u/iZuj0qGFKx48rAm6/scTMiK4tOTqtX2jq+pVSDy+dUQBYv6f1Qlu5snYWEMmgpj1fLT85NoKy
	Ox4A==
X-Gm-Gg: AYBFou0MnpQb36MY3oWc7rwmmPy0YuqSaheFEdVXNRcP+F7j6PB+BGdLf0+NGOpvZPL
	FvLu6L+Wd2s9L4FOAyvfZd9+1dA6WKJsHf8agVi9ggEjCZ04utUYm6ytGo2tsJ9fj2VY7Ha33pB
	uEWHEvexrTmfLrMFNx2fuhlZDPodW5d2NeD75GZEYZxaMX+CJebq9uIni+T03Oqx9AhzFQ+4DZT
	Q0SW3KMIHTvYWmyTI1NieyOQ0ePnIPF5W54D2IHXDDwc1fUEeKj/qvWPb2CqK7mYPtTVJe2B7uB
	zo9em9QExdDBxulqnQeGWNyXm20blqvpwtUDnpMKqZzUzAe/1kkPxXdvV0/Fdf4Z1/RKhWcQmfy
	IRG1Isbt3PKDCh9ots1NTVOA3L2PfG1qE3feXeaBFvlsNND/FWn3tZBIuadY1baQY5mLYrgCCcx
	GtleO+GZE=
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325645ad.17.1794538321704;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325425ad.17.1794538321253;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:33 +0800
Message-Id: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k_-T67daj3n7ckL42MdvjqJxIVHq3p5I
X-Proofpoint-ORIG-GUID: k_-T67daj3n7ckL42MdvjqJxIVHq3p5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4KBiGxZXtgKE
 TpLLiJHrlmpOgM5+U+NdJNe3asW1ErWUFJXrT+BW+j8eRSCHjAX8KEZ2Bdz/8o/LO2pK5XIOduP
 v10HcHam3FhhOh77tg1N+t5AJXVUo39UgjhGG3ooWG3/BK8GV+/tMCPBt+jV69mRgkkgsBWqVDX
 zCpY7uAxTThlTIPxF7PeKQVw48TPaMcfgh3MVhcYUn2uqu710Ta2DjPMvj7ECN8vKfCeLWNFycF
 FMilR7+C6ulGNJM3EW9iGCBQFwrVkRRCNPia6iPEGlpmZ/SoEyoVeHR0iIcHSFxpbErH9MaVrfT
 Im1lVMGk7o/8mf9MHTxKjlshW2N+AYNiig2L2GounDsqdd6vNwxXK68nYEAjerD7tBeGy6oNHZ4
 Kp9zFscrIuqLKDRgNbKMhKL6yIwvNY+IG+7UK1kOE9vSRh5Cb/UliuF0etm1sehKT2ljHr9ApHT
 GAHNC6Fa6pVrvwx0FJw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af67b52 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wQ8sKV_PtrUBvD2kYdcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4k96kfQoimJB
 LB1YS4Ps27WrbYPofEwmTb2BZxQG43XFdaGwWZUObXI9GqyaW7UVyJYKElA1DahbwnU57LYQ8On
 VTrV63pYvMh8sx51ZpoEMZXBKG1Ppp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185202_940166_907EE091 
X-CRM114-Status: GOOD (  13.19  )
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

CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
(0xfc0) within the generic CoreSight management register block,
immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
drivers/hwtracing/coresight/ that follow the same register convention
(e.g. the Qualcomm TGU, which uses it to detect its timer/counter
capabilities) need to read it too.

Add it to the public include/linux/coresight.h so it can be shared
outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
CORESIGHT_DEVID already moved there.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 include/linux/coresight.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5286b3606581..7ce0366c7c70 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -37,6 +37,7 @@
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1


