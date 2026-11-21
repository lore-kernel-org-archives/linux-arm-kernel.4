Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B00606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQVQHhwv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8lt9rnr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bna2mCC5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=; b=SQVQHhwvQrs6FLgtbdqXXXqbhs
	dMIJaYFsu6PdoADMkC5sR/BubLsnD2r/NGvizi58Ydwt5ZdID8q9kYNszZTHEaLwklT5XlSl7EyhN
	jwzLy4hh4I0neM3pL8cV2j8NElZvA2UtiIXrVPbAzynOrUHBP/Go+wpIuarjTXUl5vI0qPXuvw7qO
	kfllNuvbtqWuFnVEMZ8X5rw2PgLLp2GCh1rC/JV+B3Mr86PuYeoXUC9MYzOQaYFzFboXgwQgE8+uD
	cADAWX8yLDHVg452MKja5YiNkyOXBDQJRcknt28a6MB6daAy++bok0mHb+7SCRAto1R+GXXAfDIfs
	itIB+WhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUol6-0000000HZEC-0AV6;
	Sat, 21 Nov 2026 17:20:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUol3-0000000HZDd-1WUm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:20:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa3cA001409
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EToEzVRVg3WYCmb+Ipge3agc
	lXFYn4/uigqheoHGHhY=; b=R8lt9rnrMWNv8jRFcGdODknQ8oy6XvTiXjgNUJ4i
	MY0tL51IWIQSKGFMyh76tvqZ/VEnj4o7AlCUBzcu+e39rxqb3RZX1AydZa4XVoxq
	qEHSLJ6DLo1x0zjxDhoQ6BE9s6ym+c1BumtOPR5+hKQ4kC1FYE6mtJ9oejhGR4Uh
	dzJEoVNuZ5OYYXvDhmBJw5qLGT7yann9TeKKEPJmLfPT2KW1DSIvGi8/V2Dk/F4Z
	M7gNyrEC1FqUaJbQHELKQVobW28PZUNlYrq4SiK0Vd0Xsw53cwxLyOB87nVVw51k
	UunvQxWqJ5WXm5hL+BqMogsB2UsUtqZGomMfFGALtBR90g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1fd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:20:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131befso319166085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281611; x=1795886411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=;
        b=Bna2mCC5cPf201xxzdHfqP+YkRynTlY3BfGxNo1LrebkZyIkzWGFxxg1OYe18+Q0Ld
         9nEsTmlN/MSFI/F2/Zl4f2QG1EbQwqXJjt4zgqCjVDpnq+V0S211myB2u396A+J5bUP1
         8gQVGr/F0ZQTDVUp02FbXULJiNQkRPXwvWK85FVerf7Mi9dqLd1W38t45SJo21RQzeG8
         yQhH1Qfmx86rHpujCShYRH89RPiACKEpfIU9Ca9Mm5LlcKcbYsuFYc1n8fwrXvouD6mh
         5vo+sb2QZg7tA49dVAfDFS3rlXyARngTb99Ra0WhTn0fPAgOkiE28lGWZU0LSNAm43Bi
         yJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281611; x=1795886411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=;
        b=UBvy5M6NAeOhxaOvm6BqBmjIWNMm0s366tC7Flxm6UTcSOQS0xpIb9aEsYF/Sj/ocx
         lEh5GfdXnPm98D6ZPi7etsSLfqFnq+cGf9BtqIUa5qQ/OA/Cq8gadd8EtTaY22cq+3Pq
         GhTd4shex0BldNfsnQ4Hib9WHsNLdE8c4h4Pq18ugxDqUzeg6n4OEiAhC81xRBLFeBvp
         Qf82uiVZu4IEs+4CelR+8ihYe72pl6Ld9M3AfEAd4aVExn2NPbx2bhNzkOUPM+9irpI/
         nHs3SmVtwIvC8RLWURHJUJgYgjhqoVlMca5rmgSS/Yne5sU4pUGrM0HpQRPz3N9UBOqr
         rH3g==
X-Forwarded-Encrypted: i=1; AL+hErHulxDZkLjnOpA/8pdAjSZeEyMAvH9vVwQxOb0jhQ1zk2Z7U+6d+HoQ/B0soebI/DHKJul3WyeLT2g5cbMtgzgE@lists.infradead.org
X-Gm-Message-State: APuU4Z/cj2Q0U2TiPurbSf++ubD38dDPvLrhj9w8uzhT+HrD9N+s/igs
	W33Af45DEyqqOloU2052VL7FT7lMEKJRCoz4m+nxsvUTVGEnHhap8iNbqo32hMSJNsT3xqSOP05
	89wobPLHq2+6b3KtXoisaYicXr6PbX+oBiq3zEsubDTcJ4DS+AxFXLtyIpRQamWXuntuVMvyZPp
	/dtQ==
X-Gm-Gg: AZFdTZdcBEC83WvUCl62dmHBObfCIo7oWFgCa3UxVkJvsf2cK1G1447dnT5gF/oO2un
	codv0Q20Ykph9iyZFFLqNeNkc40G9smeWEN/goNgH5KHeI6tSPDew3jOcE+a5s6SqCy5tyxTH+O
	QDMjNBR36Txayp8X2F7P3bhwiDRNPepUGZQfD7lKrv6VWov1Gtt9sOaA+967LqatejX8+yQgnrg
	xuIZ6g/eyT/36tQxKzloKryAVf5oJcP/CoQAOe7EP7WPzklZymR5LBZQ9j140SLRXaX+f6B0m/0
	WtaOAmG2MlHBU5A6Br9Y2tI8mckfwWdvfOg3szqdjP+kaeuajkreFBobIFHhopM0EQkM5k+5Iwg
	kj9i2+UrbIH90FSNj5MQRCTKg4mHNFK4hbp4ULsOZSHIU1rtL1PWz/z9Cv3HnxSyn9w==
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr1113767785a.7.1795281611148;
        Sat, 21 Nov 2026 09:20:11 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr1113760385a.7.1795281610513;
        Sat, 21 Nov 2026 09:20:10 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm299567205e9.14.2026.11.21.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:20:09 -0800 (PST)
Date: Sat, 21 Nov 2026 18:20:08 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
Message-ID: <awHSyEATb5sUMs2h@lore-qca>
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OvQp1Mflhl1IUn0"
Content-Disposition: inline
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX+zK31MtvR7JP
 2FQlQ4HcMyhRp26HjFxwbMeAsxPM34GipLVpHJb4GPW753ox3tUhPWE8jbsWcF09Ea6H/P9OgRw
 p3Augx9UrLAMEbDymTrYNFKJGnTxwwvlXmhvj44VUbYycsZd/Q3ilOYMT6f2qAwklCoaCGmIyix
 DFB/QIkJnZXFveIOM4J2rzDtre+mxEbZQc5xsEzWROL4ZYT3qPIEDQ2YvLPlzhnnAHNyvNCcaUI
 /10v3sKWnfy+Awi6fdf5TZYphrf2mxdl3nRt6BBpphw9Oq/MfRJhVH9sP8mmNatWCyqKQiFvwud
 i6a+PF2Isd11vIE/Voz2LU3wJxX11hWIUr/tln++j7GIc3XRMG23PwkbqFV9rXX087CdC0BKBoI
 Rd/NFqRuYCDITOKZeShUW5dpqfV7FpmMZlkkbZEsliFsUfV9c3WGayP4SWJ9o5tJx0xZecXoXyd
 4uK4Es459/EdYE/A6NA==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01d2cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7SHFOz60fl6yjfH7NaMA:9 a=CjuIK1q_8ugA:10 a=hsGEX8tnh7uD-6tXlA0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eV6lJZQNHsCHGk_eOARZhXPBXr8nceu_
X-Proofpoint-ORIG-GUID: eV6lJZQNHsCHGk_eOARZhXPBXr8nceu_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX+cvOMKkCHDYQ
 oxmMR+ThEQ4kc8UtuB/Azxeeu2yy0rTPtQNCPjF41RBjqjJhGIQ6lcehZu8UFJ/2QCbuVXiOXj2
 NyLy9TSuh12q3aKJnIi9r59vrj00BjY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092013_410740_11CB4890 
X-CRM114-Status: GOOD (  22.75  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0OvQp1Mflhl1IUn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
>=20
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index c229275b11b3..287f717ab3ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device=
 *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> +	unsigned int hsp_args[3];
>  	u32 delay_ps, val;
>  	int i, ret;
> =20
> @@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_devi=
ce *pdev)
>  	}
> =20
>  	dwc_priv->eic7700_hsp_regmap =3D
> -			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -							"eswin,hsp-sp-csr");
> +		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						     "eswin,hsp-sp-csr",
> +						     ARRAY_SIZE(hsp_args),
> +						     hsp_args);
>  	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
>  				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");
> =20
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 1, &dwc_priv->eth_phy_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_phy_ctrl_offset\n");
> -
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_axi_lp_ctrl_offset\n");
> -
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 3, &dwc_priv->eth_clk_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_clk_offset\n");
> +	dwc_priv->eth_phy_ctrl_offset =3D hsp_args[0];
> +	dwc_priv->eth_axi_lp_ctrl_offset =3D hsp_args[1];
> +	dwc_priv->eth_clk_offset =3D hsp_args[2];
> =20
>  	ret =3D of_property_read_u32_index(pdev->dev.of_node,
>  					 "eswin,hsp-sp-csr",
> --=20
> 2.53.0
>=20
>=20

--0OvQp1Mflhl1IUn0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawHSyAAKCRA6cBh0uS2t
rPlnAQDvFThEV0w9sN0ihzSOFueg0SkPnLH7gOu/w6OxmOIKFQD/ecz5Rb5UjmPu
wcE4gdPGntcwSBsNbPzD5kliXTV/+A0=
=TTZe
-----END PGP SIGNATURE-----

--0OvQp1Mflhl1IUn0--

