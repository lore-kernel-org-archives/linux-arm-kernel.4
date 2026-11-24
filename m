Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D751606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q1pDWjtz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsuLAtoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLDp6/zg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=; b=Q1pDWjtzQ1WYSMmejEWX4hhRIE
	DBdTqUh/z0SPxjDrKog5c3RAJpFJ4DaTcFxypXu7nkJm21qmAENfmL9uPRk/qw8I/4iBaWlcOYF7j
	sXbAytW/sad8XSCfu0tXQl+a6AeJT+MkEra9uIVPhZdKy4+YlctAHg2l2EXYPv8x9P+xpZvXfkw3/
	QKxPO418EB7PgFiwksu9Qb9t4Eu+1eK6FS2gVUkBnNWAad/N91WJFblaJ1STxaZ8ayi2Gsh5cdxWY
	BKyu8yYFRCZtOlT/Q1u3V/p7ZwtDaftZPZqeijr/OSXr4C5FEi2UhOqb7yDexS6sWlJKq4jFjaqzz
	JK9vh3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1G-00000005EvS-3ILg;
	Tue, 24 Nov 2026 00:04:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1E-00000005EuK-0jsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:04:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuapl2973605
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABM
	CjzlVzYU=; b=WsuLAtoBPvFCnvZOFiNOb7w6/tgENSRqbkGK8bz8EXAvevvza7f
	izgoRuO7tjbvhGrZvBEWOAq7uqjWK/2R8W2eFbEWnZ56JIJmgM+L289khjFsVPZH
	kaIV838m6IqVtnV9/MJS6BMjBhA0B2k/erOxB0tXLHtVS/qDBGZ6WgF0RRoJOVgu
	0cpG3XnUvxc+yuHJoZNfhWUwu/SPrxtJq96kZ/mrAHwOpKYzhw4TR8R9myOvQ82S
	yRPfT+5CGNfzpNNyj1AnbxpzGw9dGEbCiAyB6NouuJz3JF2FsMlakHsr9Zuu3e1A
	ooG2vOuyPkjC8MmvlgTHMK5Eorw4h/nhNhQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy041mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6950197eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478658; x=1796083458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=YLDp6/zg39S5qSm2ApyoBVjnfKuLFeSeqqCXxmHmzAO6zNmPMNMYH2weEXL60YsV+H
         i+4FAjhP3+Ea4d9OhCxumEe1IOdfR1bHEoAIhs+bX3j2x+w3g0rXjxk3m7jFMGZyHfx8
         BOZvBOA+EHi9TlyZbr4yM31/EiDx+7xL57wP//88eki/+mkauktjobUP/lfuFWs1tfCQ
         ih+V/eaaXwFFLAnENl9P0tAv082yReNVbiFxbgMo6pHF2m2llg56mFeye/b7XLHQl9cQ
         RCiGB3CgduiWNfHB+DvnN0vw2+ON4MuF2pskeMqEN41OrZhY+EPb6PymGxNi1gP2+5Ll
         MQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478658; x=1796083458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=TmK/bdb0ExXfThkT5sIRBDmxHCxX/XK6S2mDJQyFwyoyidwyb19rbzXfQxlJc7XRkP
         +TeTc4ozd76TKDJhv7g8fxKZ43PQ60fwj/+hE7fzzbVVPiv1sYZdtsLPSdELuDOH+JT1
         76Y8RrsKzQwDpblD9XYCOoQjc8CImCX493ySAyFp5s6da10eQ2P40IDKXZqfrPWKguYU
         A7i8Zynvw53xB7JZPy3ftDob6TktSFEGd0hAQqP/KiHYzGMCCVegoUGoGNTMxxN2NgZz
         4e25qBUsOsFzsW66vOKGUZm7mW+n1B3NvGCH8whc1JDMqv1suZVAnH5CIWqMp0paeVyi
         Q7cg==
X-Forwarded-Encrypted: i=1; AL+hErFZx7WWnlPHGHUC0TNsYiivym1GQUe9AqU0m8PLwjx2OOBe8WlXVc1wSToyhJ2NEM+oobQv7jaf93+Dei1DJsAr@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZiP18me9YhyVZ3NO1DwlkeuA5cmN+IFe8aALxxtDBm7Q085ID
	+KFhsNy5CWb3xPCw4eP9PEYcrGPDHtw+LFTArNtbOmk1N2MdRDab7UwXauOAm6PTUYNwLKoORBr
	c7NuSSIbRvlCA7PVB+83GCqsEp3b/ZLHe5xcLqw+3fPZaPb2qUD8IZ7iu8tBSZ1QdHdJTKrRULf
	u4gw==
X-Gm-Gg: AZFdTZfkrcCaMZTASn1JNwelX/Gj0PaMCnRRoDhbJXEu+MSUuL2FS1K2AhqJ3XBC1Va
	2pFA/fo/fzOXE4IxP4bdTW989PU3Nvujqcx3VxqMUz+fi7cEjNKhtkzUNrIwmRhprsO6rQt4kRg
	KAJXLyjLBXvk9jpUelp22eKt8NCZ0qdMz9xNQTzjt//zXnWRSyELVIyFCB9dSpCU71KSnjPrIof
	w57RwP1GH0aX8U1A7eZsdbZQGUXtOjs6Tt59CH32SH6Vg1ucYRi5pGfhccAu2QamXJuk7BDBTY/
	BEH/vAp3HESWlT+R0yBAfdKslYyLg63Ci5/gbCaF+wNfP7t5qaCXnkA44RV8IGsKTuH7nW7ehHy
	kdWaZQj6+Uxj4khnz35MjlJ+bLgMj6OuB2xBIwHQpPQKHSIKVOxCIAaUEHFsVJpkUcA96dfcNr5
	IMINbR6ODGHOPkEKnETmshhkk4NKnVVigUCEs=
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920262eec.11.1795478657520;
        Mon, 23 Nov 2026 16:04:17 -0800 (PST)
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920228eec.11.1795478656983;
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
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
Subject: [PATCH net-next v2 0/3] net: stmmac: support up to 16 MTL/DMA queues on XGMAC
Date: Mon, 23 Nov 2026 16:04:12 -0800
Message-Id: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX0VLBrBea3/4O
 kJrbk5BD5nTzJIA1Qp5Gk9/ih4ljd30qffnmRjS1pPdPpMvZGTmMGrHVOZCrCU39X9jWDbhOF3o
 vo4f7DGbEa4Zus6B2E6jVJ2++SI1eWleOZQI20TIxokjWLeh1wr0bekcIxtjRX3v16kG6w0jiiD
 T4EhHH27ViBIUy+HFOADqifPHafZWD1DIsml9RK0lwtEjRvwkS2Youqg5qk5wRxCC3PURTEnFFz
 ygjR5hN183wa6nbxORee/MrGNGl1kA616xPHurRR6JgzesMP6EPiYbCO5upGrGBx3ltCSLQyOUs
 N5LbOoAgvQWnUdP3EFPOeOb1mwCKF6q7Ha6AGMMMztkFxKi59JHUkHfeE8OoAeE98H2BZuCoxUU
 SaUm4+CPxFkMRaNl+/liee9JtWPLGlYb7Lxykm0v5MG3cwrgfl+EyC30uOqrCToV9YrNGm5Zt2u
 GEIpVQbB0s4T93dPgcA==
X-Proofpoint-ORIG-GUID: 2Txfjm2V438uzbFWNgsx8lcMaVyg91ok
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04d482 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=j8eSvQKXAAAA:8 a=fBzlRZiCmRc88xsmlxcA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=j1SoD6Fdrn8k65qUt67a:22
X-Proofpoint-GUID: 2Txfjm2V438uzbFWNgsx8lcMaVyg91ok
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX01yLVjGaJwbT
 k+tAEFa0FN3pQR0Oaru1l8m1OcuOVAVkEdA2hABvji/TcDKflQyBhvX5Ty2aE0k1/bHKMdJh+ab
 pQloQFhg6DLtdjgz0J1lL5dbeRLoMyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160420_393904_FA303EC3 
X-CRM114-Status: GOOD (  13.81  )
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

This series continues Jakub Raczynski's v2 series "Extend MTL/DMA
support to 16 queues":
https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/

Newer XGMAC hardware can have more queues than traffic classes: Qualcomm
Nord is a 25GMAC-based SoC with 12 queues enabled (the core supports 16)
and 8 TCs. The driver assumes one TC per queue and bounds every TC
register write by the number of queues, so the DMA/queue count and the
TC count need to be separated before the queue limit can be raised. This
was raised in the review of the v2 1/3.

 1/3: separate the TC count from the queue count. Bound the per TC
      registers (ETS, CBS, weight, TC_PRTY) by the number of TCs and
      the per priority registers (Qx_TX_FLOW_CTRL, PSRQ) by the 8
      priorities, and do the checks in the callers so that errors are
      returned to the user. This is a rework of Jakub's v2 1/3.
      tc_setup_cbs() is not changed: CBS offload on queues without their
      own TC needs the HDMA support, which is not upstream yet.
 2/3: extend the RX queue to DMA channel mapping to 16 queues (MAP2/MAP3).
      Jakub's v2 2/3 with netdev_err() replaced by WARN_ON(), authorship and
      sign-offs kept.
 3/3: raise the maximum number of queues to 16. Jakub's v2 3/3 as it was.

The review of Jakub's v2 3/3 asked whether the other cores, whose per queue
registers only cover 8 queues, could now be configured with more. They
cannot: stmmac_hw_init() already limits the number of queues to the
count reported by the HW feature register, which is at most 8 on those
cores.

Changes in v2:
- v1 was the MAP2/MAP3 patch on its own:
  https://lore.kernel.org/netdev/20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com/
  Following Jakub's review of it:
  https://lore.kernel.org/netdev/atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net/
  - add 1/3, which splits the TC count from the queue count, as Nord
    has 12 queues (the core supports 16) and 8 TCs
  - add 3/3, which raises the queue limits, so the MAP2/MAP3 mapping
    in 2/3 can be reached
  - 2/3 is unchanged


Jakub Raczynski (2):
  net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
  include/stmmac: Increase max DMA/MTL channel count from 8 to 16

Sagar Cheluvegowda (1):
  net: stmmac: separate the TC count from the queue count on XGMAC

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 17 ++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 21 ++++++++++-------
 include/linux/stmmac.h                        |  6 ++---
 6 files changed, 70 insertions(+), 22 deletions(-)

-- 
2.34.1


