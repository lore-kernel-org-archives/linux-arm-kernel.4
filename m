Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4cKyeKzF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btv88EO4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhTu39DO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=4cKyeKzF7FAqC/
	tVRp9aFNIe5l34M7w41Oa7414EhlJVw6zqga2Evb6L0M//0jr/3BSbUS4RwRB1XEshgY2wJG7Xpgi
	XZQFQmB0JlDgK3Nixt6hu7Vp4XKtp0YvIijUHgdqmJ4AHzITO92HxwdI6l178JDB/6qGotoHDEu+L
	YDosgrjPmV9nlFDQaRGlsZnS+qhtkhnROSKqZVfkCfo2t8krUUdlRQ3ukds5Z+MbqcR1oSPt5cKvN
	3bxTrU3FQ6Fcsqpe6ynBmcdivTjAyukX9MtkrQFt6x6VPNNjGVeHB7P2HgmYl8e5mO7Ihol3OdRgX
	tQw+xjAqRdFrBr25CuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotL-0000000HaG2-2Alk;
	Sat, 21 Nov 2026 17:28:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotC-0000000HaCT-2xWp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:28:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa2OT614157
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=btv88EO4gLrE/wpV
	APU4YEKHiGrjzbTl3s7A9Xdg4MR92ZdUmE8JgJZ/pIIxZoHF6+zgW17giNC2zrIC
	oZXFUeB9DYA8dyMw3OinB27J5b9ng316zd1bx8EP9uFVCkyaguYb+WcdnSLf5IlP
	l8IwZRRUy1CcQl7G9yYOUdPeEvbLmK3tE1OXqatFm4XqdvtioJa0+qRHDXcV7vl5
	eKwryv7vxbpNrfXXOCkxF/BNQnV65wZQ5nO6JesplMl3D/2wT4k9DkDSRTTMbbNr
	X55RzipZmnoB4HFurSTpBhyDGMn79JqYpiSoB/bcvO7pTpMHbW8JVy8LEw5jzTMX
	hxRkCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mg9rc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so338912785a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282117; x=1795886917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=KhTu39DOlQ4OAPehNcOgekpmT/GbPmGI+MVDIVJY7ti/i+lwSdgnYUBtHo+XSFzf8t
         q0vMvnwkfzoV8iwM1qnIL81zsl07gm3JFfjjAueX/SKuG2vNpHPTGUottf/IH7DkyMsy
         hU8zpMDqSf8tA7U7xim/jb8SSM+PE70bAV31wJgXtqbJiaDVR+3nrUch/AANJMECnBOc
         ixJov3C1TiCS/21XGn4b6K1Y/cYF5eDY/50DMj6vykIfg4sQnfqOFmUw0cC4ma9u/346
         LM2KSg8CtHKlfc1Y/uzTrggHnoKrP9Lwi0bxSLDvCCnBI7mviCJXep0QWqAzsEK9K0h4
         2CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282117; x=1795886917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=BIeXmtX+pfJx/om4WkN42ui5AOkD+EocVwYebmd7fXhWRkBoLPnM5TELJknnciNtRg
         6tMX5KseXVbqifzItOjKzaGgHFU4CXpr9eyDKJ88zORWQ2BqLHmxl6zEdp1fYk+H4Yyq
         itKaOQkT/o7eHOkr0JRhqqJofT9ibBif89mWBhLa/tQUCDPoAnc7vH3/cOHEDtMKfl/q
         ei93w1bufHhfrsZzRo5onoYETQ1DDOBWl0WAxhvUUbRIYYWb5ChzjsntMDOaXJW/I4rP
         8w/0d+WvX6EloMY1MH5Pc7mSIgis2KOSUWHZhRGkqGKraMC5+VCvBaETAAzr8BoI/LF6
         AW6g==
X-Forwarded-Encrypted: i=1; AL+hErHZj59aoxxtTMnIx7WMfb0HGCzhkLQ8RGDsxgNbgR0U5AaPEPV9NEMs8GPnO9SdANPlzxbyba4f9XmeqV5/D7Kh@lists.infradead.org
X-Gm-Message-State: APuU4Z9RI8tnMgr1seyh0/7ZTtCgnbgIZCa+4ruVMSEBYVuIJyL+Yufi
	0muflbX3M/zoc5VL5RSu8zDD5XFMsH3oItgcvZxfX0XyMkieCOMP4NpoGwZgH05a7Rkn3NGFDeQ
	L6yeh3aC31FnT7MzXeeYIRFhjOizUFBFly32gfPKvKTmBUxem/Qzg7qupY5mN+sU8wBKj/iDBHS
	CeCmYp7cEdcQ==
X-Gm-Gg: AZFdTZe8YMqhu++2Qa0Ec1QkqPU9yDuoxTUu23T0vEi9ExxVquBnM2WRZz738HHRGuz
	eJZr4YVPIGmAVl1Vv5tHiOn23I5vjywFHIoksM2hIgv1b8uVLN+KzdNN1k+JttKk7k9aSh522j8
	hBjLcIrmqvLqIks5ogZwTvK1u78XfRxklamQp/LfyvYWsIKHSAqW1qaqp9xIZ/7xPYuqILX+O1i
	3ATX9BXkHiiUd2yOI4MN94IXU6VXx3CeRFL6O1iC7tQl2YDA++A7MMRAx7Bmpcw+ojgJ2MmHlcP
	9OJnPFHKkNaEjwJzZj35E5jUbCB0faCNZsmm5Q7fdQp1abOusplOX1/pXuJvtOqflQSLv1qBz5R
	4WMsK9Onynt2TRx+IfvbPw+YCO4q9uPB5FyXXPXxyuUr0R/o9ZFJui9B4WnXpq8c+k8bSZjZKLR
	4RkBSKrcwE8qjZr8GYBU7L8EeU2Gk=
X-Received: by 2002:a05:620a:6508:b0:949:6e1b:7cc6 with SMTP id af79cd13be357-949ba690a5fmr1084230785a.0.1795282116897;
        Sat, 21 Nov 2026 09:28:36 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:949:6e1b:7cc6 with SMTP id af79cd13be357-949ba690a5fmr1084226785a.0.1795282116313;
        Sat, 21 Nov 2026 09:28:36 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm12685687f8f.54.2026.11.21.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:13 +0100
Subject: [PATCH net-next v12 2/4] net: xdp: add xdp_buff_shrink_tail()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-stmmac-rx-mb-v12-2-3ae2f3bce174@oss.qualcomm.com>
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
In-Reply-To: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX2Hu4jhmavnM3
 oIK2hjtJWpZmTjNmirgv5XVA7y7Fc422RRFWgsjDch0ssLqrTaKu1uquiRQprZXhCReWkG56jQk
 uj8myHjmuPCVnzSQuwegbbOBj7PLrLvaXfSxdVIyD/r7PPrLJV7mbtmKbS8Mfzu4aYlf8930u0R
 LMv0DeSY81/E13PtuzMLP3OxDX9QHwy/JdiFZs2vWMoQqU6qFY4s8S3GKHAujkVpJRieGSHPjp1
 Vp/4wCM/doPaWh4luy2HngkGOkiI6zLmCmOugoMvZSQfuLBmfVVVNIshJUMwbnwDLX39ER3RU0h
 l1sGQlYsqLzU+7ATKNlG6ImoNsMrUvKyAtC3gE6rgPmA7S+GcwCVFhKfBoqaXqpU2p//QC7PIzW
 zXc3FYD8ODL+0eGv8RNaUoswWeZRDnV8P3l6oYWjN79FGnhvqlWQIad2GWNDLPgch+s/Ms3RQSM
 E7o3BlKI5zY/T7oJqyQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b01d4c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7V0IxQAAFVITDsu0YkUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfXwHs+68TNyXgN
 /fG5ItEjYHJugborbQUVu9PjQEBYNRzJNkS5cp9DyfEMCZ4V3Tge4vNDBdgoLb8f/Ikj7EyY6rb
 ahAgSpPWRIAitNDVD0lfkcvI6M+7CQg=
X-Proofpoint-GUID: sGsFYG92kw1E4s-5GVu-pma7vY7LPwNX
X-Proofpoint-ORIG-GUID: sGsFYG92kw1E4s-5GVu-pma7vY7LPwNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092838_894572_92130501 
X-CRM114-Status: GOOD (  23.99  )
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


