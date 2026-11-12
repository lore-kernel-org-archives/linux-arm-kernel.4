Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A35606A893
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=exr2H6gw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQCB+TdO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0uhX9kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ht9dr7DTrvc5N3Sijprb8a3IFfZmsbP7xbKAQ2/ikn8=; b=exr2H6gwfQg7Nr
	HdMKx/mXcXbU5Y22ADQEVZSbZqj6YArR/PfheTSsL7al+dhuViAekUbyoztgzz8u5e+nDv01BiYe7
	clNnZSResPYxF3ZOkYPygHWfwD3J/z+nz7R7TTbFI59sG+Ird54vBtOvFBhh1hHCvhjYytJ36vx2+
	+RroE2e/gRCESrcFw0uwfU0tZ+mT7cqWMdU86SMSciUj+QFrmy1+pWqIIEksEDxl/0UqgpJrvLRKS
	Qa3pdNXllG7s9m3Hce6DcGKzci0PouQXLHNnko5HbLK5UA8g33a3iakwMS1V45LH0+PwGOJb4ardh
	AczqRFA5HTHbJvj67yHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlQ-0000000Abi3-0oxq;
	Thu, 12 Nov 2026 16:35:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXl8-0000000AbaJ-3m2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:34:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZVgK1736574
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht9dr7DTrvc5N3Sijprb8a3IFfZmsbP7xbKAQ2/ikn8=; b=jQCB+TdO9HvPNp0E
	q4v5lmgSswC2h7Spqpk5ruzI5e4LHB9uJjkwMFCcEekKUZyej6K1sOnPBVrJzHNC
	c2ojSkGPNzD6Ep/qyZwDewP3Ulat34rgrq1Da9rBXKXU/D4XW5LwK1eMlZbOLbgs
	MlXShAKJySgUCE4/75lDBSJhHeN/dIteMelt+ZLF84kp4gGFmhdHYSe4odw+BegI
	XPJNDUudYqk0t6iOpWnVZCAvC+lzWBRlDoGo3wz9ueyY1yscyL1Cg21K2BF2B8wR
	ufqThHxLq1KlLrk/t15NyfCLJY4fhYvRcX6tcASNu7T6bleqldQnIGLreSe0FMy5
	RIykYQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2c97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so21176241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501285; x=1795106085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht9dr7DTrvc5N3Sijprb8a3IFfZmsbP7xbKAQ2/ikn8=;
        b=W0uhX9kqSglurwCd+Xv3XT6HPOFnDnSw21BC89PuoQporPa34N/aWJxSeYh+O78p7J
         NaF+fe0dQ39NoxWjZKXr6xuArnnjnFFYt7VR1N3A8jwAe86w8zf52onqmxdCLzUN/HSx
         h2vk2Z48+/UJM02pFPymClp8GM8pnzLDZ77o/fUleC2LO1VpU3OR/nGLgZo7gLNu0Qo+
         y+EHJh7MzuzCkdjmv9yck52D+YqL67to6iprQjbC/tQGvDDP7Dk8/3WQi2Rs1X5lcA9W
         yrP1a0ehDxeGI7DsZvBOGfhmHmjZEqdFCqFK+7Mafyf2R0HFYVkSseeiSOyNhEYNTIKy
         yEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501285; x=1795106085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht9dr7DTrvc5N3Sijprb8a3IFfZmsbP7xbKAQ2/ikn8=;
        b=HYdI1/G71atbcxtc5eB8vV2F7GRfJQjp5jvDPhtj0PW6G8iBLKP16+2Nh/jlJeFwBx
         WUwZAo9jqg6gk0Q2htjywztUxi7uGmYdvOCFASmjmoWcV6W91Rq4RNoaE++PoHRM09Ku
         kmuuELWeeWGE+eRIgBcAOmi5GXvRtQev/EOb3ixMAdRamP8jvWhhTmgKnS1Yzyh+UhRI
         qk4vtzTFCgu20cXa1UOayuqtOphA+wGPC7214JtJuoWfBI/+sF1u3nr03++5WB38LaY9
         kcMkMLAzvaC2LuLf9kP8FGvID7wn9E2gmeu+exqDhpguDafID80YHCNbED0SGmWF//Jx
         6bNQ==
X-Forwarded-Encrypted: i=1; AL+hErFT78XrLAydBi5zK9pEi1tZLidStWFTIEh5ytVkzofn+sfX5r2H1mzlxtZ+23sZtMLt6fswRLz/pmjD4MuuX8H/@lists.infradead.org
X-Gm-Message-State: APuU4Z+DqY+JW1jl31uVtF0xO+Ao7K3KgRO1Vx8fa7Tg3BuUIBLWXzZB
	zfcYKFrkzL46MiXWx52vNSFaNAFh5WHGA/3c5T3b2xHFOKSDf//gVGz7P45tZ9RutBkBl4Ddgra
	BKZYJfkohN0uLEp16thU97/tTtw1KUqwMIb/CSzbXUteQjOXPPQ7dNk8zmrajX6uFFhR/DpSlUJ
	IduQ==
X-Gm-Gg: AYBFou2+N5XrbIQsWNRnVnuehuDCztTkZti066H4/hsW8uTrWrE2247N5517OhH1eT+
	7J45UkxfOP9YFvTFvFieu2JO0i7LZ9DrYDjhetOxztBcGlnBqGuG4IL9ANrFD5aeP95t5Dx6cLz
	X+BDLGG1LL7am8Z4gQcW04ugJyReDQaic3aiur4pP6DKpSnDCTSaIH1LfsTVUgaXHEu2ysfbkX7
	rwF6KTqsNlqJIEWgT7/6KWpAGnkJtWNafGs7Czfz6hTaFSFnuuoXmbwJXLcnKcud+BNRCniJ1Hz
	ccrjTiKVi66VO5RYPwJxIXNwBKiNNyTT237Y4GR7sWCwCGyjMibtMCgfAnXDIbgH2QF24YAjxAr
	oyYOnoHG54Zmim00ya2aoBwDgapwC29kxCtp3sGpmOjHE4JVb6FWIJdEERIp67CI=
X-Received: by 2002:a05:6102:2928:b0:7cc:95ed:3147 with SMTP id ada2fe7eead31-7d5061e6d3bmr2487615137.34.1794501285297;
        Thu, 12 Nov 2026 08:34:45 -0800 (PST)
X-Received: by 2002:a05:6102:2928:b0:7cc:95ed:3147 with SMTP id ada2fe7eead31-7d5061e6d3bmr2487585137.34.1794501284694;
        Thu, 12 Nov 2026 08:34:44 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm144499035e9.1.2026.11.12.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:34:43 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:34:10 +0100
Subject: [PATCH net-next v10 1/4] net: xdp: add __xdp_build_skb_from_buff()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-stmmac-rx-mb-v10-1-d3d04b65c6bc@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: afDenTfpYFR27lpmFD4mQm8uxa_Kbqr-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX8z+L3O9x9/kf
 fVCw7z140N3LgqdjM/atXCLwn9SdJ7k+nEtapvV5Kz6qXMnxY9LfTc2yEqBLQ7kU/U33D5QmTY/
 GuBEggpGeA32ZDjqoegKK9Pj02XLTpE=
X-Proofpoint-GUID: afDenTfpYFR27lpmFD4mQm8uxa_Kbqr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX+QQcjYk2/SYO
 UEHpcUmpBuZPoVjyigPx/EhL5sv1FE/0/Z27e57Q5oB6SrhfAXuYbYoE4ppRJl1Z4WEhS/85lNX
 gbRq2xa194NdaA0L6yJJKKBh0XnP5Jnjo6sTZGiMkH7R5GoIPZ89/cYp9+1PG2lU+8NDldengRI
 WB3MHTOXXmMm+HmGZTCwADuHQ/YZzwKRMW1P9M+5BpDl4ocIIzfjine5NJH5q/b1yUKpQ9Y2bjH
 /PXcG9SWk2GG1z+dgwxrl+j0tXM56q5lkrmuskMYtbkYA9IQPKMk/V9vU8B3pRomDPqRfCST51N
 jBTb/GEcB4gVHG3pGmPX5S0ntl5+rVtEeDou9AI7g2apYEu1/RfzyxCvFx2A+ptvkzoGKGNFIZD
 qCWwF4ncRA/1qtufO7v73ei4OtWIm5UJKbd4ODhRgrnkFiTKE51C9UbsIqBimqg+Tkpf+pcqlEi
 RvX5K+akfBCy5S38Hcw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5eaa6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ksGhbug9fU3i8ddnHjYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083447_041407_D59C4051 
X-CRM114-Status: GOOD (  20.11  )
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
builds, which consumes the Ethernet header and advances skb->data.
Drivers that still need to process the L2 header before protocol parsing
therefore cannot use the helper.

stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
the tag at skb->data and shifts the MAC addresses, so it has to run
before eth_type_trans().

Split the implementation into __xdp_build_skb_from_buff(), which builds
the skb (including the recycle mark, the Rx queue index and the frags
info) but leaves protocol parsing to the caller, and make
xdp_build_skb_from_buff() an inline wrapper that still calls
eth_type_trans() as before. There is no functional change for existing
users; a follow-up patch will let stmmac use the underscore variant.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h | 17 ++++++++++++++++-
 net/core/xdp.c    | 11 +++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..3a25307e1d67 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -379,7 +379,22 @@ xdp_update_skb_frags_info(struct sk_buff *skb, u8 nr_frags,
 void xdp_warn(const char *msg, const char *func, const int line);
 #define XDP_WARN(msg) xdp_warn(msg, __func__, __LINE__)
 
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp);
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp);
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
index 1d679e8fd649..470bf90d93ef 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -620,17 +620,18 @@ void xdp_warn(const char *msg, const char *func, const int line)
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
+ * PP-backed, record the Rx queue index and update frags info. Protocol
+ * parsing is left to the caller.
  *
  * Return: new &sk_buff on success, %NULL on error.
  */
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 {
 	const struct xdp_rxq_info *rxq = xdp->rxq;
 	const struct skb_shared_info *sinfo;
@@ -667,11 +668,9 @@ struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
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
2.56.0


