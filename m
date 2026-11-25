Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WMARALZG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kmhz3EQ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=; b=WMARALZGpsKOSWeZc/8D2EH/s7
	AxbthQ1N8fP4tVhP1JmSKb2KxzEqMsBavfK4lmksKJmFgh/I0MNoS5OD0AcgAEsXcUXG8AxBxvc0e
	IFjfW2z6qyT8bbhkYJQoDfPfU9tcSpnRBL6y6WohVMe4q/c5wxg0Zgj7zOGp4Ix/cW5uekDModfEX
	mvJSX7M6V6zGdaJFXM4dFUt6C1dfAa9LDKe6GVk4hwwn5Qmrbb2A0cK1rfjXGWlOLLPLZseo8zdQT
	MmEq0NoSpT/RU1wynNWgZfLb8kqPjd1+iP+LOUMbRCINr9LiyVWH2WtDyI2mb0g3mrP/vH4/yZ/+Z
	9mE996kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIcl-0000000B8NO-0m9s;
	Wed, 25 Nov 2026 19:25:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIca-0000000B8JE-3cHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:25:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB41n3594013
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPR
	rRtBfFBA=; b=Leh8WXRt5l7hIe7RtKjlc5O4uK+nTw3iOGPprVdaxO9Wigx3D/j
	yseENXSby6OKQIaWjOibcQI4z6ZjpdRZ7tFGzg33to60FU6kTUT8z3afSAgYeWjI
	5FhrOLjTDxITtVOUIsKra7Msfm52YhkkD6Xt/nvqJg1mtroD4J3sNMWJ2jUmbXDJ
	mHsuaEIdJpr5aXCQCWV8Y2rv/qNGTAHeAokCP189kMSKNkmPlY3yWQaMVPzzcqOV
	SDqPwLCepzTVBQujZPAe8worS+Q6CW7b2d5FR3WJceX+47miYTFXBzwYvCuCKdiv
	ePFT52KlwU9/XN39stnSQVwMP2YfpgzR02Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6c5f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:25:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso7285675b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634734; x=1796239534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=Kmhz3EQ0BseXUQZWWz/zRjftSsl6ot55nhKdySA2hXqVy4zVbPoT7UbXBP43viNrC3
         aYkDbxuVFmEyS6bnmrNR1r9+I0YupkWcG/Y4ChH56duZuIhAofkZ4XTkMP6U0tfaHeAx
         PAJo1qq2PVVtn083VwBC1cYLrP2UGYo93bGY3UuofFvcEKs4kazzDMvLA3zcCv30P3dg
         6fl1M5u8O8+v/jM/rRZG8y5qCEHQ2o+H3J5YM2i+W4XPn8C+10dfbYiQ1y4gMZ5ldr17
         aNbHYr+Pi06P1P0e7F6tJWgZt4c1SPBoWM1rbf1hRr3XSUizz1XUreivICuD/dU9UXR+
         zpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634734; x=1796239534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=iiFI7R6/yme9+IJ9cBfhIlBahhf4sHGunT53/GwatRUBQP/sYC0GpVby2vVst6qlC7
         BcAh7LKPh3JpDp7wQozmJxFla+q8DSXedV2FdNSisluVTwKMUFRmDIQWdOGNPkNFkADH
         VblCcMo8qAjrfvUEQzmw+T9BECPNq2/Xe6EVv7/jDP3ROl+51M3zEDxE/CAiL11pkEuL
         6TEIDkolDSv61uzAI5sNUCW4F1coAkFvjZNi5qQy4mLrw0GEL4Xfi8alQfdRzBleBIAz
         FKPnoM0MrQZhslNkho5Zzq6r99CRiQ/BYD3QgD9WZ9elwOfyzaQmmxk3jpvn4TQ2Zicm
         a36A==
X-Forwarded-Encrypted: i=1; AL+hErH16ikjp0jasW+m9Hrxf6SSM3Dt8czIujpfxD9ynDIAeDNeKSAVqMnI1Sr6ALp5FWekZzUBJD/NHg5Coa7/WQ3Q@lists.infradead.org
X-Gm-Message-State: APuU4Z/clyG3HUvYt3fxEixcUUSMRo4AsHHcgkFxzNz9IaiDxzHx803c
	EvcMiivt5quS6wB7qd2WQQs2rqVXyHiJsqLfj6uMkNeWqfczMViY9UU9LAWh4naqmqUVEXbsDuC
	/aUp+gs7fXXDUm/N9IvqdmIO60BUZzdjZHvs0UEZGnvFAclmCHtPQl+FHzP5Zy0KDJKZ4w2iMc7
	b8Xw==
X-Gm-Gg: AZFdTZdVJbKqzCPTesAKwVMCUqCe3/cbPiCa5OCHxiAyHtsERetqtXT0rzB0OcYNR48
	aX0Abxef35oxrLLlYCaMKxEOxQ2brtnHLoYoUJNOYBSuJpQc0qRWp19Xbn+93ZKAJ+NGHQu0rMm
	7CM9zhweezX3srqGmtmeuSyT0Lru4UGWY12QUJWBlBW/YADtDYty+cXgLaz8kH4SqieSnuDhl0Z
	/uclzttSiTb0OVbsYnmzLaz5oE8bckBTXfRQ5Dqx49pbaON6E9ORsaTweM1LQmGTJCJwgWEfKAj
	gpaUhrerXx5h3mT6QB9ZHrQTd0X6PSZmJcVjT/NW3I7go20YO1GeoSGcSyESTHQJJOYx7FZkLhy
	wY6jrCknDZ/E64SLqc/8ZzO/hZzz7m2HFKyHx4/XFWAHYu1Y7oIQ8rDcLMMZgZqs+o/NnRzL2Kp
	hPVYV2Ad0IXKkyVNP03I3qk+tMsUojfUgf78tf
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422918b6e.68.1795634734027;
        Wed, 25 Nov 2026 11:25:34 -0800 (PST)
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422896b6e.68.1795634733588;
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm18125768fac.16.2026.11.25.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        Jose.Abreu@synopsys.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net] net: stmmac: xgmac: fix RX split header length on multi-descriptor frames
Date: Wed, 25 Nov 2026 11:25:31 -0800
Message-Id: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yux1kiC_ZtlTrCWnlF3V2pQU0_8gAPUm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX3F3km00udzry
 AO8n3tbqeJO9tWnItIM8ngsm6Wm3Yz4ClT0o+AxvCR8vEGoC8lUhKsTHwwEMTfEs822wdLtuYKF
 hwmtX5jY63OVmlil5CS7WAWBFfI2+/Y=
X-Proofpoint-GUID: yux1kiC_ZtlTrCWnlF3V2pQU0_8gAPUm
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b07362e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ojtf-fZehEoJ8Fw7nBAA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfXw057MW45VSqw
 CPRhcvxLqcUk4L2Nyl/DCidpuWEcJL3xF/auYvyobdWaLp3oIaBMxEJDfqfv9CucQEQdWHGAfQ+
 X0bx+kY2ABK47MU9a6k5pm9/xWgig4wOKb+MTxNfvg2yXncR9bPWSx/Oi2P+1WxImjR1RnBHjpc
 /AT+HhNI83FPiKQx7a2hY0S/3v1RaK+DiYl0xcRo6uhJsQpX01/UEcl2+bNWOi2TKvseUTnjJaf
 7rSJUs7AhbRKNpv8iRMw5wARYePlHgIvQAEcatiQq8AagAJGVGNyf0xkhiQGaQQLHrnpxROm7w+
 bTbXWTZVfCnpo4RtRfJS3syZXVkYiI6OlZqm8l8VUZ3jKrL69p6VJlWV8Pc7YuXu2/DMNOqPev1
 2qNvaswcBYoeZdhyTkOjtkUcyGd/BtVOcgAX8P69UG9iNBe7DdZ2CBKWOX55h+GyfrlkIBLxHrE
 g0g8TxoEsB0brWndyRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_112537_198574_9F34EF4D 
X-CRM114-Status: GOOD (  22.38  )
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

dwxgmac2_get_rx_header_len() only reads the split header length (HL)
from RDES2 when RDES3.L34T is non-zero. L34T, like all RDES3 status
fields other than bits [31:28], is only valid on the last descriptor
(LD set). HL, on the other hand, is only valid on the first descriptor
(FD set), and the databook's "Header Length Availability in RDES2"
table states that HL is available in RDES2[9:0] when FD=1 and LD=0,
without any dependency on L34T.

A frame spans multiple descriptors when it is larger than the RX buffer
size. This can happen at any MTU, as XGMAC_CORE_INIT_RX sets GPSLCE and
WD with GPSL = XGMAC_JUMBO_LEN (16368), so the MAC accepts frames up to
16368 bytes while dma_buf_sz is only 1536 at an MTU of 1500.

For such a frame, the first descriptor has FD set and LD clear, and
L34T is not valid there. When it reads as zero, hlen stays 0 and
stmmac_rx_buf1_len() falls through to the rx_not_ls path, which counts
buffer 1 as a full dma_buf_sz although it only holds the split header.
The frame length accounting is then wrong and the skb is built with
the wrong data.

Read HL whenever the first descriptor is not also the last one, and
keep the L34T check for single-descriptor frames. Also return early
when FD is not set, as HL is not defined there. The caller already
ignores the header length for non-first descriptors, so this part
does not change the current behaviour.

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
This fix was split out of the net-next L2 split header series after
review of v5, where the multi-descriptor case was pointed out to be
reachable with the current GPSL setting and to need a separate fix.
The net-next patch will be reposted on top of this once it is in
net-next.

v5 of the net-next patch:
https://lore.kernel.org/netdev/20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com/
Review comment:
https://lore.kernel.org/netdev/179548403438.3135.1804854034587814346@kernel.org/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..0cdc0bc695c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -437,6 +437,7 @@
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..ed38aa358642 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,7 +292,14 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* L34T is only valid on the last descriptor */
+	if (!(rdes3 & XGMAC_RDES3_LD) || (rdes3 & XGMAC_RDES3_L34T))
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
 }
 
-- 
2.34.1


