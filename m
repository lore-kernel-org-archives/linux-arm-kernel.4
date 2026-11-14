Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EO9KTGSG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP5sHK8b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwZze0c0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gVmJhbhmFmpNnBeZFMO8F6xPAmfr5dJB1/hcDGtiydQ=; b=EO9KTGSGP2gi85
	p8FSFL4NnjguIY7xHKw6YIP9aowBrwip47pSZtmoicjNjvDjRvQkwISktMwVUMSAqqzp4ljhHDYgp
	yaC8O8HtW3osJiY1YOVcNhSsJUGbGUQWPzBSzQmWJpDXu3F0ZN+gFSRp7L3jFxreyCWS2tMOAF8qI
	AM+0jOyN6zOaYBAACEWVHIaDIv4WLup+VtCjWiPl+MlQiMZVCd2B6C3Pt39zCFnL2ptC8LpZFtVyV
	LinLo3ZcIPZHkqMqwzBsZLZKUfGn4Ief2pWqVlpt/dFwQlte5S8dECX+P4SWE078mw+iHfzDwttPB
	ExcNRFakw/HwMBgVilsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBhJ-0000000FsWh-1cii;
	Sat, 14 Nov 2026 11:13:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBhH-0000000FsWN-1u07
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:13:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wVUh1089287
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVmJhbhmFmpNnBeZFMO8F6xPAmfr5dJB1/hcDGtiydQ=; b=ZP5sHK8bZNHl3KyR
	8j3zJXe1sf0pfDQCOR8SHwA6vfd0giftBYbg3PqHIl+S8vgLzhB1hksm3v9OeWkW
	Q9Z7X9PlngHp91ObKaRX79d1eR75CtihvKoVnLLR73z7o1bZhbCkhHIBa5kM/7hc
	BCP5WG2iig6D3od9LrlZR80+0q2K76c/18lEiCpUb1GugtlgSz3VeRFqME9cMuDa
	XjOmMIXdWepKljzAYCDEwdWWMlaYXIY2+AIbKkGIJVjXEGRg6DIbm4hVIsNWD1Hl
	3RVuM3oMBoUlNoK99cozSlPY0zmdUBbs8v3sCR7fJBsZgZnbjGMybUgDxE/S/Fj9
	YVNxBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rk0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:13:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2085532a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 03:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794654805; cv=none;
        d=google.com; s=arc-20260327;
        b=WeXS8c0lVQ1Nyk8YaIsUiDFgO3lvSH7+6EoEe4Ghg9YB8wuPZwPAvm+U2lO3Q+ts78
         D/LnU70IJg9Baakoe9KCMOrLSUwGhe2TDuJqiIrUIK4IZ/KHdkra6E1Uwuo+C4+4V4K6
         pz8HYpr+lXa7QycqGFk/w+eNOfcvOwAYT34AE/FQbwcZK0saKuqu76j1SW0et9tEhkhN
         rWN8MOYC4JQ9Mon4uKYlXqVjHdwiggedmv4gomo9BdVQYBlp6MIwk5moSEBeYo5emaWI
         8JNvykZg1M00MNdpRik4VLrrYMsyNBeZcFYP1SlSF4sdNFFKLG1iAErciapi1NQqr/W8
         YviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVmJhbhmFmpNnBeZFMO8F6xPAmfr5dJB1/hcDGtiydQ=;
        fh=zWiFV47ApO0uu8cS5PiNwC9a71toTSeu5BaAKooYdBQ=;
        b=jOaRgr6TlgY5NzEXZEfxgfE8QelMhzLndHzcq4UPp+ZvZRvmwW6xaaDDiaDH//tJpf
         GzuNFmrHsu/e8OxnVyFHrw8S6EM7bDUPY/HJGeQMqpfzwIRJGX38/SzN783y7BnLRjeu
         I/XAaRpMON4VC6GWw8uQtgeWO/vOjyCLF8KpAKQX/nV4U7MEA//RUiBQRnOxdROpPfrn
         bjSH7b1mdb9CHW6b6iMMAOnjM2ZhKir1pjw9Ik00Qhb8kzNVweWf/dk7YTX8ZyoEQIQv
         mFqnSmc5J+yZZnEUAzrtyTBtcWpmMBQ/UA6aOBAS6m8KgsYiUHcnxXMh4C+DYi/9sX1d
         fIXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794654805; x=1795259605; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVmJhbhmFmpNnBeZFMO8F6xPAmfr5dJB1/hcDGtiydQ=;
        b=OwZze0c0o0bYgaVp2PCBGRjDGOPuyKUA62mZppFpEgVAmivCvXUGvkQrGVH4P5WHnq
         qgeOxf2MCpH61rM/nMeSBUHmJJemrqAcrSb6wLLkcAf5811YByDKkSxLDKb54ml59h47
         PRsPjwGCOOD2WblRC6vq6JhpGSAoeJ4mYJ3vbUCCsxBQi0DcnBvoHBBtEgBBI+Lcfdtt
         2PKcuDnmXMmMbB99ctMtcwe9W9EXL43WEAOuWhLI442VIOO15fFfrHxRF8ycomjCgJKm
         kcjP3Tc1oBRiQgwrcABMHLGRVt70G94/ofkcoUo+4HDKjIIYdkIk3FeJyp6XPZ0wLv6g
         xxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794654805; x=1795259605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVmJhbhmFmpNnBeZFMO8F6xPAmfr5dJB1/hcDGtiydQ=;
        b=Aj01b9P7XbinB5j68uGqFviOg9KYQSe5bUl4VAbNjMtDm/FoqIPOPdIb+cgcuphuxG
         /5eS75XVuVlaG0vy+MwIIEsYwWDHAyf/RimsVkMqHrnk83FyUmyRKkF8pEgXGYhrSWIM
         I7ye8NeINxpun8ayG4TeXqI94RZ27btZdxwmkOFhi7OGbQdqqMorJHghCwCgbYJUoubE
         vrLcYrxyAGrkCz20kyyixW2j8dPzND1Za62U9hMHSKPtt96d6HTgskaf4Icrl9gAUY9g
         GhcwVPGWraFDBwrtgFsBRP9JV1FDqO1JAaPEzzMShPB5b9RQlJb8TQeTM+HYbAoPkPUU
         yvGQ==
X-Forwarded-Encrypted: i=1; AL+hErE54A1DXHzo4s9pU4YL42kJuELQlOJIdnDzQUVGtH0p6dMz3KItrsUcjE4yu3Ob6ujmeiDVWL9MnBNwlNHlGR7w@lists.infradead.org
X-Gm-Message-State: APuU4Z/LmNeo8+8OnU2041uxau7/2NCb+Ra+7onkoYkUU4RCUyjoXwTo
	4opB+im7vQ9I7nm9bpqq32OfI5hbLkpaD3qFesetUg+BFW4IWtwsVfjKKbT2ThiLsZQtYbaWtdJ
	819SMjpC2ibMHjs5OaLMEg/9O8udYINVzCupyRvsmGC9xIW4hHHhXCXUu4xkQRN86gIE5/ocYuF
	CSFwE9EKvLAerxU86xdovRLTONW87hBCNdUci5e0hmHHvQnZdFwXJ5
X-Gm-Gg: AYBFou0vTr3tp2k8YZPJUI372quGNOlotElZDJfWvIG+orozrIdfwQrMFGmKxCqbouR
	yysgaT1WUySYPS1nt6HFIDmm36NxMcpkxoEYwfaKoU238rLNi7VetXYBKg17RNxCk4jvdBwqtPF
	T83yJ6eJpNamU/1w7vuoWGn1Qh9gjbxOJYMMzTKMOVpDSsZNOAJiSmQcHWTg==
X-Received: by 2002:a17:90b:33c9:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b1b0ca5085mr3649572a91.24.1794654805145;
        Sat, 14 Nov 2026 03:13:25 -0800 (PST)
X-Received: by 2002:a17:90b:33c9:b0:3ab:8288:b8ce with SMTP id
 98e67ed59e1d1-3b1b0ca5085mr3649559a91.24.1794654804653; Sat, 14 Nov 2026
 03:13:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-b4-arm64-teo-defconfig-v1-1-5e3763385f89@kernel.org>
In-Reply-To: <20261106-b4-arm64-teo-defconfig-v1-1-5e3763385f89@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:13:13 +0100
X-Gm-Features: AclHuK-HAQDbXPhoocW6FrnwtwdKTq5H0HXZJ5dbq7n3fwl8l1vAmudy8rO9hJQ
Message-ID: <CAPx+jO8LZs-VXehHwjWvR4G4aoS-Gn7AyicGQht-9g6rtse_mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the TEO cpuidle governor
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af84256 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=taXE9TO7TXhWlUUu3z4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NCBTYWx0ZWRfXwcNGYW6ARQLZ
 1GuUrusaU1R11Ukm0MLZVjEZaxLRPV+BJPDbCzBeOJ5BSeI/+mkTGiAeavAzMX4bi+R+V5Xe2/y
 GlQ2OQE+GGCLMT6g/d1WLmjWObLmmvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NCBTYWx0ZWRfX9CIxHP3Nvpoq
 40K93lBElwZCJAIDRK2M+NSphvtzZc018HWQt5UTrvQNw156srvEndmuYHHN5sZ8YgxEACzBlj5
 70XjhxIA7q5PCr1smmKJFP82CSLWIXlOKjkVkIVq7SzJtc8Fd3U8qBr6MXCc7uOVfqz0anuVkXh
 OlEKycBbLc8L2Ux9sPcREqqfhMSaG97Du4mbVDRPrgbKM4hwguvoR2w66lGzNSeP+9wxNl5v3bp
 8fcXFSSQAYMeU29WBiiu1q+Muoss45O9oZVP7gCzsScSLlUqhdZvXDxDVtySOKaObpf+AOyHW/e
 4NUBdWM/dZUrFKBvYqqksa2ewrwBZtmtWIfmCPskzFvxUglFcWOdDO7ciNPn096448GkcaZy6Fh
 7+DHY32euFtY0nRDqZs9UvYVhmZbZvwRculDcaUL4naKBdqtvrnKqew6CXSKgHLjrS+sb8mHRmG
 Zyx9PCQ3VttTFiIb6kg==
X-Proofpoint-ORIG-GUID: jXWNl2oC4Xcq2eVXBj4y7r19o5IwGOum
X-Proofpoint-GUID: jXWNl2oC4Xcq2eVXBj4y7r19o5IwGOum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_031327_634799_5DE3B5F2 
X-CRM114-Status: GOOD (  20.83  )
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

On Fri, Nov 6, 2026 at 9:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> The TEO governor introduced in commit b26bf6ab716f ("cpuidle: New
> timer events oriented governor for tickless systems") takes a different
> approach to idle-state prediction from menu. The governor gives a
> better behaviour than the current default for tickless idle systems,
> and for the multi-platform configs that enable tickless idle, this
> should be the default governor.
>
> The arm64 defconfig enables NO_HZ_IDLE and ACPI, which enables
> CPU_IDLE. Selecting CPU_IDLE_GOV_TEO suppresses Kconfig's automatic
> menu selection, making TEO the default governor for this tickless
> configuration.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Feel free to add that for the arm defconfig change as well.

Kind regards
Uffe

> ---
> Prepared with OpenAI Codex assistance.
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4985b29b21..fa99d62cda0f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -93,6 +93,7 @@ CONFIG_RANDOMIZE_BASE=3Dy
>  CONFIG_HIBERNATION=3Dy
>  CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>  CONFIG_ENERGY_MODEL=3Dy
> +CONFIG_CPU_IDLE_GOV_TEO=3Dy
>  CONFIG_ARM_PSCI_CPUIDLE=3Dy
>  CONFIG_CPU_FREQ=3Dy
>  CONFIG_CPU_FREQ_STAT=3Dy
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261106-b4-arm64-teo-defconfig-b1616afa4d29
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

