Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9002F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tRDUFv/T;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRiSyNEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdrsyUbt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=; b=tRDUFv/T1BYNsp
	yijZ4Mci2BvmSvD0SIr9OT7kUnEIKEeTyBq6+q8ckBBxbTnS3bc9MzDf8JDpqa5owTgAj8YZpP085
	0fP4vK/aMZmPR4CefLutRd2zGwYgnHYnBpmfugA0ZsdVapv/YQ/7YQk5hJg9DRQsrP3UhZRAfgTXY
	iaQfPJVqU/SFtpC4t8eMwpkp0Z5es0BQMBo5iAxv7eaEQFnAn+hsDhfXf2gJ2oU0kfXyFcmKpAxNM
	NZbQHjV0sTm++Fe7FiZH2uCUCNhkYwZHSwylobHsbENDOdQnSis/xNXF3DEFkPVf1oI1QlXWDLASb
	nshOjumMYrm5qYIraSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotL-0000000HaFs-1mF5;
	Sat, 21 Nov 2026 17:28:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotA-0000000HaBw-1oXM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:28:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa2wP614136
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=; b=gRiSyNEmHndj6876
	96wz/7K9Z0Odna6gDmMRy9uLSoQqLAOM9YHag3+ctAPHwxRwtfmKb1HB02yZIYsn
	+l1J7Hzgjs2G7Wv2ZzX5eZkaGUGw5qVsf2T46PiWcBxkYZicW3bUQ4QEDSvVT32X
	cPBr6IbBwqk3NDfmwC9KEAEPyeCw5yTlZdpsZePShyvA8i5ojq+2mFYNHgGmebbv
	89PFa/3E4h+69co5QyANzsuy4dU9iBHDwTVbHrzho0hoF+C7EOn9b4LJsVaRqNQT
	Z1QfNw7FIRfdoRxvjpB4WILdXOK8Gvqr7SBu1XkIlzKQUQ2EwtsD8ga+UNcBI5ex
	cWG0yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mg9rc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so201136485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282115; x=1795886915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=jdrsyUbteVrc1hEGl8Nx1/jg9dBXHx6czv0Ti9d4K2mMq1NtTrEe3oarODTx0zi6AQ
         hYY4S7a1+oAf7CnSSkca+x4STZ2n02ic06I96nqBbgUsG++zxlWzdha0PEeNn2Vy8qSO
         +l8WFrBmEjQ5p2YHMyjfqY+IH+9prmVpACPdApPwvPQTFeqeoU93GEGGieZe9Po6fhmB
         J/9OmlY5LxTukBJR8QW9pZieEIcGPfCsb0W4TwnflvRFYWlDIu8CLu4t9UlAmWnwFn+0
         ccqcNbLYMSYrRjON57aaq8Pa3Mt6PdAPrFg+l0ov8qDSSRJ0VWX/BQgjqMRu0YOykkv3
         a61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282115; x=1795886915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=oHNfndejgH7VqsiSp6dYi1aElVDMSKXAuZ1IhQ2iRy5mv72QFdF3D71dc1hGtJ+Bx6
         it5L6hPiKgPqU5UvGmZFmnQ4TqTadvAqUkHd6mvMk9Bf7dMZDyzLyxywUpEzKL1ZHi3U
         K2stExiV+Y2Y7c8J5OCR87+1Uvw1ev6k7+RTNPDZV0ncUB+w9v4BdNMTX/geRtZgQF/W
         Mq31NPwoUEMjArlErHcu+tKhxqozZsI47QrsTL85rNmQrBXlw6p4DyzUztGZwfDeT4/h
         X0m7AxO+hq7IpR61pSSCiyR7QM+Yi4sI49g/02SZ9Sh9Kx/HtjRU+/DpFMDGFP8iGFyG
         ku4Q==
X-Forwarded-Encrypted: i=1; AL+hErFMSnSaz9hNj6XwRKLQ7pSpXIixkkhuBjAfWWX+TE4RspRgajfsGdtIpavgOQXf/dHzSVpFQtQvS4oIX4/25Ipu@lists.infradead.org
X-Gm-Message-State: APuU4Z9yhJt0hvz5RVUl6DSKW9RHlV4PbcL9agF3j7Z2hrlEkSnJUGox
	RkoQNx7xPiSNA6ZHp1lpSuSwLlcd6Obrn7JM1BZeWMR0mRappdOdttpb/2+nbcLjJwLCiSUkeXh
	VHts8ZMb4yZvP4HKjTqQsxJyzOyGCuTXgODP1Kjb6CekKMhsEMiYwETDix9Zb+IzlCs+RePznnh
	s+0w==
X-Gm-Gg: AZFdTZfM9dqDa02JQ3/E+L0X4TWrWTl9ePjcedpFP1AH8qwnkfuRdszgTfmHX/vz0Ny
	ZVGCejivFLXBOZSzNPBlZcAs1l99xR/tUInS9VkU1CYfiCJ+0rxQNI5KhfPADbcH3RQ5EFbbSlX
	dbptVOpGETzRQ5etS3PPqw+X/z06Xf1iMr2diCR1QB+wM1xx11VJkxdb7/zIPrXPn8xkZbednMV
	yaqpBIr991D41nCRLG6/4gA92+tGpQQwgaJwyKXK8gltpfgicD9uJwR0ypx+iYpt2sGDmEWULC4
	vvwpIka/TEdki6btfi0AJkyJ7CoRO9ftEij5nlWup5cCRneguE6KL0h6xFOU/wXSI/H5aU81O9K
	gj7aF46/oGcn/b9XKDE+b38CaWBidgj95mW/yDYBk+N02yWcwi77O/BrKwpWZHs8=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1052545685a.8.1795282114602;
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1052542085a.8.1795282114034;
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm199723775e9.6.2026.11.21.09.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:33 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:12 +0100
Subject: [PATCH net-next v12 1/4] net: xdp: add __xdp_build_skb_from_buff()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX8IPDr/nDXACP
 GVqv2yW3V7zlBixvc3jLHqKKlz2CPQKI3R3EuNjfvNhBQ4WH0OuP+6yUuY41p4xidae3ajQ0JqJ
 TgYcLDBlkwo45cVMyKkLIG2qJGeoRL7ol+uB65bxK4dFlhO3jXc1WTebgoVJdEkiSN2VUAiKxGv
 DAiGB5jX57ezH1VAANsCmbqkuQmvXmKyb7BhD0+To+PSfNdW+MLF7b8aZLItVb+XHR+XQmOQ7Kx
 y9vBjFgZ5iZkt2yKvelFCAhWt1NycvvvM0ly/X6X/Sv+JxUU5fvfghdTSsQWZbexRZNTJ9KDms/
 oMdx5cVRBtvwakpalt6jkbZBd8repyjlH+Lp8vc/xtTelWFHEiVF7Wk9+DIala/pb5HhGC/auLd
 RUYZ8NVglfOhL281+r0NToP6F7uaHdYkMrw9e48nyObiRv2f7Q4DHVa5BgYnChOpAqKjm8wYZtk
 nHE9HcXTWeFf5g1zQJA==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b01d4c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Tg0PG1yVOJps9yXbb-UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX3rV7eMFthrYS
 +he2MXM96qQShkEQtZxsJgPtaMr14Tf4TFEo3tH6SXerLvS1Bb5mybvA+HobpW/7MxM6QLW3z1d
 xO3Eb8pYDvSiRj4zS2y4KK7IwsDnITc=
X-Proofpoint-GUID: -1N-ao3iXbNzE2yGmHq5pOm_q5rAd6rA
X-Proofpoint-ORIG-GUID: -1N-ao3iXbNzE2yGmHq5pOm_q5rAd6rA
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
X-CRM114-CacheID: sfid-20261121_092836_595057_0B021848 
X-CRM114-Status: GOOD (  21.14  )
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


