Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FAC606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IYZbChmo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZRczmZN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpyxGxDy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N8Sxm8XiSudcNG9BW8w5hvCi8/CmVau/gswvd5wgkPk=; b=IYZbChmovKc6pVs9x2u1W33FPn
	3qcl6EUOC/d8NTN3vk63Hj9gH8IgScqaYBpq9RroZTTaYDbq+D/EmfOMy4kcLmeD4AebBZ9ld8Oiy
	rDq/r+SOMPvLjYA0dwWpbDFfe9sh/5WHFeRRmqDYqoCUTzekLxFBkTc3vjSlIJEJECkfbPUjETiq0
	al0Uyo06yr3oJMANIxF1g/5tWHtHxZL+a9TivaLGNXMB15TO6DrreMaNkLq4xQmmRJsq0VpkiAGDR
	bS2r7Ec/boyyuoXmxsDl7mr5cSDE6OheBVEkeSyfou78lwjyDT2XOzuzUH2ImxW0fnrhAFEvbu40Y
	+bKKYE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSgj-00000009cxl-3caA;
	Thu, 12 Nov 2026 11:09:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSgh-00000009cwp-0fOn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:09:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j8wB126726
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject; s=qcppdkim1; bh=N8Sxm8XiSudcNG9BW8w5hvCi8/C
	mVau/gswvd5wgkPk=; b=aZRczmZNEnYsaFzeBhuPfu4rnEXN04hXMUB5/K7TEDg
	I/Ww4v8ot1+yIuz0l3V0LWg3kplM2IweieQ+Ga6VIhcJpbK2enkqkKywJ0jVqXUD
	FmOWV6/mnzhWUM9wAG29dHJEd+QE48nTlX4ga/AiOwk/Rq5nafrQORIBGzTaaBnk
	/enlTcT6fCXQPuxivCspDFfp8tKlVxt/TjEtsuFkNMNv8O3iMAPDW+yaCrlFQWUq
	ftvzQOWzupdzxSXKCiJ69t1EcQSYbAi8pJ4yhwpvLmOwyEldRkkK/6dUd0Jvtvcg
	L8KFnOttc4fEshfUlaEHwRatzwPpRqcxexLL9gdstJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a08qtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:09:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so140434385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794481789; x=1795086589; darn=lists.infradead.org;
        h=o:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8Sxm8XiSudcNG9BW8w5hvCi8/CmVau/gswvd5wgkPk=;
        b=XpyxGxDyg1tnOqciV82QDknD9d9bg5YMwvp+CU6/4s0hiMotgJqvuZupd21ste2NXi
         g0dqeTspJTb5ZVl9gSCypOKyLUI6MEd4NesTw+n0MU1VeSZBljJnBBHlh4t/9AV+v+Am
         LNXelShMMrPv86GYBxEgVCV2y9lkVvoRGfAPyYI9Nbesjra3Xp2Vjr0eJTFHeEGtsUFb
         Q+eQknVEf3MtJufL4Cvd6pVP9nRBSbW58GtmR7GhQc8v/4PSjx1N9jesxGD41mVnVEX1
         tHk7vYdgGy+7ZKNCUgMbheriq/0BmBu7CDG6wlUNjix92MwZhUApBecTu+WHyCBmI8WI
         9YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481789; x=1795086589;
        h=o:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8Sxm8XiSudcNG9BW8w5hvCi8/CmVau/gswvd5wgkPk=;
        b=u7Lbss7IOT7gg7R7WwSG9BaH2VWdI0I7g6zo8F97J27rYev1LhJgJnzCHBtLG72TRc
         84ZXA5YT5WTq6A06vwGzL8nQVF+soMQAxtrkeN/87RPz1i/cd5ZnsRqcvXD3PB0W+cun
         VtJMMGCiEgG2eiMGVnFnDfTBNTQYopLAmzShZDVPqn+gBuHXQu8AV/jVlptvS3+NO8dt
         C96cRMdQFAZG2yuB1+PinjmUNpOijbirDj6OV2F1tJc/PGWuxB4jSX7EJvBdF0xt1pBM
         EEMFtVwQS9n0dbGb2pigdU7535Cr+JeHcwc/gPnYIIkolG8UGtHH8gaHv/n3szwyqon0
         noMA==
X-Forwarded-Encrypted: i=1; AL+hErH6xUkNavrxBqIi4TziZgyHrM1VNB4v0X2mzye77aZc4dOXtYwCr3TzUHTNB7VGuqU5Um7a+4bCBo+aNFC71xog@lists.infradead.org
X-Gm-Message-State: APuU4Z9jo3HhDLKvoYeX+gWD+4ddVEOqEWx+fOocUSAEMXQEBRz+j3xX
	yXEEG1s+7jRHeYMBN1HyjC7xpVWLetUqcRDdfNtpOZkmBWB8NdqCz07HDGHJtK9K7aUitYnSuaC
	nKkLylYoHxPAjEeQtAGXsA0nLuIpdFQtpy2J5cPdulNHHcsHvshhddr8fQd0iYEAZ60t9KlqCsI
	t2uw==
X-Gm-Gg: AYBFou15ouTTbVfriXakARCUMWzjbvbY4cIls7qeOfCuFUZoSIERDQmiY2nC11FZH5/
	cbcmBUd+f6ZHp5Gxy/lfH5YRymy6tk6TUIcKZr3VYsYIWMk6sIVyi+/pY/gs461mK841TK46x+2
	i7wlOnKZVHRegTRMSle/q2t9LnIb+53Amb38X2sgOTMrkVuqx38S+4loP+aS4RvINr12EkQJRm5
	zbP+CTg8djtoA9sVbs6z6LtwPy+F5Us37VvNJqgwc59BkmH3XUPIIRc+etcbeFeptmailLoAota
	sskZ9RTB7LEIiyoloyxGoE4H2uJ9Z1xlOA/Gqj75bENAcDArAQZwgrvEsOsxZY+NLcnrf0Uyjs2
	8mozUQ3n7ycIqODr/L11D2BL3PpqJO7paLCmJgYP440Uq0m5ZmCgAA+JxybKrWDE=
X-Received: by 2002:a05:620a:412:b0:93f:4498:603a with SMTP id af79cd13be357-94933140d8cmr273168985a.35.1794481788266;
        Thu, 12 Nov 2026 03:09:48 -0800 (PST)
X-Received: by 2002:a05:620a:412:b0:93f:4498:603a with SMTP id af79cd13be357-94933140d8cmr273166685a.35.1794481787607;
        Thu, 12 Nov 2026 03:09:47 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm120060095e9.1.2026.11.12.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:09:46 -0800 (PST)
Date: Thu, 12 Nov 2026 12:09:45 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v9] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
Message-ID: <avWeeUAo-87qexve@lore-desk>
References: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
 <20261111181341.56706354@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5Zoifa3Cp4gU6eN"
Content-Disposition: inline
In-Reply-To: <20261111181341.56706354@kernel.org>
o: Jakub Kicinski <kuba@kernel.org>
X-Proofpoint-GUID: JqQ6U8oz7x-v6RmVoG9lnOytGyEK9gfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NCBTYWx0ZWRfXzLj5xNGOnv3E
 9+sIDGCpWehsDveGSYTCRNYbh7zt4Oec1RhB4EuHg0Jf4uLqD3Tq4SDW6+WIK4B+7X6KyHrr3sG
 5VWWriQ13AGuyRnCaEpy3Uv7lO+oAyTFE9XE1mnHcUm8e6biJz0YtYNGAndqC+axL1cq86NcCXz
 FsUUQ4cUpWwbttXXswhtCdW/DFnfWtPg8mK1XJtg/vZK4YPmPRKV7WqDqmu4OrLrJGDzVKGW60l
 PyZ2fiqldmY8j/DEjrotbcuvRaKgTBCrXQvEWkFMZpHTjTVVBsaYGBsUUIuedtUXFzE1mf2aH10
 mQmXjj5HwxQn9OxknMQBC6hymWM0txQEcXPEIMaJ4nxPIaGS09ecW9p4ZEKeC3KnYQFI8emlKXm
 4f6YaYa6CkptxhX0H1lik2xrWSPMDDe+5Q5T/CxDHo07B7KjOOKvd+Bk7FwjlRlsYvKc4ARZXwS
 iqObKqtfCanmnpDAr5w==
X-Proofpoint-ORIG-GUID: JqQ6U8oz7x-v6RmVoG9lnOytGyEK9gfy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NCBTYWx0ZWRfX6y1GdfgwLu8K
 H8tYu5c0zpmCisIDpwE5ZBbY8Baf/isRGXPsRWuyqRygqL9cbq6q/+LIm/j8dkqANgRkADEGyKD
 IAxifWPeBAX1T0u32yFGFacOf2KTQcU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af59e7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=9cW_t1CCXrUA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=07NEhHcJ6ct1wQha1QwA:9 a=CjuIK1q_8ugA:10 a=HwC5dmO7DALaZ-7ppEoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030951_321348_A5AFA940 
X-CRM114-Status: GOOD (  27.71  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--b5Zoifa3Cp4gU6eN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 06 Nov 2026 11:54:19 +0100 Lorenzo Bianconi wrote:
> > +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> > +{
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	u32 metasize =3D xdp->data - xdp->data_meta;
> > +	struct sk_buff *skb;
> > +	u8 num_frags =3D 0;
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > +		num_frags =3D sinfo->nr_frags;
> > +
> > +	skb =3D napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
> > +	if (!skb)
> > +		return NULL;
> > +
> > +	skb_mark_for_recycle(skb);
> > +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> > +	skb_put(skb, xdp->data_end - xdp->data);
> > +	if (metasize)
> > +		skb_metadata_set(skb, metasize);
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> > +					  sinfo->xdp_frags_truesize,
> > +					  xdp_buff_get_skb_flags(xdp));
> > +	return skb;
> > +}
>=20
> This is almost identical to xdp_build_skb_from_buff(), why not use the
> common code?

Right, this is almost xdp_build_skb_from_buff() but we can't use directly it
here since it runs eth_type_trans() and we would need to run stmmac_rx_vlan=
().
I guess we can refactor xdp_build_skb_from_buff() in something like:

struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
{
	// Do not run eth_type_trans()
	....
	return skb;
}

static inline struct sk_buff *dp_build_skb_from_buff(const struct xdp_buff =
*xdp)
{
	__xdp_build_skb_from_buff()
	skb->protocol =3D eth_type_trans();

	return skb;
}


>=20
> > +static void
> > +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
> > +		    bool allow_direct)
> > +{
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	int i;
> > +
> > +	if (likely(!xdp_buff_has_frags(xdp)))
> > +		goto out;
> > +
> > +	for (i =3D 0; i < sinfo->nr_frags; i++)
> > +		page_pool_put_full_page(rx_q->page_pool,
> > +					skb_frag_page(&sinfo->frags[i]),
> > +					allow_direct);
> > +out:
> > +	page_pool_put_full_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> > +				allow_direct);
> > +}

ack, we can rework xdp_return_buff() adding the capability to specify
napi_direct.

> > +
> > +static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
> > +				  struct xdp_buff *xdp, int offset)
> > +{
> > +	struct skb_shared_info *sinfo;
> > +	int i;
> > +
> > +	if (unlikely(offset < 0 ||
> > +		     offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
> > +		return -EINVAL;
> > +
> > +	if (likely(!xdp_buff_has_frags(xdp))) {
> > +		xdp->data_end -=3D offset;
> > +		return 0;
> > +	}
> > +
> > +	sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	for (i =3D sinfo->nr_frags - 1; i >=3D 0 && offset > 0; i--) {
> > +		skb_frag_t *frag =3D &sinfo->frags[i];
> > +		int delta =3D min_t(int, offset, skb_frag_size(frag));
> > +
> > +		if (delta =3D=3D skb_frag_size(frag)) {
> > +			/* The whole frag is consumed by the strip: return it
> > +			 * to the page pool right away. Its ring slot still
> > +			 * carries the page DMA address until stmmac_rx_refill()
> > +			 * re-arms it at the end of the NAPI poll. This is
> > +			 * safe because HW cannot touch the slot until then.
> > +			 */
> > +			page_pool_put_full_page(rx_q->page_pool,
> > +						skb_frag_page(frag), true);
> > +			sinfo->nr_frags--;
> > +			sinfo->xdp_frags_truesize -=3D xdp->frame_sz;
> > +		} else {
> > +			skb_frag_size_sub(frag, delta);
> > +		}
> > +
> > +		sinfo->xdp_frags_size -=3D delta;
> > +		offset -=3D delta;
> > +	}
> > +
> > +	if (unlikely(!sinfo->nr_frags)) {
> > +		xdp_buff_clear_frags_flag(xdp);
> > +		xdp_buff_clear_frag_pfmemalloc(xdp);
> > +		xdp->data_end -=3D offset;
> > +	}
> > +
> > +	return 0;
> > +}

I guess we can exctract the logic from
bpf_xdp_adjust_tail()/bpf_xdp_frags_shrink_tail() and create a helper we can
reuse it in stmmac and filter.c. What do you think?

Regards,
Lorenzo

>=20
> These two OTOH could easily become new common helpers, they seem to do
> nothing stmmac specific?

--b5Zoifa3Cp4gU6eN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavWeeQAKCRA6cBh0uS2t
rPFeAP0VMe/78PkVnBIxUEdWOxWNS8mn/VHlUChXe7LArItcnAD/Z3cRi1H98JVr
c0eziNWwRX+hmLoGHFwU5ALqhPHhXg8=
=ojdi
-----END PGP SIGNATURE-----

--b5Zoifa3Cp4gU6eN--

