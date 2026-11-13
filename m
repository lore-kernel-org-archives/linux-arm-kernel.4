Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE3606DFB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCDd4fYE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DKyXru8b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XVh/12MesWt6uYv1UM1jLyY9sbr06T+NQ2Z6qheZiy4=; b=OCDd4fYETfhP16
	G1DzHPAfm/dFAtw9BWeOimIztGqmlso2EFGFa+RcS0Q2z+RdtPjMvPnc5OAC37svMfboYPWY+LLhP
	OMJPVrRz8hMA5DBDXuOdJ3ZH72Me3rIkqreHa7SikZxPpoHLD33g6YEaP8NlJkTPhNNfGSmEOzw1D
	sBlgp1lbzM1DowcJhIyODmhjh1zfomuWfY044MbPgl4zWGb4Az6wJ0NzTwrWW8kvtTqfkt8vEkf4q
	/52hwpSGnr7OxC8fDLK1Vc0kJ01LEkN2FltXle8rPaU+EYB/JdpIC7UR47GGsirPAzjBXdnc2TUGH
	pSZEg8woy8QFlC6gcYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRowP-0000000CQWV-11II;
	Fri, 13 Nov 2026 10:55:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRowM-0000000CQUq-1Co4;
	Fri, 13 Nov 2026 10:55:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V6un3652797;
	Fri, 13 Nov 2026 10:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVh/12MesWt6uYv1UM1jLyY9sbr06T+NQ2Z6qheZiy4=; b=DKyXru8bHgL1UcZ3
	fdHyMlcESE+PfuMiv5CCvB7UXy4T2pRyyH2vmGb6PNIhaNgViTHNEn2tcTbdZq9Z
	By/UdxEfYeT1H1q81HiZ0mSYIK7+9F3zVTP2QxgSbhOMucSP21esIt1xtOQp9wyG
	II+hz84T50Bdzchs5RQqkoJqtHYTA3LCxmtJLyVZVSkhWo6t2lZFWErVGt6jaeie
	8f2d25dmSDAu30tn5SWsVHXJHJDbHw6fJyD7JEDxiOOoc9v0/1H2vczyOHjmEMkl
	CkXZzwRXcgijsZFyOYhrzeUMyKwF6U3sN+oUjORDHAUfx32OLcX2uuFVgNbk+tGN
	w6HKdA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwan1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNtj2811646;
	Fri, 13 Nov 2026 10:55:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6ADAtMls2811620
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:22 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id CD3AEA72; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:25:16 +0530
Subject: [PATCH 4/7] arm64: defconfig: Enable PCA9685 PWM controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-draco-evk-display-v1-4-28a19c6aea87@oss.qualcomm.com>
References: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
In-Reply-To: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=702;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=y4TzdCQXmsrg2ntNhaSUZjRck1sxSasPzANCdkoJOMM=;
 b=tLy0kFOynTArbR5fnF2duixWZJW5VUizXh9IgiKXyKYt22pr7M5oUWfoVxy74FPa/yIQDpF40
 4Nxmg4TnLKwBEJJ1tYeRUVnMwFIz6qG7FZLS7W1PTvn/Ir2B1osvhNh
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ec9e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qI7vs_IE5eraBV8M_hMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CI2KXP1pUgaxGB-OCxSoYycqXcvYziF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfXxGEzUVz1qyL9
 4sgPXTwMfsZ6ZGBcSKFpRSc/uZcBZCOeZ8IxWi1gJEPFfalkrhOTsIapTPwFRqm4Szjj+yeSAs/
 wMjWcwjBKbhUsBtMhyqOtRHzLrD7TjP9sFThDK2ddwP9L8OLWzyUjFDoCBvMvHkf0hPSECdpWA5
 5+FjJEzVHX9AFbovAZVu1uLmKiQJ5ZQquZhz32Jl5n0/dnT3ybP36FZ1FvTjG542MK8AEEOzIdE
 VtTNj+uj7WQHkpg+XqIPGYBYqSb++4WfZHgowGRMMHkE2/CRt8Zfmnhq7PQ/lcr3NC53wQ/4haT
 zT0rwTL0YBgWZ2ae1lRo37F9mssX/muHo/4b4YJOSCyTAlTBJq4z69rHMeEklJn0/5/C0Hk4/pj
 a9kguHSrEknt1pv2L/b/bvwoLfCJX/XagEzr6YyFWy2CVsk1sabiwtEIMxKmbi17Sd+E/yjQWXa
 /e07rVt/TXE4jMnrQ2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfX8Ek7nxSAO1Hi
 vyKSLfSkavVdSgzK4QJAjWpAlpX2aR6N5yYi00pnFm61piBiYuC+t8eP08T52Saz9p0KYRnXzwD
 i/0eZGgBPTeEkX74Tj6ePbDJzVEztpw=
X-Proofpoint-GUID: CI2KXP1pUgaxGB-OCxSoYycqXcvYziF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025530_447781_069DDFDA 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.7 (--)
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

Enable CONFIG_PWM_PCA9685 as a module to support the NXP PCA9685
16-channel PWM controller used for backlight control in the
lemans-draco-evk LVDS panel overlay.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfc52e32802e..7e381899f3c6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -614,6 +614,7 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
+CONFIG_PWM_PCA9685=m
 CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m

-- 
2.34.1


