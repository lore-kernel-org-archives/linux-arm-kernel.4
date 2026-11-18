Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bFobZEMr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxf6Sm/4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arJwG0eU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=; b=bFobZEMr6YaJP7+OPbzoLAQ7B9
	twVq6sy4R19EyLcDzvdXOdhUNMuRdeIqjmjIM5lqbEqiHXbAraRqwMzhjyL1bl2UBANsPtc7ALbDT
	5665MvgxSuE+sJo2ZUNiomIPLlUFBQwpADOUDXWs7lyiZEbM+nGVGsc8rgZ6tfmXgpcobV2nKdT4F
	+5EhHpbTs9ahOw7wTGZcmGn7oUrhlOgs5moaiKoHsWyNbbt2+VHzc4PQ8IFSFbUl9mdeyESUhY7TU
	Bzk4G3DSxl/MpW3JYh72E6CuvaLqNeIgAExenQ7EYq0YUlj+JD9DvT3FdgHwlLIG2Aa9mCMaSgxIw
	vf1HH0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcDY-00000008Q7O-0NGG;
	Wed, 18 Nov 2026 09:44:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcDO-00000008Q2H-3EaA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:44:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8gqhR1430548
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UD6Ea5YtRKAN6/w2L3NLQU8h
	WxRurH6m4E/cCzEvjsM=; b=lxf6Sm/4aFYe/mEejA1fegl4KiJLdCnHKNPerLji
	pCROGBJq8Jj1rXJQR6fWcoKxdvDGLJ6vziOuy+0tAKouR9hWOY6Ty1VRIoVStETj
	0oZMxfwMEyxTv8lXY8XUhB1KlUtT7mrzoYMFRnZ4A5FEkmBsRXdkvvarelUEPGyM
	fC1WLAidfAzw3KMVnE5/0a9s5sCWoAo6fpfrIPu/nC74WfMHKRZXl8AV2FZ9kouJ
	rloy4cfMcekALU6jT5LpGH/Mrq6shq1r7cIuwz1hvzROaAZP/vhMaD/MG4Cc3FSF
	24bLThos47qHsDESPVnSqCLhjB4+HwKO7zKUc0n90NASug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92cv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:44:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-542fc61841eso14206021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995069; x=1795599869; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=arJwG0eU627nbL8WfvtIFnFuoNiMpcxyyfbymleC1BkFXicVD/Ucl+OP8We5ngnyg8
         Zz4fFfu5Lqpf+nT1dvIfYjRDRMz7SkzOaFGyMIAW9PU8Mb++xqxpdWwvxS6VPpKoIAla
         BTM+CAdMYs7uqdVBo8PtiNCOwYvqRLuiwS1gSjzzKTs5pOHIi5/h2WXCQ+Xi04etcSdY
         vSKR+3DYqdivjpFvt/cJhHZb/7PfjLG1FL0pyLfC64rQHnloU1ypy/g4+j7OMBHV4t5a
         mxeNL93axkxFrFzua5POBGpU0vi6MOIZZxZMQ5jfc4WZS72TgowdF8TWrjnTD7XToFAO
         uK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995069; x=1795599869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=RGXb4eGUkUOhXd8E3mQVlm0HWyUGuzpNb277/tb84Ul5tfIxDbQI9F9Xe6FBBnGqZT
         mi1hGFrZNHsbEgXUAmVg67ajrABG9StLnbAph85ZAMWDMvMf3cHe8BLXzN9uTJ8/7u3l
         jl6C2x5UdwJr8XZCGQuTNgoJb4VSK6FN08WL4gN6dQOl/OBZqy/4n/T2Ga4K4JTsboPY
         o2rKuoeZR2w61axCbZY8FTTzTQak3pKdktJE608YDMXU1Dj5oyrDN32VzVhF2GQFElLl
         W4PLZMOq/MpydIi7fUm04kEdNw8NXngKxwPw4/hGeB5aX4v5LbO4EqXYhmcg4HyQwCcd
         QXbA==
X-Forwarded-Encrypted: i=1; AL+hErHdBVNV/1PHfvcaQtF/R+iu4A7m/ynlPg503jauLIRlxwwwYi/SISlhkz5badtWi60y+N0tPHJhPerKJ1VZpbt3@lists.infradead.org
X-Gm-Message-State: APuU4Z87PcxeKSZ0wNmqa5xr1/5eJXfIuO/ciH28qTGCEipV/ZiYho/1
	4RYesyc2W0kY8kZLprywp1wT6DRZx9yVl8DfKxov8Ve30mtDQtBi3oz/l0GfqfPzC4HX99SQm0y
	YUMZG4qR6BDwa3oTvrlOzgUSubfK3bb/ZVKKn3ZzdhCsGmwb4tiBrMmSD/bgePt6Xmq3yDMz5sI
	QoQYc8Upbv5BNU
X-Gm-Gg: AYBFou0dQ4ig9xPThSVx9VrgDQ1BKTmzON6CcaJpvcv8A9LxrHUD1Xh+qPKN6ygTrRW
	CeFTeDj1ajOrakf2ElcFtxfEvSvCXEVNR5SiAe9lztQjX2hZqjmzgf9wGiQefcuBbzc4XwYCdfd
	0e10W3o5qZCoy0RU8EvG4c7NcwlfY0K+0jAYyPvAKyKsalVfkxwzK8BnqanFKuEQUJRhAFVX4sO
	TfbPVlvgzqgAPmIF5Wt5TNzacOCXvIeHKZwO3Oerlx/RSiI6co0ghvgl/4b8Uq28Z3MOxbiOHxY
	dmCU582JsyR1bSp4cC2pPXJOMyNVPguZqiPcZg+5hQZJ2TpM3bpxh+W0MqFAL5zXupymNC0XpQx
	2biF6WvZlvLS4ppiAOziq7uLtLUxSS92VjQtEFhk2wFOKHUtx71PH/aFgFcWXG9w=
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804311cf.16.1794995069140;
        Wed, 18 Nov 2026 01:44:29 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804001cf.16.1794995068605;
        Wed, 18 Nov 2026 01:44:28 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm240232215e9.3.2026.11.18.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:44:27 -0800 (PST)
Date: Wed, 18 Nov 2026 10:44:26 +0100
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
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
Message-ID: <av1zehivK9azUIom@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRK1tvd/MI9w8hzH"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX3BzzNiF1s00w
 MzyDPpPhozgdJMKsryug23tsVugwxoDqD1ZxKKX1NoVqy+YMwz+eYZychDR3zitulE92p7QgHfE
 pBiTtjvhsuIQ5+UytKlEqcqIZ+QUNdS8QIRgPxXSqvUaZ9krPVVANh4lCCN6LW41x0HK7VJ92jJ
 +RzBtMl28GEbG+7W4QZRLPop9nlFQQLDwIyFGSyY3cGqFl+pHREraBBnxfcQjhls/irPUXnz/1D
 q1VAHJY0Xpw+NO9c/BxYu3sbQTRRAPcr9DJcPb0SI3+6mVyPA55GX6hYqbsQkh59b0zNhpCh2nI
 glV4gYrO1TMAAL5NJx39UUebVwgvHN/mYsDNHe/wFCNUBSZCE2aOL1ZVoz5v8jpYYtuHCzxF1Nx
 o2w+hrm0TJqULWFEEzztTkn8WJW6UvkaRaYHJl6hOObyHNGUgjDjcSokH8nzZuOvhengyvjQRKt
 kSoZiaIW7k1sJovAYbA==
X-Proofpoint-GUID: t2wjAdNP_kUAiMeKNYSGRaRaoPVL12Hw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX0EGv2mWWL2Tt
 3cT19KeM6z9ZNyTt/NV5O3jXJLp+QMOb619N7f04Y/mSMdLzFaXX+Dwv88yTswBSuA/mQ4T/lUn
 v5LgCU0qXi+HJExGqKdUG1bAqCKpgjo=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd737e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8Sm9gzTdqpzl8EHs-poA:9 a=CjuIK1q_8ugA:10 a=7X8ZIgrw44ctfyHyHP0A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: t2wjAdNP_kUAiMeKNYSGRaRaoPVL12Hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014430_813376_45D4C525 
X-CRM114-Status: GOOD (  23.63  )
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

--YRK1tvd/MI9w8hzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
> the QCS404 version, but unlike QCS404 its RGMII clock source supports
> the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
> delays.
>=20
> Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
> phy_managed_delays so rgmii-id uses the DLL-bypass configuration.
>=20
> The bypass sequence has been tested on three QCS615 board designs,
> two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
> existing compatible binding and qcom,qcs404-ethqos fallback remain
> unchanged.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: this is a new commit which ensures that the phy managed delays only
> affect actually tested hardware (Shikra and QCS615).
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a7fdba73da2b..790159ae1be7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_=
3_0_data =3D {
>  	.setup =3D ethqos_hlos_setup,
>  };
> =20
> +static const struct ethqos_emac_driver_data qcs615_data =3D {
> +	.rgmii_config_loopback_en =3D true,
> +	.phy_managed_delays =3D true,
> +	.has_emac_ge_3 =3D false,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static const struct ethqos_emac_por emac_v2_1_0_por[] =3D {
>  	{ .offset =3D RGMII_IO_MACRO_CONFIG,	.value =3D 0x40C01343 },
>  	{ .offset =3D SDCC_HC_REG_DLL_CONFIG,	.value =3D 0x2004642C },
> @@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device=
 *pdev)
> =20
>  static const struct of_device_id qcom_ethqos_match[] =3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
> +	{ .compatible =3D "qcom,qcs615-ethqos", .data =3D &qcs615_data},
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
>=20
> --=20
> 2.34.1
>=20

--YRK1tvd/MI9w8hzH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zegAKCRA6cBh0uS2t
rKbqAP0Y9Jlze5h2MB2o6B8iauLXSq6ptrMeehkAecNddaYyHgD+MmMk4Rpz4f13
U9ddshl+n6SmpBBaR7puRzI+Ei3OuA0=
=s6vu
-----END PGP SIGNATURE-----

--YRK1tvd/MI9w8hzH--

