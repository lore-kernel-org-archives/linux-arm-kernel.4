Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7CC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwQ7v4Vq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3AM7ma5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5uDhuBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=; b=nwQ7v4VqY41FVD6cIZu7six9oF
	fFPUcitxKy94AGOcrjmiQP6rNM3w+M2Ytj3TTvUlvu6Sa7co8n2XQ+iPiCWqyk0DSiI7+45kyOhnx
	Kgk+z/XoGN/5z9SbRpZAEN+Sv9UApDfD/0mcZPSIlcQLH/xGT25ynPwD4yCt/r8Top5g3IIbHmkvT
	jU8e92nvbZsLPLFkObhSEubeAGoc7yWvtCt8Xfwy7sKRKDKvRO+j+rh9XBdcEFf4szsiEsDXtFJAJ
	iG5Bwsx/3jcwNgDfdXxD89lBDww5nZMtf2Cv63EA5kvXc+2suEBF5sTIr+cecivPnlhb19zwGCVE1
	0NNb/3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcCi-00000008Pn7-0mom;
	Wed, 18 Nov 2026 09:43:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcCc-00000008PmX-2cdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:43:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8NvTL2383140
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AUnrIqYg5oO/8dWsnNZrU8gC
	3RoY4sAX8r+6bIRiQzU=; b=C3AM7ma5b7fxMT9qvM40GoiEHIniEOXV5+aCbCYH
	wJGk7imQK3QM2W3lWYYtco0s7LmAVfO5LQPJao/v/fHyYigkAR2/KsMwOEoBbFbd
	F68H7vQ73gJLQ65ph7zygPqbPyQq0HW+yuwjvu3LFJyebvK7oMGzAxWOOqs7D1ev
	vS7/nZgpZOL1jLaaZNvXcpNVyPEZTQuonB9Z19hnSRefqK4kZfzUUnzoIeiiA3WH
	v4Ich2uHdHhBjRlaE8nAbjLPKTsY6ECcJLL1hbHEqaMVkT4/M31E9CakIaDynlCH
	wRUUbWkKpMcJqu8uUcBAUqdK9oJkHgs0nHGDvzkYIYO5mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatd7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:43:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so118267585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995021; x=1795599821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=R5uDhuBlBbeHzY+yftew1RefQGMlvjuUCb96Ef7TVKZlo9KeR1skmkooPfbEf39tke
         z8JJhdI6B282+G6VEHEoqEABLfGAFsF0z/Cgs/RSODNheqUIczXRh0O23vbOjgsRYMEU
         zGf2d4clOpYF1AIXuMHFUdcltW9BldUDSUUiw9aUU+YHFjRF82q19xdSu8ZK11CJdgVm
         JGopCMO3NtKU6bPoc2CMlWLJ6YjqVZ5rbAUQs8WMe7E8/6Npa2+t4AGp1dA8/KWvP13x
         ZnMuuNATACrvn4hz6ei+EiSQAbzEmo2CsKdcd7bIeaXYbvvr/5/5i8fCk666fb1YHtfW
         /oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995021; x=1795599821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=K3+k23k/EpKJdN6NY1uNUH4Jp9i0l9OP141Me4x9WDxBugOFcZk5HIX3h8Lx8IuDU1
         zwbFB5jt/IYMUsKulIuVfvtFLc9XAqa6yV+xKaWjGit81Pr/i9pYYo9Hde/mYUPrFgoX
         rtJb/hYRa2lkYMQ0qIQgm5vIfI8NljapZuiHlVluMjs+TBTq7B9nhmo1yjpRiyUUeEPb
         9RWfF2dxDSAWUbRlq8K9Beqoo1OOeTfjVTePrZ2Rp3fo3QuKMoQ/4RKEWugGyt0XpJP2
         4UJwUaBt432fEewjlXL9GQAfWLru17ivFJr+H0zEY/jXWf0cjyJcel6HA7sbs8wpkc/C
         W8VA==
X-Forwarded-Encrypted: i=1; AL+hErGaXOZD7BnI/tXb+kT9iCA+zG9Miy0S1ZlVn5AcAN/NJjz5XCfCjqcqdP+shoe4K01QnapvYvIe2vWVjLAlcaXN@lists.infradead.org
X-Gm-Message-State: APuU4Z9cZzOkAdIgMVgGtEY939KLZSGShbEYUT9IWy0ESfPP9S00A2lh
	zj/+deWsh5SgokRVIHvg3YQM/TV16Yl2tGfeoT6CkxGvGHBtf7Z/XyO940pTszf333sD9XFy9df
	5on/g2NNBS/6roKScEg3IuzH7x/1Zq7JJjSt1nJvuRWipXRYhU+GQTfio2gfSzzkICwXTslbHn6
	iP2A==
X-Gm-Gg: AYBFou1dy9SeI3AqQS87DD7mOrehpN0lM0N46Catwt2kN9Ut/uMQktwxNk8NLSCL8r5
	qLAHiBALLQDtodxtN9tiB/EKXLhx1Ui3YAXBxd4uVpAe0wK+SJJoPIIOXdM6wqbKEsgThZ7K5WW
	45eYKR0rXncd5HVBPKtSGVmOL2d+BsxklCKTC8kjhUDsVDQtqrT9GnZB8lcEBawRy7OYWMkhgag
	LJWaATML8pdb5opss0MbZ6Tqr7gN9cYvIlBw17RNsPa6zgOTpCZrdLnsRDgb+S33fa/FuW6dvOR
	yrAitUGdbSSymGw6OpGmJGI9BaNeuFkOX8mv5ad51nlztKzYJrhpXx15fWtw+9v2V0NAveXHbm6
	Jh92MS4kEZL/7nLvZnNNkq6IVWmrlE+VJw1uFmy4SkRWndBgnhhIeYPoSHxKqcu8=
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398314285a.46.1794995020961;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398308985a.46.1794995020335;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm3435347f8f.42.2026.11.18.01.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:43:39 -0800 (PST)
Date: Wed, 18 Nov 2026 10:43:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <av1zSpwvTVWP-2zZ@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETxtsn8fYdG6F01d"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd734e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LGXQo2T9AS_8CfUs2oAA:9 a=CjuIK1q_8ugA:10 a=AOVp3MrtItf36BpiwHAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZJDK9TgpBVkOLZPSGfLcgnHbjM4YKmQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX4XqlTlhfe5do
 AmuLUXsuBwzDWH4/3XX0jbMMLMqcZ57SLglMzjKEXmNiK0UfGhXGq0m1cjQYnBFLCkgu7LhDS9R
 oVKZxjCgoikB75Dp0BPkrsml4fp0n/nSRYmSOuYYxYMsbQdrWt2dnS0xKYZDbsGXBBN/zLKgBau
 OFC4qfog3/02fQsImT06mX6F+s4ePkq6/s2BA/aBH/2celiK7MyvKRfi0lgQM31SFKdqFJs/1Ie
 fYOQe1DoRtPyWNZldFl7VegxEuhifKifxiNdybB8UEp77kZChj0ZbjoOh4Gvs7z7zx0hiNyz4gQ
 ywcmKWbmuq+U7nHxzVvMxLZdn4mWPhXJ84vw36sxvW5B6HiU5tc78mKj5vuJnhS7o3GLEMydQdT
 WUISfdNmS6y0EMFzh8o4pYYwsimrMK2qIEtcSu2AGZ8b+2j+oZpbI8i+nGxsDRPL8YCG5AKvDax
 0qenjBfsmNje9AlT0uw==
X-Proofpoint-ORIG-GUID: ZJDK9TgpBVkOLZPSGfLcgnHbjM4YKmQT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxEyHazyevHpb
 AyMANN9+RZDcsrY4w8Enn7y7mqyEGZWz13i4/tnyzKjG8AFDqBqt8acdunLFbhHwczRTmH5KSCo
 E1n+01amKBGA9KVQGapodUxe+Yd3zKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014342_668888_76729CB7 
X-CRM114-Status: GOOD (  27.32  )
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

--ETxtsn8fYdG6F01d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
> and the 36-bit DMA address width.
>=20
> Set the NOC clock rates through an OPP table to ensure proper voting of
> the VDD_CX power domain. The stmmac core enables stmmaceth before the
> glue driver applies the OPP vote, both at probe and on resume. This is
> safe because VDD_CX only needs to be voted while DMA traffic is
> ongoing, which cannot start until the glue driver applies the vote.
>=20
> Shikra's intended rgmii-id configuration supplies both TX and RX delays
> in the PHY. Therefore, enable phy_managed_delays to select the
> DLL-bypass sequence. No POR table is needed for this intended bypass
> operation.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: set phy_managed_delays to true for Shikra and reworded the commit
> message to clarify concerns raised by Sashiko.
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 15385750b3e6..a7fdba73da2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_scmi_data =3D {
>  	.setup =3D ethqos_scmi_setup,
>  };
> =20
> +static const char * const shikra_noc_clk_names[] =3D {
> +	"stmmaceth",
> +	"axi-noc",
> +	"pcie-tile-axi-noc",
> +	NULL,

do you really need it?

Regards,
Lorenzo

> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_names =3D shikra_noc_clk_names,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clk_names) - 1,
> +	.rgmii_config_loopback_en =3D false,
> +	.phy_managed_delays =3D true,
> +	.dwmac4_addrs =3D &ethqos_dwmac4_addrs,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev =3D &ethqos->pdev->dev;
> @@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[=
] =3D {
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };
>=20
> --=20
> 2.34.1
>=20

--ETxtsn8fYdG6F01d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zSgAKCRA6cBh0uS2t
rPbRAP9BOltPilAtM/l/jP103hZDb2bBRLwQa1hr5OhxYjxr7QD/e4//9SJ8S8YW
RN03Uozs6Lfhs9Mz/3nOHiTwyhZ/zQ0=
=rI6r
-----END PGP SIGNATURE-----

--ETxtsn8fYdG6F01d--

