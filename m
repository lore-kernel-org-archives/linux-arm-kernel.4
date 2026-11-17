Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA2E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+brBR5o;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OF3R7XS2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fSjyj+T8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d7zSyNw6qz1m1x7CMIoGYOav8WM1/EyZq/PX2PCxZm8=; b=e+brBR5oa/4M631NRIZc2z0Z2A
	oJTOzb1A/Kk/nyUbilISkt/zYYtu3mc/kZjmxJdr7WPFCoF6YMrRbF/Z+XHKQzZhl5AeA+ddmAjaW
	lJwFuGBwc2IIuAtZLwVh3q/ozFLkbpw9wVwMBAWHAQLz8PcwaEVjM1MGJoya92dzrrMBHd7Jppn7+
	xGxBHr5s+hk1EXBkHimFMrDW24tmuh4FemkYSfFQTHO8sfieE4mVXYLlkhIUGy+KMGio+zqJ++0q7
	kHjsoUIHDPxUB4N7KjKWyPQomxO8vD36uge/FwVsHXFUZlEICwxMoJ5eraxwUC29Brv8aMRV1s0zC
	dCEUbIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLTe-00000006MK8-1EE7;
	Tue, 17 Nov 2026 15:52:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLTa-00000006MJJ-08Xp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:52:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQpi11663360
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d7zSyNw6qz1m1x7CMIoGYO
	av8WM1/EyZq/PX2PCxZm8=; b=OF3R7XS2UREI0oox314bHvrnPsSIkDr3bYdZ9D
	u78uE3IygWn9V+LjEhSZlC1ZQGDl2xt+QPF/b2jsO86p9IcZ7H+hPfHRBES/zvSm
	1aD1nurnfPUBGOBM9cZLefjAzqntSskvFsLrcnY6rnjw/fB+/eofg2cr1lz8EH6t
	GSJpMnlnQ9nIVQlOCQNbHHFPd3nInsN0a4OpV8KzGSjqWf5/sJdTFZZ/pY94WwM5
	FUUxbnh/ZesueNsr0cppHw6phJ9UsXuLI9GF1Lgrq1NZYKQduW4hfCNp7TUIygrj
	/gfROIOd4gCFcufw+SmZuVBVL2IyOg8za107u4prwew1Vg4w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc9sf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:52:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d57f6ea49bso818071137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930724; x=1795535524; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d7zSyNw6qz1m1x7CMIoGYOav8WM1/EyZq/PX2PCxZm8=;
        b=fSjyj+T8bOdXRYu/trBa6M+BpybyOvgYHFlV2g2MxDTl9nieV+jmEIV4ldRYUVy1sK
         m3KkuxLWEMQ6j5OKPvUZXfxzHz8A+gHVu8SpyG1kl7CLVJtvGf1TTDtfy3bgrF7/UB5L
         5Vjwa8oMGp2Qt/GTaLP2OLX2/uVba+KWDAzkJEij+zM4bODEiGIPYjdYSJCX1rH+G/X7
         Kit81aNs1b+K4BfHqghE6DC4T63x8eR3yBeWohHar3w0CDYVunEfkQ2gng3mduouOESa
         MI2DbozKP4nEAGL0VYuUUgE4pWHTveyRz8Zl9y8i/1lx+Y3y4ibg+eDv3EHXEG1gpAQ7
         3uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930724; x=1795535524;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d7zSyNw6qz1m1x7CMIoGYOav8WM1/EyZq/PX2PCxZm8=;
        b=Dpx6qXpi8+oaVkNlSdKCwos/qfuNQrN8gTj5Aq+Cvl1Xm3s2XV+WgTmMQj3fmskhDD
         DrR+uJ1lnnH6TwHafAu809HnpbsLsZLLVryaxPkERnehnAIllp9LB17d16NiuLnp4oF4
         TyvaoiOuX3cN3kCtf78IAeKVmROpAQSMeUNCd5WHoh/51ZsWg4ZGhgQo7lZOvIb11EJL
         EJywGXVTxh+juOcV8hYZt1YNTTuR7W92AVV6aj4T3R3OJbGUBT1IIt601BGJsTiA78Sw
         ZIIyGuRUD5PmnkJXPohyUoGLslpbFz+wIyvItWtLHPmG14cGoNRyYamCmM5HHG2/9mXZ
         jCqg==
X-Forwarded-Encrypted: i=1; AL+hErFgWEuNLYYTVONnsLCArZflagYWhvo4Anq4ZBh5w+rLWADO+xgrvaG9pzsAE1SWAMrUTHlKSTl4wIolmc7dHji4@lists.infradead.org
X-Gm-Message-State: APuU4Z96W51m74Sz6qloY51oKKGfNZh372WuF7rZVZFcDeOAY3In8UL5
	+u3EJwukP8AlzBZgjDXYELbwmGaliCHpdtjga8lEsJjfwiijhFpEQtk2t4YU4GruJ+PKv/6Yltv
	x3JZvTB7+kKCdzVDkxuWB81q6lymD/4XIJ4sfL7Tvcu6mK5mbBk3midfaDV++7iRORcndklVntw
	KZBA==
X-Gm-Gg: AYBFou2zp3ATjGM4CODK9G/OZBFZ8WpZGfLsv2NYP7xRHJ6IUGyfw+cj8O70EgYElgg
	AeNwhLQaxQeL2AqNvEgqyMxc3ry+tr2HEdUAQ9Vq/t3VOKB35d8SsrPSg7xx740x2olCwSkqOst
	KBi20RYxGXviBFN4E9wyyOXBkkk3yURp77lAfXwNizw46nod+guk0x8nfXTgSewflG8P67iLKTp
	kEphM8+f8/q7HW/KIrSYfcPZ/m2noUAPc2PeM7LaZC8G2d/u1hXyZy3RXVutQlfIK2olJzNtVCO
	C/YlTqilrckJ/DAWQFgc7pvDDNWWb8StyGnRWQ9FOcwq7PokGxnvWAeErLr0X+yVJQXQg/RZlMZ
	MLnh+IFOMs9iyxMXbtEN6zpxO03rv3Itz5JmUuhJ1GTDvQDuVsOWwEx2ATNlvecc=
X-Received: by 2002:a05:6102:6f07:b0:7d2:7827:c01 with SMTP id ada2fe7eead31-7d64d82be4emr3297214137.28.1794930724311;
        Tue, 17 Nov 2026 07:52:04 -0800 (PST)
X-Received: by 2002:a05:6102:6f07:b0:7d2:7827:c01 with SMTP id ada2fe7eead31-7d64d82be4emr3297198137.28.1794930723711;
        Tue, 17 Nov 2026 07:52:03 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm111211405e9.7.2026.11.17.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:52:02 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:51:53 +0100
Subject: [PATCH net] net: stmmac: fix num tx queues in
 stmmac_xdp_get_tx_queue()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB1wrFjwKkVCML92FkabRAmId
 29w+cHjXRQRFJGG6qKAU6NuvkDqiqav9QtYXTG1TduLyJtjWlc78ayZs9vNgmRSNr8DB7iBsy9
 xtu9kpnLYA0r33D/kkWi87z+oQ4kHcgAAAA==
X-Change-ID: 20261117-stmmac-fix-xdp_get_tx_queue-0eda31da641f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX74IocU3Nqh3g
 ggYjh5CSUN2RuYXVdvd2SOEtLGjUJlgMVmoAHnAtLrZM0Hp/JXYt55fkK44vQD0/amomqk5hLiN
 vg0enCJ+9ip4pyKsl6RwMmszxyxDo+A=
X-Proofpoint-ORIG-GUID: dySeCe2HcGYvtWDIaUjPCb-FkDGGdW8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX2VP3im1sv+g4
 SJjjLArUwInmLGPsP0FOqOQVyZe8iGIiSiMr68squrUN0A6qR3zj3xZxivcmZqebnGnS6c/DWip
 kqUOZEfQEoI7CEPSi4ZlmNdaePTNefsg7Eojm2e6r/oSXgmimnq7z4zjBIT6KHyiC2OQEu/xUfN
 1bA7aEIAI7+3AgHJhJW2bJdGVCqtivS79zl86VOM10vzQY+VtkbEhII4p/ssvbSXvnmXukSKkBX
 aiXHjE3/LLR6dtdU7v/L3pfUZSECDRdIQInErGeAAGrJhzSXrxGAVWUVGEU3cz5MsExZsWPfs/4
 SEquS5QPqUpFsjXVJAk6sQjpa/enXHGJsP3BHXjhpTJgMSTp4ASZ8+5SiZVb+54jqwYqpQdyDEz
 7kBa9v+5aS9pt3lNhxbPRFjwE/2yhh5uRA6Gi5NAvgJh01WAWftz3/7hgKuYYbsDBV9fim/TiSU
 +M0RqQ3Gs8vylRzHjYw==
X-Proofpoint-GUID: dySeCe2HcGYvtWDIaUjPCb-FkDGGdW8G
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc7825 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EjEmtv2rKBG8bDbUgTQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_075206_315538_18E5F884 
X-CRM114-Status: GOOD (  15.98  )
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

The TX queue returned by stmmac_xdp_get_tx_queue() is passed to
netdev_get_tx_queue(), so it must be lower than dev->real_num_tx_queues.
Since mqprio offload can reduce real_num_tx_queues below
plat->tx_queues_to_use, wrapping the CPU index by plat->tx_queues_to_use
can select a TX queue that is not part of the real queue set when the
offload is active.

Use priv->xmit_qdisc.num_tx_queues instead, which is the value
stmmac_hw_setup() installs as real_num_tx_queues and is guaranteed to
never exceed plat->tx_queues_to_use.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..cf87afd27343 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5408,13 +5408,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,
 				   int cpu)
 {
+	unsigned int num_tx_queues = priv->xmit_qdisc.num_tx_queues;
 	int index = cpu;
 
 	if (unlikely(index < 0))
 		index = 0;
 
-	while (index >= priv->plat->tx_queues_to_use)
-		index -= priv->plat->tx_queues_to_use;
+	while (index >= num_tx_queues)
+		index -= num_tx_queues;
 
 	return index;
 }

---
base-commit: 5e9b2ad9b8384cd3c417cd5e2c3bc7eee4a72791
change-id: 20261117-stmmac-fix-xdp_get_tx_queue-0eda31da641f

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


