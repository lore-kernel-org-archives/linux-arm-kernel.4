Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B8606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ysEM/ZT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu1Zs6O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pzcn8p34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=; b=1ysEM/ZTC7WP2Po9Fkq7nM57d8
	PWx909DcjzblmtKRiuW+7wpFBKFNYqt5/Yoh9yP/86Wt4RkFJlNaYOIa8OZrplR7PfYgJ0+BXJ8Ky
	6i/rPXMiNoc2Ir73kIl76MGxGZe4XPAv/roQ61NS31UhR37VRsrmb4tk2KFyrPInc4mTeXPEoHPZa
	6oibqIyFQpwnRoOBBx5OM9o+3ydftLWYl+Do4DmbE7oL6RZJs3npePYgM3a3NCBQdfojCt/5MYypV
	RDCroI0yBSMhVprkV2Fo758O6E5Kby4w7v0k8erEmtVg5oMSj4uM1hOT0+hxQX/VPuDSFJiF3gsG1
	D4a0hvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIir-00000005lSf-0UAO;
	Tue, 17 Nov 2026 12:55:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIio-00000005lS4-2ek3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:55:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0wgH3048138
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z4dX78GuYSiPqA2FlATo7FmV
	UT99P1UESYr9b7xa8HQ=; b=UVu1Zs6O5pjQrgl8jVoF/KSh952CKn4Mxao/SNKs
	kqd8b2qwDynvMxUsmaLrYj6z2BVYlmzQLy+CMsa5df9q5YFmgNcD88e53Vl3WoAu
	jiOj3LPr0c3oRHbnw7Xuu7bifE9RYQ/7/MCa3H8UEMqxMY1e/Zn6cAY1UfBlSiXx
	E15H98yH5J51/dNLeorOkf6Rpy7dzNn5KZtDQQp2WnPb6nbgReyzSmSvVjO7q0HS
	fK5bJhNLcfvjKzhKbTPRpWQuKkx/iLoJVzpDaSaRdxscycDH0+UVJvdMUFsc1gu3
	eGkWUBMWQUfiWLeFIksrtmBIBLh/ZJPJIoYhq7woprUJ7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10mvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:55:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1263338185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920136; x=1795524936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=;
        b=Pzcn8p34Bb9WLdO+ttiynJkUrPEAQ/tqvS/BmRkXXh4/vDOtFxDYaolaLo1apeA5DA
         7fB1UCIAYhNfNSp8ZpsnNjdSlXi74nMVnIGkfd1uaMyKnZP+miZiS+tqFm39FGUHVniH
         WxniLyd/YKFhY6L/iDDsctyU8O4Evax0FCtpdx7xls1TE9MsgQp6PeVPh2AFMAco3cO3
         ONsLD5BXSiqI5TCt7AleA6wyOCuMRenGvNg1zok9gYk/rLi7lyvBtp86sFyKH27p7nA3
         YXB22JTPY9L9Fk5guo9tYaZMjN+1DdZcA2b2RVkv2ctHw/zTj2k+dGL3L7fIFJVTQHyw
         GnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920136; x=1795524936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=;
        b=qPSkbEUYmem5f2hsro0aaelZbCVyNG5fY/8pNZr6dfbiDib9Ee7iPfHWIcFo3DfR8h
         PglyOfkFcbYPyvAgKJ6lFQVSz7323lBcp5RLV+QfK/eEFEG3YYYTLiaPVnOLBWMqXBss
         GjRoZRGbNz7AbPufBc/iJ6Ve5iub1bRg3/kn615Z1VU4+OtRKcmPURc/5lPQW9EGOWu6
         uzoh+jt7XFsCG0WlMrl2qZmPE/zfrDEa1abwEcy1rVjGiVAfjcmNxDH9MGQS4oyIAddG
         ysNkQzr/YEGEL9bj115G+bYAIamKwHpdRU9QtabWQBqPwbCtfchXShtvR0K3TjhpAHwz
         908Q==
X-Forwarded-Encrypted: i=1; AL+hErFf1NqWrbHKte920zZcgZP8mrSocRlYwVbQOlnymTZbGERBKp+0OShJzjdKV2DqGM9VfI4v4z9rw0dsMf6VFD2m@lists.infradead.org
X-Gm-Message-State: APuU4Z/JmyaWZakBi9vZA7JgAd1Zo49R73N5cffmkBSj35T9tvSwq3ta
	JyKPi1oaZSnL9sJ+FWjLm/PWVwbzIBFExCyTyM3z1hlJTrSK03B+l20RyC6QFowt2yr1cvmeQza
	9ScGz/Enn5+VzTBRtN6LY2pVdJ1jIUXDaFrD2r4wsDWQwD0bVNa6sr3HayBDaQtaSQP2RaHPzKv
	l+7aahHiO8mZN0
X-Gm-Gg: AYBFou1rbcxcVWeQFp4xdkG3c35DrcrKD1ZUpkrYH0jw3ASHRRSqNmfuW+u4czV25on
	O9btlxUCU4SDGGW570M/xqvQW6Lpr1qsVuXL78G2jo6wuQW1/ggDtJ7WSjiJFtuMcgY3R3YMKU4
	taUQd+zFkSzk6WTzhSGfaF3qbfW1zoEI8ftA+iCp2Ce9bfuKLgjU9UYk824mWwcxugBZVc/JlXH
	B3FhDa2wR7dP7uKvusCO+tgbycN+1jlEFMqm3tNUcR7LfIuNO1tH5tN5tkPCvGR8S5j4wXxI0gw
	S2E353zOpsyD1nKMYH1z1s+qy3LbsyMTa/2OJKGzhoBZWJZ1ihowxUnnuHwcUYmhl0Ulq10ZC4z
	nxktQQqTjYtCfLG1eK59QN3Gl2eYnTqjhwSVBYdE9oxSOdFAIAyUBAeBe+tbpsRM=
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr2188193985a.40.1794920136230;
        Tue, 17 Nov 2026 04:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr2188189285a.40.1794920135649;
        Tue, 17 Nov 2026 04:55:35 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm5159093f8f.58.2026.11.17.04.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:55:34 -0800 (PST)
Date: Tue, 17 Nov 2026 13:55:33 +0100
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
Subject: Re: [PATCH net-next v10 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
Message-ID: <avxOxc3sU3bd29-t@lore-qca>
References: <20261112-stmmac-rx-mb-v10-1-d3d04b65c6bc@oss.qualcomm.com>
 <179484961485.3136.18371294575845722948@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IgpR4FCbaFWOr+d8"
Content-Disposition: inline
In-Reply-To: <179484961485.3136.18371294575845722948@kernel.org>
X-Proofpoint-GUID: e4pNbDqrROCgGOxAWUWezs3tvq-mzRC8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX+SNaLkY9VJu4
 UEpBSQef5UYwE5coFDBRH8FdEUaI3+bV+T20XkA2BQXUEthu/ttYbfMWaDsoHtpnNgYaY6xXVTE
 fTedpzf0foL9gXlhNzR6BPlpSe/p92M=
X-Proofpoint-ORIG-GUID: e4pNbDqrROCgGOxAWUWezs3tvq-mzRC8
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc4ec9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=--SqLFdaUOMV0DsZRZ8A:9 a=QEXdDO2ut3YA:10
 a=CvoAkVhk7Y3g_VbaP6MA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX8lWbgbP3QL3r
 +uIuPrGGIBolEvSLjD4RmHQp7IsfhaqEvu10tBXzfLiPeGBzOBoLj7psZN3o4HvMYo8FBdBNmxr
 R9yRgE/V/kGr+q+iPGur3M/AI3JU7x+od8LqBRHn9bnVKhP+U9K2nk/OCjJpz0sl6yBoIXSh+0H
 /p9kUObG0DRoFNIe5vIicCcLGMxX8N3lP1Up77QZDvOH8IU9IvAnWkp2cUxk7H2SkVm4f2c0/9n
 CrOkHhv6VLBNQ8wthOXJ43EkAsnKoTd3Y7lmYe8iBpUKVRTaxA5jKKEC6YaLm4ZbIupUfWUq993
 PsvtaXmiHhuS5botWSkLzeywArAWoNAcjhWgVauqqzYmgzV2RNqHuOOoI0bCaZMSu1lcgU1crTL
 3GzxM2zNIMTxeGqVYRKWKcQTGOJLgVfS4/5/XcX1/qK9bUuei2i6bV0t79D7rwdR/pCB2hXNQP/
 5O8R3xiNYkbughGtHCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045538_689007_16EFCF3E 
X-CRM114-Status: GOOD (  30.41  )
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

--IgpR4FCbaFWOr+d8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] The kerneldoc for the newly exported __xdp_build_skb_from_buff()
>   (net/core/xdp.c:622-633) says only "Protocol parsing is left to the=E2=
=80=A6
>=20
> --
>=20
> net: xdp: add __xdp_build_skb_from_buff() helper
>=20
> This patch splits xdp_build_skb_from_buff() in two. The new exported
> __xdp_build_skb_from_buff() builds the skb without calling
> eth_type_trans(). A static inline wrapper in include/net/xdp.h keeps the
> old behaviour and still calls eth_type_trans(). The goal is to let stmmac
> process the L2 header (software VLAN) before protocol parsing.
>=20
> > diff --git a/net/core/xdp.c b/net/core/xdp.c
> > index 1d679e8fd6493..470bf90d93ef2 100644
> > --- a/net/core/xdp.c
> > +++ b/net/core/xdp.c
> > @@ -620,17 +620,18 @@ void xdp_warn(const char *msg, const char *func, =
const int line)
> >  EXPORT_SYMBOL_GPL(xdp_warn);
> > =20
> >  /**
> > - * xdp_build_skb_from_buff - create an skb from &xdp_buff
> > + * __xdp_build_skb_from_buff - create an skb from &xdp_buff
> >   * @xdp: &xdp_buff to convert to an skb
> >   *
> >   * Perform common operations to create a new skb to pass up the stack =
=66rom
> >   * &xdp_buff: allocate an skb head from the NAPI percpu cache, initial=
ize
> >   * skb data pointers and offsets, set the recycle bit if the buff is
> > - * PP-backed, Rx queue index, protocol and update frags info.
> > + * PP-backed, record the Rx queue index and update frags info. Protocol
> > + * parsing is left to the caller.
>=20
> [Severity: Low]
> Does "Protocol parsing is left to the caller" fully describe what the
> caller now has to do?
>=20
> Moving eth_type_trans() out of __xdp_build_skb_from_buff() also moves out
> the other work it does:
>=20
> net/ethernet/eth.c:eth_type_trans() {
> 	skb->dev =3D dev;
> 	skb_reset_mac_header(skb);
>=20
> 	eth =3D eth_skb_pull_mac(skb);
> 	eth_skb_pkt_type(skb, dev);
>     ...
> }
>=20
> So the skb returned by __xdp_build_skb_from_buff() has skb->dev =3D=3D NU=
LL
> and no mac header, and protocol and pkt_type are not set. This is true
> even though rxq->dev is available inside the helper.
>=20
> The peer helper __xdp_build_skb_from_frame() still sets these:
>=20
> 	/* Essential SKB info: protocol and skb->dev */
> 	skb->protocol =3D eth_type_trans(skb, dev);
>=20
> As a result, the two __xdp_build_skb_* helpers now return different
> minimal skb state.
>=20
> Nothing breaks today. The only in-tree user of the underscore variant
> later in the series is stmmac_rx(), and it calls
> eth_type_trans(skb, priv->dev) before napi_gro_receive(). A future caller
> that does its own L2 handling and reads "protocol parsing" as just
> skb->protocol could pass an skb with no dev to napi_gro_receive() or
> netif_receive_skb().
>=20
> Could the kerneldoc say that the caller must also set skb->dev and reset
> the mac header, for example by calling eth_type_trans()?
>=20
> A smaller point: the public xdp_build_skb_from_buff() wrapper in
> include/net/xdp.h no longer has any kerneldoc. The kerneldoc for
> xdp_build_skb_from_zc() still refers readers to it:
>=20
>  * Similar to xdp_build_skb_from_buff(), but for XSk frames. Allocate an =
skb
>=20
> [ ... ]

I will fix it in v11.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc%40oss.qualcomm.com

--IgpR4FCbaFWOr+d8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxOxQAKCRA6cBh0uS2t
rN8KAP9n5nAt1PRZw9UtpxsfE+nfrsPd8jBTaqd/v/2xmf0JLgD+LNQ8PQVLXBEM
4iO7vZYN47HIhryG3h5wueYeqlLIewo=
=S4jk
-----END PGP SIGNATURE-----

--IgpR4FCbaFWOr+d8--

