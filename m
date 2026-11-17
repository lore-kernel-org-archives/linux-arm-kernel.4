Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pD/rSyzU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avF3v8DL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=irRFIwrw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=pD/rSyzUvHbpI0
	c0LoN8qR1KY8LxucWSRjG/LHzgEO15u8lIh3JAU+eKBQ6uoJeRj95+DnaCTXN9DFKm+EaPJ8vZdbP
	yyIvZ/3eCgSyCob4qPB3VYSoHgBzDkfrJH997sOAmO5AMlGTfyqR+kTo1QQhPskdiU9C7jesNzqWo
	05clYUQGWtJ1+lMsR3kWcB0WPa5Ogw411T9ZUc32iLKk+qsjTsC97HnWRNPWxeieX9FuW5Lww1q6I
	Y6IUjnaG37dKOhchHtuBHYLWQ7lTBUnkxgBiDNqxsHNMXBR9EiPffP5K3NLahyueGcc1us8kN44VH
	FcpPiHcI9vq9EtVOXl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm7-00000005mUh-2SSA;
	Tue, 17 Nov 2026 12:59:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm4-00000005mQd-0llG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:59:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1JC62756001
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=avF3v8DLBqGJvYX/
	uU7FsXtWNt0U3g/5JFdi55GUi71jd/cDQV8ZN4WdSm43bEG53AvSu4G/sndntDF/
	JlGAoYu44a9EiaI51VFCxNwflm7kcHhclwrqPxf0T2EwXIFASRetv9K/FDBXGLT6
	mRXp7W6lKfeFquq0JFgiQiWF8Qtf+SV0+cvW0GWCuo3slcAV7zTNJvdKMLkcHvjh
	g2OeJ1MsAzy02iaU+q3tfgD5pYOrgAJIhuLdF8DOMYTqPivNI3A8uhMov/B0zODP
	9gsdY0vyyL1U2yQCv/4rNa/A2FolYOjFdKuvkt7lMXEj5hE3ujcwEQzWvUAZgFsU
	NXU9Qg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuhyhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ef6a9f18so3167695137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920338; x=1795525138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=irRFIwrw+01CiDBMUCnf0OM0fiyY2PGMRo5gBLxhNNrsGOhzTFeoQ+v+nYbTv4szvj
         4ERbaej9Bg4BlToctbyYW5kp8fI0WpnOein4iDv+IJ9MZMXe+1fbuPAuuJLkfGaddON/
         huSh1ZUavnwYCmwt5ugXpRoxGJ4EcBx7+LjNmmzrOwRFdm0LTBsRLk/mC2auLSNOejuW
         00pgbMFsiLg/3wKbL4zbHABNv82zEmz78K+gySffuAfd7vusw8YwuXSNUgYYlbgDjxdc
         Ks6wiFmm7vwGm7jMh1mWYMgAWKxkEXweTEd2ERSU58+MOhHLxHuG5BD37kZZP6UsFY4j
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920338; x=1795525138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=fLZh7djVyJQsA427Asmyx/fkRQP4lPTHyDYtNveI9VZghwvOCXG66TfwT/MOtsooZw
         b7+jBI2mrnwPcM/hTlkOWEFzhf7pnFrEXqc4yjBfyXArOf4LxnEDBs3URzFKWKHUSL3/
         7sBQaK2rF0pm1/vWW2vl89oAYci/NCnLt8tAMi9uRg4G7d4j9ptW3fEP53t8VQ1i6QwS
         VtwW67KSDH6MqFOUpNhfUiBPcK9ADRkh0VBg2ytOayHbkwm1Siwm8jsDXG8cxeICKUz1
         AtYEMJuWV+3XNTVLzLIKr51LKHUP+e6n6CQACco13PlKChWDyyQXbQ2Pi0yotzy9K1Me
         z3Sg==
X-Forwarded-Encrypted: i=1; AL+hErEpWfpUtUiwoWsHf7jRAkaPsKDLMafy0fC0RUuayItDbTgS+lipNuAWeGOSuf5NTK5GKYSYGbGFrfRjRCM4Ysnw@lists.infradead.org
X-Gm-Message-State: APuU4Z/oIVrszUpcD9Q6p4c8jskp3c3q5x27o6MmtvgXwR5LRzR442y+
	vQhl6Da+ELnG2KoDLZRAi+32euBX14jBM5BsL9HJo/QzoJdLv63NxU0SFpqYuDuZO8xZw2Y9WJl
	/iiN4ljbmQGzLbPi2wocHj41vLoAezJ81rCsGmWKiruquEibs0q1/SYwDFBOGMzzLtEjslNCrZZ
	aJyQ==
X-Gm-Gg: AYBFou2zLMBuYmWITSKIMog9LCUxfEQBr+jUHOWqetJS/ZxuYJeaB8kB9ktfqowKuTz
	6cOdMue0inknjMb6+KC9N08n1EYu6bwCfmLCfhKpjFK0o9QKEroiL096C7MEiIBsGfgleLgO8vC
	wPQCcpJbUlkog3pIMa4hKTqsetiqs5jWoQWJiC4G2D5BhOuiJMH66XHCcLc0IZJnvM6++2AFIex
	c48Zw+7cJPuPQlk5fv+/0OBycp7Oy56op0F5m2k6aM0gPK9RKQbBq+LLIQIdJlI191ALzmNqwdr
	iKU0ks7/dSxna4H7KEugvpePVqZygZ8CLa+UYqEO5YBe+vH6y7ytZrEYIkTHpfxR359QjVJq4Ry
	Dnzp2KTO9eQWMITh5Ay+hfOlg6mbAaFE+RMxHGEXyCICT290BPEtwcyysvN9rc/o=
X-Received: by 2002:a05:6102:5112:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d64d6ca8c4mr5116916137.13.1794920338287;
        Tue, 17 Nov 2026 04:58:58 -0800 (PST)
X-Received: by 2002:a05:6102:5112:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d64d6ca8c4mr5116906137.13.1794920337768;
        Tue, 17 Nov 2026 04:58:57 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm143431965e9.2.2026.11.17.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:56 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:58:28 +0100
Subject: [PATCH net-next v11 2/4] net: xdp: add xdp_buff_shrink_tail()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-stmmac-rx-mb-v11-2-9fa5c34ef245@oss.qualcomm.com>
References: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
In-Reply-To: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX7JRnzLxPOl3N
 ab06G5FPt4gdHPowRKi9qh/VyFf6e6UvYkMOtfMkZTF6zbMEPfmq2stZ891GbhTClE5asXxxtp9
 PpCWtDi+iEFbu10LkBx/8/HY9ukmIMby1qZ170ZfmxY1KYssiDINO1Mx5EQLWFzDvVT7lSvg314
 JuHgC6D35O0h8lXNthywixjenwGIAXL9t4a/laSeLEXwZ+7kpzfzu4YGVadudepULUMt8mkgaDA
 uSomv7AU4ETdvSjruDhI6DSrudwFO62fmMWTIHLfsvjiXTL2tDxHJij360muWFM83/ob6UUrXd6
 9tENkqu8gb6HzjDadlcPH2bmaiv6tCR1ScVarSVFlyBEr+oa28/zglzJIR/JQUZMH1SfbuO9UHB
 D2c0pDmt0VSPCaoChN1WcwbyEwyc2QsqavcGHljxU6a0LK7/QZNg+v7JT10RIJBLOGANFOWeoSb
 FQSZERLB7OEKwNUa67Q==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc4f93 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7V0IxQAAFVITDsu0YkUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: kyKxFd_0aF33LO6n6O9pFuhoDseTXwVD
X-Proofpoint-GUID: kyKxFd_0aF33LO6n6O9pFuhoDseTXwVD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3KWpL8QU4yRJ
 AoiY+XuUBhX8jQ7nM7LU5eVLzG5d9JGoQJWXjUn3E1dev5g4kbF6dyqYXftx1806mYt6M6QQ2Y5
 5fMH+bgWMpfUFoe7KL30pBOFsUxAMzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045900_368822_A6D3CF88 
X-CRM114-Status: GOOD (  24.76  )
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
bpf_xdp_frags_shrink_tail()) move along with it and are renamed to
xdp_buff_shrink_data_zc(), xdp_buff_shrink_data() and
xdp_frags_shrink_tail().

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
 net/core/filter.c | 80 +++----------------------------------------------
 net/core/xdp.c    | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 76 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 054748b37d7d..3400775d179b 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -415,6 +415,9 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 					 struct net_device *dev);
 struct xdp_frame *xdpf_clone(struct xdp_frame *xdpf);
+int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset);
+bool xdp_buff_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
+			  int shrink, bool tail);
 
 static inline
 void xdp_convert_frame_to_buff(const struct xdp_frame *frame,
diff --git a/net/core/filter.c b/net/core/filter.c
index f42ecfb5841f..cdbb54a10b0b 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4438,88 +4438,16 @@ static int bpf_xdp_frags_increase_tail(struct xdp_buff *xdp, int offset)
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
@@ -12840,7 +12768,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 		xdp->data_end += shrink;
 		sinfo->xdp_frags_size -= shrink;
 		delta -= shrink;
-		if (bpf_xdp_shrink_data(xdp, frag, shrink, false))
+		if (xdp_buff_shrink_data(xdp, frag, shrink, false))
 			n_frags_free++;
 	}
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 0db2f68afc5c..acad82982d77 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -676,6 +676,95 @@ struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
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
+	if (unlikely(offset < 0))
+		return -EINVAL;
+
+	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
+		return xdp_frags_shrink_tail(xdp, offset);
+
+	if (unlikely(offset > xdp->data_end - xdp->data - ETH_HLEN))
+		return -EINVAL;
+
+	xdp->data_end = xdp->data_end - offset;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xdp_buff_shrink_tail);
+
 /**
  * xdp_copy_frags_from_zc - copy frags from XSk buff to skb
  * @skb: skb to copy frags to

-- 
2.56.1


