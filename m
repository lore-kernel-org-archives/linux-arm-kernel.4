Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXsFOp2D;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMXbgI12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=; b=mXsFOp2Ddgk0Qo
	s+hlUxqFfXkpsMWr3TOV+G5H0p/TE52AUtSLsCa1Ec3+01pYmtObLUbc/F/6LHDYhx7jCdWix1x33
	YmRGu8jIV4KY0AWPqzG4a91McGD1HiVKvllGssKkpIz/EGWaVH7Xa/ZTeG45jaO7GofORff7AcRV8
	cHE9lBz8zbbyeE2FnS3KEz/iQwwPBlf7kDBJPPSjpmQupFq6cSIUDrCibfCiLOYDA1lD07q8ZcwLp
	0uBFUH9alYQRxcv8fE7RwMbHvaEklFS094IuV88xjfdQrSRh15+SG9h7SGo0ihN+zIzAB8tBmDinA
	zSxFzZk5SfBmRMDMRaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1R-00000005EzC-0oQR;
	Tue, 24 Nov 2026 00:04:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1G-00000005EvB-2hOo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:04:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLH8T03503150
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mg80NlqNhIn
	EEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=; b=Isdm3+S6dwSMvWxl6cJiPxQDHYc
	TTBkduGearKIXJFdEyftR2lH0dlFfflobdBqpo6hDwArreDSnh/ZxyTGnIF86bZK
	Q9kMCK/nJ5oH00mm4+4KNjoNnRnn0KNQnekv3uxaxrPDKFSh8SOGl/uUrqQga4wL
	sjy7FvR4lMLkh92tF8ac4Dwv/Qn9DsFoGToNny1oFYm7UHCSGGdND1q7hd5R+5ci
	IhEBWUYXy0qvXqvu3IiqxmktPr9PHnLs5qqHpdO7S/qkecQcvVNeiUa7cU9lAUGB
	p2a2+UDFXTJ/pH5fHscaWQcdkaB3RunPiFJWevgRLwm+gDc2CQgDOOm0Tpw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ns0sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so2413984eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478661; x=1796083461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=WMXbgI126XypfnsPFvALNr+XNGNChocJ9mFwnAm3OH6yJ/H623u6P28u8GPZxWnDv0
         tRYV1huvje+g1ZBpYf43vJipaEn5wrfth+o6PHtm1fkz8NCxXMaY/QQzCPlxSj5b/FGP
         LebsOWkfNRX8CxFVF89IPuNRGV1ykBA04BLb+W/4dZvBaj49vueeUyGQCWZYNyxVPOSR
         6nBo4A73csYrcw1NSt9tAhyE7KYZzmpyf8RsO1agMp0BjtYzJs7+b9ySjDdid7LZmJT/
         0YuP2yo1ceyWg0sNwcy/+GYWI9IHll8qp34zNxCUB35YvvA7O0vbpgp9Bg9VeGbU+d/W
         m2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478661; x=1796083461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=f4+zdwyrVtZgnzkoYn23eKUj1TzNtDqU9lArmv2EC7ghA2MvrlmHBxGNPDvCZOYQSR
         FoYNVGb2BuVmLgzpFA39JjM1eukVxjf7v4YoO4kfbIsnwYfbG+6WfrHp2U3Ok/6cTb30
         b1a3R+3KhWt2C9e5P0vNaj1N2LxDT9u/bB6f4ZdHFuKTpgT+LGXiqnzaYw48UtxQcv0G
         mqLmjBTEke+JL7a5cGzVLlujPuOqDdBayEY+7hCd2oKqF/PO88mcNo6PcPsZx4LdHDwO
         n59P8sQa09uezh8YocTmLBZez5h2A7LIe27MXFDJMezNSSH2x1BPSyfkRq5++97y9uRJ
         HHcQ==
X-Forwarded-Encrypted: i=1; AL+hErG4V3FZAqdnrLP5FW+Otjawz9pElhgLpckHqRvHsHfhbGz9fzlL6Fe6P9nDBdjHw4TPD7mcTxbEWqdtYxOmbx1P@lists.infradead.org
X-Gm-Message-State: APuU4Z/F/EpciupInXedm+lqE/6G/qOYbYWrhX5zGjw0U5KM2qV+NVos
	YykEwPkO1ufbdupximOPVj40H2jk1prkSP7ubqG6icfQXdP8JEDjLphNubE72RcAfKBV4YrEjjC
	y7DEmRvDOoEDuWZJjlTRgRH6X601FRsE6pkzeSi0h6SjFl1mLM01J+Yi//Yz38vdmEmd2D+hwKC
	4j6w==
X-Gm-Gg: AZFdTZdUWDOG/nJKJ3CqH1LstNdnuJzme4dJ5oNM6mS3baQ8cGLVfqzzPbJ6E4WkGv9
	tinHuvCMv0/oJp5FRL4GG23f6D/efJiC4Cp46GnYZjX62p/cNLne+Bi1fKJs3CjsRAuWsmH+Ze3
	XXYtUzSS3EzNebHgLLGRTmxi0V4ivGi06z6QoYbwTiJNbM9CAh6naOZBSfUPqSwYJMByBfwJZ4j
	x/Qt6n40cKCaNd1p5jv0F7FxXTtmZjTr9Y4oIqMV8b417airi2Rb7segVrn6JbDlwtHiOQtmHPl
	9eLFTStPMCAmUpT87joVuFD/6Sq0S0eBq73LZxVFu6i+0Ti4Lx1JjbChI7D0hU8xEhxSpxcnxJj
	zHWwDP7173RzbB4xJNVDyIM9rHCRCQLEBjODL21EYMP+Z4jWcBLhFL0Bno131SjctXAXIDllPFT
	99nb9R92XXczm48F7L8f+syGNHQHXjZ67hY08=
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650566eec.15.1795478660223;
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650534eec.15.1795478659631;
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
Date: Mon, 23 Nov 2026 16:04:14 -0800
Message-Id: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX3HZSUHCe1jFC
 CN6Kf+HHSgIBVaoyJ44qBy8AL166tYoEAxKU12pt3xLlawYySA6HmMVDRFl4jGFGwNKQHnYKvg+
 UHRLYUQ00VCvMhIQKjJ8M8TkwwGajP0Dim6/oBviPujsXVR0uweWmDgJNLf74STMvADjJCrHjKK
 /jXTyP5uxv2/AmxLC6qBQWwKybiyaIaprtEbDK08y3Yt8RJj9RQVFPzIvGAahQ5yukSOrwzMftj
 j0TqUTrGYhr8MPaNW2smbp5TkvH9xtzM1BzTmafp37zcaHtMxK0Pu+IB7JzoiH3pnjn7crteXVD
 T8neSTv/qRYJqckwC8adH7KYIx6WkU+IOTlGuj3LRojQhTIyNMyF/y+NtpqcXeVChhpZnXbTS/g
 uJFsByBGEJApV4Q8RIHqRjLMqOtHOB55FqdbUFdJeF1p268Jmn/ALQPDOmJr1FSjmIl4CHwqM5S
 JamFDVZ5tEKn/7MnmIQ==
X-Proofpoint-GUID: LO5qOPj-eNuwn3y2Ig-3xDt1RP4T4a_h
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04d485 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=Hi6WPrPG3QlE4bLLXg4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LO5qOPj-eNuwn3y2Ig-3xDt1RP4T4a_h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX7jolcbcXdo+N
 Vt6WT6CZVH1nQjQJS29sjs90pHkCyFh8HKlJM0Z37J9iJNVrgy7c0RiObMZyUTsR9PqPI9Z5rfp
 hsNgVL0oTwcXbyX1tS3qZGxSNcU0RzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160422_803069_C795CCF9 
X-CRM114-Status: GOOD (  17.15  )
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

From: Jakub Raczynski <j.raczynski@samsung.com>

New datasheets for XGMAC (3.20a and 3.40a, depending on product)
support up to 16 MTL/DMA queues. Before we increase max amount
through macro, prepare dwxgmac functions to handle that.

The only caller, stmmac_rx_queue_dma_chan_map(), walks the queues
below rx_queues_to_use, which the devicetree parser limits to
MTL_MAX_RX_QUEUES. A queue above 15 is therefore a driver bug, not
bad input. v2 reported it with netdev_err() through hw->priv_data,
but that back-pointer was only added by v2 1/3, which this series
replaces, and a log line from a void callback does not stop the
caller from carrying on. Use WARN_ON() instead: it needs no
net_device and its backtrace points at the caller.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 21 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 77a54792893b..5b83fe07c1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -257,6 +257,8 @@
 #define XGMAC_MTL_INT_STATUS		0x00001020
 #define XGMAC_MTL_RXQ_DMA_MAP0		0x00001030
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
+#define XGMAC_MTL_RXQ_DMA_MAP2		0x00001038
+#define XGMAC_MTL_RXQ_DMA_MAP3		0x0000103c
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
 #define XGMAC_QDDMACH			BIT(7)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index e50c0f4c482d..8aa69647a207 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -259,9 +259,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value, reg;
 
-	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
-	if (queue >= 4)
+	switch (queue) {
+	case 0 ... 3:
+		reg = XGMAC_MTL_RXQ_DMA_MAP0;
+		break;
+	case 4 ... 7:
+		reg = XGMAC_MTL_RXQ_DMA_MAP1;
 		queue -= 4;
+		break;
+	case 8 ... 11:
+		reg = XGMAC_MTL_RXQ_DMA_MAP2;
+		queue -= 8;
+		break;
+	case 12 ... 15:
+		reg = XGMAC_MTL_RXQ_DMA_MAP3;
+		queue -= 12;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
 
 	value = readl(ioaddr + reg);
 	value &= ~XGMAC_QxMDMACH(queue);
-- 
2.34.1


