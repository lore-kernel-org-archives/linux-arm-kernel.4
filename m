Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B22606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=idMFGFO2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QkQ/JwvO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcYNg8dh;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQUXMeiX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=; b=idMFGFO2eob15J2ceahGCLmXjh
	apXlVqZxH68dODnQZaOWWAsbT3231hoqmX0+uWd58M/1NFxrWjRLrImG7Q2DtB+FMxJGdSDSeq5Jt
	e6vVTkIEDGz+WXtSnfJ+MFFfHXh/h/4ymQHbUI6SGsm4Y+QWH5LCBvTdSJpBYpD2HdIIum57B2aDX
	FWqPcInxHIer+MxD1OVF/hYeRsRzW/epL0qEQlq1XfZa4L2DNjkIr/PGzIvjIL/y0SgWOtsSbXMky
	RFCEpK5f5IH+dpvLU/H8lcjJ1BfT8Ty1SV+lQFbEiAqkVvX2FdTgEuuvwiMUtYBOJuV0CUNUZbHRe
	WSstajMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc9p-00000008PQn-2y5m;
	Wed, 18 Nov 2026 09:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc9o-00000008PQV-1M4L
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=; b=QkQ/JwvOj2K2+JjB4OZD/OLxgu
	yaYQm31CvZV+FJgPdNw+TDx3ius4FrbsE31mD0jkySk3mFGL6yINcGjwBjuHnHImh9AaelqsyDekl
	BOrwTOR8OVRlksdr8oKWRHeFSrgft6l6ruAwaOSTYYViJY+ym2vSrrqV5QFVJrVisb0kwfirqO/IY
	zMdQ2OOQwCSRyp3r95MjhekmBoifeWRuJvSH5SAVGBSivD1iH6WTNTmyBNzKg5jb0oQto9MRzhxPq
	EJfgB3Rx7gDYkWfP3BX3g5s1RneHaJbsynx+nOtXB7jbx26I7DtGgpVYv+KYy+92NLoggtlcxt09D
	EDJu0u8w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc9l-0000000FsJ3-0mAV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:40:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8OV8q2602501
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAyDX6sBJRescoz2h8Wju/7f
	Xm9bYBb2dd0D5Xs+d9o=; b=ZcYNg8dhnRByell9a43mmmb6YmQfuKlErWPlGFA8
	T93elM9UY8hEJnc0ty30Qp+2NJUHvhJ08cdQ344TanLKsvrVr/TBiIc7wCMS/m7Q
	7GxvhtCAXYHo/7J6NitY8yJCkAl4CF6orJkn8MtayZ5UGSrhXwWYe9nNgUnDDeZM
	tsaDu2kNyS1tjLnvb/99CD7it1euLgpqMtfMNC8HWunt1JRLUQJP6H5c9yFFvB4r
	C7h2rmpybDaWMHQdS7IAWZutilrwYaAsgLpRi97+jMizmx6u8CGbMz1CJwv2Hhbu
	3WsxU5uCSxaMfGL6UaB9pm2wz/CqXf+ND9S5S8FUVoxwvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv72du6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:40:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so128529485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994839; x=1795599639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=JQUXMeiX/QXMA6WvMtJsr9CPgz/wlU2+UGNjxL5ocuc9Wu0WJ08f/C07uMpO1LoTnD
         1soAAWn2ovJ/hoZcBTvtOE3oviqjrG5WqVye1faqWbmVpENWSE0FVo9CKqtS5PLeA5QF
         /hSCWeHOwabOv68VvD1UJCUpf1UGILjdfh5f6Wi3ZBT/6vjoFHqg4dTRc15uUmFvdN5f
         qKNHNy4AnUApMCsm5V/7J8IW+yEvNdxTHsCojKg9F0K0TbZF/McTB3hLSbBifMLj2UOu
         Bqx8RyYd5SCcu+SVfASL+dHmunOIFdpe63L1Dzxf70afmDhQQ/yuItiMGNQselHfHal1
         FtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994839; x=1795599639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=ICfNB+c/5UxHdktrrM7ghyXLfxjiEcP8xvHMX7N0Q8v7Q4EiVlmMxccTPdBWBOrdCy
         cOf6WILBZKXUh6URz6kDyY/ylIq7wIe5lF4mJp2MLkjn4gaDPLBgjI6csm3j/UjXI/Fp
         yC9ZvVGgQ4LJjh9y6Sh4ymqDdSy8WhPBa9d/+iVwVM9wrdnsdUaSGBq4VWXK7Tg730iM
         gk+diE7uU5Nu2l92YSxy9wQxgqc2in0Pk6beocH3G4Kh5JXyUu+M2MOCCB4HxhZ2MckC
         TfQYicKQLUnDXeqhusAcr395y4HEJlCeaPivFw9jSFsU9JasvT2XKrNcK91c6vXBC2Wz
         WC5A==
X-Forwarded-Encrypted: i=1; AL+hErFoh2ArLwNaYT/vtwTAsYOfOHkLlyoGjPEnXbHvffhhPX0wV0fEXjviLbeG+QE1SVapFvbdIKA7xlGFTRXu+VMp@lists.infradead.org
X-Gm-Message-State: APuU4Z8pdqsqSDI63UGMomDGAKbFj1wFrYVdxJsicQG5ApC/4k6KGpqn
	/YkxIpp5m94DSdo1QMXVyTRURZouhRDwRq5mI6Q6SEui49BwVJjYot6lhYitukMkN80Qr8AtGYR
	DBjiey8kieexBqJwcnIG8qnkt8YzYhKfUKw95ugmdnWbzGsly6hsn+zG7+V0mZ8DGmDMZV7/1V+
	Ssqg==
X-Gm-Gg: AYBFou0EeJMv1YXK0Gmg+Otd9h8G98nya8x5LNqw0HdOU6p78RIjMvMAiab+Yu6zQ4q
	t5J8U/1h5JSk27liUEKK16d09pVBmKVRBqL3g2Kon7lVfgDQ7UVtQqVGh9zOVemb7HmljQN3pIn
	a702Q6hpzxBJT9Ss2v035sXh/JtFOaL4AqC04TpNUGUM+k/o9+xJHy3EecwQ9Kd3XO2vvAHEa53
	gTFH1MK7d5FBbjPjnZtrC1JHK0PGCNoqCTMlmrYNbJTcfX+E8u3XQxXZC1upGudQWy5UPro5d8r
	wt9h2Y81FjxvvqKaa+EA/myvMgoSffsyzH6XKvW4nsK48Zgq5gqHKN2ReWV+/2Htz9fxTQWiODW
	vC2N2lQBxBtWkGyEhoWNYHUyu0pkEQbMCk4ncNJsHfgKDjtXuI5BojEscbNNtxZc=
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798025585a.44.1794994839427;
        Wed, 18 Nov 2026 01:40:39 -0800 (PST)
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798020185a.44.1794994838774;
        Wed, 18 Nov 2026 01:40:38 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm190598255e9.10.2026.11.18.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:40:37 -0800 (PST)
Date: Wed, 18 Nov 2026 10:40:35 +0100
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
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
Message-ID: <av1yk7P2_nNBvRMs@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQAqpoQJ5wAuuY31"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-GUID: xfq_nw-MJh88iG0qoAEzNDivq0YqBcet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX1Oc8sKnoZ2RM
 C3VCMSYh/lbp92PIP8V4MC+ikmZV8SXreGRi93y5FwksYaDiJ+dchlQJFcJ+22L61KQgZhapCmK
 hPBeN3NEdH5uCLG/j63ZF9tkShvLfxtFpm6wH0ACKc98cOAeZyDFOmmxIwotCrKOdOOHsWCh/PS
 C8/mo+dts/4HfnHXTvkeYzi9r0AnCIvrHlQdsheHQzzrExeD095/uaTsvv6dNobdMRvLQoJCrpa
 h1opmjNiZJ6uUh7+yjWc++LEFIoL/ySFYS4suVwS5NZtJEPR3B0HP/Roq+2myS2h+lYJq2sTM6k
 nuQuceuhGxuvnNvWZuj1aEkF0BsPy03/6YSU7wH9NtlLgTBKr9DuqsrueQ0EZeoux9sXWPV2Fqx
 g+7/wfHn2meCZOar3aORtOPaOXG+/v3bdwpsU5Pw6dOkCq4vVFjyYlbGjUHkx3Un1oZbuvMTnxE
 SkveagPDsuoXoceykow==
X-Proofpoint-ORIG-GUID: xfq_nw-MJh88iG0qoAEzNDivq0YqBcet
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd7298 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=okzICtKxooRRR1VLav4A:9 a=CjuIK1q_8ugA:10 a=Dhi2dq_hunc8pPVQk9UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX31UFQAmNQG1o
 RipFgRylwQxCG3R2vvKA/Mk3TUfo+FH25CcBg64Es/I4xDEzqaBBe/wcz/qeuiKtfzFr7SijKxs
 znZDhIHJ1ka2Ka0GIZmJZWhxaAojc6g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_094045_481362_997A1942 
X-CRM114-Status: GOOD (  36.99  )
X-Spam-Score: -0.9 (/)
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

--sQAqpoQJ5wAuuY31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
> per-platform clock-name lists and configure them as a single
> multi-clock OPP. The OPP core programs every clock rate and propagates
> the required power state.
>=20
> Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
> compatibles that describe AXI OPP clocks.
>=20
> No functional change for existing compatibles. This will help us when
> we add support for Shikra.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Hi Mohd,

just a nit inline. Fixing it:
Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++=
++++++
>  2 files changed, 104 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index c6559e749c0c..15639666e837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
>  	tristate "Qualcomm ETHQOS support"
>  	default ARCH_QCOM
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select PM_OPP
>  	help
>  	  Support for the Qualcomm ETHQOS core.
> =20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index bc443793539b..15385750b3e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_net.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> =20
> @@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
>  	const char *link_clk_name;
>  	const struct dwmac4_addrs *dwmac4_addrs;
>  	bool needs_sgmii_loopback;
> +	const char * const *noc_clk_names;
> +	unsigned int num_noc_clks;
>  	/* Fixed PTP reference clock rate, used on SCMI platforms where
>  	 * firmware does not implement the clock protocol allowing linux to
>  	 * query it.
> @@ -119,6 +122,8 @@ struct qcom_ethqos {
>  	phy_interface_t phy_mode;
>  	struct dev_pm_domain_list *pds;
>  	const struct ethqos_emac_driver_data *data;
> +	struct clk_bulk_data *noc_clks;
> +	unsigned int num_noc_clks;
>  };
> =20
>  static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_devi=
ce *ndev, void *priv,
>  	return ret;
>  }
> =20
> +static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)

is it clearer to have an utility routine to set a specific freq and then ca=
ll it
with freq =3D ULONG_MAX? Something like:

static in t qcom_ethqos_set_opp(struct qcom_ethqos *ethqos, unsigned long *=
freq)
{
	....
}

> +{
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned long freq =3D ULONG_MAX;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	opp =3D dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
> +	if (IS_ERR(opp)) {
> +		ret =3D PTR_ERR(opp);
> +		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
> +
> +	return ret;
> +}
> +
>  static int ethqos_clks_config(void *priv, bool enabled)
>  {
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
>  	if (enabled) {
> +		if (ethqos->num_noc_clks) {
> +			ret =3D qcom_ethqos_set_opp(ethqos);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC OPP set failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +
>  		ret =3D clk_prepare_enable(ethqos->link_clk);
>  		if (ret) {
>  			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
> +			if (ethqos->num_noc_clks)
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  			return ret;
>  		}
> =20
> +		if (ethqos->num_noc_clks) {
> +			ret =3D clk_bulk_prepare_enable(ethqos->num_noc_clks,
> +						      ethqos->noc_clks);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC clocks enable failed: %d\n", ret);
> +				clk_disable_unprepare(ethqos->link_clk);
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +				return ret;
> +			}
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks)
> +			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
> +						   ethqos->noc_clks);
>  		clk_disable_unprepare(ethqos->link_clk);
> +		if (ethqos->num_noc_clks)
> +			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  	}
> =20
>  	return ret;
> @@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +static void qcom_ethqos_noc_opp_cleanup(void *dev)
> +{
> +	dev_pm_opp_set_rate(dev, 0);
> +}
> +
> +/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
> + * and set up an OPP table to vote for the required rate and power.
> + */
> +static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
> +				     const struct ethqos_emac_driver_data *data)
> +{
> +	struct dev_pm_opp_config config =3D {
> +		.clk_names =3D data->noc_clk_names,
> +		.config_clks =3D dev_pm_opp_config_clks_simple,
> +	};
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data->num_noc_clks)
> +		return 0;
> +
> +	ethqos->noc_clks =3D devm_kcalloc(dev, data->num_noc_clks,
> +					sizeof(*ethqos->noc_clks), GFP_KERNEL);
> +	if (!ethqos->noc_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < data->num_noc_clks; i++)
> +		ethqos->noc_clks[i].id =3D data->noc_clk_names[i];
> +	ethqos->num_noc_clks =3D data->num_noc_clks;
> +
> +	ret =3D devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
> +
> +	ret =3D devm_pm_opp_set_config(dev, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
> +
> +	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
> +}
> +
>  static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
>  			     struct plat_stmmacenet_data *plat_dat)
>  {
> @@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *eth=
qos,
>  	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
> +	ret =3D qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
> +	if (ret)
> +		return ret;
> +
>  	ethqos->rgmii_base =3D devm_platform_ioremap_resource_byname(pdev, "rgm=
ii");
>  	if (IS_ERR(ethqos->rgmii_base))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>=20
> --=20
> 2.34.1
>=20

--sQAqpoQJ5wAuuY31
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1ykwAKCRA6cBh0uS2t
rNQBAP4lJiuirwRLFVe8XvEt5fSxZrB9fn9Cj/z3AcKiRIBcEAEA+hNM2boDyzWS
OuhgaeR4bNxOJR5Y8qmsH2GTsrvmiAU=
=y4oA
-----END PGP SIGNATURE-----

--sQAqpoQJ5wAuuY31--

