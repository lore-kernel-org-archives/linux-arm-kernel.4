Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281DD606A88D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aiARtarl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMOTIcR+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aEFgCxIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wusg38HgCb4IaOp5BRSapHlon+L+ha7WNeunLyBc97o=; b=aiARtarlM9oSWT
	2dBqAC2Zj9exk8pipqOH6Fvs2a1WnJjNCSdEU2LNLGoSll6FnpJmgynHVH2+8jwNvHJhiVWLdc7zC
	NUufVwuU10gw8ZriCRBqgzZBtpRKOQGoM5YT9iQQKpVtAuuQLF914QE27liVadtmEHsithKZuwNsl
	xMC01WwshDUP55l5Xz/x/SEt5ozShH2TIIyE8oe9WMIUUCiAD4haHQ9BZXMa1GHf53GRgkv+FzvIo
	tqivLKM8GfKWUDqp2bxr0AyKe6bMzc23LokTVc2knji4c38/ceGwuR9gYF78Vy/JUdyy4xdjX6sBn
	/zdcbSZEZtuOoz6GX00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlR-0000000AbjE-36eK;
	Thu, 12 Nov 2026 16:35:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlA-0000000Abaj-3Oxs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:34:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZjdE3180978
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wusg38HgCb4IaOp5BRSapHlon+L+ha7WNeunLyBc97o=; b=NMOTIcR+krVHn61y
	LKpFviS9NKCyKuBdi4dH0rTrbJmDpQtw5A+t44i3oCzYTZwzdBizBZSCozLNZ/Ad
	jRokNnn01vJwvhypnq/AL0Svphb4IPMfx06lfUbobQ6sIH/lUjiMfH9gFzIuQNsL
	7kTUBEDPo2dRHosoRAU5Q8oXZQt1olTF6nbq+WnY2IyCtekO839acQgsr5bnirlF
	lRhLjv5PwZvcLlUdwj/WXrkAY17QkZZ006V+h7WRCCegfRB+I9Clv9CX6iI2wLlY
	cCthBbfgF22SgnwsvTIB2f432HgYeYXPRRNHGhLxKNj9bnehicaOVBikJCJLinxN
	cDoU3w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j18vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99b92772710so30074241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501287; x=1795106087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wusg38HgCb4IaOp5BRSapHlon+L+ha7WNeunLyBc97o=;
        b=aEFgCxIgOy1VCtqhLLbSwel4tiDWWwgVvS3xdb1lCLoGswBAebxF80gF76vMK2lbEO
         Ks75T4EWhv3ym73/sgo3Vpu0XmTe6pr+8RpLVMSqtnWWCyxB7Va01vOkUYttafTnXYsY
         Lzr2LDlT3vBNzYcbptdXJA9tLVRhGPowc9Z8nm9K1yHj37cF1Q3VEOqrL1xGhnFGg4Eq
         qrvSxSNfGVa3HoCv3Ngj8V37GRkY6NolDLQSZ5Eofl5CPDPh0l7TnR5DaiQ7AWK3S6NJ
         Cb7pqOZLNn05dJU5WLP9KYcutY2pwISnAn+XAnUO4YcWhzjZ8AG51ZS7kF1Q4Nqf7kQx
         AKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501287; x=1795106087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wusg38HgCb4IaOp5BRSapHlon+L+ha7WNeunLyBc97o=;
        b=k/m525fPOy6RrsJs1Ew2XB48zL2URrwaLb4HVF0HyZJwrZOoKJweSERvNxHHsFgiSW
         gqjrWWj/sUuAWQ2l6dggOnxGP4Qf4lA2FfrerrgFI+p1nB4W+BvX3Rk3I/xb+LQKO+70
         SBG9j12mYRI81jj/HlmaMAXGA/4466Sp9ntzKYkF4rzpZoIG0njPa0UuHmW0tVnrhGNs
         XdVuuHBrnfkpsGW2a4NmlFxSqrLZKuMpqZ0Fwngj+nhYPMRe/K9lkNC61/I/I1jGngID
         AuzW87/VI5Vx4qYa6dTTQqa6QBlRY6g+VuEA4z0L/kXTbfd6HZR/lBNAlrMKxkMLYJFr
         J7hw==
X-Forwarded-Encrypted: i=1; AL+hErELS8TlmJBif1QI1NTcSHcsdGDLxi9ubrbuL4waZGUT3OFTnzStD+QiwYL6winz067gBLO02A4/0teFeoBsDwQi@lists.infradead.org
X-Gm-Message-State: APuU4Z8a0TH6ekJGRqoOCblJHVtxKeFpYrZD5ci8aHXLfK2yOlZIyzda
	6H09nCuF5ew82JSeahYDkgE77V3Zsraa4bLmaXj/zeZQH6u67SpskBsVpCscmim5oC2J7oSfa2O
	x+1pLcP276a52mHLpND5WZdXmT27CcQ7b7fNUoecuu4STQro7IXSx6TAyd5sD8czPryweS2GhSU
	Wa5w==
X-Gm-Gg: AYBFou2OlqRCeajvOEZjtwS5oedB/ufVmpw+RoYDVYIhYoSqp4EaeBzws6op+1Lv6/5
	kGVVCL1dFEQR4TZO+IZ7Fi/HjqbJ9Rs3gc6Vi9te5MZrgZUKoZ8vH5dIVs52x0pqZZQi4+psBcC
	lWv/wE3E2EulNvZlVMq9Y/bwZ+Oxn7aJP2G6WfIX99ts09k234Q+SBSsUR0PuNl/cv/jojxKn0j
	YBD2lPM/JLRudQsqBwHjkcbm7DLGGHEo5rwWTIMQoejkBrityOc9f+SfFbOpDETpysvSh+tpSAO
	tJLWvYJwJV6qOUsYHRBKaoD6p8zthcNhhYGgJvych8b30uO3Xr+e/agISAIqwJkoh+fwDlSEAne
	P4hWewHXD+QrMwbkQ0J9Pef4XTyr93/0z65HuGNAvhdghh5fNF/nmbmRanAa7JAQ=
X-Received: by 2002:a05:6102:6051:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d5061fc3c3mr2720226137.31.1794501286902;
        Thu, 12 Nov 2026 08:34:46 -0800 (PST)
X-Received: by 2002:a05:6102:6051:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d5061fc3c3mr2720208137.31.1794501286355;
        Thu, 12 Nov 2026 08:34:46 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm130165f8f.35.2026.11.12.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:34:45 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:34:11 +0100
Subject: [PATCH net-next v10 2/4] net: xdp: add xdp_buff_shrink_tail()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-stmmac-rx-mb-v10-2-d3d04b65c6bc@oss.qualcomm.com>
References: <20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com>
In-Reply-To: <20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfXyOzVIOZPyoHE
 I/d0cJyNrgRNaLYib6H2nZhWX3ZRZWdG0397Hwk6NDxZwOTjtfgZRRCnd7fU5D1nDwI359fDfxI
 D3WrqWY0MMGp3sj839mvr23odPfYYgs=
X-Proofpoint-ORIG-GUID: jBSMQhoQgL7hhbBXghLshPQ3Q6yR5nqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfXxJ/n891tfema
 CdtBSlczGzgH6nJF4bZhE66QhaRyKvdiRruQNCw7LWGNUJBxp4XgG6UYUbapKY1nkoWg8leujN1
 v5rPQkCDeRPTE4Z6Vkmg8O1ZHUU9iOOX4PVcLwEIN2fltPS80muF+gPPro+OoGASqG6iq6JEF8m
 Kjujzvfn3oodarkUOyygrANa3vfd7fxajULy9UZalnAjW7OXO2/kH7m6Rf5w4psAbgmuZ38S2Ob
 66SJOhDaA7uTdGOpiVivdWxhlUoQRPcShNOIkXmq9p8W3dF/rHc5Zd31iLFqP+GFlQdMU8KJgA1
 LmqT26JFbzIfoWdwxs14RLcW7gkGWkysc3dtnBO6O4yC1rHY4yRjFeQjE/qvW5bLAxvyRN/zy0P
 UqDRyUvo19i6mTk8h9nAQpQ0WWESkTC4aUaZ1u/z3qrXIWCjv/F0+cl6cjDY/EOePEYudbw04zU
 u5rFYPRT4qX4KJRfRSw==
X-Proofpoint-GUID: jBSMQhoQgL7hhbBXghLshPQ3Q6yR5nqW
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5eaa7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7V0IxQAAFVITDsu0YkUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083449_152422_7F9702DC 
X-CRM114-Status: GOOD (  24.65  )
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

Move the XDP tail-shrink logic out of bpf_xdp_adjust_tail() into
net/core/xdp.c so it can be shared with drivers. The frag helpers
(bpf_xdp_shrink_data_zc(), bpf_xdp_shrink_data() and
bpf_xdp_frags_shrink_tail()) move along with it; the latter two are
renamed to xdp_buff_shrink_data() and xdp_frags_shrink_tail().

Add xdp_buff_shrink_tail(), which handles the linear case too and is
exported with EXPORT_SYMBOL_GPL() for driver use. Unlike
bpf_xdp_adjust_tail(), it takes the number of bytes to remove as a
positive value; bpf_xdp_adjust_tail() keeps its signed offset ABI and
passes -offset for the shrink case. Negative offsets are rejected.

bpf_xdp_pull_data() keeps using the frag helper under its new name.
Behavior for valid offsets is unchanged.

This lets stmmac use the common helper to strip the Ethernet FCS from
the xdp_buff it accumulates for a multi-descriptor frame.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h |  3 ++
 net/core/filter.c | 83 +++-----------------------------------------------
 net/core/xdp.c    | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 79 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 3a25307e1d67..1ec49f7a9d7a 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -403,6 +403,9 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 					 struct net_device *dev);
 struct xdp_frame *xdpf_clone(struct xdp_frame *xdpf);
+int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset);
+bool xdp_buff_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
+			  int shrink, bool tail);
 
 static inline
 void xdp_convert_frame_to_buff(const struct xdp_frame *frame,
diff --git a/net/core/filter.c b/net/core/filter.c
index 9b8d5191c4ba..5ea45dfce7a2 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4438,96 +4438,21 @@ static int bpf_xdp_frags_increase_tail(struct xdp_buff *xdp, int offset)
 	return 0;
 }
 
-static struct xdp_buff *bpf_xdp_shrink_data_zc(struct xdp_buff *xdp, int shrink,
-					       bool tail, bool release)
-{
-	struct xdp_buff *zc_frag = tail ? xsk_buff_get_tail(xdp) :
-					  xsk_buff_get_head(xdp);
-
-	if (release) {
-		xsk_buff_del_frag(zc_frag);
-	} else {
-		if (tail)
-			zc_frag->data_end -= shrink;
-		else
-			zc_frag->data += shrink;
-	}
-
-	return zc_frag;
-}
-
-static bool bpf_xdp_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
-				int shrink, bool tail)
-{
-	enum xdp_mem_type mem_type = xdp->rxq->mem.type;
-	bool release = skb_frag_size(frag) == shrink;
-	netmem_ref netmem = skb_frag_netmem(frag);
-	struct xdp_buff *zc_frag = NULL;
-
-	if (mem_type == MEM_TYPE_XSK_BUFF_POOL) {
-		netmem = 0;
-		zc_frag = bpf_xdp_shrink_data_zc(xdp, shrink, tail, release);
-	}
-
-	if (release) {
-		__xdp_return(netmem, mem_type, false, zc_frag);
-	} else {
-		if (!tail)
-			skb_frag_off_add(frag, shrink);
-		skb_frag_size_sub(frag, shrink);
-	}
-
-	return release;
-}
-
-static int bpf_xdp_frags_shrink_tail(struct xdp_buff *xdp, int offset)
-{
-	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
-	int i, n_frags_free = 0, len_free = 0;
-
-	if (unlikely(offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
-		return -EINVAL;
-
-	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
-		skb_frag_t *frag = &sinfo->frags[i];
-		int shrink = min_t(int, offset, skb_frag_size(frag));
-
-		len_free += shrink;
-		offset -= shrink;
-		if (bpf_xdp_shrink_data(xdp, frag, shrink, true))
-			n_frags_free++;
-	}
-	sinfo->nr_frags -= n_frags_free;
-	sinfo->xdp_frags_size -= len_free;
-
-	if (unlikely(!sinfo->nr_frags)) {
-		xdp_buff_clear_frags_flag(xdp);
-		xdp_buff_clear_frag_pfmemalloc(xdp);
-		xdp->data_end -= offset;
-	}
-
-	return 0;
-}
-
 BPF_CALL_2(bpf_xdp_adjust_tail, struct xdp_buff *, xdp, int, offset)
 {
 	void *data_hard_end = xdp_data_hard_end(xdp); /* use xdp->frame_sz */
 	void *data_end = xdp->data_end + offset;
 
-	if (unlikely(xdp_buff_has_frags(xdp))) { /* non-linear xdp buff */
-		if (offset < 0)
-			return bpf_xdp_frags_shrink_tail(xdp, -offset);
+	if (offset < 0)
+		return xdp_buff_shrink_tail(xdp, -offset);
 
+	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
 		return bpf_xdp_frags_increase_tail(xdp, offset);
-	}
 
 	/* Notice that xdp_data_hard_end have reserved some tailroom */
 	if (unlikely(data_end > data_hard_end))
 		return -EINVAL;
 
-	if (unlikely(data_end < xdp->data + ETH_HLEN))
-		return -EINVAL;
-
 	/* Clear memory area on grow, can contain uninit kernel memory */
 	if (offset > 0)
 		memset(xdp->data_end, 0, offset);
@@ -12839,7 +12764,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 		xdp->data_end += shrink;
 		sinfo->xdp_frags_size -= shrink;
 		delta -= shrink;
-		if (bpf_xdp_shrink_data(xdp, frag, shrink, false))
+		if (xdp_buff_shrink_data(xdp, frag, shrink, false))
 			n_frags_free++;
 	}
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 470bf90d93ef..7c98dbc2a770 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -672,6 +672,97 @@ struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(__xdp_build_skb_from_buff);
 
+static struct xdp_buff *xdp_buff_shrink_data_zc(struct xdp_buff *xdp,
+						int shrink, bool tail,
+						bool release)
+{
+	struct xdp_buff *zc_frag = tail ? xsk_buff_get_tail(xdp) :
+					  xsk_buff_get_head(xdp);
+
+	if (release) {
+		xsk_buff_del_frag(zc_frag);
+	} else {
+		if (tail)
+			zc_frag->data_end -= shrink;
+		else
+			zc_frag->data += shrink;
+	}
+
+	return zc_frag;
+}
+
+bool xdp_buff_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
+			  int shrink, bool tail)
+{
+	enum xdp_mem_type mem_type = xdp->rxq->mem.type;
+	bool release = skb_frag_size(frag) == shrink;
+	netmem_ref netmem = skb_frag_netmem(frag);
+	struct xdp_buff *zc_frag = NULL;
+
+	if (mem_type == MEM_TYPE_XSK_BUFF_POOL) {
+		netmem = 0;
+		zc_frag = xdp_buff_shrink_data_zc(xdp, shrink, tail, release);
+	}
+
+	if (release) {
+		__xdp_return(netmem, mem_type, false, zc_frag);
+	} else {
+		if (!tail)
+			skb_frag_off_add(frag, shrink);
+		skb_frag_size_sub(frag, shrink);
+	}
+
+	return release;
+}
+
+static int xdp_frags_shrink_tail(struct xdp_buff *xdp, int offset)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	int i, n_frags_free = 0, len_free = 0;
+
+	if (unlikely(offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
+		return -EINVAL;
+
+	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
+		skb_frag_t *frag = &sinfo->frags[i];
+		int shrink = min_t(int, offset, skb_frag_size(frag));
+
+		len_free += shrink;
+		offset -= shrink;
+		if (xdp_buff_shrink_data(xdp, frag, shrink, true))
+			n_frags_free++;
+	}
+	sinfo->nr_frags -= n_frags_free;
+	sinfo->xdp_frags_size -= len_free;
+
+	if (unlikely(!sinfo->nr_frags)) {
+		xdp_buff_clear_frags_flag(xdp);
+		xdp_buff_clear_frag_pfmemalloc(xdp);
+		xdp->data_end -= offset;
+	}
+
+	return 0;
+}
+
+int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset)
+{
+	void *data_end = xdp->data_end - offset;
+
+	if (unlikely(offset < 0))
+		return -EINVAL;
+
+	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
+		return xdp_frags_shrink_tail(xdp, offset);
+
+	if (unlikely(data_end < xdp->data + ETH_HLEN))
+		return -EINVAL;
+
+	xdp->data_end = data_end;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xdp_buff_shrink_tail);
+
 /**
  * xdp_copy_frags_from_zc - copy frags from XSk buff to skb
  * @skb: skb to copy frags to

-- 
2.56.0


