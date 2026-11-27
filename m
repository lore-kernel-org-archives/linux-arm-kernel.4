Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292DB606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgfvBW2/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8FSn2iZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E22i4opM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=; b=WgfvBW2/768p2U
	MTXYuDsGq7kMjVIuVmABZecfaKSdP46NutY+pIN0QH/nVoHiwC0wOOZoLgKD2JARP4mmRwAgMbvvk
	+f90rOYJGrq8fZXIB2uk5XBXnmZ5DoOJ18vVePZN1FCeZ/csGJUipZegBok9GDgGsLAAONGM2Y4Ii
	NbNGUXjgUnWhdIXZ6OHgBkr9qaYwe0zk6OZV+/+k3U/plP+0jPqmCKuzUCXWCYYBvMZqp6H//J8en
	wxbkGhXrHgCdwM7RhATAst9vzDTxL3qsk7OdOjo4lbMSkGcAJ2/97ioZmqm1Vu59RFh1Kkv5+TozI
	W6VnWxeipu3qgGKtYwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxBE-0000000GbxF-0wnW;
	Fri, 27 Nov 2026 14:44:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxBB-0000000Gbwm-45wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:44:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1U8v4018817
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=; b=f8FSn2iZHcsATKgF
	WJAeJexnlKz3j7WLV/2YKbtM3l9JM4zIBSCZNtCVZkSFLnetxhOoCgADsCKPyyDw
	N2AwHYTLToyOhsd07p1V2HSh6hijG5Kri7/5J6frbe0waGRZqJ1DhocyLHtcRJ4U
	hIJBYxdCDzNU2rX8zUiHQusE4nnPYbAfshnlHtQPt4eyyo0/yPHVHSDzvCAUgZko
	ZvEc/0XGqPhrsgO3u4GzHpUFnX7UzoMXhjS4wxNa3gvvFcxJyDr1iQQtB1PKNAhX
	L3acFofw3917cqzAA0cOfLaR825HOzt6Ehe7bT03fkEuPgjCDHb3VLGhIPPb1pqZ
	Vo0VrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dha40v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:43:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f040c6e0ceso75732045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790638; cv=none;
        d=google.com; s=arc-20260327;
        b=KQ3KUd+b/1+ZgTg+Wwr/RNKyQfpX+vWkilwcx6N5GPLwPVH7pz6zcDTudlJGKpM4bg
         529p2nwtkzIU/FoNXr7Avc4q/YGi0w4jJQclk5ycHSNbUjz0CFzC3VESOJ82olHlKNli
         3GTHEBE3cBRz8vN9zd7s0NgsA7sEKTz8QtXMavuYTJBq+9hYT4RnmV9WefxF0FT3ml+y
         qfaK0p8ej2VTwrS0WudY2CSqemF7svJ6YSQfLI/cD5pck0+ZF42Nqk8HQP4s5viWN/Lz
         /BKTvqlnFiiGQqpp2Dhs/Kc0WId+o+mL8PdrkxaAZE0ihCzfK181JD0LWMMqinBwOj2O
         K8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        fh=SMMrRN0UJLhkW+EFlaZfq7lyEfGEGDb8dc2yM77+d3o=;
        b=d5K5avQdjJiVAeGHkFfxA7NoLp5q66qaCko6knKixcgSj6AOO9N8dnu3VPCj+6YJWW
         nFop2ho5c0IdAC+nMzybiz8b8iOVRjymde7mFmm44/jdFGn3YJ9SwI7jzIUsXvM6CfuE
         upKLNvZtSPGcCfPbt9/Zv3wSncg93p9jkQeMt3MgyKko9i5QzJmZwWlWKJMZwEgWX6gx
         +0MjhWYatYNxJNQcuis91gutx0AW7JVkOt2xdSqzpCNmFgobeL/fdrGyaWq6MXha6vL7
         Yki8aGSUaWKq5thGLQqvwUSdMIVU7eHb4bLOThzlxarMOuSRWUQZ1IX+m3m7+2pCY+Er
         Fktw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790638; x=1796395438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        b=E22i4opMxqqyXN/G5EJHHWphbmkTRrVZ+lZ8/UMr8f0FQScHzQqruX8bm2tHbZ6GHk
         hMDsDphHUvmD13VAEaX3SNsNVHebx7JRvbcI6hldwdxJRlKMr2XQhhmFlrdoo/ZPEMRF
         dx0MTXiY6PWJX253Qr43dOoXZ1HrhZLRqEzC1mabRPDT4lNCqDNSwiLA9HG9x1ss95T0
         3d6Nt/9jJnPY4r5lqsvsbLrJghLbmiIYonWHD9E7kHEUDpvdZUjGCt5yKnYiB75/hxyo
         GN0wMAPbzYqs7vR6HCBcdazc5y/wdXROSwxGx0CMaSrUV/7Kbbu9daB1GOzNOX8+tgD8
         dnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790638; x=1796395438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        b=dONG1si7l3K8oR8PXxHQ0Xz/bXUQqt6HiI7yuis1t/j3CtfLFSA20BTU0Y3fjVhmZj
         EAqZgaD3gR/AKVeXx/tAmJK4ngcxkndnuuBHG2pPy6fdj2Fu7DaZ7Vctr8EYFQbDmXfe
         4nPUOh9npIHCWJpHGHIF71TIACl3tXrnujjGgJi9b8ZA/wTPO2uNx0O/SpxPnHCEbMAm
         UU+je4mVRh7UDQLcH0IQtpqL6Uml3uo6mxgwSz/gjfe05TTsrRTZScE3M5Eo+S/IEAN2
         CdqWz0YBPPfIjVlAeBldzjwZWhiC7meRXV59x6Vo8Yfeu4p2UIR2viw7xgklRR8vWFE2
         GQWA==
X-Forwarded-Encrypted: i=1; AL+hErEXMQZIGO240K/rSGOlCT+kAvSTbUUQcZazkHxLKUNRr1o3/0+OtIV5X2G8VYdmwCVE9SlOIsBpwHbbHUCN8GE/@lists.infradead.org
X-Gm-Message-State: APuU4Z8H4N5IO/i+vY2f/v8CgSMn9Htc3tvHqdB88m8Fk4V44SYqv3ek
	T3zikLwfy/OC6ebKiumEzSU40G27dAIzU8tkDk0CHGfsRQ4yTBr4TuJi8jHhEnqwVDuBQ3z9VZp
	zO6LEkVjgr4t4m+4DHApwTZsPoRUVZTgdDX4dfkB4QjL8fp7vwQYt09EmB+jq5TeZ4BmeJ88iAe
	UDYm5IFxg8umiVe1Fr/Fsa61kn/c6Vpf/8LelBti2d+DrFwFBI4I0z
X-Gm-Gg: AZFdTZcI96dkBw7FS3QGpyyrfikqBgx7vbvTGbiJTIxy5dB9Pg9b/5NkkLpk4TKKKwt
	PB2RMN6GbrfXiYM3Hg2NaFm4q6U91z63DZNkaTqwz1OOto6H8Csg/qgMyujOm7ef65z2EPHXCOQ
	oAZAPG3q1ACPuhT+kvzPXdSeVk5V7U0QEYktB05hBQZuBy46rcMyULeKIE0w==
X-Received: by 2002:a17:903:26ce:b0:2ed:3d3b:c5f5 with SMTP id d9443c01a7336-2f0f4a36319mr59479975ad.64.1795790638318;
        Fri, 27 Nov 2026 06:43:58 -0800 (PST)
X-Received: by 2002:a17:903:26ce:b0:2ed:3d3b:c5f5 with SMTP id
 d9443c01a7336-2f0f4a36319mr59479645ad.64.1795790637838; Fri, 27 Nov 2026
 06:43:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:43 +0100
X-Gm-Features: Aa3M54qMTgg09-LOlmQZO96BQZ0rleJjZ6ArcEP-EJUj-jeo15UHbVxIpCxwPn0
Message-ID: <CAPx+jO-nDpYJyeKGqjqaO7rMrTW2DzFsv_1WCdFjcR8EborPzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mmc: mmci: stm32: silent data corruption and HS200 fixes
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linusw@kernel.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX2ezP491sWx47
 H3cZho1pQj/ivgLf5GGphughxpLSMzJsgDXtxnFEv32pfWpMO8E4vW4LfBkwiCi+XuZbCbvhs1W
 zFdUUhySeKIegvt2BXLF3VQbylUo2xnq5tYPpHYLNNMthTOykddo/KAz9f3pfCWO1SdJ+zlq2B2
 7zUD7pSj0w513ereYA8GbKgnyChAMgCxTgZCuIFl3Yu2K8qb1LqadZ0O7VxrQPtT7dmE7o3ESPY
 NYngCmAWdXRq3sY/QZugsHEXMXw1fpDgF/xEdSSlWyuIdB5REwJIAsvj5yCFIJyeezQv50X2wja
 iz6tDtFMgrf83CPgjjXEd+9/MjGaEr9WmSbwb7Aq21S2Ms5HHlYeEuKKVyqjoTWR/eq6raIV8hQ
 T8xtL1MiAo2HQCE5bsES34jm8leoxn4kCEN8I32y3vud5nKfhPE6TZmi5ZqvdXI33c210aUzIt+
 +62onLm0Vi2rogNL2Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXzQrNufz+WT80
 sDQrFTPw5DIOy2zNX7erSJSEElAgV1MDscyOCP6Ejjlr3mRUDX5K4DZ2cmawilkaz29IV/Q2U1l
 Fuu+oJ66qLGPa+vqh6BvD4n/GbmL3Tc=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09972f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=uChsZFC9AAAA:8
 a=VTaG3boj7W6_II-ye28A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=ULtXvzFHYWHLyBAuiDia:22
X-Proofpoint-GUID: 43oREcl9_-h6oQbWtvWl519bvRy2q-dS
X-Proofpoint-ORIG-GUID: 43oREcl9_-h6oQbWtvWl519bvRy2q-dS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_064402_152269_6B13C751 
X-CRM114-Status: GOOD (  26.85  )
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

On Wed, Nov 4, 2026 at 4:27=E2=80=AFPM Mateusz Nowicki
<mateusz.nowicki@posteo.net> wrote:
>
> The eMMC of the STM32MP257F-DK in HS200 returned stale data and lost
> writes without any error. Patch 1 makes data CRC errors visible to the
> core again. Patches 2 and 3 are the fixes of the ST downstream kernel
> for the causes seen on the DK, as Christophe pointed out. Patches 4 and
> 5 move the eMMC of the DK back to the sdmmc2 pins_a groups and remove
> the pins_b groups I added for it in 7.4: the corruption came from the
> delay block, not from the slew rate, and the slower pins avoid
> overshoots on the SDMMC2 clock. Patches 1-3 are for the mmc tree, 4 and
> 5 for the STM32 device tree, patch 4 needs patch 3.
>
> Tested on the STM32MP257F-DK with a v7.3-rc6 based kernel with the same
> changes, each run writing 832 MiB to the eMMC and reading it back:
>
> - SDMMC2 kernel clock 200 MHz, HS200 at 100 MHz as in mainline: without
>   patch 3 the writes failed with I/O errors in all 9 runs (sdmmc2 pins_a
>   or pins_b, with or without NEGEDGE), with it all 6 runs were correct
>   (pins_a and pins_b).
> - SDMMC2 kernel clock 150 MHz, HS200 at 150 MHz with the delay block:
>   all 6 runs correct (pins_a and pins_b), the tuning picked the same
>   phase in all 10 rebinds on each pin group.
>
> Build tested on v7.4-rc1 (arm64 defconfig, W=3D1). Not tested on
> STM32MP1x.
>
> Changes in v2:
> - Drop "mmc: mmci: stm32: do not use NEGEDGE in HS200 mode". NEGEDGE
>   has no effect with CLKDIV =3D 0 and is valid with a divider, I misread
>   RM0457 (Christophe). The writes at 100 MHz fail because of the delay
>   block, not NEGEDGE.
> - Replace "mmc: mmci: stm32: lock the STM32MP25 delay block again before
>   tuning" with the same change from the ST downstream kernel, "mmc: mmci:
>   stm32: release the delay block before enabling it" (Christophe).
> - Add "mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25
>   SoC" from the ST downstream kernel (Christophe), with dlyb checked
>   before reading min_freq from it.
> - Add "arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk" and
>   "arm64: dts: st: remove sdmmc2 pins_b from stm32mp25" (Christophe).
> - Rebase on v7.4-rc1.
> - Link to v1: https://lore.kernel.org/r/20261031120700.42576-1-mateusz.no=
wicki@posteo.net
>
> Christophe Kerello (2):
>   mmc: mmci: stm32: release the delay block before enabling it
>   mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25 SoC
>
> Mateusz Nowicki (3):
>   mmc: mmci: do not count a data CRC error as a complete transfer
>   arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk
>   arm64: dts: st: remove sdmmc2 pins_b from stm32mp25
>
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 -------------------
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  4 +-
>  drivers/mmc/host/mmci.c                       |  5 +-
>  drivers/mmc/host/mmci_stm32_sdmmc.c           | 28 +++++++--
>  4 files changed, 27 insertions(+), 68 deletions(-)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0
>

Patch 1->3 applied for fixes and by adding stable tags, thanks!

Note that, I am planning to submit a pull-request with fixes to Linus
beginning next week. So if things work as expected these should be in
v7.4-rc6, if that can help Alexandre/Maxime to pick up the DTS
changes.

Kind regards
Uffe

