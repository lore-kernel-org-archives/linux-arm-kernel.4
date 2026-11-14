Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC3606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMMRMJqC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxYcyGch;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WPIkmlFh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=; b=IMMRMJqCVlP7W+
	MJPLsXbYOvTOP9fGwa0vM4otxG60l/TlnUo97b1fin1oCF0MlnhNDj4NpMdCwm88S3pP1HzLCX/FU
	yc4NE8cHIlhsiaTPi6pBF8lQstUdujQpY1/d1jMkZI4V3RvChq/jEwXSO64JK7Lc99JyIZ83SnIVe
	YuSf7t8adtcoogJ3fy38HjrE+6y2MmDRDFJAexsZGnpr4794wuWj/NipeBc+ibT+ncP18j8XlCwyp
	lEjPXAiPOPwUpLd2OnImYLsE7epOnLzBFMIs+PU4zHolT8PBYTLBeqrwd7U3pT/ReKfTJYjw173/x
	7NIiOPsf9tyvN4ygosIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSB5m-0000000Fls6-3u2U;
	Sat, 14 Nov 2026 10:34:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSB5k-0000000Flrh-2DGz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:34:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9winX1750637
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=; b=gxYcyGch9+cPb4FH
	n98Ykn7pArnMkE2S4TViKEWtLROj0U6F+5LSs2MypMrJ9piRF6B+uyk9zXP5jDmW
	xotKFL9aJnmtl7IH/urvnpgIsSzbraNwclKh5Z7YlRdTcVdgOfLx/n1Qw9KD/AIj
	ppqANTaaq3U66TUbjDncG51BXDnjOsNfj4TMJoE8ep6l/46nqH2sYjtQyf8eg3VR
	0ns1BP+RrdUeGXjY8Sq3h8RR6pIyLDl7RcBwMM1feabPnWfhA2hXMnzdoaRDljFM
	xB3Ivpy9eD4KqFJ6pfjjlWa/5uuwotNXgxw87TU5+tE8CI6yQrrMcJUd4Ev16GNH
	hJukdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40hvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:34:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso1270692a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652478; cv=none;
        d=google.com; s=arc-20260327;
        b=Ax1deLRpXt2kY3UrZRFDggdQS5iJONIO0uhAFYP7axOVDJdB7oUfBwFbLzCNWALgto
         mARvKT9gFv5KaceRYy8RDb9wWF1YoIfnejCLQuqfHyPoYn/JjM1uypeg3qJ3d11mc7a3
         q7Au+kYw0/N52I0x8ENlm6Cg4zioyGyC+UbFLI/9mzPB4O2EjfTc/jm05k3qNpZ5xKy1
         ndz7VLt/Q3oBW4PvdwR9RdZBV+HHAgeYrMfz8oo70KD3ermKISVodiKIiRl4JZdj8qNr
         m7vz/EwFgt9nL1+ju3+yG42sbR1KWpHhyX/mDIPL9sFZRaGVXlrXjxCHWegm8EKHYWHC
         cgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        fh=pgI+8VKVr7vDone5jopiOMMZvZD4avw3OqOomztbUO8=;
        b=oKoGnKdNjnid6wbe56yZNFWyNgEd11nzXv0Wt5Rrspg69FUuvuf2rUBVId3b+6l/UE
         r1Ca3/JQrpjaC7i5FHoNBYD8XlJEamCO6McIRUqzsPyczWIB1oXhTlg5KrAtAS9ftwUF
         Q+IhQolNqs2AbBWRex7ZsuedCjW7yf80LU6gcTRIGockdl3wNaTZfHXMQTKMikJupnAw
         v8GUElawFnTMjsGuyVpZW5ZLBlj2HrTtZKx4lis7latdI2sFJzOV1OLDjGq2KuPMPkkM
         lSZyAK5tkmb7aehFSQV+dr/17ZmYH0E3NyMMelZzP8R/1sD5TYRXv06zTWUCFjXCJzep
         z+/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652478; x=1795257278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=WPIkmlFh0JK+jyncJxXpFUyhFt2TH/EUtS2dVI7xWQRjU2q99JbBaFz1v3TRr/q1WW
         Qe10bg1/s5WthwJINHKBBcOrcmVYGI2nGSjkAgz/GGRUz64XXSnY6vwpYieWpadc77f0
         qyz6boZO/1S5uCqOe5HDZ2K7I7q89l5+GPOxDgN9WgBeel0eMgUgHnC3CbeHpaWcU5nn
         cazjLuxREr2kHGLtE18++9kvg08FOYDg+K7xxCV+09cTkeuxw1SWwsq6f+AU8xadswZo
         aHyPbhLhJy33ByM8fhWaUEiRdCXfEZyozMyGWVYLOSVAtItKIDIVFtB/ovuq/bN9iZLt
         S7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652478; x=1795257278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=Pn1KZdL5tb7kN0a7T8xpqQCC6AqbPZ9Xi2evucVQcjRNMghCri47lZguBqvbTiiSlX
         1bd4uIAr14Hxf80tMR2Zoq07+ogBPTWRzSccxKPmJrpOk5vBDC9SGAe3feiNqUMydbBH
         BDC2AmifSpNRris31CZCnKA67SCb9ht6P2Jj10TvX4YS88BuYVHbCn4PdBgaJ1QEovCE
         axxnzTV5Uwv4mrjyH3CrbkWgI0QeQxe/82j6R2P1Fv79mjB5DHvFC6xKaqMOWqdHynY1
         67xjLq/51jd0srHTNlvvlJNbgNFGwjaaxhtknDrn8mV2PiQMt2mdew1QL579Jbgm9KPx
         QBCQ==
X-Forwarded-Encrypted: i=1; AL+hErFvtHJSUAl22kM5htJXBWq6pJ7IeRGF/1YgKI7LMEEotAwvdHIzisM9QquBzVWRF/ho0107Dj2OsL/2gkoWZGPC@lists.infradead.org
X-Gm-Message-State: APuU4Z+HNx7Q+ceLmj5K16GSN2/ahinzdK8Gmm3n9M8j7s0uDzqKV1yn
	O9LS20zqHQSWRbMVZMZBoKgRkXfZ07rzdKCPvmT3CK2ycqT6vAJ6UHnGvdJujy/335uaX1ctja/
	MujLWzW5pTWyo2atFbxedfBZpHsor2OOY8NCW95VetNeO7TRhlEkGBWNcyVmmbjtKxtMPHp+sCE
	zBrPfHsqz1kSkWz+53lEBKcnze0f6ZfTDp6yRJZvGCFXELcC9ZQ/Ye
X-Gm-Gg: AYBFou3hXx1kIMRyvCwd0OKOo1zoS6c3P20lm2msvzmFIgeYXPEKwLCkcn7NLf+OSUn
	mVvBKFz9er1+bjqD8Hs6bn4UIBCKgjsoGCeMv5qDhbvlLSrbJsLDQs9NS7QVpr7a74Wyeuj7NmF
	eslIp5s1gpisc4U+EyTyC7Ea8mqFgooi9l2gefFXAlKWvl4SO1KCCs5uIIuQ==
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b1b0b83494mr5437872a91.47.1794652477759;
        Sat, 14 Nov 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id
 98e67ed59e1d1-3b1b0b83494mr5437854a91.47.1794652477282; Sat, 14 Nov 2026
 02:34:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:34:25 +0100
X-Gm-Features: AclHuK94u1eOHPpWE8nBMTRpf4tqar4SIHPxdb5PqkdOcIBUQwLxrM5M47Vzypo
Message-ID: <CAPx+jO8ByMju7HofLyZywRQRW4W7_15LoRVDn4K5oM+vsmrSrg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: st: add STM32MP2 power domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX9XLWDQ+6DEqm
 KOed9St7BtHKOTMTDX3hJTnG6QsKcLWx2FlqzpD/mWkV9YF0EdnxbitP3+Vz39gXfSO8FuFA/sn
 FKz2uL9hMDiO4+XUcLnGUxE7uT1RxZBXQFJzZkkZd6mHMHNbEMDgJl5NN+ELiRlyCe4EOAf15/d
 iWIuR/kYxkIi/+VzG2wb1H2+5cnyJSRA8BDb3S/soXamXt6GjBRI4r5dv2c0hw7d/dd9y9VKCf0
 WtPBlSUpfqBiWrhZDowIB5ukXFZ+rBkthtNgBop5iIyCWjmb6T6hB/SO7Ti9J1CntnaubyzbD5E
 lJLCbE3iquIqTfWMBjMDQSrVjRhP4agFsDL0QplUx5t2E/xRk+DzpMrltLpSgLyCmL5LM/IuEOw
 ZcXaHZWOf5Tgv3s0IEZC0r80QgK+H46lZTC0l3Qqcunr6Hy6vNySK+kiRg3iAJQNl6lpQhNDI/r
 a0fYBiRcOod9WG7RK4A==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af8393e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=8b9GpE9nAAAA:8 a=UgPYzwtURW4JLmgtzPsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: DpbJ0RUsEsu_dPy0a-FpabpN_RIaOHDA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfXxGjcfsMHkdKY
 7sgge5QIpcwVowQceEfHAFIeZgWGQci2LvFvmlbiSwqZI8r/VHM/YSzqYJ1M22v/ZFVYnzU/eKP
 862svUFFrIB13KK3zdov11Mv0tILiyo=
X-Proofpoint-ORIG-GUID: DpbJ0RUsEsu_dPy0a-FpabpN_RIaOHDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_023440_686099_EBCE3368 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
>
> Hello,
>
> This series adds support for the D1 power domain used by the STM32MP2
> families.
>
> The new power-domain driver uses runtime PM and the clock framework to
> keep the Cortex-A35 cluster in Run1 for devices that require it, while
> S2Idle wake-up is handled through EXTI1 and retention PSCI power domain
> (RET_PD).
>
> The power sub-domain D1 without GENPD_FLAG_ACTIVE_WAKEUP is required
> because PSCI domains manage the wake-up path since the commit
> bfd5859709ee ("cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with
> OSI").
>
> This patch is a preliminary step to support PSCI OSI in STM32MP2
> platform and the same power domain will be used also in STM32MP1
> series.
>
> The first 3 patches introduce the new power domain drivers.
>
> The next patches add this power domain in device tree for each STM32MP2
> SoCs: STM32MP25, STM32MP23 and STM32MP21.
>
> Regards,
> Patrick
>
>
> Patrick Delaunay (7):
>   dt-bindings: power: st: add STM32MP PM domain binding
>   pmdomain: st: add STM32MP power domain
>   MAINTAINERS: add entry for ST STM32 power domain driver
>   arm64: dts: st: add D1 domain for STM32MP25 family
>   arm64: dts: st: fix power-domain labels DT coding style in STM32MP25
>   arm64: dts: st: add D1 domain for STM32MP23 family
>   arm64: dts: st: add power domains for STM32MP21 family
>
>  .../bindings/power/st,stm32mp-pm-domain.yaml  |  46 +++++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/st/stm32mp211.dtsi        |  37 +++++
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        |  54 +++++---
>  arch/arm64/boot/dts/st/stm32mp233.dtsi        |   1 +
>  arch/arm64/boot/dts/st/stm32mp235.dtsi        |   2 +-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 126 ++++++++++-------
>  arch/arm64/boot/dts/st/stm32mp253.dtsi        |   9 +-
>  arch/arm64/boot/dts/st/stm32mp255.dtsi        |   2 +-
>  drivers/pmdomain/st/Kconfig                   |  14 ++
>  drivers/pmdomain/st/Makefile                  |   1 +
>  drivers/pmdomain/st/stm32mp-pm-domain.c       | 128 ++++++++++++++++++
>  12 files changed, 353 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm=
-domain.yaml
>  create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c
>
> ---
> base-commit: 7b3f3e772d5107c3a59b9f2278e9aeab227b26db
> branch: master
>
> --
> 2.43.0
>

Please re-submit this so all patches are sent to me and linx-pm,
including the dt patches.

Kind regards
Uffe

