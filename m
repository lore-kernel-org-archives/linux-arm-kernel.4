Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24043606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXj/778r;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bBa2kNd7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Od/iGOGp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sWc95ycG40mAmX2MIf/ajSXRL+qWRNcMXx384bP8aTg=; b=wXj/778rGQuPGC
	7+GPax2JQPkL+k0lQ6BakclDlNt4DsI1MxGL/WX4ATflEjDbT42apBwIfDGSZTGvBNmxZPOebEnua
	O2hs2M/GwxSwV5AVCu5WcgV4yveGJXDfaA5vL47Ydn2DNY2txSO9Qg1YmGNZn50eBmd2ywUSaaOa+
	zK1M+60maFozKstzIBB/ho6DsfehrCf/HsGHzLNST2P8RtfSUWkPHBlAx62LOkrtzeGTrjPTolWjK
	dSm8pppyOtQsog8OdLya2z3L54ncO05GwNWjthCU6nJdAJCEjCyKhg+e89/PdQOUZ7iDHXNiJwNm3
	Tcz28Y0leX/awaBDoAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXmr-0000000Ac3H-3iWj;
	Thu, 12 Nov 2026 16:36:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlC-0000000Abbh-2WUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:35:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACGRPfS1768165
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWc95ycG40mAmX2MIf/ajSXRL+qWRNcMXx384bP8aTg=; b=bBa2kNd729GySv3f
	ujDeXzgP9zdEdp9CTYtaUN0QvEV5xnCkbv4J+oRRySrzSOk2TvH3EikCq3IGENgx
	fMZ8vV+qZfn0OJWOX4eQCZOvWya+5H8Vh3yvul1Wy/SK34RZj7FXdW8I0yyrzkY2
	JYDUGPXrny1avnMGLT51P3VlO5hvjXCe6n9FtfErmTAYXlQ5tKObPYkQ22TLK3gR
	KSYzGjhN+iRBS/kzHlyVexi2EDMKzSb5B2ndSXdYd2mR9wMKuW/hz9mOjMrQH9bl
	yaKrs5lUR5AYrhXFy2J93yp/AdH+H5+hwOzmej+ftjKCHvav8ap6alxKT7PXja/W
	KrcOzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ag167-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so936529385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501289; x=1795106089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWc95ycG40mAmX2MIf/ajSXRL+qWRNcMXx384bP8aTg=;
        b=Od/iGOGpt3hI0ciLqcIXYdyTruW7wVa/QhwTpmFLumbNVld8TI10uI3YyffruMWfL9
         P4EnJQ8AUqyykcvGRIf7aI3vwuTuNrLTPVj6xBsPrFPxTBG1zl08kkSXuxlG4n8UqrVF
         oJ34LMdwR8nZNdfvrDTDRMREGYgcbqgkM89fllRObz16ojg6wKFWMzYZpAZgu7LNaPKK
         GvrCD79FVmIxR698qFF7sjvZ1w/ix3yxqAmPIt7CRhteZiquj5aEpLrU7YC9s1WDricv
         0Drd0dpDIR1PV2j6r6PT+vpYI0IShclU23rjpwsClD7/J2A8Qr9+uxG7X+CYZCAGSiTT
         ZcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501289; x=1795106089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWc95ycG40mAmX2MIf/ajSXRL+qWRNcMXx384bP8aTg=;
        b=YmQDCnUuUA2kCAjIHhkO8HaTSD0KOu6B6iKksGPJ1a5n7F4WuAzp2GfSFOnjOWeBlr
         YtTCqTTTbunZUc8os5T2vprC3Vd1gIoIylf0uT/sj6hPoZDYdmJxzzjgcZUPAMqMIDaB
         wP2Y7hg1/COB3M/5hWZnoU4twa56b5JyUGQi3Mhf0sprQGo5P/Gq39Rl+qyTs9KST8h5
         kvs9+ay1dQ0WA/oGV1Nx6dosvpT22QiOu/+ozrasQrwHfySVOXILeCyqb3/IRJZIC3sj
         L0Whsig4zjUWk0p7AagMCX7/Blu7fkEflbmYo+ToA9p9gezxOsJLB2mDJHreaHaRXAyJ
         Acrg==
X-Forwarded-Encrypted: i=1; AL+hErElYeitLzFUxOs7MmpTF//C3FN3xJxf9cGaZv8uNlLg99mJjQumTtLWcUDjrknrfu3cFBiYNTUvV0iCxfB51hig@lists.infradead.org
X-Gm-Message-State: APuU4Z9KlyNPMVFH+B/+yayvc8bJKecAYOfkFlAzTLEVBq+T9v0XoVCc
	zk26Z9E+8rFqWU3limFaoEsnCwpS1nm5SFvlGAfjiAx4856jT+NmIuNF/gI1UX8lnUFXiQMVzOf
	ndCLEuc944IbpyUEzxkxxGxtUGHWcYj056OaUP0FW4Tw2zRuHL9otfQbjn1D54Ux/mbgf0XfDvW
	7USw==
X-Gm-Gg: AYBFou0sLci3+SHUwGoV4vApAILgIsbB6fap9GhYdSccBzvLUbFKJpkUHMN5UZV2yFm
	himtH6vtLcL1Z7wR+oh43MKbOAjkq6a7mhBHvGs1zqetlpVxOLWiBOCKi28RLEYTga7yXRmiJag
	x6WyLRcwmGLIZseARQH0dLgAInSXG89Qel1YTpfkKGTo/Jf0Kii6WZ5XsDq6xYZlP3T/yovYrvp
	4GI+Oq4HWZGzu2gsjj8D5T4PJ08KO9LBMQxtzb7Re+nprYGsr3cMJLt4EaRm35/JEQNMJvz3+Yv
	7+TyE8nBn8Ov53Tt+viCfatp8aV0mKKEkDwBwJ9RMBmDjs9f6bYjG0mMYbOreJbgYq9Xh8JrC70
	UwJA2sxFEOCoCwgUJGFGeOjWQj1k5M+2Hu5pmJdDcyx6wx18C8ueKELEheZ6SOrY=
X-Received: by 2002:a05:620a:808d:b0:939:b099:d52f with SMTP id af79cd13be357-947afff4569mr974884785a.20.1794501288882;
        Thu, 12 Nov 2026 08:34:48 -0800 (PST)
X-Received: by 2002:a05:620a:808d:b0:939:b099:d52f with SMTP id af79cd13be357-947afff4569mr974877585a.20.1794501288257;
        Thu, 12 Nov 2026 08:34:48 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0d7esm197476f8f.12.2026.11.12.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:34:47 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:34:12 +0100
Subject: [PATCH net-next v10 3/4] net: xdp: add __xdp_return_buff() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-stmmac-rx-mb-v10-3-d3d04b65c6bc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfX8vvTPjGMAIsI
 PswYCKoFkzWfNwWgeyHG63RROKXzeG3JgLDTn8I62U6HRvoz7YGkdltL8wCj8ny5cj4Ahfl4GMu
 dx1C1ESYxM4uRDcTE65GHACfEYZz35E=
X-Proofpoint-GUID: zBGxkBHv5G-qlwjVNHni0RJtPfAtqRcD
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af5eaa9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfX2Xhz6blHQNrD
 yapKfk8cHnniBPOYJr/llwbqUSAd/Qfuht5xh3k4eeVAwClD/WaoWceZVKdqrQRyoiCsd3wvsKz
 /0b4uzuYDXIW6o3BlU3LKm3IyO+jXEwqrl0f5q1lq6jrB0DQSQlm0A2DoiUQzvpky0CslKKGqFi
 pNxHtnJdoL8XumD3L9GzwDb3+0Yz1uMoN8VBLkUzjvCPtGNIBZuaiqNK7XARkJ/mxASV2Ok9IU5
 ikH5cvcJo3vH7+d9l31aE/TRqHfyE9XbiSUTL+URZoDnIEQsjEOIwCkawIk5Zr/dESRlEmDidfg
 ttk5JE68NLYd/WNonGeBHmI9dSCeyYf1wcJHkkP1c+bKhWVUW9In7rBOOli55WX87HhiQuFSUtN
 aJDF0Sa3FyoplMRn9QW5a05KAx1xD6Yq9SggigVQEwxd2qBh52JtzChKWRVqucnvGwUuZxIOwHi
 UUyOH3CaOsOYa69Pjow==
X-Proofpoint-ORIG-GUID: zBGxkBHv5G-qlwjVNHni0RJtPfAtqRcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083451_543406_A86F0C8A 
X-CRM114-Status: GOOD (  16.03  )
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
index 1ec49f7a9d7a..fc6c350dca31 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -472,7 +472,12 @@ void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
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
index 7c98dbc2a770..bb8e157bf0a7 100644
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
2.56.0


