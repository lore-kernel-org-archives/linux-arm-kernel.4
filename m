Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cV3Jn1y2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pkek45nb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSSmIi47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=; b=cV3Jn1y2eegqnv83sNJAnUivCL
	MjCM+Px+IJiNfSYfaFgc+BfQI9iO1UXkFRhOd1bE+UPuYN4ZQS6vypMYisS4i/bJq2NmTuW/gxz8k
	rdEj4q7ILuPnRVkKMftytbXYYTlBrwQIft9dpeweGF69wba4IAGO+hwVA1z/55/Ai+Bt+LuMsUty5
	jIk8JOr4geH2jUB/+aJuVsUeaCwHZGEqMxNhxrMbRtu5QKfiC8jm1PxOgRgJTFa199qeNy1X2Q1lP
	e3FOr55Qae3Psnj9JDqQmARZWsyaMY1K4GISaZF9d6qOqDnFYR3txu05IRZFDRFhGIdf/U+PT0zWo
	mL9PmgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbjR-00000008J5G-0p5u;
	Wed, 18 Nov 2026 09:13:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbjN-00000008J3n-06U1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:13:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8cIUf4060200
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgNqGNkSyaCHbgQrLwcGSMfA
	aOL0GqaL9ZS9mVJYGS0=; b=pkek45nbZFw72X9I8v8wMsLNJXBCsEMpfHvRIst7
	kM04LP2uU7f5U1c95BoC5DPA4ehI2dhuQ07JZHLebGvWwdE+3QTyPKALXHO+9pBP
	81621wRkxS5w17kMXJBHXH3DI9gjIFUY1HjshMe++yBiBzeM8vCxCAUWKfeqHx+j
	5o5KEEduiMP0hfg2DV+lpzrR0SSadcP6c1RJ/vHyjU0ldHfQgLjB+83SYVMqvX7F
	wDXCMQU9LGh3vLK0BTQag0/WwwhJ/YIz8LEIUKNQmeG9lqS/kVVdWN54nufevHnc
	8jbTFXaxZW/oyhFZEV8niu5HRXs/Q5hUw5ivkMM3leHNDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcj8ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:13:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso162951785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993207; x=1795598007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=BSSmIi47f9eJH+v+hmhdONoXzW4/ISApJq0aIVjRv1qwbqQmTrCkPmuF5Ya6+4J8t/
         w6801ABJeBHV6GFnoUWv093vkMjb1Jlld9UnQxBo2DIDMYt2eZfFjr31NJAk8un3BeeQ
         aDdciWELPx2XwWdPupth0tBcadec5XZWSjN3Lsdtmu/oZaL+czQ7n426o3+3LRe7B14c
         GLRbUXZNW2sHxhbOiqBbRYHcyb7ZxLxOo//w1fjgMaFzIu2YC7mYth8XOksZkBg33RO8
         qnikB/2OqQsPCELfuexzuvLWc44l4zlCqXrvWdODA+T+B1yhkN1zCrjacXjjB90UPZRb
         +LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993207; x=1795598007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=uvA6GFmBh8x9+AJGIcKfvZcMtKIFcVoqRaHZsL6O2rqoRmw7vPQXGmDcwj5GQDc/fc
         s18yLIl7PwPnlfBo/72/rGdIPQz/jLcKhiSUt+N3PbWJ9FRL5z27wJBu3UKH0KWaG5fi
         mOqZy5pXN3glCkFaU53ZXCipD8o/H/hsj3dpXQ6rxs8SJYfUwu+zUX7ejsBm58J3GNfC
         z9+QrQaVJa+1SuJ4ewkVhqzi23SgwuN3K6ebQ5vTTypBFOBDeeLKhOCP0CF1GW0lZite
         xzIDUfAC8k+STqbEt++2tIF4sqA7w5P7tGYneYH0HD9tvdVooJ+EaI9v6jKhkeTdckbh
         37hw==
X-Forwarded-Encrypted: i=1; AL+hErFJTqo8qmott5XtRbhMsff1k8jENCvU9hj1K0USBl8n7gDPTaPbiXCicRwfhCGR02d4VV76gS+UXk78TkZDOz1U@lists.infradead.org
X-Gm-Message-State: APuU4Z8GlcwhWGMVEM8FObEHquNvOCbjRwwhFmm1IxKypW4s3ghPiDnq
	9weqdQkb5a9Ne4CD0IK0XPiG2VgHry0G9CcXvXDNckzdaL7dNdxkkonDjyT1MHdoy2IGlQaBRDO
	n6sTKEfEOQvB77eiXNMP/SwCl/iRWmoMtRd363oZBQv3I8QChGcyKyqh/vR1xkHH9Hmnunczcbz
	c5Kw==
X-Gm-Gg: AYBFou1tNy90v8TGeeaP+k37qVslrc/DL1TMhXA8G6fDVJXSlY0kNtQCx1o62T2lMSZ
	n4EI3vrY2VroJRklZTNhZ0mWiFjlp/qDmQ2wjD2dDWTVY0NXw4jVzuKaJqtSFuaTfEvcY7oCJfY
	yxEJGPdar3nATXAa5iD8NuoEFOatz6v9003lvSfhS1AgxTzrHXu+kgZEFjdHf2c4WOFTi3SNkGD
	AcSblaotjyq1KvmEHqx8rW9UfPAYTw9a81ZRY2qGp4faZlfiJn9W8O7Z+E+0E93jrgtI0RblS8P
	jsrRoasjRC33UTPcBqkBdBQcO8APEn8uCSPX8v0njsOVgxFkibBBul3KcNV0BPq2VbUQgQhEB8X
	9nS9qE5l0vabTK4Vfmj0j76Jk9V4RARt41l8Sc+HNuGvCz6WDUp8m9PsnILZLNVU=
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390439185a.20.1794993207058;
        Wed, 18 Nov 2026 01:13:27 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390436285a.20.1794993206497;
        Wed, 18 Nov 2026 01:13:26 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65693389dsm3301484f8f.48.2026.11.18.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:13:22 -0800 (PST)
Date: Wed, 18 Nov 2026 10:13:21 +0100
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
Subject: Re: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Message-ID: <av1sMajsn4Al-xgw@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rKfa5t58Xe8YK57u"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd6c37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=RmR1C2qGtOR5igIFRNkA:9 a=CjuIK1q_8ugA:10
 a=qFG7hDbQzpJO8DkesHAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: pXz-mkzuEkn8JuW18wwn8yDFhNJQUhpO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX/T+1gtZgEXlD
 v5fQucHgDU4SavslOmMriRfIDy2vmA+2VFgh7LbAvWrLZYiCX5RcFb3Zxzu0Nbm6tHdKIiHMMO5
 toYoIJ+1trkLFZvRJbsx14MEF6tVkZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX1yAA2muVdU3t
 GBj4OBLoZBs4vBDaj6Ihjo11dGyTX0fMK4uOmkN0CpnsnK6OGD3kl14J4wmKhHqRHmS9r2wd+Tr
 YJkNZpQ3X4bTri6ZVCjpi+5PuZlzw2Mmv/7Q0Vj+LT8lHV0f57B2GXkp34/oIzAi/dNj2Qz+r/u
 E7ulInaj9JoBcUkAlXQaDXKxBuoFd76/6GwE42+85GuJHLJMeAonmpx+fKPntfK1xgZyF0pEVKF
 jcCNRqNYEau2VsrKNaL1plRcTHgOPQ1goYK5PNFq86z1CFyPeOfvfwsS0I5v1T1V7nCTuNT8R1b
 6riLRh30boE9oTLp5noCUfxvL5begswQazxgxAI9uIGXKY/+J/cKdBZc7uM0gSCbA0t9r4aqdhI
 ZATtNWd4ChFLlLk01QxO0pFkQ4SyOjJJ9XEF6lffRi2uIuCnZK4lsfyHbofcwCs3I8NAgTtd+n6
 86A9FjjBNuA5DgZlRCQ==
X-Proofpoint-ORIG-GUID: pXz-mkzuEkn8JuW18wwn8yDFhNJQUhpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_011330_918304_96CC665E 
X-CRM114-Status: GOOD (  25.20  )
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

--rKfa5t58Xe8YK57u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
>=20
> Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
> a link is established.
>=20
> The DLL locking is not affected by the current clock rate. This has
> been confirmed with actual hardware testing as well as the fact that
> the existing code performs the DLL lock first before changing the clock
> rate when the link speed changes.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: add some details in the commit message to address concerns raised
> by Sashiko.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 99ea7e0cfb00..192788e00dfa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethq=
os,
>  	if (ret)
>  		return ret;
> =20
> -	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_100=
0);
> +	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);
> =20
>=20
> --=20
> 2.34.1
>=20

--rKfa5t58Xe8YK57u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1sMQAKCRA6cBh0uS2t
rEoxAQCXFnBdtRXO+i6NHOYmwXKbg0uyCKdVXH/7nhAU25CIswEA79MQ20mTgIZQ
/VNRnKPr2gb/4bOoyHks5lzMSJAhZQs=
=aBpG
-----END PGP SIGNATURE-----

--rKfa5t58Xe8YK57u--

