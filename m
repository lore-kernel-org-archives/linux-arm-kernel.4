Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z6T5L5i4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1oeZPA0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bff3mSI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=; b=z6T5L5i4KhaZM3TNQOaEkGhQL0
	9wTua4UPTIRwySXlWcLvEsRZ0+iaI43ECJLMGr//L3FgLDy4IZZ2t2uJtvBRFrjlwBXxCWiLF8JOq
	iBSsW6LrcHYxTK1/pKGNlQ9Go4I6/uzAGVtfS5+DXEjIAVQwvaW+GzYyvojS0V5dRJ9JtEWzK4ptG
	+e38NcrI2/V5svofA9+vxQQcEmZ//9hOyibj3+MdNOD+ZMPfvBGed0XcNFB8CnLdpDOZ3mN6I0Wrq
	W3RpBMRzOAy6mOEtK/1eY2xJ+SdIuLM+/fiUd+QCMYUN8Kd5AlJQM6BDKwi+Tp6WfMnSFbAysFOJE
	TQWXCzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotC-0000000HaCS-13gw;
	Sat, 21 Nov 2026 17:28:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUot9-0000000HaBh-0yn3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:28:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaBZG1592514
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Atpvx34I5zy3w193SbuJM2
	Y7axw8mjZO4wtWdl2Uqks=; b=P1oeZPA0xKGWSh3+uHGn4Fy9q4Wn5Vl6U/BKvx
	WiMjtEhZf2Jfllpsv2pepuNGRkejYJc9OxyprRFsDnWKtxZdVAmRUP9nZg4RckCg
	0XvEvfAt2BjOZ2F2TpwsN3cW9betl2pMQGtyS2MI4vl/5anEwp64wUzvVbjvCZD+
	bjFJWWnNmW3a/O1eXS3XEj4vSIswk3dCcTXZI9ptzONtnQ5eugd4NjwweIZEndtz
	DmZtpmkul6SUOAg28rYJHhYk5PliKndZ/syF6YooWH3vzLAyxINPPiNaNA5uN/aO
	KUlMT0ljMmvaROUSndP7B9DxRY6JcT8jXdg/CcQKblXIjcBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6hrur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so293585585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282113; x=1795886913; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=;
        b=Bff3mSI75/3VllaB60BYT5/Q9Mc8u9ob0Bk1bGsW9R8jlHov4I4clahIcvytQ9hDhn
         tUwXBI+yLcj4mGzGkwWvw8+Yh/WcxKJhHeIBZZQNvTuua5hCwuGPbzfqpsdwEdsZ+kXM
         gDnXAyM9lz7EW1TPmhFUpSgRYZxZTb/T1HvhmO/LtzkCiG8efFgHFpDLwL/ELK/HGdX5
         dwGgF9CREqSJdLFesuHKdVC9rVU/zKSBzCTB1Zrc3g/Em0VLZQZFXJr3HcbzybxsAt4S
         hdemasYY9aFRXa45fr9u0g9L+vsOwe/qoJ5A+ccVLc9k99/DSRDLnWurtbqG1w3JztGa
         oLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282113; x=1795886913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=;
        b=S48WUe1y5M/fP+gx44Y6apUNERxn669Rtcbpr1WZzb5SsPktiLHdkghf8nUVeO01hC
         bJYdi76YlPxxP5c1zUxY7wL7TK4xJAojKreecJJesJ+3bd+/mWvLJzQA0O7RYCCx1KZ9
         ojJOkkq8oEmgsCONVh9/9+DxhxuNfnVNDkRVCryawWecOm+moPhb4Mt74ELFkm3sDG2p
         zECSUhfARRvXAcgw/q9VjDj3MWEo+O0VaWp7S2TH9p0EZz/eA3aLgjK3FP3tV2zQ47JR
         ydi08x414SkDAdwdP51z26e1o6xtMZzbnmI7DUw+jX93pxoZ+tJvo2nAnfhD58NiSV/f
         9WwQ==
X-Forwarded-Encrypted: i=1; AL+hErEkC8ffwrPqn3CuQSG0lhY4LF0pkdFGV8kuhNy1TOE3vi5FJOWay6oje/8C8AEcAZrzfufi6IXcVB1bZi9sduaL@lists.infradead.org
X-Gm-Message-State: APuU4Z954dCO84fCtOw90YYsuzKJqtjg92UunbRyzs/xD+uzLEi8nTCs
	rZzwMs+g1ajP62+Pf+3C6aqerQ29BqL9VOlupNSi4aHfScdCX4sWydAKxPugxOuZsQzsDcdP+5v
	3/MLxexsBbznqdXsCAHKHNmJpjtmYlsSKducGXPIBUDTcMxtRvFG1oxLjub3JAX7oiGQKWomyRC
	ZN4g==
X-Gm-Gg: AZFdTZf5OQ2NwWMQhnuPZtFIu9QnpvVRvaIhQ9yjZEub3JikTdKeo0M9+5RA+q35Yge
	YV2PYp0CwSJIugkNAc4hl0RISaJTy2hGFGIFL3aHqISwmZXmrh3M55TIiVFfxo+ueROotCZaFbf
	XKJ9bFR6fQe/K3AL6pKMJz3IZJzMSTWVTWFilPoNPqLcTIY/eb0HqDqfifmPEfLSCxHa2l/AZFO
	xYRzKZHIqqat2reZlUp4y7x0S1rSL7GMoeaCYscrCFz/akQSYaVpECzrhN45evtihEDs1COu/w6
	xM+c1P8PfwG4NZc+M/UOFItpHDXRHAmH74D0lKrAISj7ickbd8Fqh7Sk5M+aiZnRmtac9dawixf
	UwtvAhxME/RNxBL81KJoukt+0oMYk4KWI+VkIhHwviKk9y4cSwUWFDystT62Whbs=
X-Received: by 2002:a05:620a:458a:b0:949:5872:be1b with SMTP id af79cd13be357-949ba9fcc8fmr1063864085a.39.1795282113040;
        Sat, 21 Nov 2026 09:28:33 -0800 (PST)
X-Received: by 2002:a05:620a:458a:b0:949:5872:be1b with SMTP id af79cd13be357-949ba9fcc8fmr1063859885a.39.1795282112503;
        Sat, 21 Nov 2026 09:28:32 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm70964255e9.4.2026.11.21.09.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:31 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v12 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Sat, 21 Nov 2026 18:28:11 +0100
Message-Id: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSS27DIBAG4KtEXpdoZnh31XtUXWAMjaXabm3XS
 hXl7iVetIiEDRKM+IB/uDRLmPuwNM+HSzOHrV/6aUwTpKdD409ufA+s79JCQ0AKLBq2rMPgPJv
 PbGgZKqGsI40iuCZt+ZxD7M+799qMYWVjOK/NW6qc+mWd5p/9oA33+mNyQ4YMWiFRdwKEiy/Ts
 hy/vt2Hn4bhmIbd2ygzCAuDkqGCIRUwRg6qYvA/AwFEYXAGTEJ0qNFFG3zFELmhCkMkI0QnvLN
 aBN5VDJkbtjBkMjw3SQnOITcVQ2UGUmGoZBCRBJkClx4rhs6NMg99y6OjTkMESb72FpMbZW/Nz
 YjSeGhJGmErhv038C5Tm3rrwVpviSsl2oqBkCF3gSCkm3S8A9Eq6VVb6y5iruhSST+V2eik5yJ
 EEvKBcr1efwFY0nK/ZgMAAA==
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
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
        Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Metn2KqYAtpWWdsUucyqB68Ud3Na9bXN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX8lkQlOdw9Os2
 6P2anWP8KOEJdthIWggs6rZ1vBkKG7UYjoezh9w+934cwaRxOL8RuG3sGf36cCoRmWK92ZmM9ur
 UaVt23ilwQFsgvSKPGeg3YFBqhuBMpA=
X-Proofpoint-ORIG-GUID: Metn2KqYAtpWWdsUucyqB68Ud3Na9bXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX+aYYCh1KZw84
 zlWqt7Y+YueLtxndTFc53QihV0MObpaRsHgffaGPE9DwlqD4877JdPnMY+AeY9epgYDf940VbuQ
 RcQJHue1Nh/xjRtPvXMpSmYbQMed5Bg/v1MiP7uwVG5EH/znNLU4UU+0+Foy/jRaxCD6ld3cqy4
 /+yioAGYxduSFGutozJlG6ncTqGOmIEfHOhlfvHjY3322xcA4j8jZc0jxpXf3edf0oNhiZoSF8H
 OE4xDR5iwfgmvLAvEZS6MVwfH5tjy+pYrQI6T1DZ+nOFkCBlzzExjAS+2Vg7jCMWjy7wGgGZuYB
 AKGadTdCzrSpOlicBczZUslD9vN1271u7YTMCwvsbWT2GJrenK81t2ly5J4Y+UNQtoE4rtWMxeq
 OBtuqvYHmT+8BxFxt18rNZoSHlsOsr0rROOheVx2vdfrJogKdS9q7+cGNiM9bqW5RnosAWm9AGD
 +fX4DvldXzumNFK5CGw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b01d4c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UDig4O-PjbkV-u4TaL0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092835_397074_23D9232F 
X-CRM114-Status: GOOD (  17.97  )
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

Rework stmmac_rx() to build the xdp_buff from all the descriptors that make
up a frame, so the XDP program runs on the whole (possibly fragmented)
packet instead of the first buffer only. Fix possible rx_q state leaks
when closing/opening the interface.

---
Changes in v12:
- Rebase on top of net-next main branch.
- Link to v11: https://lore.kernel.org/r/20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com

Changes in v11:
- Fix kernel-doc for __xdp_build_skb_from_buff().
- Add sanity checks for xdp_buff_shrink_tail().
- Link to v10: https://lore.kernel.org/r/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com

Changes in v10:
- Introduce __xdp_return_buff(), xdp_buff_shrink_tail() and
  __xdp_build_skb_from_buff() helpers.
- Link to v9: https://lore.kernel.org/r/20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com

Changes in v9:
- Rebase on top of net-next main branch.
- Link to v8: https://lore.kernel.org/r/20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com

Changes in v8:
- Add patch 'net: stmmac: fix VLAN tag stripping on non-linear RX
  frames' to fix sw rx vlan parsing.
- Rebase on top of net-next main branch.
- Link to v7: https://lore.kernel.org/r/20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com

Changes in v7:
- Take into account the case where buf2_len is not 0 for the single
  descriptor case if the interface is running in xdp mode.
- Report rx_not_ls bit if the packet is splitted over multiple
  descriptors for dwmac100 and dwmac1000 cores.
- Link to v6: https://lore.kernel.org/r/20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com

Changes in v6:
- Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
  it requires some XDP fixes.
- Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
  RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
  yet supported there.
- Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
  fix pending bugs due to missing XDP multi-buffer support before patch
  'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
- Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com

Changes in v5:
- Fix possible read after bound issue in patch 1/3.
- Do not allow parsing non-linear XDP buffers if the program loaded does
  not support frags.
- Add patch 3/3 to remove MTU constraint for XDP prog.
- Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com

Changes in v4:
- Reset in_progress flag when the packet is fully consumed.
- Advetise NETDEV_XDP_ACT_RX_SG capability.
- Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com

Changes in v3:
- Return secondary page in case of error.
- Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
- Add patch 'net: stmmac: take ownership of saved RX state at poll
  entry' from James.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com

Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      net: xdp: add __xdp_build_skb_from_buff() helper
      net: xdp: add xdp_buff_shrink_tail() helper
      net: xdp: add __xdp_return_buff() helper
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 229 ++++++++++------------
 include/net/xdp.h                                 |  39 +++-
 net/core/filter.c                                 |  80 +-------
 net/core/xdp.c                                    | 113 ++++++++++-
 5 files changed, 253 insertions(+), 211 deletions(-)
---
base-commit: d23de0bd0bfd62405e6c80028008838ec140af25
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


