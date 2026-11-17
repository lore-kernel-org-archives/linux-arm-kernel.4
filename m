Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244B606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/A/UUFN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erLzjBQS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHGHKjFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=2/A/UUFNzQ6SxM
	Ud9sHXWHztyj9bBtrvMM+MqK0RVeAUdnQz+zHZ9bgkfToUJwN+9VwIhNPPpxpdf0CHsPh2RJONjqE
	21C0iiI/VcugVz78G4hFWSBvrlI/j6JNULoWdi8urOHPctKlN2In+ktitFm0bvvIA5j0ZuokG40Qt
	NJGr2MKIvb7VmG7SmBKWBOt+q6OVT2BN28xT+w4TwKO2544/38b1Bbim5SiVL6c1CFveGq0/Knvv2
	Hg5YA2vvwor5F0XlA9cCrmM0STYbHpn06vxUzNrLHtyEOJaMMTNs2BJfu8r0fY82Kci87ThG1M1Wn
	zN+0DfLy3xjnSfIW3UHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTImT-00000005mip-096v;
	Tue, 17 Nov 2026 12:59:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIm6-00000005mSB-02Yi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:59:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1LpW541672
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=erLzjBQSTtFHGQmt
	0smMLSZgebGlfltudacnsNitWoc7RXJVmij2ba1QWpLNBOxdkmHSQnHltnA1wOth
	aikZGjDLg2jElOF4GMUjP78Q+Qshe4jKQM3TObScq3pmShFxbX7MMw2Sr4Co7wRs
	LwZX/2VLc4Sz5Z6vabUSLQ7K3CfWd4oF3Gya+t6zSY1XlM7JWd7XNz2i5hbAvW6c
	GTXBdhlnGcFjea9hPX/Xny/Nu999SVFCbh4uJzvOj/iR+7Y51T5T2KvzoaZ88fZa
	LvxIXYhpkMbAnOq+0HjoXEFHbOAdQOmaMl99h519x01vUSS6a7nSpw6mC1metISU
	Pp/w9g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1ft0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:59:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0e774882so1681141241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920340; x=1795525140; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=gHGHKjFxunBXMXj6fuDoV+9K8UPESMmEpijhmMMzUNeksO2WGLM/8dlWfa/moFRSKw
         slfFYNAdT7daw9WaIVSC53wa7hHNB/aYoeCAjbVr6HEJB0P+TyHkxtT5emjRUm/erzG+
         VFRzc1mY2A6+OpiLvFQEU+6fiNtxeMHeDHKDLp1LNidkp7mnkrk+oRX8b8IwIO+oOfOG
         XHymVUEuX2DbKw2jknKjZVmZ0t1WSiPp8KUP/mssJyHtQRSB91YGqTo7YxGFHeuI3v5L
         /CQ96FTxt/PzJ8VkJlkP6UtkqGoVhfdUmQ8/k6ZtnkcISH3OkjtWhWu+OQlv78BZfuB0
         264g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920340; x=1795525140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=zeO0eWK0ovT+s5ia/+4+nHgEQnlNUIf0bpwsveZSquI3lpNw+5B3LemiWSTlo7bf1X
         6Qgi/KnQ2vSo2uk1ibCUk9nfvjAbunOTIaNmr857vxI6gfyYZE5zN9YeVcPY1bVASiMM
         Gipz+3Yb/A+Pbo9BkZw0Cj1lv4VWKpO2SYjmeL+7VXvlDjxFkQOzVLfXa0WOClo7b1AC
         3wOLsxhnxbtqRIOoxv0YnP43ITDE6vtYBS0H03FmUq6laxZ3q4funo0AIMdqAX6OdUhi
         W9CxNxet7JmI5Ug6P7fgkI2S4K9G3WsBCPZBDnCsmIVzwGwD2WjKMNbxUqjafUikmI22
         2vTQ==
X-Forwarded-Encrypted: i=1; AL+hErHzP5ljEJtH0vw6ilZ++GGpvW/pqTBzscS8PEiUIddgoM28U0jBwv12q/8zkWOwf5bqXlRazbydjUJBkDxgrLoi@lists.infradead.org
X-Gm-Message-State: APuU4Z+1mEQk2iY45l53YWq+rUOrXVEGOH74EfcyYXJlGfHpLnQUaGH8
	9kmRqeCyUnWavXkZFYTE8kBOMTo2xBf8DTLLvqB3RFUfLv4egPXR+NGcOB//XyBfpnhshsNEZrj
	H24OVYDmEoK6y9Wsu8piMc+rQv4rEzBEWNYlS2A76fY0z3vV3gQdy5lVcRBcOIri7osz2KESRuo
	+IKw==
X-Gm-Gg: AYBFou3rMx6xBJ9zMuQblTc/zcZ1ZM06Ig7Zb+6E/38phr+7pYFuZ7eGn8J+msn+t9N
	acNFbRsM56V7ij08VdY6uonoCMMFsksZIyp0WI+st9CJwfDVfLO1/RD6ilPQeQw3Z2Xr81AjuDo
	x2PvQokseGc8Gh+kgEgf2vsrJgGiOe2bE0o8BIqbpltHBiBWanv1uCnuVRjgQyHjeJcRtTFSgcw
	Nclb7qNmfh3GMAgvRPZc4Nc3kLysWz7D7iFGY4gKBwVr6Y9Jb6C2A6nJG9n1RgaB8hO0pS6fX07
	SjZHCMn1do4Kka8w9kIROZd+B6+uQMLklINaMuTGQZKKuCg1XvyviBkUdBqWxnanNXGGM2+m0Z/
	bh7C/CKuq/r98TdP+wcxVFR6YJlcvkLOc/vC+QfoQLJJ4jtnQLGVtQcZIczF1RRM=
X-Received: by 2002:a05:6102:548c:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d64d72b1demr5233228137.14.1794920340214;
        Tue, 17 Nov 2026 04:59:00 -0800 (PST)
X-Received: by 2002:a05:6102:548c:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d64d72b1demr5233222137.14.1794920339653;
        Tue, 17 Nov 2026 04:58:59 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm60545435e9.4.2026.11.17.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:58 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:58:29 +0100
Subject: [PATCH net-next v11 3/4] net: xdp: add __xdp_return_buff() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-stmmac-rx-mb-v11-3-9fa5c34ef245@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc4f94 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2YnnsRosDIlL
 0iUEiQjhAgXMYF99f6wNu1GghNmpP+99cWomeeYQJPR7L2rSC7a1GFSy63wfHJTegcxlaF2Tvt1
 oG9MVxyGst+9i4Eix/ALiSGqqt+PUxY=
X-Proofpoint-GUID: 9PTRxGLCDw8Xn9A-wxAaeDE-ku6gJ-PD
X-Proofpoint-ORIG-GUID: 9PTRxGLCDw8Xn9A-wxAaeDE-ku6gJ-PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX4Y0x14VagdNz
 KRNqBuqsdSFZ8g+BG/UpftU8c7O9N75c4bKKDgPS3Z5fzF76HTSGvgpvVlpOmpZGxhPZc8PsdQH
 zgxOrCH7jua7hypnbAqqi0TvtqgLdyuT0EYGIpCyE4dB0Y2h6kzq9EzLPMMJSx7MHJxWSvfiSxq
 QxS+P0+sEQC1AsmQNt8uYh7SyhgOGKTqw6okwqjglRgRWyCvXvgxZVH5syK11dowvcyEunKCsNm
 wsqbUOa7N6P7DZ1zBSkvDs6tzVwOZr1VjLXMOOZUMt3VEq6eAyuMdO/R+nIOpdnYxQ1MJY6QdIs
 YmN4HdQaeSw1shXjTPlU1Fy/+gGzYDghSMrbqBXQh7zW1hkJG1fAQBENobpr8c5WJ8VuV1f2QHd
 wBHq801/aI4KJi7sbIQlOw7MFoF0rTFV8+Lbxj/1SLwhf6snSlA4QR0rEOf+1sNiwdk6K9ClVWE
 7f2P+wQyKtBfM5CoqzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045902_211841_1A7715C0 
X-CRM114-Status: GOOD (  15.80  )
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

xdp_return_buff() always releases the fragments and the head with
napi_direct = true, which is only valid when the caller runs in the NAPI
context that owns the page pool. Drivers also need to release an
xdp_buff while tearing down or resetting a queue, where NAPI is not
running and direct recycling must be disabled.

Split the implementation into __xdp_return_buff(), which takes the
napi_direct argument and is exported for drivers, and keep
xdp_return_buff() as an inline wrapper that passes true, preserving the
behavior of the existing callers.

This lets stmmac use the common helper with napi_direct = false on the
teardown paths.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h | 7 ++++++-
 net/core/xdp.c    | 9 +++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 3400775d179b..2fc972f71509 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -484,7 +484,12 @@ void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
 void xdp_return_frame_rx_napi(struct xdp_frame *xdpf);
-void xdp_return_buff(struct xdp_buff *xdp);
+void __xdp_return_buff(struct xdp_buff *xdp, bool napi_direct);
+static inline void xdp_return_buff(struct xdp_buff *xdp)
+{
+	__xdp_return_buff(xdp, true);
+}
+
 void xdp_return_frame_bulk(struct xdp_frame *xdpf,
 			   struct xdp_frame_bulk *bq);
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index acad82982d77..1dbcec0b31ff 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -546,7 +546,7 @@ void xdp_return_frag(netmem_ref netmem, const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(xdp_return_frag);
 
-void xdp_return_buff(struct xdp_buff *xdp)
+void __xdp_return_buff(struct xdp_buff *xdp, bool napi_direct)
 {
 	struct skb_shared_info *sinfo;
 
@@ -556,12 +556,13 @@ void xdp_return_buff(struct xdp_buff *xdp)
 	sinfo = xdp_get_shared_info_from_buff(xdp);
 	for (u32 i = 0; i < sinfo->nr_frags; i++)
 		__xdp_return(skb_frag_netmem(&sinfo->frags[i]),
-			     xdp->rxq->mem.type, true, xdp);
+			     xdp->rxq->mem.type, napi_direct, xdp);
 
 out:
-	__xdp_return(virt_to_netmem(xdp->data), xdp->rxq->mem.type, true, xdp);
+	__xdp_return(virt_to_netmem(xdp->data), xdp->rxq->mem.type,
+		     napi_direct, xdp);
 }
-EXPORT_SYMBOL_GPL(xdp_return_buff);
+EXPORT_SYMBOL_GPL(__xdp_return_buff);
 
 void xdp_attachment_setup(struct xdp_attachment_info *info,
 			  struct netdev_bpf *bpf)

-- 
2.56.1


