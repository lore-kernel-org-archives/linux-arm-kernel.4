Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBF606A882
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xevyXb0M;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQQi5/oR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ebo1Ou5l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=; b=xevyXb0Ml8U7/P
	W80PTjslf9Ac4OFnh3a1MHMKPHwRoJYeUFmLwqTa8iwkATqlljVfYxUPspvpqx4uNuZwgmhnQuMOC
	GOnLKfvKBOWofB6Nu4jKHncuK3JGfJXpFWUxSbOGljLNDV4BsgiEKp34BCEJGeqcKhFcymr+i4PGP
	nI0SLc8UxhxOGRpEsTcOg70MnTxL9H+YVFt7kBfBy/wYFgw0Ml/1zldXYZ04LFzSaRNSgLzSGmX+g
	qDwvv+pMlHEAA1aVYGD9PE+RrO9lbWSCPe1cMkYYWLXIeA//QhbDkOKqdRLeMsgsiz14VBCNf9Uh1
	mv+QhWUT/u0+p5vXhWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm4-00000005mR7-2r2q;
	Tue, 17 Nov 2026 12:59:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm2-00000005mPP-0H1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:58:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0skR3048030
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=; b=KQQi5/oRWvB62OxA
	M9dhh1/XSNzwLUcrvTvdkr/g75f8xuXqKO2vi0eTx0xAkAQ7mzmAS1hf5PNFh8T4
	iBRHOKkcTQQ1ch3mL0XWLmX3Ydlr+Q2M9T887ttU5nOB/w5svUDlohMQdIHw4Czp
	Cn7c2lskk2O5CL7joAMi7C4jm6AiF2kRzdYai+cWuMQLb1xkHWs4WcvLWyxuPXub
	aYtbfMbuVPgLxO8Ou9o48o4mPTnabt5oBtXb5YOi87S66DT6o37t96XltbCIJ9WZ
	eS81xG8cdm4gn4pNSN5R3K2x0/M1Ohkott/WBxHTZRG5kW+Fl7mXRDa3KnJxs/2p
	AeZjSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10n6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:58:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92101559a2bso11734866d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920336; x=1795525136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=ebo1Ou5lH8gZb/KIeqGHjeNFwreqMfCfUA0tbyVq3FGQi3NxKuVvvFoQs4ypQNQ2FM
         c4mhMRPWchho6Gqyq22J6vMLlA2N18NezdzBAqpub+4HikIepVFx9XwmF1OhZTEiC/fg
         1l9PGRMPSclHZUqttAAIxUtZHIK9k71+3L1ZXFA1NDAB0yMxZ2hrdZnD5n869myIQ974
         WZvUtjm9pPYmsm4k5XbsfNbFd0MPx5o5iv34KuiJsfKI0KZypWmHv7vvhTIHcAZpptwO
         AvnCIW8/EZa6Oc6gx8QgvwQx8n+5vUp5cfyDX4bzwNgMCd2+fRlSbibO1+4uAEi4lGBv
         ZI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920336; x=1795525136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=llgavJvMQhdsK5zvloOZEzj1ctN76scRKI2KrHejAfTDoThI1QO87/qT+WIL7t8DEH
         Er4e9ew0MhXDT9Sdmi+gwdkxPbOe78A6q6eHYDkYhCayTttZa9z4G6/N4ozuhjZ3I4Ao
         kly7kUT35/tGObxzNSvqz7MGFx9rjxdJ1VFHI/nmKj8pxTWervaVHv2CSSrv/FI2R6Ub
         swYx3ZOzlTjmjOMxxrSeDI0dtOvu+ayOAeIIQ0CNd/iN/gwnN57OlT5sHfwx1FfIXEko
         uq0FNeD5S1y69GAwVNAjUVo831y164JV5T1m2xtNpG9jBIAMHTepOFH2g2dKauJPOdI8
         8C3w==
X-Forwarded-Encrypted: i=1; AL+hErGv0Q0mI0RsPuX1ItmeCkg7gaa5KxaTmul1+4oT/4BOX70GUUlyayiKEaqQ4+Ghr1uotc73aw20ILSLGBR96z8B@lists.infradead.org
X-Gm-Message-State: APuU4Z8FzW8l9TYWXAfB7D+Pe2w4IDiwxSqrrQ56OntwzJC/3e91UTwR
	DDkGtMuHcwFgdiyP18FqTHoBxH07XNBxcUoUu4SLdK8zz4/BXzEe6McTI2stq/ChlnEODJzgfIl
	OFso+PWSbxdubhNmAXldvVJNBnjYtWphvZspVO9At00hWnzkd5p9QWkFVVZVfttWHPb3FW/Nr7a
	cUBw==
X-Gm-Gg: AYBFou3LJpNvP3y8HJQC8yXcsdYhcZuBqPSE7p+lpkLBTiwO0m7tYgfnjhqgu6N8MXX
	mA6xf5B6LWGWGeBHC0AMwWfle2zX9jPIFedZzWHktCidYibUUgNsWVoSXhcMvqcSGdKmyojSurE
	JDe+esZU9ykHHRmLpwlU99VrAGpnRo1+8rR2FXhWNAbRgzkSVs4rUH9bsMvMcn2sq+f5ntrr1Lo
	J5pJgrwjcC07F2Qh1jewTWN15ioyJKYP4MXxDD4Rx+YXn9HU9TsNzn1LhtEMQ1dSubhk1seK/9S
	bcf5SxbVnXYOGgiqANIlY9acp7geJileMfrNHJNjiULOsnaT+g1NA/5D60ic7+UzEoPu4Ox8Aoh
	URxhIYOuhU2vHGit8FKXP6eucaQYhHdHBjag6MSzSAaRWDoIw+GZpQlrXbiVNNVPJY7tGwoMiJi
	dWhqyqkz7Uwo2w9ctbCnx1slBBKCA=
X-Received: by 2002:a05:620a:684a:b0:93f:3358:3ed7 with SMTP id af79cd13be357-9494bb399acmr1976653685a.54.1794920336327;
        Tue, 17 Nov 2026 04:58:56 -0800 (PST)
X-Received: by 2002:a05:620a:684a:b0:93f:3358:3ed7 with SMTP id af79cd13be357-9494bb399acmr1976651185a.54.1794920335795;
        Tue, 17 Nov 2026 04:58:55 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm5688357f8f.37.2026.11.17.04.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:55 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:58:27 +0100
Subject: [PATCH net-next v11 1/4] net: xdp: add __xdp_build_skb_from_buff()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-stmmac-rx-mb-v11-1-9fa5c34ef245@oss.qualcomm.com>
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
X-Proofpoint-GUID: w_EqWbg7awUXYGQi7VpKJQ7ljZB-mcox
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX4HOH0v7K9Hw5
 VrIcVrfWw9G7d+LMcK9dIxTD/s/lmLshYX7Rmak0M3q/T4P8REbp+aBVosGOvKpZtnHPaZq8Fb/
 sCGLvvPfNhoBtJ0Ojr+g+wxg1c7lHI0=
X-Proofpoint-ORIG-GUID: w_EqWbg7awUXYGQi7VpKJQ7ljZB-mcox
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc4f91 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Tg0PG1yVOJps9yXbb-UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX8akLHlmijR/i
 0FpYPXAF7RXVY3qu80LtC1wLRXvz9g+fqIZhVDx3xaCdOr4mDc1jrckMYnZ6d9rLwj2D3Msnw0w
 L5HyEI7k3Kd5/PDdv2IZrS92pohyi9nm1kk8faH/IoY2kEs8X3O+ffXhw7seq9nFkbPfGPulYpJ
 LwgM48teuwEpXZ24R+9jQTovbjn1byPsB0RQeN78avrsfkFsmeFPOKEotVmIXdxR+NCQV3DsPAH
 WYQ/TWDnxpoCN8qYrrjOvWgxqDOAkrdGWpkUZJnxLlkOt98I8gtpUhjJWzHmfF2ciFCIL1nyvmQ
 2m5El66d0hxvhozjHkAC1SN/FQgJa5LFHCdRjcJ2x6WAdMhB+OMQoBaHikGpZd+EkE4DEtm4A8l
 +m6lpBb6XN3T5ds3Q3Pa4bDhm5FXoYxrSrmGbzxPA4T5OAnBFCFYgGII3gFlYaHKYoRz+tFeAf0
 U0WREE9d+Oo+YKhRZjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045858_127979_18374200 
X-CRM114-Status: GOOD (  21.77  )
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

xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
builds, which pulls the Ethernet header and advances skb->data. Drivers
that still need to process the L2 header before protocol parsing
therefore cannot use the helper.

stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
the VLAN tag at skb->data and shifts the MAC addresses over it, so it has
to run before eth_type_trans().

Split the implementation into __xdp_build_skb_from_buff(), which builds
the skb (including the recycle mark, the Rx queue index and the frags
info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
header unset, so the caller must initialize them, usually by calling
eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
that still calls eth_type_trans() as before, preserving the behavior of
existing in-tree users. A follow-up patch will let stmmac use it.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h | 29 ++++++++++++++++++++++++++++-
 net/core/xdp.c    | 15 +++++++++------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..054748b37d7d 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -7,6 +7,7 @@
 #define __LINUX_NET_XDP_H__
 
 #include <linux/bitfield.h>
+#include <linux/etherdevice.h>
 #include <linux/filter.h>
 #include <linux/netdevice.h>
 #include <linux/skbuff.h> /* skb_shared_info */
@@ -379,7 +380,33 @@ xdp_update_skb_frags_info(struct sk_buff *skb, u8 nr_frags,
 void xdp_warn(const char *msg, const char *func, const int line);
 #define XDP_WARN(msg) xdp_warn(msg, __func__, __LINE__)
 
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp);
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp);
+
+/**
+ * xdp_build_skb_from_buff - create an skb from &xdp_buff
+ * @xdp: &xdp_buff to convert to an skb
+ *
+ * Same as __xdp_build_skb_from_buff(), but also calls eth_type_trans(),
+ * which sets skb->dev, skb->protocol and skb->pkt_type, resets the mac
+ * header and pulls the Ethernet header.
+ *
+ * Return: new &sk_buff on success, %NULL on error.
+ */
+static inline
+struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
+{
+	const struct xdp_rxq_info *rxq = xdp->rxq;
+	struct sk_buff *skb;
+
+	skb = __xdp_build_skb_from_buff(xdp);
+	if (!skb)
+		return NULL;
+
+	skb->protocol = eth_type_trans(skb, rxq->dev);
+
+	return skb;
+}
+
 struct sk_buff *xdp_build_skb_from_zc(struct xdp_buff *xdp);
 struct xdp_frame *xdp_convert_zc_to_xdp_frame(struct xdp_buff *xdp);
 struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8fd649..0db2f68afc5c 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -620,17 +620,22 @@ void xdp_warn(const char *msg, const char *func, const int line)
 EXPORT_SYMBOL_GPL(xdp_warn);
 
 /**
- * xdp_build_skb_from_buff - create an skb from &xdp_buff
+ * __xdp_build_skb_from_buff - create an skb from &xdp_buff
  * @xdp: &xdp_buff to convert to an skb
  *
  * Perform common operations to create a new skb to pass up the stack from
  * &xdp_buff: allocate an skb head from the NAPI percpu cache, initialize
  * skb data pointers and offsets, set the recycle bit if the buff is
- * PP-backed, Rx queue index, protocol and update frags info.
+ * PP-backed, record the Rx queue index and update frags info.
+ *
+ * This routine does not call eth_type_trans(), so skb->dev,
+ * skb->protocol, skb->pkt_type and the mac header are left unset.
+ * Callers must initialize this state themselves, usually by calling
+ * eth_type_trans(), before passing the skb up the stack.
  *
  * Return: new &sk_buff on success, %NULL on error.
  */
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 {
 	const struct xdp_rxq_info *rxq = xdp->rxq;
 	const struct skb_shared_info *sinfo;
@@ -667,11 +672,9 @@ struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 					  tsize, xdp_buff_get_skb_flags(xdp));
 	}
 
-	skb->protocol = eth_type_trans(skb, rxq->dev);
-
 	return skb;
 }
-EXPORT_SYMBOL_GPL(xdp_build_skb_from_buff);
+EXPORT_SYMBOL_GPL(__xdp_build_skb_from_buff);
 
 /**
  * xdp_copy_frags_from_zc - copy frags from XSk buff to skb

-- 
2.56.1


