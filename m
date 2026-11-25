Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wqqt8zxO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOdwFPyo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUOSpvjp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FG6F1MPd7/ppBGO8fakRa3Fq+vuHnKwphQ+D28uefl4=; b=Wqqt8zxOPdhHat
	raVXJw1QLWyB+HMP2OWJHaJ9h1DbQDf4QePOa1Iz5p2q7PcPD6on97ygRuYBI5JTadYUbHleXiqGa
	R3Uu2u1vkGXXxXYkmUrdwHKDyYygiw2UYp6pPR/+BlB+HisOS09INKvtSLRaHKdkDw2sGDWyvyx3e
	lnRVBVhG7yVe8gZzGKB3FXhlU9+4bj9l8j/BQ+t9DWPrGRtDCK+48yF4AYVP6YzEDfkJY6+UevRix
	gwKExTOEjLj3YTTRxbB2gA03qrhwX/uoyCMaDFqy8WozGKTM5iYahjHlj6GL466hWa1Wp4cDL1Chq
	8j3P1kTNnbVRhThVQD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJM-0000000AEj0-27t1;
	Wed, 25 Nov 2026 14:49:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJC-0000000AEev-2Wdx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:49:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMF012099778
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FG6F1MPd7/ppBGO8fakRa3Fq+vuHnKwphQ+D28uefl4=; b=TOdwFPyoO11pw1pY
	UEendRjrLm/jA/GjCcHwvSvef7PvzP3VkIwf0KUdUEuQV0l6ScAi/NvEZRgazsbg
	MVMN87Gq0ql8iOmMQOSiFv/JQd6j2RDFZhtk+uiws3tNkjT52M2q4pRZP8Piru5p
	buCTkGSl8PBLX5D20JM1EJURpk/OPjz3pyMArxexJ9OSZo0fec9G/Vf4wM2U76AC
	o/3jnL3EsgbshcaQxSNfTDK5zMmcTD2YyG0mUCZkStbaas2OGqykvrHX5bDjhdr0
	OUv6tpco/DPt0okNC4UiM3XNbe4Clzq1Afq04OFurqJGrgrhgIeW67JERf3o7PT2
	7ZHmBw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arg4dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:17 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4ed72293aso82703417b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618157; x=1796222957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FG6F1MPd7/ppBGO8fakRa3Fq+vuHnKwphQ+D28uefl4=;
        b=VUOSpvjp/FWQRK9mcKyZfXFnLpMxcEvK/E1N+Cyr4xBhzI/5Bz9THCwU7DDU9bw5OT
         IMnLl9Crpup8PEGm02eAdMm4L5eqX4Yc8UaCZqgV0hnBuq9ToZJyqxnx2eygqfUfstbU
         yB/CFEAUGrS3yBq0xzpmLqbim0/xolhtFsZ309SvoPQr7bl3KGZeL1byPE0OnjCQ0J82
         Wh2IVDY0wekCxPwBeMTWnG2JhoGsCQaNin1nnD/wMpUgLVvG0olgCFhXiLhZtk2XzjyT
         EleBpKAAlBANOQaLxjBOD0GuTlsRI90LLQogVP2QJrvHT7SdsfMHT4xcMRi77fkk2X8p
         q4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618157; x=1796222957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FG6F1MPd7/ppBGO8fakRa3Fq+vuHnKwphQ+D28uefl4=;
        b=2rYoq4Qc5PjHq98NECrKWumGBaZbickgWxAliOMh8NPGsL67m/wxggX6l4vr5X57Sw
         cH5NZXDaWuKwdYgGyRI6Wf3g1qV8tSSrf31VhoOE3kFZBju9MxN1xoq2sb0pRMrV2lKP
         2wcDrH/uQmL67grrqTyWL/S/N7+HTU/f+cPO+CCViZmnFhECK7EIw7viRxIdKfJGJ5Y0
         ijZEzBQwSfApUEUR0B8iSrPi2oIaV5zIic9obwb0GgSeG46BtAaybEYQWBaz5cMtg+J5
         UdjRz8n9afeeOq6zjK2qmeKU6Unxrj1qCN391gfClCeLb33oYLmINEgIY9JYNs/MOFRW
         VPZg==
X-Forwarded-Encrypted: i=1; AL+hErELcUGo8oRxBnmkTBP1xODmIj7mCDt5rFfTmF9WXQXScCdpXOPFhFm0/cbjeg/uNPGnHMZvniLTKS5BlT2jqB30@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y/zG9EQULuHGNELzmlDVmdTjQqyMi2aw4uBj7BFMvM9uOhiLQ
	/63Y3ktQyUSYX9A6OntSgd1+V+nqjdraZ4DXj3o1zZpy/k5WUGMphf6bq0XBdwn0VZKufPRAqUR
	eqWLc6jbKTrrpFpiLNl5SdvXcWhc+bT8AgQw9Wn7w1wzcYeJP5fmZF5SxF48BrsAXZKIevKgM6z
	EgjQ==
X-Gm-Gg: AZFdTZc0CE4Z+aBhjyI3da+TZXwBYW9ORbXG9uK62U2ntdOKF2ZtPgeDSrccvA1RIBM
	IHHfnklTKziraiPNHCsNjjQB/WqIfKIUCoDwpQ/2Q8Qfp5PLIMW9wHjcWr13UGBG9x0E2UiCG8H
	vu3Gi8bvIEh1R/tKCzW+M+gaALcvJJlO5KKvIBogqNhT6cxzLgYYlTqok/CCEo+gV+rr3qrYdq3
	OAHwzoAiNMJGbq5nhBlyKLONit1eseHvAqoo3dhtfyua1tP3P91ESUdCoFIMXJLRd3DujcBE6pV
	1WF8fV+b7muEqwUWqEROUnWhvEaG5GAANlvYZAhDGKT+lI/uNe8+Q1GxdRRmZOxHcSjNiITheYO
	i0trKG3u6tCQPhQo3kCmJfjzVS5C7GfpY3Zcv++/17aIZgO3E5EYTbG0DWSvl7Nc=
X-Received: by 2002:a05:690c:61c4:b0:8b4:d554:3245 with SMTP id 00721157ae682-8b520435e12mr61349047b3.26.1795618156772;
        Wed, 25 Nov 2026 06:49:16 -0800 (PST)
X-Received: by 2002:a05:690c:61c4:b0:8b4:d554:3245 with SMTP id 00721157ae682-8b520435e12mr61348857b3.26.1795618156087;
        Wed, 25 Nov 2026 06:49:16 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm29175679f8f.46.2026.11.25.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:15 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:47 +0100
Subject: [PATCH net-next v13 2/5] net: stmmac: remove software VLAN tag
 stripping
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
References: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
In-Reply-To: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, Peilin He <he.peilin@zte.com.cn>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RUWu9pPex0Pwabe_v4OcrWNZ8TrsdPZR
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b06f56d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=EH79fr7-9Oi-GOabCPsA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: RUWu9pPex0Pwabe_v4OcrWNZ8TrsdPZR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX9vxRO1wyYsDz
 TTxG6DNleBUGoSncSqd7IyBQtPQou+qJbiB70jAOLeWdo/P3K6P3p2+sOvZijucu3y5LAXcKV/U
 VPq2KUF7qjuSNpy9VsQN7z60qwaGbUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfXzsfnvR3UXT6Y
 e4JVhisG5SzhVEGInmea8vFn6VrZzrZYSG7iu5Oyf5YcPtH80orca/4tA8uCZkbyEK3+dq37M6y
 p/bvbJfR4XS03e9Y3lufFaK/wtd+mx6FnI+brjepe5KWDtVV7clHbVZ/SKTXizU74vCBz2kFNhq
 jMEo7pEZTiTLGt81gxHFpljZ36g2y9Z+OZwJzxrput80Mp3Ga9CbMabQO/Diid8CDr0i89z/xYl
 OJ71h/bL41qSwUnGQdymL7d/Xk6ZqgaFEAJmsJ2gVW1L4Xq/FROtvRvRwEYzbx4FAaT5w2hg9kG
 C2opoYJIwZZlCbmNfXhIZOpFj37eZ6hYzw/8Xi04SXtZXSguBeX+fvmSTCkcWOs426b6KJBRUGK
 9TCg9IvTnI4p2qKnOs/wMk7sXLWPY/xCWpMKVC5uKdiucLoEbkzvo3sC9fMt+3Uy/y+DiVFq5kG
 w5K1UtQlMNFAZ30Yy+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064919_127515_0100BCAD 
X-CRM114-Status: GOOD (  24.40  )
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

The software VLAN stripping logic in stmmac_rx_vlan() was originally
introduced in 2014 by commit b93819854d6e ("stmmac: Add vlan rx for
better GRO performance.") as a workaround to improve GRO performance,
since at that time GRO could not handle frames with VLAN tags. However,
this limitation was resolved in 2015 by commit 66e5133f19e9 ("vlan: Add
GRO support for non hardware accelerated vlan"), which added GRO support
for non-hardware-accelerated VLAN frames. Keeping a software fallback
path for VLAN stripping is no longer necessary and only adds complexity.

After removing it, VLAN tags remain in the packet, so
stmmac_has_ip_ethertype() has to keep recognising IPv4/IPv6 behind a
single in-payload VLAN tag. On RX the helper runs after eth_type_trans(),
which has already pulled the Ethernet header, so walk the tag chain with
skb_mac_offset() instead of __vlan_get_protocol(), which assumes the MAC
header still sits at skb->data. On TX the helper still runs before the
header is pulled.

Make the tolerated L2 depth explicit:
- on RX allow a single in-payload C-tag while the MAC is not stripping
  tags (VLAN_ETH_HLEN); when HW stripping is active the payload must be
  tag-free, so keep the ETH_HLEN limit and reject any tag that is still
  there;
- in-payload S-tags are always rejected, as only an S-tag that the
  hardware stripped (and whose type is reported through
  get_rx_vlan_proto) is known to have been parsed by the checksum engine;
- on TX keep the old ETH_HLEN limit, so DSA-tagged frames that the
  checksum engine ignores (see commit c2945c435c99 ("net: stmmac:
  Prevent DSA tags from breaking COE")) remain excluded from hardware
  checksum and TSO.

This intentionally changes the advertised features:
- dwmac100/dwmac1000 no longer advertise NETIF_F_HW_VLAN_CTAG_RX;
  they have no hardware VLAN stripping.
- On xmac cores NETIF_F_HW_VLAN_CTAG_RX is advertised only when the
  VLAN ops provide .set_hw_vlan_mode and .rx_hw_vlan, so DWXLGMAC no
  longer falsely advertises RX VLAN offload.
- NETIF_F_HW_VLAN_STAG_RX is advertised only on cores that provide
  hardware RX VLAN offload and whose descriptor ops report the stripped
  tag protocol (get_rx_vlan_proto), i.e. DWXGMAC. DWXLGMAC loses it
  because it has no RX VLAN offload, while cores without
  get_rx_vlan_proto report stripped S-tags as C-tags.

The DWXLGMAC mis-advertisement was introduced when the RX VLAN offload
gate was widened to all xmac cores, so tag the fix accordingly.

With NETIF_F_VLAN_FEATURES possibly empty, EEE RX clock stop may be
enabled on some platforms; the preceding selftests patch blocks RX
clock stop while the ethtool selftests run.

This depends on the preceding selftests fix.

Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")
Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Co-developed-by: Peilin He <he.peilin@zte.com.cn>
Signed-off-by: Peilin He <he.peilin@zte.com.cn>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 12 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 89 ++++++++---------------
 2 files changed, 44 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index fcc395321816..fa9ef4212982 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -478,4 +478,16 @@ static inline int stmmac_selftest_get_count(struct stmmac_priv *priv)
 }
 #endif /* CONFIG_STMMAC_SELFTESTS */
 
+static inline bool stmmac_rx_8021q_offload(struct stmmac_priv *priv)
+{
+	return priv->hw->vlan && priv->hw->vlan->set_hw_vlan_mode &&
+	       priv->hw->vlan->rx_hw_vlan;
+}
+
+static inline bool stmmac_rx_8021ad_offload(struct stmmac_priv *priv)
+{
+	return stmmac_rx_8021q_offload(priv) &&
+	       priv->hw->desc->get_rx_vlan_proto;
+}
+
 #endif /* __STMMAC_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca4c7fb11b73..7896364c43e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4879,7 +4879,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 /**
  * stmmac_has_ip_ethertype() - Check if packet has IP ethertype
+ * @priv: driver private structure
  * @skb: socket buffer to check
+ * @xmit: transmit path
  *
  * Check if a packet has an ethertype that will trigger the IP header checks
  * and IP/TCP checksum engine of the stmmac core.
@@ -4887,16 +4889,25 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
  * Return: true if the ethertype can trigger the checksum engine, false
  * otherwise
  */
-static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
+static bool stmmac_has_ip_ethertype(struct stmmac_priv *priv,
+				    struct sk_buff *skb, bool xmit)
 {
-	int depth = 0;
-	__be16 proto;
+	__be16 proto, h_proto = eth_header_parse_protocol(skb);
+	int max_l2_hlen, depth = 0;
+
+	/* An S-tag still in the payload may not have been parsed by the
+	 * checksum engine; only trust it when the hardware stripped it, in
+	 * which case h_proto is no longer ETH_P_8021AD.
+	 */
+	if (h_proto == htons(ETH_P_8021AD))
+		return false;
 
-	proto = __vlan_get_protocol(skb, eth_header_parse_protocol(skb),
-				    &depth);
+	proto = vlan_get_protocol_offset_inline(skb, h_proto,
+						skb_mac_offset(skb), &depth);
 
-	return (depth <= ETH_HLEN) &&
-		(proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
+	max_l2_hlen = xmit || priv->hw->hw_vlan_en ? ETH_HLEN : VLAN_ETH_HLEN;
+	return depth <= max_l2_hlen &&
+	       (proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
 }
 
 /**
@@ -5153,7 +5164,7 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 	 * harmonize_features() in net/core/dev.c
 	 */
 	if (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
-	    !stmmac_has_ip_ethertype(skb))
+	    !stmmac_has_ip_ethertype(priv, skb, true))
 		features &= ~(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM);
 
 	if (skb_is_gso(skb)) {
@@ -5175,37 +5186,6 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 	return vlan_features_check(skb, features);
 }
 
-static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
-{
-	struct vlan_ethhdr *veth;
-
-	if (!pskb_may_pull(skb, ETH_HLEN))
-		return -EINVAL;
-
-	veth = skb_vlan_eth_hdr(skb);
-	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
-	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
-	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
-	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
-		__be16 vlan_proto = veth->h_vlan_proto;
-		u8 meta_len = skb_metadata_len(skb);
-		u16 vlanid;
-
-		/* pop the vlan tag */
-		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
-			return -EINVAL;
-
-		veth = skb_vlan_eth_hdr(skb);
-		vlanid = ntohs(veth->h_vlan_TCI);
-		memmove(skb->data - meta_len + VLAN_HLEN,
-			skb->data - meta_len, meta_len + ETH_ALEN * 2);
-		skb_pull(skb, VLAN_HLEN);
-		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
-	}
-
-	return 0;
-}
-
 static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
 			      struct stmmac_rx_queue *rx_q, u32 queue)
 {
@@ -5626,15 +5606,11 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	if (priv->hw->hw_vlan_en) {
 		/* MAC level stripping. */
 		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-	} else if (stmmac_rx_vlan(priv->dev, skb)) {
-		dev_kfree_skb_any(skb);
-		priv->xstats.rx_dropped++;
-		return;
 	}
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(priv, skb, false) ||
 	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
@@ -6142,15 +6118,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->hw->hw_vlan_en) {
 			/* MAC level stripping. */
 			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-		} else if (stmmac_rx_vlan(priv->dev, skb)) {
-			dev_kfree_skb_any(skb);
-			rx_dropped++;
-			goto next;
 		}
 
 		skb->protocol = eth_type_trans(skb, priv->dev);
 
-		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+		if (unlikely(!coe) ||
+		    !stmmac_has_ip_ethertype(priv, skb, false) ||
 		    (status & csum_none))
 			skb_checksum_none_assert(skb);
 		else
@@ -6429,7 +6402,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
+	if (stmmac_rx_8021ad_offload(priv)) {
 		if (features & NETIF_F_HW_VLAN_CTAG_RX)
 			features |= NETIF_F_HW_VLAN_STAG_RX;
 		else
@@ -6462,7 +6435,7 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	if (features & NETIF_F_HW_VLAN_CTAG_RX)
+	if (features & (NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX))
 		priv->hw->hw_vlan_en = true;
 	else
 		priv->hw->hw_vlan_en = false;
@@ -8275,15 +8248,17 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
-	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
-		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
-
-	if (dwmac_is_xmac(priv->plat->core_type)) {
+	if (stmmac_rx_8021q_offload(priv)) {
+		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
+
+	if (stmmac_rx_8021ad_offload(priv)) {
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+		ndev->hw_features |= NETIF_F_HW_VLAN_STAG_RX;
+	}
+
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 		if (priv->plat->core_type == DWMAC_CORE_XGMAC)

-- 
2.56.1


