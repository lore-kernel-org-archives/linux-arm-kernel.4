Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE3606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnAq87pW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFcyMzWp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VTZia+Ud
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=; b=GnAq87pWRFUq3M++V/zZ/Qwa83
	UdpYRoWjyuICkBq1X29DqcQ4gxFfid9BrxsR+lJz4T/WxsWet/AIuw4h1U+/hsiDTuDxoXRZ1E/N6
	PN4X5uGkpbRTxFkIQ0IP0xDeZCQybnJmCcSbNfvLaZ7C4xOy0vLEOMFVq4wFLlqlTC4UgfMAgceNB
	5Asrh11sDtDUfp3J7UuxzQJyQpKc7fGf5DrT2YVCIUj/QE/qk8ku22pMcnNAZwsvdQDRl4oYPoDtq
	zhm6LhY3L7cXU5Aj/wT/dP6PMdA4lfU4j+VrGhEm6zqfPVolIaK/hA3921rrtfLNogyl9b7gu9vLU
	gJAnyb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm4-00000005mRc-3YfN;
	Tue, 17 Nov 2026 12:59:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm1-00000005mOm-2EbM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:58:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3weq2096581
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DEAmJc2BKBMJhjgbpTTHRF
	sGLFfRdAaxjZhuC9y68F8=; b=YFcyMzWp4lhV3Z/xZxPI3Apu642Ptn83zZ6Y57
	htGLyUD732cvGFKAcz21pea1PRU3bWcmeMUh85cnfC2Tl4C5KFlCVSiPUl0I8PDW
	MXonOHbykPksp6aPE3scE8pu8Z8yUr9ifAHsgd0T5uPOOkrOcYHtVMKcIHjZulzY
	84nE6r/UWeBoTgQiQXuo6w6sRLs/WS0wZ6ckSOlzz/HyFAXWlsT9lPs6KdB4ABe/
	enfaAPER7Q4DqKBHrnSyRiq242RSRLceJnweCBKzlqEEdfKjj7F0X7SoWN2ceWPj
	R1vHRt3x4Gh/fgPuJKc7bRvL1EppzQcOiI98BXq0F47ym5kQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2m80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94607500fb0so370713185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920335; x=1795525135; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=;
        b=VTZia+Udn5yB6/YZOSPKB4B4zHGiv8GeCNKX19uAsPbe0lyT3lmtKi7L/bteodBaHq
         42ikrwU/IpgSdNARTAZShSXHjZeTAdUEfWr9zIvOFMAaF0v1X/pGsowDKIdezgTpDRKX
         M+tGNGBxPgeScIArIh3MnoNvsFvalqph6zR+bhU19qOCfT1OfxiaMi/JCsIK3TGVzOPD
         BmvqbCW2bssFnFxVHh3y2kIgqeNHMQQ8Je7tA7tHj2Nu2G06+DO2iBkuVjrCWh67S79O
         P9fUXebVC8WeKSJtoMws5nQR+G9DLK99ojRX8xN6kDy193Ysm1B9fxSRk+HQcyqPPreL
         sZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920335; x=1795525135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=;
        b=QTaMTS1k7vnxKrC0wZJcx8bNbo3V7AZmEUrDq5VKGg9VJz+0eztGuO0Sf39+PRA9yk
         7h5A/2jiduGjPjJ2oGFph/XQyiYisEF6DPveVaXFn8nZOS7YL5GlHUbQdvogVMHDk1Qi
         6ePs5yBgi/oDiDAoEeH29iQEZMYrc7373ZeVkzr3LJtXuPki2Rw4sRnSKVeA6fqIsqIk
         6V4mMcCZ3mYAOeZWqEEq+hEJ1h51VIo89ZlREqLsiKbysRNsUd67hgJs4+JufrfrWwZl
         Aw29Xw+BdZoXzP2Si3f8IYxMPOwOa7HT9wd99dJKqVKezUEfJYW+BzuP2ScIZz57AH9k
         iJDA==
X-Forwarded-Encrypted: i=1; AL+hErExo5uerNJCdqafip3kmL6yBZz5LKBLIlVzskQPYn5RkaL7MDqMOmvDRfZih8FDBV/4z8uuQR/Ozlo8E/1EUXBF@lists.infradead.org
X-Gm-Message-State: APuU4Z9v6Rryb1oc0CNkREPjUlob/hOW2/dWtue0HdyGTWUnki520/aW
	KL3P1jSehmpH3q5XGp1Mcx8yPge9ubdt6L0Kg7ypMwG/0r25xWPIwGD+MLYOCMSYy0NFhamT2Mt
	gmvXqVkJlN4EaLS9MhdehM+n3v2MQeQI7FO3XqVJnZZ9mbANafIjxikYftVaMjSswTaT1zPkVMX
	Mlzw==
X-Gm-Gg: AYBFou1t8SlKcuHSqBvXnIVfhZ2F0OY7/EjHwfcKmVUIxT8/5GKqnge2kSnuNW6nxO6
	Q2HQGtoftT/GK/XKzTG3RwXAe+zlaElEEwfCCjqOiKjhSVxpk+zXnYCv3orAEdGOyGLojxEPKsG
	jVqYj2JG2eQxgkl4N4wnZ/FEdO1fItKR/hlbZeo1EdimDRP39X6o0E1BwLK+4M+2hBpFwzkPT3F
	Nn3nLwdVwGysMoizdAviELj2tz4qZ7DcTepOAa3uq4UzNKkMqAwEItWlit0nPOdHDlXOL4o3mAf
	+wtASYotVtn1oQt2w64fLlhIKZUXk4sw/EZET0OMmjShXJ7/wVKC97Wz2/PHsVLIReOopS6i0a5
	REmLGuVNvW9aLQrBf4mFjUzA9Fze7Mv6+sAEI2wbneTcyTvQmL7Hv1/97UTjPONek93gRF/Jbgq
	LRwvsfX/Z0AfbmuR+Hdx7++MGV/Ps=
X-Received: by 2002:a05:620a:2991:b0:949:6e15:e1d4 with SMTP id af79cd13be357-9496e15eb7cmr1406041285a.56.1794920334755;
        Tue, 17 Nov 2026 04:58:54 -0800 (PST)
X-Received: by 2002:a05:620a:2991:b0:949:6e15:e1d4 with SMTP id af79cd13be357-9496e15eb7cmr1406037085a.56.1794920334227;
        Tue, 17 Nov 2026 04:58:54 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm5688237f8f.37.2026.11.17.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:53 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v11 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Tue, 17 Nov 2026 13:58:26 +0100
Message-Id: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRS27DIBAG4KtErEs0M7y76j2qLjCGxlJtt7Zrp
 Ypy9xIvWouEDRKM+Bj+ubA5Tl2c2fPhwqa4dnM3DnmD+HRg4eSH98i7Nh8wAtLg0PJ56Xsf+HT
 mfcNRS+08GZTRs3zlc4qpO2/eKxviwod4Xthbrpy6eRmnn+2hFbf6Y3JFjhwaqdC0EqRPL+M8H
 7++/UcY+/6Yl81baWcQFgZlQ0dLOmJKAnTFEH8GAsjCEBy4guTRoE8uhooh94YuDJmNmLwM3hk
 ZRVsx1N5whaGyEYTNSvQeha0YemcgFYbOBhEpUDlwFbBimL1R5mFuebTUGkigKNT+YvdGOVt7M
 5KyARpSVrqK4f4NvMvU5dkGcC44ElrLpmIg7JC7QBByJ61oQTZaBd08mu71ev0FYjXVoyADAAA
 =
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
X-Proofpoint-GUID: 6tabx9BHTg5X93cPq1ShkY6PgNLhbZ5A
X-Proofpoint-ORIG-GUID: 6tabx9BHTg5X93cPq1ShkY6PgNLhbZ5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2onqbMXMiQxl
 UtR54xErVxKxEUcp6KVi1MdUOmC5StlM2A6/dWq0o3SoVTozSZiTgO1I3jzu2zq8HJoCpIQde1I
 bwxyIUafzuOxy9eJq9xC4w/TgOF7pZlCncJo7bg1LCoLJUHgP/unxwAN5OTX+zyrRjDZzxO7Nwx
 QNn7/A7W3JgFzefBsXZm30F9Hj25+3bj2+/e5GMwmeZ/pmt6VOxE+ONrnWuGYL3znmeIDJ8DhI2
 yw0Zdtnw3YOKsUE5hv5/5Gl0N++pfED1VUTW8k8gnzhPFtH0ls2Ec7FiGk5FkAn/+0GywXldprk
 XKTUYqir/uE4UpL5p7tglPdzygsJKljIgt9lmn4gn63nY/J8vVpiD/5fAjuyeF57lEPtqj3z3i3
 FyEEynfUbOLdFqJSxaJqSH3Fr0molpHM7oEsva5exS/Hs5otFKtzs3JFqf7GS9ZZQ6aK7y+R7Su
 sdS+J0kB/zp4TptMbBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX7yjGhcPyzlVb
 ADnWbKd+HNgHqkZP3iwmWk9WCPf03J4JmOlxvwbnG/nZcdHuF3Urgv39WH7CYblqA0ZT/iglD0C
 ZtvilrJ2NUbr7dgTrwmv0s8wk2a28PQ=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc4f8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u4BqklbH0r9NqUsF4ZAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045857_699909_96A131BC 
X-CRM114-Status: GOOD (  18.17  )
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 231 ++++++++++------------
 include/net/xdp.h                                 |  39 +++-
 net/core/filter.c                                 |  80 +-------
 net/core/xdp.c                                    | 113 ++++++++++-
 5 files changed, 254 insertions(+), 212 deletions(-)
---
base-commit: 500da33276f5d81da764775223de9e9a251a4dbf
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


