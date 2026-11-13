Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v6stdDAE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kF4kWAuD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=; b=v6stdDAEb00LIZ
	4C5dO+8Wa4S9gTN7aFUL3qjr2hqbIdzws1VlYYhtDS+4gIHTPH0u1Kv3rUiYaBXZZlRfrjh+v1WKT
	pyMia6Zinp4nzsqEbsEeanXJoDMoWnWgsxxo3lbwUhhMfFrUmY1fYcr0Iof3buMYmh7O+mB2QCwW/
	BSLLKU+nvsnp1ee5+M3y8joVt26SNn+5UofAQoHs5LK73R0g2Vk8GxfvQwfvDab9sBAOEo1fF8rSG
	ZQQ7WfPMc8bJuzCAhRbCCHbnxu0u6npBXhuPB1DRq/HX+SmHl7zm1QE/SJDuCFPz672AtmomZIBe5
	bvWnLDUDpADfprUGIdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr70-0000000CrBD-3A6b;
	Fri, 13 Nov 2026 13:14:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr6x-0000000CrAM-3bo1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:14:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJd2x059078
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=; b=hXUGRL4yHi00dJim
	M25dk6Dz2Sx28JEYAIfIC89lLjEMl09eKnBGb3dStt55GUkm6DY/ppMLhXV61X7g
	IbPQoDpwCNdD0Xwq+UPXPFLgt+NQXSg4zeLjPPyhon93RLbLSwGsTDQ5oDUwwwBf
	acYRDQ1x3Ss6ukHMzrWf3csw9HeFECM3u4e8BxcdynnTmCVnpmqbUg5PLK8l1fud
	fkNdr10V/zYZnLIEPQysW+ApCS9J+Ua4/NjMJe73UuGJa4rK4pEXt8ZFX0jShDYk
	J0YrM9zaEEuORdgU9FKOQ8NbfzZHkM4nZx4NQuqs6j2DkhuD++kXM3BwyAzCYX0f
	d+Klxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwb4wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:14:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1782833a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575674; cv=none;
        d=google.com; s=arc-20260327;
        b=DQnpOw2vRC2cemyINHBQBku1KePZrMERSiqMs+JcX57m55CWGECs8Hw9Wdojujx3Dr
         4BBW1h6AIc78HzRQ/H3BcI2kXt1+qVFcojRZuPcsqztEmage1h4cZDC1uROssDVzECBF
         GlkdbFn/MgQKq29bnov+PPpUPpttNS/oT3LHR9tbACzALtug416P+tEB2dDgSvKuQa4h
         sBNtT2heR+EB9ciWPKr+WX35k62ufHLKekOPFiaQ+uggItdljBU751x9fj3trMTPJY0i
         NVV1IUZkisBUsjh0GZKeaRf9mQn5Wbe8WL13Bk4+qmlta33sNNYnHAl3Y8VYLWgWuZKn
         5VcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        fh=fThyYWMGFnZk4OW0jtaqVBkQfwJPGplAVLHYhw8PBZo=;
        b=QpnGRDEB9SA9DygFPGONJU0Za4xPJVigfDV4p7msY1a7zgHbdwaLjue6+X6FCeetKn
         fn0dbg9ni0en5ffYCeTmAIaGNClY8MSgcK4h1SK31VujKIWCz+EK+784tUdi48Ul+h2G
         J63/WJZNA2KKXWtzSGgRnmGgEZOAXe3vKWwTHqCrINirfXkn9MFAzrnYwNQUhL/V22Rk
         IZJSxOHleQlmfUE4KpOepdihsxGs0KlHogLDvkBUnKdDColeTAR5tqTm4FP9RCz5wf/G
         9y/OkD/DEswnB0cNWdVF60QU6CT5rc4VPclMBqKEiA6WHQFCA0/e8gxzyt4xZefML5I8
         bBfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575674; x=1795180474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=kF4kWAuDB2wbPBUkUXnzzn6a4Z4tBc0s7EW9/3DACtXgMf1xsc4e4BCqnHhyYEIWMx
         avfCg0EEHu3l0sbwRCl/TO+920FqhzvZWCqsu2T6nmWYtvJlwTZ528F/YCNQYqMPVeBg
         uCf55lr0MK/BNXRh+iDchzNgJhB5nW8mcO4N+9hbORUiOkMxij/xAeoo+GiXIYlzxY45
         bqJoXavvXMpTBgpVn0AMNxt2oOuufSm5agbPi8JuLsRlRG/B68Wu1qBNDy+tNOl5tKD/
         xyx5zL2KNOw69R8VSGE/nskOlfinT8Xv77k9bxq06DysTDtXGfnDlFU05bclZcahwzUA
         wGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575674; x=1795180474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=Wpsy7H204F8NaG9yCwCveKVGF1qgL6lHo5nMsjXeT8XrHbTZtSIiJwS0CQseUXuVTb
         xej5wfNq/q9UBMT4Oh0SUvpPApNQ54g/fDGIkfe+NHpEqrS6605p9MXsXRj0DctWkFUI
         ny79TSDYPfyuDSVi7blfwAob3w8b14N4k8gbOfkQI8OXajZdL30QL4oOJ5EX7U8tbQRe
         dlaT0CtgWxYJc5mfpp9b63w1Chm8SVfPypyVu1B+NnAIggLhNO1GGuWioGLBs/OJ2uMF
         EADowIDg3UL7hWZXAoClHiBRmoenY3Kvrop1yq4mJezKBrCWpvlkrgatSUc78DreIDhN
         NlNg==
X-Forwarded-Encrypted: i=1; AL+hErHQyzmZhfOS+BgVNuuzd4CEOiEssookhiIVmCZEPsB6NqqXRy2qB4Hj7IOy83+B0W0mWt4TUpJdaqj4Uq0ruQws@lists.infradead.org
X-Gm-Message-State: APuU4Z8BmflpG/vw2SJ3LUH103r2HxMuJcFautexYAslSKkDkEv/w8eh
	DawN63zXgFs9Ppd+dd8QDCTZPPP/yzAn6V9TR/bvRxBhRR917CNGlS3wGhjdePyxL7k4UEeZV8e
	fGHnjWiwF3E2dpbCyTAuETx7zmcjXM0fTvewOkWcegsI/eCryXddPp+s+1TLW0dqfP/fbqOnrXt
	2/7q7ubkY0qzkSn7//whxc6f3KDYLE8RzPm4hC+UHvZGZyrLgLykHq
X-Gm-Gg: AYBFou3UQCwzNqiSZsgoAkpqGLc5FdpipCE6Ln5aMkDdpTDYxDXscmfsB6ugf5HoXYF
	SBFOxodDVSV9HgDAMs/fRnjAMXbb9CHdxkblRMeXolWebvMv3lr500qaVNUDNDu+glJYq5F+5wf
	STKisEQRpKy5IFVt+4kLvj7lzjTrLs3zR5L+0U8s6asfoLvbH4mgkRGoBIYw==
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b1b0d3420fmr2545462a91.55.1794575673632;
        Fri, 13 Nov 2026 05:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id
 98e67ed59e1d1-3b1b0d3420fmr2545420a91.55.1794575673121; Fri, 13 Nov 2026
 05:14:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:14:21 +0100
X-Gm-Features: AclHuK_DTsDuBkxo1YAzBq_C8oLcltIpHJD3FMGKMO-2WiG84I3huHHxGsWxuKE
Message-ID: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af70d3a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=Bs3vFoulODVTn7UWAnkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-ORIG-GUID: muce-j858Y5ECS5RHF_ycgB_z4HOLyS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXyj8kJPBYxMZc
 +D64m4PUoHTvJ5l+8Pigl21iWv4KiTdKXGHdtkB6t2db4yEafAm+dj6E2c1P0u/yIrsT0UWr1/K
 4nGFHM6uqLWlUwLvwYiPxX+cxuMM3cwOz67WIUrvk0gjUZ/TkGIU5TjR3jrtH1Ly05QFWb5kwNE
 cCF8MwB58GvR2OkXr1XYP8UcbqvVX1PuEMkJt3DCOQkE8OyN60sQXhYjWJ6nM/yWGnlZAFOL1vR
 zWN6I/BlAFMtDcifqc9RtcO+IngLhBMzCfn2cliuMKCt9ufMSElyRNZNt3Zm9Ck2ckcGczqfYRP
 M5x2/sJqmbD50jutqMtgCbWTEDSKyUP2i4r1RW0MdoVx4Y9E79/0RiyP02JxrPN8IJqZRSEvvOc
 98IzJ9jnAwAQSe6lVdBAvXjAVYWzFCtUd3K25AhiQKk0uf4WPUG2PNHnrr2UfxzAlKY0mUnhvsQ
 VdkjyE3oaHyx869reEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX00N/es0+ohoB
 RdKRK2fEHj1u8O7WBNSyajsd54QAXEuVSSWBCwMKnp+g3f44sLyKc6KT4zxyQ1J74kyRaO2BtSk
 tenzrJyE/yWRg366Ri4xudc9eTmx1E4=
X-Proofpoint-GUID: muce-j858Y5ECS5RHF_ycgB_z4HOLyS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051436_039467_472CC224 
X-CRM114-Status: GOOD (  26.69  )
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

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> probe is aborted:
>
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
>
> Add support for the "skip-suspend-mode-switch" property. When present,
> do not call psci_set_osi_mode() and continue with the topology that was
> already built.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, added log message for skip case, re=
named
>  the property, added property check at PSCI initialization]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
>  drivers/firmware/psci/psci.c          |  6 ++++--
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b94..cc9f14769b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> -       /* let's try to enable OSI. */
> -       ret =3D psci_set_osi_mode(use_osi);
> -       if (ret)
> -               goto remove_pd;
> +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {

Rather than reading this property here and in the psci fw driver, I
suggest we just do this in the fw driver.

In other words, let's make psci_set_osi_mode() to succeed when
"skip-suspend-mode-switch" is set.

> +               pr_info("Initialized CPU PM domain topology, keeping firm=
ware-set mode\n");
> +       } else {
> +               ret =3D psci_set_osi_mode(use_osi);
> +               if (ret)
> +                       goto remove_pd;
> +
> +               pr_info("Initialized CPU PM domain topology using %s mode=
\n",
> +                       use_osi ? "OSI" : "PC");
> +       }
>
> -       pr_info("Initialized CPU PM domain topology using %s mode\n",
> -               use_osi ? "OSI" : "PC");
>         return 0;
>
>  remove_pd:
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb2..3226af6d89 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_=
node *np)
>         if (psci_has_osi_support()) {
>                 pr_info("OSI mode supported.\n");
>
> -               /* Default to PC mode. */
> -               psci_set_osi_mode(false);
> +               if (!of_property_read_bool(np, "skip-suspend-mode-switch"=
)) {
> +                       /* Default to PC mode. */
> +                       psci_set_osi_mode(false);
> +               }
>         }
>
>         return 0;
>
> --
> 2.56.0
>

Kind regards
Uffe

