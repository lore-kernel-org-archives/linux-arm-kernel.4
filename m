Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07117606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hiHiEq1e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wfgt8Rr4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOXCfrJH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=; b=hiHiEq1eIa1Ysn
	SSGc0EB5ANonEy8yzhLt4C1H8gDbtAdKhtfZiWWwW1LvAmwH/PauEDyHITeXbzEmlOZy0H4pEd/7s
	vWKylnwKd/0br0nxm3V59Uqd7LmXEC677Jlzte5I6PiicGEhyMi7dM1gicY8T0UdVlOYV3+ncnwf+
	MeoKnrzc524fy9aiXaoU4vEDipwy5hy3TSHbjbm/QP8KqSagIJSSDflzLnYHeDqp0Sbfv0nP7uxsj
	XSAKr7L0pf3XbmtyhU4fIvYhiZowXWxxwXa05p5eOkfSUJyH1LzP0zpd/lDrCWNOZo7PGu9T0Snqc
	26Xbf+jM2x4/h7iXVLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJM-0000000AEjH-2f4E;
	Wed, 25 Nov 2026 14:49:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJE-0000000AEfh-0wWG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:49:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM5Px539838
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=; b=Wfgt8Rr40icjoFz0
	93eh48mtj38nujU+LArwkZQEXDT6rvi/6D/lBPaxK8DD7Gl2CCLFHMpYDkJ1vPff
	jFPMmLvORF8/SDy2kE6onW3Htf6DTiOO+X0YCBrNecolyzzFB1klAOpjihFr7vab
	/R+hkadWZ3A+/4DlwzX7bkOJUwxOteCIPMULjcIW5bOzvghF9asen2FjJlJZ3h4V
	pcIYCl9aUO7ruZ0yt0zEC39OgeGxHP1MFd9k6mc3G7K2dtbpc7OWGcONyFQB3xCn
	DkPjGbRpfAlkavq7dAc5D1LkHXCY0ULMz8E5QIow7vxqIVvLTN8D6SQ+XA6yYzDD
	q2IMrg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhscey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:19 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4f7d6b98eso84489997b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618159; x=1796222959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=;
        b=ZOXCfrJHNlZCOHqc1y+V8fpiUfYzdgT1mOIdF4bNI4ZW+a9D6PvRk4fEvt+67myivu
         z3MiS40rLCGCry/BS9OZFPHMuF+k2pwb8cmAhrUCOXmaV2xtzJKquYb3Un2h3B/0iUdB
         J0DsK2ncEQXbOvnub13rfgDkqSwlIXa7oh0bzqBuY3UF2fWPvxjoBIwugBxurgqvUntU
         dEiQOldoC6PBdbmTlRmtGKs7ICVBHrBvhHnoaKLcMnqOyOU6lzGsIjRfuHpv9TPYHZXx
         gpTfjzgXE8VGgCNSjQsPo+ChA9/m7oBSZ9IiLnIvI8xc2h0nIsO3msZhCmfJmcq+qvQ+
         vktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618159; x=1796222959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=;
        b=eVrqPpfwf0h6sAPkFQi0RD02nFIPcuAIm08fsYcbEa939QG5BQGXz7duQXq8LrEc11
         kxSpk9c3V1FpNv5HEFeB7JZuNyFjymqusuatMH65f9f/IaJDL7K4ivWb3cjQqTe1mlmA
         N23CS/P+K0mtm9NMPdMjU4c7DAP+ZTzkkZtazNCrnVrpY/sc+hO3jwMjHn6Zo5j/+rKi
         e41bhjm1kt4JSyWzzGrrb1E/5xR3Dmx7ZP2cRyNpKhM+B5SeYenCJcrF1Y5cOnDMXLqe
         ZN9sMLgt4bGkoypWZ8SxQYm+Hs30PeyCHMT5YJ6NYYXkXT20RMvylu46qHHwE3DiX8So
         +ZiQ==
X-Forwarded-Encrypted: i=1; AL+hErGsMeRuzPAU5wwST8hTVucrU/hHNFuk1vm5+nvteiojM60ZUZUwIZeIjXOU4xDbXnPzRvICZjFYL5+9TRrR1aUG@lists.infradead.org
X-Gm-Message-State: APuU4Z9YToAbDFpLAjCZXQzuo+9mBQEd2VuB6VA/L+o8YYwtnoK6r+aW
	cM/akpoSjXzP/UtYXhO0CYNYl1kuEwIaO/EoEtNLZaU94h93Cago+XUBwtKLl6PZO0ag9404opj
	+nh/f6C+PUUIrQ6jSMVGUHK5QC4HQ+T5WDAa4lQaa523/3QdbibECe0MfI4fmfwiBr549a6LVtm
	Y+NQ==
X-Gm-Gg: AZFdTZc8FjLJUOV5aVruleu+4T0ZdbkVhbXUFUOdWae8MVao95bX1bVx+BxhAdxsEf6
	/u4LfJ+bbMdYMcnnNyL6V5ADUfig612b7P/FWNlSLoHiXb5NMcEAeOcb84OYCUN/ng+6Bh1m0pS
	LCgjMNE+cTUJ+C2DcqPCFJwqpc/1qg3DSIDEWpJKt4h4l/BzlfdiW8W5PNf0GL22qCEmIIvLFp5
	1Zi8vId4bmq0TLJSA9CCGApKH8+CK/KKKqU7Lwz3dHa0mxsd5D1M/331z8KSbYW5SXet93527Wy
	T91vkIKJAYvbamQPjOqDfAdtwJP7Txop9wSLb75dwl1uXAFnE6xLfgg0mByZhGYG6DN4SDfv/Tb
	2oTEtCXfyK72whW9yjp2gP8qqmMVsGhQD0TaWU98Hyjq78mw9qlAn72D+xjNbt0A=
X-Received: by 2002:a05:690c:e09:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b5204b991bmr72173577b3.22.1795618158430;
        Wed, 25 Nov 2026 06:49:18 -0800 (PST)
X-Received: by 2002:a05:690c:e09:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b5204b991bmr72173287b3.22.1795618157864;
        Wed, 25 Nov 2026 06:49:17 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm5195385f8f.57.2026.11.25.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:16 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:48 +0100
Subject: [PATCH net-next v13 3/5] net: xdp: add xdp_buff_shrink_tail()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-stmmac-rx-mb-v13-3-0f6bac53e8d5@oss.qualcomm.com>
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
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06f56f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NV2rGKbi5YIghCh-FX4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: 1Dm4DysYvEktwTW0RV-BtmUjF7s38iPH
X-Proofpoint-ORIG-GUID: 1Dm4DysYvEktwTW0RV-BtmUjF7s38iPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX+6dBDCL/9T1M
 3Orw3AQJIGB6gNTNc+ESiw0unI+TTSel9+kjGLL3/UQalrxez1jf9CxShoR6OP20br6nD7pVFWB
 IbDIOlt+KRp4IWS9JsU6W/PrcqqRgks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX5rk5kVmeTuBZ
 HDqYWjsHNCr9ZRZvkC8SkaW01nWPQuZkdQumF612o2J51gOWsY/uRjWEVQV9g5Ly5V3PjEuCAHw
 PfKL6CxZ6WAQD8/NG6nK10DVFLpKo58C9RaIWIP8EzZH02caYGvkhUmv4OJiooqKZgqeeNMvMKj
 rLTOqESy8O6B3XSb6DdDS6FwLnhAH7wRJej2YAYs8kwdpR+09LRatrpdMPS7GcYwPYzkkl49hoX
 Ls9Raw6+JXsOtr4y+ZjirEDX/s51NA0XJWUriscXABc65O9k+I5HsBtlNfgRwgY1EsjpyOlSSpe
 PeGZtJacpWdutp64phgQwE3ylnqt10VjIkhzG3Ejrm0WNIi/8xJqZ9rnqBAh1hkuhVunoffIvb3
 kPFgS+Ot4luZWIerLO50qeB/2CRnkk7sus5u+O0eMv/cjQ0wNPEMy9bD6l32Eh6RuN2X2imr4UZ
 GPV2GuvLHQrVNVc5xGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064920_448373_17EC6B32 
X-CRM114-Status: GOOD (  24.59  )
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
index 07231adfb5f8..02289028044c 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -388,6 +388,9 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
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
index 1d679e8fd649..055931263413 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -673,6 +673,95 @@ struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(xdp_build_skb_from_buff);
 
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


