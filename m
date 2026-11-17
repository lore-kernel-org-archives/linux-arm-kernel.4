Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66353606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D2t+Mcl9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwFZS+o6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DeOZ64Ww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CRYqBTv4x5sG5yKQiqFGY54mrAYYf9g0PlzTS//Wg3Y=; b=D2t+Mcl9DUMCk7J4jakh84zZe6
	o5dr4q3ZIND3BaSGEYVHVwUhfGhyAte78YalcCqJn4ZdMt25nkTlIVdVFTOXw4xWuxp500qYFHQ0p
	4E6+vE8dAUIxVXnHXb1xYPiVX+OYslvDYBpBME3530N4I3puzk5nmltJ61xHdsCjQC4t18F339y1v
	sQ3u03zl8tLW+5yA94AYUHO8F1Z0E4ca8W4fbTswQu0p+VNjVm9eBUXCnh2tHEdmSq+EcrG5TC170
	uyM5p4e7POuS2CTSKUnTmQTPeihurRy6jk2+uGDzdeIb6CIy70DBOuN0q9Q5QBNRAF248E3GCj7TX
	APIPIHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIjO-00000005ldb-1tOv;
	Tue, 17 Nov 2026 12:56:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIjL-00000005lcb-40uK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:56:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1D3T198293
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CRYqBTv4x5sG5yKQiqFGY54m
	rAYYf9g0PlzTS//Wg3Y=; b=nwFZS+o67KhwDPfC7G9harCmXeX98czysd8GWGuv
	tVQdksrBdJ78Z9xIVi8U0NSB+r+RPOukgdMYNPmZ4YhXYg6d/U12PP7v7qt3Ntqm
	Y3TK4z5/WsIApoTVMgJgXKexN6AsiSBII8Un54PjjUwHAoRVN7bZzHb8GS6KfCLl
	I3rXAMr5snleHPi+Hz6EnUC52M/0MiVguYtPGGT1BjSVh1AbQ+MK18otqqUIJNx+
	jsOtc9HHWJ3Q8nWV8BZs64JWWSpr+f24eixHmQl5hCudKHf2TQfPu+2qh97ExHsx
	be6dDdiMC5GVAlvslyL7yrnGg1P6a1cuIK2eACbcmWdK5w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9t54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:56:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so634535241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920170; x=1795524970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CRYqBTv4x5sG5yKQiqFGY54mrAYYf9g0PlzTS//Wg3Y=;
        b=DeOZ64WwBsvKuZGus6HRfb2y1Z3pasaPuyLEk4MyB6KErf2DPzKvpu6Ysf3zKuYquF
         9XdrFhnbcSlIh5HNN1lQpYrFCSo9Pi0dz9rYKEAYDCauCjmnZVsTikwm/TrYf0TRTRyD
         AJG8TmTKGijkV2kZflx5E2UMXHvqDYWAfSzkjrhBrv8vXvoGyjo8unIX+zq6NBIKRvLb
         +X96rEJ4iQCuHWMXoP5jvSodQJFstLWg292rPHABm6PKoC+PU0XHO7UedWaWgkxQEvmj
         1UAUVi7HWgfZ0slMxapgGRfHUQc/vXLS78WhdqYAfSg1VHS9GWc2qcU1C97vvTz1ypIF
         HCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920170; x=1795524970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRYqBTv4x5sG5yKQiqFGY54mrAYYf9g0PlzTS//Wg3Y=;
        b=ZbJSCvGvY1tUS4bK6h2GBy6t3poPzPkPHQ27qkFmdMIgwlafa6EYQASVEZxRYfeX5l
         NDAOCRkwmRl6o6YTTh5OGU3E/P+DSll1+zCJ+lGHjk4bY73nZpn4ekptpMYSSSILKHo5
         qzmY18K2xRqmgUw7s3EiXP7X6VxEQek3U6rmON0DKvhltmfg64zwZkOnssLZKJnEwEJ8
         MVi0EvxDSp9HKoFVivw4NNDdzHArPFZkqR5v3SuEL8EtwYW6fbyW/FIfCnLR7ES1c3ht
         ZQHz8b6S0cwpCifpZCuOrgR3Erz35GHtqXrh374fVe0eskDfKwm1wkp6OjuEbYvc9O/F
         tVPA==
X-Forwarded-Encrypted: i=1; AL+hErFaFxvvmMu8usrjbrO7/5eWjEvsFaEN1BSGG26nYlKe1J+jc4U++4ZbI/khWNE1Sz4yTV4Lq/0ODiedEzAvuBlu@lists.infradead.org
X-Gm-Message-State: APuU4Z8vW/F7k10A644OSQ4/Z5iVKUl3z7JpBoCmioN/SMIOmKjfUKl/
	3AVUAwIfOZWvzjF/EXtMT+PH8UECFh7xjQtl+ZEdDrXWGRSJ/MOIHFyEL/198gOOYMmDjQR12I2
	7DNfHRSxVRhAfIGrqp1e1nVjlsw4ybka+iXB6/fvE6LLN8C6Lf258R9s01c38ZpzCJEd3KZ7D88
	w0Cg==
X-Gm-Gg: AYBFou3L4AwhF5Cb8wzcbY+RGk81hggbj8mX3e5/1MMeeZZ9Gb4s3eXYLsEhH1i25jW
	ptqGg+2uje0IVuqU7++Tb44sVlmKoB6wbNp+g0ZB+CiuJMRiT8KguEgzKHlJw+z43u4tPo/2OxO
	xvHWNZfXzhWmSKWDVkT3N7WQADDtJpaKlZ9dj3BIDjs9TYGKMwMt2lBhQGNawbvS8FMVtxvYy+y
	Ofyk1Y6o3hqsCwjkWBhClLEplJNl0TCMe+mORLbX2lU3SvZUIN1BmzPFMmrU1HKEH9bydxO2XOI
	KEr2e6arM8DxKRzWKc/uXW1ZDXOh1eP2U3unOgLgwKDq42xCcWZIsJSvAfrAh/TJ7V5lJ2JNIZx
	kIJ4EWU6//IoiT5LUsaUoteThdw8fsjbrX1TkOHg/OWiBB9veygAl1m2iPl0JynQ=
X-Received: by 2002:a05:6102:84c2:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d64d6d61b4mr3074693137.10.1794920169978;
        Tue, 17 Nov 2026 04:56:09 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d64d6d61b4mr3074669137.10.1794920169296;
        Tue, 17 Nov 2026 04:56:09 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm72247915e9.4.2026.11.17.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:56:08 -0800 (PST)
Date: Tue, 17 Nov 2026 13:56:07 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, horms@kernel.org, andrii@kernel.org,
        eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
        emil@etsalapatis.com, ihor.solodrai@linux.dev, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        nb@tipi-net.de
Subject: Re: [PATCH net-next v10 2/4] net: xdp: add xdp_buff_shrink_tail()
 helper
Message-ID: <avxO59MbI0ql5YhQ@lore-qca>
References: <20261112-stmmac-rx-mb-v10-2-d3d04b65c6bc@oss.qualcomm.com>
 <179484961693.3136.10654880889378798099@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kB4YMmlds/8C4Vd2"
Content-Disposition: inline
In-Reply-To: <179484961693.3136.10654880889378798099@kernel.org>
X-Proofpoint-ORIG-GUID: o0t4R6CyhqyDL0xpdP1Yi8h9x5upjGPQ
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc4eea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=haHO5IcbFzYs7ll2q3kA:9 a=QEXdDO2ut3YA:10
 a=OVCSiOd5OdK5HwpI3AwA:9 a=o1xkdb1NAhiiM49bd1HK:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: o0t4R6CyhqyDL0xpdP1Yi8h9x5upjGPQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXxVNKwfGDPwtH
 LPkjJYhHcvmGhRFEyvLY/nML63fGgsdEtwov+fOkasm1TlSWmGozhhADOAVdx5gBnMrCQyAumQc
 xw3RyHIS1NrRtTX84KcSSatdsrs6Dbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXwpiQ/foFcFa5
 aqlSYx7/L3aDnveocV4GRZB9fNqN/NCEuG9GFkCiFwWOpCET93vPoIyTPwOVYhwGk2RwdykoKRi
 QsDe6rwVCbO5tDJhu3hkY5RAHK7Aiz0/zZd4nOoOtu+o/OnjyvfR1cA14P/Phoqwevw/qYWUclE
 3c6ESjWi4E2gi69Ma2PqR1mL/vSJPGIORJd8TkgHGvXXRvC/DnV8LBtsepYiwuIZtp58SQFfYcd
 r1dD6vrJ/zeFg036B8VMgdTRbkdojwGLRwJmp/51n8A7GfIOgx4Q0YIxjK4iHntUCwRBU4M72Su
 Fo5NJQC+isu0QpYaBGlgh9xJkV36LTvd2b3ECKO83CZnOcyscCZe3KGBlbJ398ntRrW7U6rdKqC
 gWF7qjpK1CQf4kWsSrq2gVzlVxN/gw+XeP8w6PrYuamAWsG21i4deDLr2qWLHLpaBB2MUfWAbCa
 7iDOXFPTH16GaH9fvaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045612_116304_DACD001C 
X-CRM114-Status: GOOD (  42.53  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--kB4YMmlds/8C4Vd2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 2 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Critical] The patch removes the lower-bound check `data_end <
>   xdp->data + ETH_HLEN` from the linear path of bpf_xdp_adjust_tail()=E2=
=80=A6
> - [Critical] The new exported xdp_buff_shrink_tail() (net/core/xdp.c)
>   checks a linear shrink only against the lower bound: `data_end =3D=E2=
=80=A6

I will fix them in v11.

Regards,
Lorenzo

>=20
> --
>=20
> net: xdp: add xdp_buff_shrink_tail() helper
>=20
> This moves the XDP tail-shrink logic out of bpf_xdp_adjust_tail() and into
> net/core/xdp.c. The frag shrink helpers move with it, and a new exported
> xdp_buff_shrink_tail() handles both the linear and frags cases.
> bpf_xdp_adjust_tail() now sends every negative offset to the new helper
> so stmmac can share it for FCS stripping.
>=20
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 9b8d5191c4ba2..5ea45dfce7a22 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -4438,96 +4438,21 @@ static int bpf_xdp_frags_increase_tail(struct x=
dp_buff *xdp, int offset)
>=20
> [ ... ]
>=20
> >  BPF_CALL_2(bpf_xdp_adjust_tail, struct xdp_buff *, xdp, int, offset)
> >  {
> >  	void *data_hard_end =3D xdp_data_hard_end(xdp); /* use xdp->frame_sz =
*/
> >  	void *data_end =3D xdp->data_end + offset;
> > =20
> > -	if (unlikely(xdp_buff_has_frags(xdp))) { /* non-linear xdp buff */
> > -		if (offset < 0)
> > -			return bpf_xdp_frags_shrink_tail(xdp, -offset);
> > +	if (offset < 0)
> > +		return xdp_buff_shrink_tail(xdp, -offset);
> > =20
> > +	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
> >  		return bpf_xdp_frags_increase_tail(xdp, offset);
> > -	}
> > =20
> >  	/* Notice that xdp_data_hard_end have reserved some tailroom */
> >  	if (unlikely(data_end > data_hard_end))
> >  		return -EINVAL;
> > =20
> > -	if (unlikely(data_end < xdp->data + ETH_HLEN))
> > -		return -EINVAL;
> > -
> >  	/* Clear memory area on grow, can contain uninit kernel memory */
> >  	if (offset > 0)
> >  		memset(xdp->data_end, 0, offset);
>=20
> [Severity: Critical]
> With the ETH_HLEN check gone from this path, what stops a grow on a
> linear xdp_buff from wrapping the pointer?
>=20
> The offset argument is ARG_ANYTHING, so a program can pass any positive
> int. data_end is computed as xdp->data_end + offset. For the linear grow
> case, the only check left is data_end > data_hard_end.
>=20
> On a 32-bit kernel with the default 3G/1G split, packet buffers sit at
> or above 0xC0000000. Take xdp->data_end =3D 0xC5000100 and
> offset =3D 0x3B000000: data_end wraps to 0x100. That passes the
> data_hard_end check, and then this runs:
>=20
>     memset(xdp->data_end, 0, offset);
>=20
> It would zero about 1 GiB of kernel memory past the packet buffer. After
> that, xdp->data_end is set below xdp->data.
>=20
> Before this patch, a wrapped value was always below xdp->data + ETH_HLEN,
> so the removed check returned -EINVAL for it. That check now exists only
> in xdp_buff_shrink_tail(), which runs only when offset < 0.
>=20
> The return value also changes for short frames. A linear frame already
> shorter than ETH_HLEN used to get -EINVAL from
> bpf_xdp_adjust_tail(ctx, 0), or from a small grow that left it under 14
> bytes. It now gets 0. That seems to contradict this sentence in the
> commit message:
>=20
>     Behavior for valid offsets is unchanged.
>=20
> Should the lower-bound check stay in bpf_xdp_adjust_tail() for the
> offset >=3D 0 linear path? The later patch "net: stmmac: rework stmmac_rx
> to support XDP rx multi-buff" doesn't touch bpf_xdp_adjust_tail(), so
> this still looks present at the end of the series.
>=20
> [ ... ]
>=20
> > diff --git a/net/core/xdp.c b/net/core/xdp.c
> > index 470bf90d93ef2..7c98dbc2a770c 100644
> > --- a/net/core/xdp.c
> > +++ b/net/core/xdp.c
> > @@ -672,6 +672,97 @@ struct sk_buff *__xdp_build_skb_from_buff(const st=
ruct xdp_buff *xdp)
>=20
> [ ... ]
>=20
> > +int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset)
> > +{
> > +	void *data_end =3D xdp->data_end - offset;
> > +
> > +	if (unlikely(offset < 0))
> > +		return -EINVAL;
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
> > +		return xdp_frags_shrink_tail(xdp, offset);
> > +
> > +	if (unlikely(data_end < xdp->data + ETH_HLEN))
> > +		return -EINVAL;
> > +
> > +	xdp->data_end =3D data_end;
>=20
> [Severity: Critical]
> Can xdp->data_end - offset wrap here and still pass the lower-bound
> check?
>=20
> bpf_xdp_adjust_tail() passes -offset, so a program can ask for a shrink
> of up to INT_MAX bytes. The old inline code also checked
> data_end > data_hard_end for shrink requests, and that rejected a
> wrapped result. This path no longer has that upper-bound check.
>=20
> Some 32-bit configurations put lowmem below 0x80000000. Examples are
> ARM with VMSPLIT_1G (PAGE_OFFSET is 0x40000000), nommu ARM (PAGE_OFFSET
> is PHYS_OFFSET), x86-32 with VMSPLIT_1G or VMSPLIT_2G_OPT, and m68k.
>=20
> On those, a shrink larger than (u32)xdp->data_end wraps to an address
> between data_end + 2^31 and 2^32. That is always above
> xdp->data + ETH_HLEN, so the check passes and the wrapped pointer is
> written to xdp->data_end.
>=20
> The packet then appears to span gigabytes of kernel memory. Direct
> packet access, bpf_xdp_load_bytes() and bpf_xdp_store_bytes(), XDP_TX,
> redirect, and skb construction on XDP_PASS all trust data_end after
> that.
>=20
> Should offset be checked against the linear length before the pointer
> subtraction? This code is also unchanged at the end of the series.
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc%40oss.qualcomm.com

--kB4YMmlds/8C4Vd2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxO5wAKCRA6cBh0uS2t
rEaaAP0bCS+8PXbCG4IQReMWkZwemcUWcImjpdq9d1cLr9EguQD/QGWDD2EyxewI
SjOXKQpcar8Y7mQ+mx+C3VPKTfHBMQs=
=dcAu
-----END PGP SIGNATURE-----

--kB4YMmlds/8C4Vd2--

