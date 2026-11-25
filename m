Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25835606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WcUU5W8X;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nN5HuPAe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTeuxXXK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=; b=WcUU5W8XGFz/63
	NEV0RZFhq1BLYU88DH2CZmm18JlvlIkzulfxfneSsu7U7hzFxGlwr2VAnMz8myag1FglG7A2pyf3S
	wZttQIu97jfoOC8BuEW/hG7tUxtCAfPt1Br06gp3SpZod0u+4DwmIPDN0j4xdpwxl8FslZc+Y0YB0
	h87qETCWwpB8+4Nkf90teBnkbzEptYt8wuv/Az252pJi9ekplnYBUmBVlE/NXOzByfOgWcRXCueKZ
	rgzshtZYnyIfnOkiRvgyErjkyta1NjNPZFmJiJINigNHQXbFUQw4UXK+MnUOEna+KdjhLaRyRAo/H
	NkoVjPKQf1Ks//yT7BoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJM-0000000AEjX-36E8;
	Wed, 25 Nov 2026 14:49:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJG-0000000AEgs-1U1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:49:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APELtWB3725644
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=; b=nN5HuPAep8TQmsUz
	XdjqnsWFEgrmwYw66IBMyL1fbRjmBC9cG3Dzo+82Md8geoDLRIGPw2hjZQKphbx3
	YmTztth9BBm2pLcZBKO+gdDEOSWhUymmwdPN2LnQc1km5UHaLa7aCOsryf0cxj/n
	mQ3llFhrsOlM0XalDktbU/iUIeZquze6ne5pTs7eGVmaPQb+q4Tcum8NBC218JWy
	m/1L2QfbgA+WpzR4K14L1vUS4cH0JLIes56ahlF2+WW83Ur6jwZKSToMhwk6qB8S
	8kR5SzqEmSXAvOprGd/aZLqIK4AmsweKVHXDwtteL6A/eAwTsXUk/jM57kxMCaZb
	Y4K3qA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61af047u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so1073168e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618161; x=1796222961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=;
        b=MTeuxXXKyuF216n8d6LKoijaTSGhwfJLvuMzHlVe7n6ox1e/EjTFmXu4MhuozAgaam
         dAEMC6ig5G4oj7x5suFiABC5032RREhosr7Vl9Uz0g3NQJUa1tr0o/GnZwuB8ueNsiMk
         8x2hpk1JAa+b8SIZEGq5Z7+3hP+emeKomlPugwdXoSO5Dj/hhXIk8LS6p3ACrek6pg48
         SsPFL1LgVm+7EEcm9MkDSw078Ffu2/6JhJRPg0p34GCfMg9Ao4ldoYtiJ9UC/gLuuqA0
         H4ZS2lMsQCiWJycvlEFJIcpVpjZVROv4M4HoIrr8oAOFY0jZeOIn/I2vu8aCNYfeiAFy
         HROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618161; x=1796222961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=;
        b=sNCMrotDrOnE6MbQwVKtlXCR++uWG9Q0EytblnrNJa5h0C9XyppZY68u+EgQ/xVAoc
         TTMhad3YC1pTG7YPAguRhQ0KLQOF5xoZ63aXqhBWOzjEpx9BIZKJY1/uPtCPCoCQuq2s
         TCm/O8a28clkvlwTEbJ/xeBaoAcc8cLqHf2Pwh+vOyOAoUsABC8o0sTxDyCPx1U6tk/E
         xC7HiQadKhqZzuWEJFiADw6dXr7X7GqY7Vm1FPDyYzL4Qd+32UW99JqyXkaSCSv7kxzn
         fbGdfCwGIY6I3kj4u170aUmg1wGDIo7oP15BPN72BO6BhZiRIexuxL5acbbqWKHR70X0
         UbGA==
X-Forwarded-Encrypted: i=1; AL+hErHsPadvQqXdVUObfm178E6SpPNj7hCwMbOOKSSfdLU6GvSpDHNLb0PZ2DnvKVwQoaH279ly4WqKxIN6quJJOXaO@lists.infradead.org
X-Gm-Message-State: APuU4Z+z1mTHrQ4Y63wpLg+1K7V90aLKR6swezMsdmquCYErOmfHReyk
	EhF/Srjx6VfWuROmFbGKFsBhgATEXIuYsntr13jCYFpq5FtEst2A/f1UYnn8VlbFzSOpAu0GdZ2
	jD4XD8TVujODM+Z9dePn4vWhfHln6dTJpRjxyf8F9ckl+cIN82vPqre2E1y8HYqogddAq/A5lUm
	tzPw==
X-Gm-Gg: AZFdTZd2CBtxsbXwjQhrwaERgt8/KJe1BQkA2Dij0jKwe+wrxHJNi/HquXi/BUjzT/x
	zN33YBStMNgPlOhKytQ4hwyOZlk6khLqsAHXTYfyuIF7Oy2FUnwgHlIM6/vS5f2vZcarpnBmKmc
	Rcu6BVqWkY3ADvqhMcgALf1gekwwUJafdInzDWqcsa3ISOC5e3xthXCzgViTMMWBXW7+JpQxSVr
	sybnfpKYok/LbRZYogpqFUbwBVECUN/t6i2c3hIXrI8XR9dnRCatRylTMLAQ6H2aeDNYqXeCQpR
	Dvl4Grnx+rgWTZxFKMAqI2sYdd3W5Av+j15Sip2rTnbLZ/25L06LBsbOjJPJ3cnZ5SWQLfmV0I9
	JlZW0hlMFk4n6WB4porxnX1dm7wcc5OPMgCqbYbkEKgTzr8mcyvMErr4aVsGIvcBZr9BJ4aXwGo
	yNlvNY7RDSybVb4hYHSu1AoWMwzqk=
X-Received: by 2002:a05:6122:4f97:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5ee8aeb79bcmr10154540e0c.4.1795618160462;
        Wed, 25 Nov 2026 06:49:20 -0800 (PST)
X-Received: by 2002:a05:6122:4f97:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5ee8aeb79bcmr10154418e0c.4.1795618159458;
        Wed, 25 Nov 2026 06:49:19 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm554109195e9.8.2026.11.25.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:18 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:49 +0100
Subject: [PATCH net-next v13 4/5] net: xdp: add __xdp_return_buff() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-stmmac-rx-mb-v13-4-0f6bac53e8d5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfXz5j5VLXi2x9d
 RzNK01q6ROSDFx43VKTIHzlS0c6WirLGKPx7b7nb0D+HNjji8KTKISWCoYnCd1AKP+heFGarMaE
 sJwo/KV/UiVpq4/48mkcLj8tsVsxzUE=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6b06f571 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: RAJ1-JGXYYI5cNGui4WFRmaonmGU1juF
X-Proofpoint-ORIG-GUID: RAJ1-JGXYYI5cNGui4WFRmaonmGU1juF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX24YdvzrMEQUZ
 aCIEp0+QpaICP4mS4o6KerG8nuEmBXpVhj0EDWQIrNiurCphHW42LG8vt55fXefJiL4xUS2ody9
 MtfCFrNfEbdNjzhNqTX5FjDYRFQV1GOV49Jfifb/pDXyNvHAPNZavK+CoF5oazmbTln4k8tZ/+b
 mEIKjVdFCosMiuNo1Z6PMhmPjISKxKiok/rjm554vMJTD1cKacohC3l2pMInG5fM/b4gI3HpP/9
 kTUDrk0H2bpTXx8KAVCKa5aPkmda/TnbNoiovN8zKuxmcNUgTemBjFJF5Lz0QCr+If3GZUi3tZ8
 elfcvfDyz0u05oywo6Ye+xYFzF2ZBP8QiPJT96pZ+XAuObOMt0Z0poiVhQMVIaI+p5dZN7L2K30
 RrcWSz7G9A9m8UQM/yyTh6FyhWa16lpOskTY0ZBmwvTqUWQWwt3s0hmm3zNGjL6hS6vms/ZjE0P
 3FWcKpSUcSEy6fFi6ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064922_401590_95AB0851 
X-CRM114-Status: GOOD (  15.62  )
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
index 02289028044c..f0946500c487 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -457,7 +457,12 @@ void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
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
index 055931263413..f35ae7e118f5 100644
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


