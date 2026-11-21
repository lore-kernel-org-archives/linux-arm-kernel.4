Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98978606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Td6KXY/X;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncRMs/Fx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXO9Nulw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=Td6KXY/X8fY3Vm
	94sLfhslJZur1EBmBEWgRZs1pa5kc+rkn7z59hkf7wjdpYy7ZxMGtesg5WXk14/QdTqIwz2h/YXqj
	SpgKlcUdhem9ydEpVTY0fBl1zGG7So/rLwM11rWLl3XOFwR5z/c3XTUSD7wDWPwo5hOoiqumc16xt
	fdA0ffRaijh3SRG+WfTnmlzkZY35DQz7YwgDm6O8227AxQfMACZFqst6FhwR9+ro1SZQXas5nKzbz
	8LiiX8ZtTnZvirx0/jgUx1nxzVIZuB9F+e+zHk55l3zlf9iuTQXX6DvZ84UTuqBMsdfAxpO1Djpv7
	AGmzM6xqnWmYI47Q4+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotL-0000000HaGI-2aSC;
	Sat, 21 Nov 2026 17:28:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUotE-0000000HaD9-2vgj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:28:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa0wl001036
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=ncRMs/FxRq70fumZ
	bEH25c6rwXs9WizSy/k0JdP6pwiHYY7dU0XW9FkB1pNfjacWPy8gtsnCvuuWQM1m
	HMwH70Pn8pumdexGMsqF1pbQSf11FbwZ2glxqfGn4cmK8OtRBcXN9d5xFXUZgtY0
	P0oswngXpWAhhleN4xae/RgjEPgjhWWVWHYA5DO6Tc73fsjXZD8muhD9fjC6K1hg
	9PGm3xbvZZFaWmV2nlIBNcMgILDY9MDUArKXwYRC3no2++apvdhGm/WgJ2j4ybeE
	3ncz0MbOndqoFFRM7nIzpJjoyPdnzu4t34nVjilrbruJntK6rHLW2qSxXHTT4Z2m
	pRamYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1fy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:28:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213730b07eso36107826d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282119; x=1795886919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=fXO9NulwulluHAvybeyyeLRJg4XdbAFIAOEaoFVrepXr3wZKbDwJPz7jH4k21uEXYn
         NzCmVEfb33GCukbKHJNa+PYsexTswtM5Bn9JsMVfLHtC6RrHJKh61FM9bk9Px5vd4ghP
         Le0ZS46tsiTDBpmbFRElLI4J3iQ+Q3HWbzngRInzT09BINWLGT2GuTAFFnLmT6jBjj1P
         J75WvlCY5wSJHB978wjWLFJD1aRSvRaloKZwsi1TX6tnUePChgqgI2kzbkLYrjcsBr/F
         I4hNQiPc/jNipaY921BX/cV7ZDkb9JCBkOQOZekfn06e0m8ASEreRxEm4ddYWZDrE0t7
         3KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282119; x=1795886919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=S4OkAp+e62V8uGu+LaegVhd4g/M2ZnP9Pq+kt3PSS5npcImaRh2d+dhcroCs339uLh
         lEfoACw/6D6dworWF2ooBEbrk9UUQxOHRskfMJxfwP+PaQdMOEb0MuUNHFmaXD3eH76F
         8z7wDDn21q9anpU712Du5BAZ/G3dtboxJ+xC44qYjfbKsnjQyKAFUHqojofXf9PWTJID
         cI8TfHHEiagVPB37iGQ99tdo/ih5off8VqhM4n4fhCBJERNfV3Gwl2yDF1KsXXdtgquJ
         A31ks26XNfVydDd48DOZlmbx7CCT00vjbnWOPwy/Z0/sZ1sTvuBaOo3TLTovOt82hnFP
         7PKg==
X-Forwarded-Encrypted: i=1; AL+hErHlHVqrVNdwNMAwtCS0uVVwf44LFEZ5c9IXX5Ed/y5RsSFi4AH4u0e0BwdFZgsgYqmimm3NjlKdWOuUn0/I4bmZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8zR3BBEv4WkrwS5VIK5KnFtU0t684omxfl6FTbu1n2A0rQ7N/G
	mDLcaR0M0wr+Ja75LzXoGlCNm4bRouUxokXxio1rmCT+mjHOuRXOnn1/iElb6dey2NG1u1qD6wf
	qHNrie5ukiau7YKxY5VPTMtQDrtlviwB+hXH0JWP2IqxqLgrmIIIX4Ku0beFxHSa5b0DAFHhivs
	N5dw==
X-Gm-Gg: AZFdTZdEMal5iVB/ZJkiI+JyBJhyPpfhipzekDHy3CEuBivqCK2c9+xA7X0es93ORcg
	FhVpjaQWf27H915naKQ9G/P9jbK5eyziFCLlCX7fcKZXH7e8SW9jc6tnQwYNUIfCldQ27atfoqD
	Mv0+1hWdu47jG3miI+9u7Jjw21KN0DZUngbaFCNONemQr1384a+qpVTJdoh2NVPS9qfjnyIoNeF
	1289XXv12/gwh1eUd/+Rzwnr1WWSZjM16KsSFM39p9cqSrd+1jBe8chFehlaXOTbWS2OeQXaquQ
	8u0m2WVsrF+Fupp9J5Z6+u8zsj6tZSi+pMMMnXhKBqE8e0vklBg3cp2Fj0wswHztLEVdH7NWyF0
	0vs4GR+pELIYAGRQlHgCPB/IHhw42b+7FB7SU9SSYSSoueOJsHwfAiLlsq8K7h6JRiC9S4DhqK/
	LdoP54pr+gkudz+JHVkDFJ3rSPmKc=
X-Received: by 2002:a05:620a:40c1:b0:949:5708:3cb1 with SMTP id af79cd13be357-949ba67d397mr1120420585a.0.1795282118932;
        Sat, 21 Nov 2026 09:28:38 -0800 (PST)
X-Received: by 2002:a05:620a:40c1:b0:949:5708:3cb1 with SMTP id af79cd13be357-949ba67d397mr1120416885a.0.1795282118477;
        Sat, 21 Nov 2026 09:28:38 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm12146461f8f.41.2026.11.21.09.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:37 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:14 +0100
Subject: [PATCH net-next v12 3/4] net: xdp: add __xdp_return_buff() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-stmmac-rx-mb-v12-3-3ae2f3bce174@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX0nSZBbeTPf/Q
 7WmbprYkud/VGt5oPJNquNAuhuI7Llejs6IGbFZAP9HMMIILlbFQFMiUy8oB07zrynO2vPZwr75
 oYtZ/O4FhH88ap769rPwofwDuLjdCO1d46aVf3Ieqp3iCivhw7c4t1sjLNqhcTIwBvLRKyj2DId
 dzXQ7lUDxCb62RYyjz3f4ZGj4KwYtmmVI7DR9l/jh+f4PeEjNt4fQYgp6KoFbSIZL9vt88rr4N6
 +UXCnaBcUy2zgWYUq3zoyfkEoXtAezhlAdYcZJPW1qbtFN6eMa3nT5H2ADdqb8ic6s9qjDu0R9+
 EXbgT+3VYHgonEaOPykA1T2znNZOWGJs2vWc0RtQBNIGBsagiM0ZnX5ld5nFv115lnE41m/UgXf
 qpJvXiqtoCmq5vSxxxUcdsuRw/ha1mgPbHysCcwAQ3Qpl42WGRHfCcJioKxDg/t44k+94OrdQv6
 LBlbVoxJ8w0t8SXWgxA==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01d4c8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ftBiR6wuPj78lyOPIc_-Nhm6jr7pmhnT
X-Proofpoint-ORIG-GUID: ftBiR6wuPj78lyOPIc_-Nhm6jr7pmhnT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfXw3tMHPA7KNQb
 L3ohFNPe92NbkuulB8xpKtWqMiTm5gjvlAnz1UmgqgCkgPvKkfE6XySeVRv+MaJmZT3S89E55BY
 fBxBNozFebBUIvBpkizRHYU0bAl3TlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092840_761237_36F421AC 
X-CRM114-Status: GOOD (  14.93  )
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


