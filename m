Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B16606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 00:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MYqcqDQO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSs0bbHT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdJvgZU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lfYDwuZSFviGTTlMEh9cD/tenkn6JZrvdi0nKAxg6CA=; b=MYqcqDQO+n0D7PIKUBT4s0OqBt
	xfJWxRXLpoqb2e7qQoZJLDrk1Tr7Kq669P1LHUt1XixGsJxY7lGepRemLN6+0Ll7ZPmM4em5UsEU+
	xiHi/OEO3aMIBPyUXo10gux4wZLYMI5ivVSxB41PfqYqSIUkMDykCY0VvgkJBUzjdN0/O8Wy7alBe
	qR3pMkXEE2ZNTPgG5ypKPzC4LGTAGldzknE6HTtNfuXZA/jDnyOy8PJ0jWfq9mSrDYnLrtDrUrBNc
	2wcitILPJXjXi2zTym+Ji2Tk61Y9izTprXQ6WfvYgyL2ILAmLmsmcOD94EOk6xiPXuom0Q9iRJa69
	artKVKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCrz-0000000Dmgu-206s;
	Fri, 20 Nov 2026 00:52:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCrw-0000000DmgL-1sdC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 00:52:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G5hr2346663
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lfYDwuZSFviGTTlMEh9cD/tenkn6JZrvdi0
	nKAxg6CA=; b=NSs0bbHTM+DMflHZBwkB14CcEwBV8yJyaGR0G4JTv1s6aIPWc5D
	eJ8CzYxbgd3W8ozUL2zf8aaMEci57f3ZMj7mhwfS2ADwaxVxHGxoXqvsfTsx08Ei
	HWnFHi0Ms6wqLa56dulDFnMMIIxrqqLm/CEE1LfirKLL2Sx3BOcfIiTfY5Ym6Q5+
	IleabaGHQ15IlPFU0PrFpUNb1DIGjfIvCVlWXsu0bIEDchi2ogvr+cx3MTTzwvcz
	vkCm2kz4YvKL4ogz/XekRN0XqlonhZ5x/lvwxERCwIIR0fH9RGcPOUsnN5awKyQe
	P4iN3Cq8OJ02saT4ZgYuSoJQjIKePOQW/DQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70c7mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:52:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso413727eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 16:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795135965; x=1795740765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfYDwuZSFviGTTlMEh9cD/tenkn6JZrvdi0nKAxg6CA=;
        b=NdJvgZU9c9s6DFMnIQJtOzmlt0+ZifMsJhtYQ5tOLpa6mPRy9lAj/KXQPoC6ASDh7s
         BcwAsCm43H3AsLd/oHLdsxktUyuIccXoKeQLjc2mbISyiQBkHajZQkUfRBKy+iAdXpdi
         z129eBJyLYJ59bRUNMBuVWSjwcLcVoBPbtAHI+Zs6+BrcIE5F5jlOJHDWxmgjOmChxQF
         BPLcwtUORj/RbwaajgAoiivsjD4V/6LfD2EYsbLSxu9HLI/RTNRAGo1f9uJiFnWAtBKP
         ffoZwDW5iGVk/yqh7osQUxnfheF9xinDACtnKc4iu1sYN1ShcBbNyY3Fj4C4e9mVvga7
         lRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135965; x=1795740765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfYDwuZSFviGTTlMEh9cD/tenkn6JZrvdi0nKAxg6CA=;
        b=q96mHf0HFsih1ndEJEGcOW1+hqq+c+UejuXqlUUMOrM8y5XW1KAGFcuzzQ4HP2PVnE
         nkBSbPZL62S1uOfJZ6nD9DXS/6zQZcI+hDVfjilmvlkWd8YNhgToSl+csRB59o9GeZ9T
         5RdECxM2uDNasZMH+NG+NnOJRgHw7iVtURA2kmPEzvCFMQhzGAGhpkbLwrw1LGGBjiJo
         CdPD57YiLttjNUg2ZtsfOrs7a79j3FpakjzfXiTbVHa5X8p8tn+RReWItviqELoBmBPm
         ACjtpEnZbeV7Bs8IvWkPXgpP/XqiSqft9zvZChOR0Pq4mZ7bOmfuJgDBxgdEDk9OnAv3
         x0Jw==
X-Forwarded-Encrypted: i=1; AL+hErFnEVN+Yd9GNFIPFFEgkTTGICH7cWjpqa4L96ngXHt84OGahv02cgwLm3TT1UyPimU2BBy8jI71TWfP+i9IagTM@lists.infradead.org
X-Gm-Message-State: APuU4Z8eazQo+PbJKgeGkOn0LD88wfrhiOKNH1NiDg+lr+ylNHzkFhwu
	Z4ZCZP5l58KQHCHlVeE1Of5maO/oslRLLQOEh4rxlHItQYxF9mCz+z8W2/GsZDFq+Y0zBhvpv2O
	me/z1xYtJu5RtKjPkoSBQ8sh/taEo7dU9KIp0KzsGDky9eNQsGdZH45JUEbEl/GRa/wMYw3yTAt
	Z2rQ==
X-Gm-Gg: AZFdTZdVdFwD8eiK5rSGFOXSe8weXxNSdOYZJL9XOtz4wdp+P7ZJH38orYgilhGbnSf
	bzUrNdRpFYkh+2qwB4cqd+8UEIfFyMTFGFGW5GEryzw3+HM8sNpIhaX0bt8mf5yM3WQyQfKNR0X
	ouS0xRYiuzToTCv8RiCxFyfvsAXzF+Dm/9LKxHxhcRXztQiq2t6vbRd54cJYFqGYEHimh+N/b2M
	N/b56bnaRwClEJ14LkK49WxU6LE38DQsb9QycA7snlEPB8Y6KcnYn09t7jl9QUKu7F8zpiHCyV8
	Ql8mEtIKokVOZxNMDLRbYpMTo99brW8SbQyOAoYnO2rZm5rZ9vljyg++s/E8nAns4xft+9mhmLv
	nAjwpxh1Or4FQHbnYkUMh+pO3I8sQ/WSu4Xb9R6FyR764aH2qmrjyAgnJSXJcAYhnMqiUbwlNaC
	V4JeUbnvc1pBSMKyEIxSCsjJ2qWheLAQhRs3IL
X-Received: by 2002:a05:7300:e9cd:20b0:36c:f88b:caae with SMTP id 5a478bee46e88-3857025cda6mr1224977eec.22.1795135965126;
        Thu, 19 Nov 2026 16:52:45 -0800 (PST)
X-Received: by 2002:a05:7300:e9cd:20b0:36c:f88b:caae with SMTP id 5a478bee46e88-3857025cda6mr1224946eec.22.1795135964551;
        Thu, 19 Nov 2026 16:52:44 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm2164705eec.16.2026.11.19.16.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:52:44 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next v5] net: stmmac: dwxgmac2: enable L2 split header support
Date: Thu, 19 Nov 2026 16:52:43 -0800
Message-Id: <20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vhnSaojsjTueOeRDDTXAqM7SyI7W81tw
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff99de cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GebObiA6MxcdEQzCM0oA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMyBTYWx0ZWRfX0TYrQDWe/agI
 JVApb8AyaT6y1jLk3Dqsl1mZs960YbmpgARkquxp9eGlddjOjJ1EhJ9kKUYhdSN4AhtP/HAXJEn
 h2akmu8zkHav6bpDx/MN0B/cvIAFX1w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMyBTYWx0ZWRfX22hJo5F8v06w
 F9R5grRvVBfwZbgJrzwG4SYhMaFw74ecz9w1nebxgoEJUXFGv2mz+FVLe4oXmYjPu/H5yaGnoY6
 vMq7Xzao7UJRowD2gOgvj/nQ4DIl8kEeeymv0ftTZkhgkZbBhcGTIy1LpsYy7vk5v1nn4mbhfpU
 CmGN6JX3TvUEROZUpKvEfpB4pzqvF/NGJTU7ip9jVulvJM0O3ZJ7qyrsuBzaF6ZiKYng9nrpjHV
 hp1+8qDqG6souaU310yj0AvoAbMN833DQENRUnfQDEHgGf/Jwaor+xMuT9yFlv0tZ8TgzmmJFfg
 i/sWfC/WpFT/p5bsoaIxGvmUG3CUh7m7zavn0/zzoLq3/PMAq54nuuodfBEIOAH5hjf3CFPfTFm
 edLtu2qBy2WRnMTpC4uMw94BefpVSjPBwaPbG+onBSXRPTS96SA8Tu7I27D2Nfl+26PUUTqvfQ6
 kq2coi0Q5cKaFm2JFmw==
X-Proofpoint-GUID: vhnSaojsjTueOeRDDTXAqM7SyI7W81tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_165248_640731_B98E3FA2 
X-CRM114-Status: GOOD (  27.48  )
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

When split header is enabled, XGMAC2 only splits IP packets that are
untagged or VLAN stripped, at the L3/L4 header boundary. Other packets,
such as tagged AV packets, can't use the split-header path.

Add a config_l2_split MAC callback for the MAC-global part of split
header and implement it for XGMAC2: select split at the L2 header offset
(SPLM = L2OFST) and enable Split AV (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header") to
XGMAC2. The databook states that L2 split is not supported for packets
with variable preamble, so also clear VPRE in XGMAC_EXT_CFG0 while L2
split is enabled.

The callback is called once, only on split header capable cores, and
reverts SPLM/SAVE_EN when split header is disabled, e.g. when RX
checksum offload is turned off. VPRE is left cleared, as it is reserved
on cores without variable preamble support. The callback is not
implemented for XLGMAC, which shares the XGMAC2 DMA ops but uses offset
0x140 for XLGMAC_RXQ_ENABLE_CTRL0.

Also make dwxgmac2_get_rx_header_len() follow the databook's "Header
Length Availability in RDES2" table: HL is only valid on the first
descriptor, and L34T is only valid on the last one. For non-IP packets
RDES2[1:0] carry AV status, so HL is RDES2[9:2].

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
v5:
  - Move the XGMAC_EXT_CFG0/EXT_CFG1 programming out of the DMA
    enable_sph op into a new config_l2_split MAC op implemented only
    for XGMAC2. The shared DMA op also ran on XLGMAC, where 0x140 is
    XLGMAC_RXQ_ENABLE_CTRL0, and cleared the RX queue 4 enable bit
    (Sashiko)
  - Program it once instead of per RX channel, only when sph_capable,
    and revert SPLM/SAVE_EN when split header is disabled (Sashiko)
  - Clear the SPLM field before setting it (Sashiko)
  - Describe the FD/LD handling as following the databook rather than
    as a fix
  - Fix line length warning
v4: https://lore.kernel.org/netdev/20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Only read the header length on the first descriptor (FD=1)
v3: https://lore.kernel.org/netdev/20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  9 +++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 20 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 16 ++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 +++++
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7f43a0b17083 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x00000140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,13 +440,16 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 09194b9d8322..58d7433e8b17 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1412,6 +1412,25 @@ static int dwxgmac2_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 	return 0;
 }
 
+static void dwxgmac2_config_l2_split(struct mac_device_info *hw, bool en)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value;
+
+	/* L2 split is not supported for packets with variable preamble */
+	if (en) {
+		value = readl(ioaddr + XGMAC_EXT_CFG0);
+		value &= ~XGMAC_EXT_CFG0_VPRE;
+		writel(value, ioaddr + XGMAC_EXT_CFG0);
+	}
+
+	value = readl(ioaddr + XGMAC_EXT_CFG1);
+	value &= ~(XGMAC_CONFIG1_SPLM_MASK | XGMAC_CONFIG1_SAVE_EN);
+	if (en)
+		value |= XGMAC_CONFIG1_SPLM(1) | XGMAC_CONFIG1_SAVE_EN;
+	writel(value, ioaddr + XGMAC_EXT_CFG1);
+}
+
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.irq_modify = dwxgmac2_irq_modify,
@@ -1451,6 +1470,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
+	.config_l2_split = dwxgmac2_config_l2_split,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..b28aa39f9947 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,22 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* when FD=1 and LD=0, HL is RDES2[9:0] */
+	if (!(rdes3 & XGMAC_RDES3_LD)) {
+		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+		return;
+	}
+
+	if (rdes3 & XGMAC_RDES3_L34T)
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+	else if (rdes3 & XGMAC_RDES3_L2T)
+		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
 }
 
 static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, bool is_valid)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..80131fdda2d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -410,6 +410,8 @@ struct stmmac_ops {
 	int (*fpe_map_preemption_class)(struct net_device *ndev,
 					struct netlink_ext_ack *extack,
 					u32 pclass);
+	/* L2 header split, MAC-global part of split header */
+	void (*config_l2_split)(struct mac_device_info *hw, bool en);
 };
 
 #define stmmac_mac_pcs_init(__priv) \
@@ -492,6 +494,8 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, config_l4_filter, __args)
 #define stmmac_fpe_map_preemption_class(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
+#define stmmac_config_l2_split(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, config_l2_split, __args)
 
 struct ptp_system_timestamp;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f256244ce0d1..0c333d14be4d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3832,6 +3832,8 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Enable Split Header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
+	if (priv->sph_capable)
+		stmmac_config_l2_split(priv, priv->hw, sph_en);
 	for (chan = 0; chan < rx_cnt; chan++)
 		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 
@@ -6467,6 +6469,7 @@ static int stmmac_set_features(struct net_device *netdev,
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u8 chan;
 
+		stmmac_config_l2_split(priv, priv->hw, sph_en);
 		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
@@ -7430,6 +7433,8 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	/* Adjust Split header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
+	if (priv->sph_capable)
+		stmmac_config_l2_split(priv, priv->hw, sph_en);
 
 	/* DMA RX Channel Configuration */
 	for (chan = 0; chan < rx_cnt; chan++) {
-- 
2.34.1


