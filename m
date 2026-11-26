Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mN9nK1De;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V5kd7NJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hPRni7Gd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=; b=mN9nK1DexFZwqa
	ZW2/ULCK4NVk9uB0JxbyQF1AcX36mWMPqW3QG2iqz5ESOIHeXpPyrub7iOjUaGgXdSiR4THmqdl9c
	5X242aV6GDRcHMKXPFviH0GIXFY9GGVZBCVRCU4j+pHGYxzo+/d4LuiOc28dk2F25pnWfIwhJws79
	UdTaNuHiN3mnm7lac9ykur8fv/lj6XTUIHb0o6Ss/5EpENyCQipoOOuFUwYsXBBhLUSOdLfGJmykT
	q+rpDl1K0tDmmYjTzzKn6p+/a0HnyfUKqSCbxtRAy26j/hvTQpLEHM7W91js5zhXNvLrQvgm3c36B
	S56ejgysaV3XkHN8GytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYYd-0000000D8xy-35KS;
	Thu, 26 Nov 2026 12:26:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYYb-0000000D8xH-0Q6E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:26:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVaWI2263599
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=; b=V5kd7NJzOdG1BKDx
	I5/IfSAIdzSsX2fnwQfRC8Ib6pN0PhViZABr3i8j+TcXy2/+4RuObh7mTfOUhyBG
	lpUcGwqLuHO6d1ShDhOgyP3m1JOqUkcsIyKwckbHs5JsWkzmwIaoAuS5fukPfORQ
	w1QHpcgzG2F9OJzhtLyY0Fo6IYUyGolDMPM9ratJxnB/4aiLTx+vieyBzrm+iZl+
	Um8lBMbrSAUrJcXlqBT8dFm7EvfP13qLnlz5lJsmEFHC5xK25A53GmprtuxoziDA
	Ayopt8q9+tqRTSMPhN08ghhqxJ4nbGuYPxHLR1WxPoIA+gzzdxAq4iBhkiTgGX9r
	qJ1DPQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:26:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so3754348a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695992; cv=none;
        d=google.com; s=arc-20260327;
        b=QBWLjxDWJ8VZmHgxdnndNLGm1h2Lw4YBFp23RULvjMOiGUUn6ilasvYd1dwYZzncOL
         yKW9nBHepTSIJ1ujfin9vgTJtyzHuiMJ0I8BS9ITxiz6pQ/Ni5QtWkXbOTV+3y3iIhgs
         whcc5SQ7D8wOAPJlijNpDByCG1O6Bi18UxLnGeVSWJQ53itsveQDm0cyRoM9THbj7f+F
         6qA7Z0OgGsQA0Pp+/ewPkYqTxaYODRmqA5McEb3yjKlgnlAPIYawh0Qnib+gXDay5HmN
         5h+fghzLnev0WkYvF2m/02HgttlruQEaKj7wKDSCoHXQyzgCRUbR2pu9jNH9eBXJvsQD
         dylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        fh=GEu2mnNU+4a59mUWf7o8inZUjE0wk4quHZUh+P8YiXc=;
        b=jdiai2MXuAveKc0bhx68/2bTTcHT7XsZKvC4tcQPVKiydFV81Au1O6/n9BZzq6LRMw
         pbPdqiutiaofCJ15UsIwRpJ+D6qrW8x+YjUCI/817FXrfJYlEfl3kbwYa8syNb0tkZ39
         oqstwK+gRG0lVMOKRK6dayc+YnN8dlUE6k6fvgsjUX1RKnaIzZ/SjfgDK4meXKoh2Rdi
         hrCAL2/xRSf2FXXx5zh/1fj0tb32sNpPDuWG65XwdAeAQtTuwONmkU/MhiW7ex/fLdne
         hHstHpQb7ih9xRrHCu6lDFicKutehAl84/Bar9E/Xo4XzA9/d10pR6jeW/hEFoTsHRYk
         fm/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695992; x=1796300792; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        b=hPRni7Gdv3oCNENgb0u5gaV4Zw3RfTsSXMYdUW2LkhDwxo3ngLooNHpYEqv5NIryOw
         50gNiX0U2zp5PmBVRabSSO/z5d+YB390v0JpuUYuTAvHltYpFA6qWXLWPpEMlgoS5E5+
         doNVarEoTDmk69pZhfM+ucjNlLfLu1UgaFrECzz6tA3uznE7i2fjidXagOSwuaqE3PS1
         MJo8HeRo2V7UTx9lM/yM1VgspVJV23WVeJuYj0UCrHhA5bgwMms17jCdW9EwNVAkVXAW
         FN62v20xJ1nwrdCgn+PM6V1leV/9dQPoNOoD5k7YifSAnx0ROeIBdaoyBAV86OaD7CJm
         CvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695992; x=1796300792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDf27xnjIY0MGgU9QPmFgOgG3Aq3X7unXOSGnQEZ3Zw=;
        b=LXtfjdamcAObgHimGSd7d2du6MamhPulGCgpaplViuXS+sRjMqcFyV2b2sFInwUS6E
         5qh3IujJzGW6MbI3pZZN/w2rpA2mJfXDRwTezPbnmVtPbUhWh6eQx6TftXKZYuVjY3MD
         dmHBj6KiDgdSP+OaB/lNeo5RwHHih74jBFb7e4JKQL9+p4C1vL552ic3yI8icyAy1/b7
         6W3eswmBKJrw2qpyLCm/TwqWE7+xzdwqlUhkMcX/UrU9AdL7idKMrUNoDPKbSXS9ywbO
         xiUgpvQwdQqDHk/rQiB4dVLngFled1wQJ5VCpUVQGM0pxyoEE5tN+tegOttJKh/DT52G
         gmHA==
X-Forwarded-Encrypted: i=1; AL+hErEarCdy29f1fRMBwO4+B7Xh3b/PPVXlhCd4Ll1VlXuh+PbYTnRt1rqbv8IDB2cgwpN2gpUelQPnmvtsBXbJxzqs@lists.infradead.org
X-Gm-Message-State: APuU4Z+YlaHxih/nVHe+1OHmXlTTalUJvWycLfsdvh/uedlK5maNWMlJ
	sShXQfMnqI473Gyut6gvXxo7I7vGfCWwgFUfNWDkXey1sgAFEKIaoPRnHV2lPcj2rXsHiFYhWD5
	QxIp4l7AqQt72Gw59+5lFMckbE4jskkOrwMmxhWzHQuLrq4BsSMUO1jPbQMDmO4ezH9joQXypEz
	VWLDC5Ngpv/eOZaQ+TIP/m7TYV3tPA4RZaj1S8b+6U3arQWY5TW0V0
X-Gm-Gg: AZFdTZdrdIwbHWhPkUP2voNOPKKpGZdd/krg0dapWAjDHxJw6Hp6qIz9PaHb2il+N4i
	/ei1jbelS9qQeAeS0zjopuA/iHDCX/20CnOuaKMs1mfSoccfBVhSu+fu7gEDRl4fXboNa71Rhod
	XZUzEaBpK97p7IK4E/38Qg+5e1hJJT3pQ7FNI8H/sY2tMGYvxBINNXwLBaMw==
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr20258223a91.25.1795695991790;
        Thu, 26 Nov 2026 04:26:31 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id
 98e67ed59e1d1-3b41c92ce58mr20258182a91.25.1795695991298; Thu, 26 Nov 2026
 04:26:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com> <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:26:20 +0100
X-Gm-Features: Aa3M54oSOwHoQYSn0V3AtuTR48SOSoC8DE5fzBMGlfQpwJvg-qreLFgHRZWsWfc
Message-ID: <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
        Navid Ghahremani <ghahramani.navid@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfX4ELqZbEnqWve
 E4/Gs2CB6beIS5Exo7ZLpXqFh5yqPfXIFKa4U/909XIDmAqlTs5NS00kdN3/m8Xa/L8c/kNeCEc
 s6IyMAgmVhutcWiAV69lIPbQJTF6aGVa9Am6qTyfHCh7x6aIfaYAiEZ4rdTAAP9Do+CS/OoeYFB
 /2z2WFL7EDiVfKvA/pUp2k6c6B51HAetX3K+IYvWT351xwcUd3Xbseu2jzDxc8JRnE42Iufo+aw
 qE42B7YMzQNZ0sHzU31j6i4tbdBhkm1bkRIR4kd96lmQGx5u+FQNLg1QIQFeVPhhXsMMqzEG75W
 5SBwJSFwyDH/6LyJf2sS3A5lOlPJQ/PetG+wWGkPNbL8hg6wMxzED5TlvQbwmD4vts/daodH6Yd
 Ek1sm5bYNGzi8aUbOPZb3Sf6uOuZdty5CpMj/wFTNGvC5Z/HtAP4LXtUWUSMbqswKvAp9sk94TC
 S74t8l7ucrzEpVdq86w==
X-Proofpoint-GUID: jRFKGXOP_wib4Y-xlXh9lkBUhu7blXA1
X-Proofpoint-ORIG-GUID: jRFKGXOP_wib4Y-xlXh9lkBUhu7blXA1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfXyM2Cs3t9Rkh5
 EwnPcwmxGIbBkhtVUEn3diY3C4x5oLx4vJJWeGFmzmRhKu9cHqmHhMJ6mjUhIxd9LmLQZOnEJTC
 cy1HUIWqVqoPD7VRfhRvYzXfHO8SHXI=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b082578 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=kvRnqJp7QHj-O9gkUQ0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_042633_147323_5FD08A19 
X-CRM114-Status: GOOD (  33.45  )
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

On Fri, Nov 20, 2026 at 8:21=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
>
> This controller has bits for USB, HSIC, EDCP (a cryptographic engine)
> and GSM. Not all of them work the way one might expect (see comments in
> the code), but they are there and can be set.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>
> ---
>
> For now this driver can only enable and disable the USB controller. I
> expect more LTE related power switches will be added later, but I don't
> want to commit to how I expose GSM and EDCP in the bindings just yet.
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/pmdomain/Kconfig                    |   1 +
>  drivers/pmdomain/Makefile                   |   1 +
>  drivers/pmdomain/zte/Kconfig                |  15 ++
>  drivers/pmdomain/zte/Makefile               |   2 +
>  drivers/pmdomain/zte/zx297520v3-pm-domain.c | 286 ++++++++++++++++++++++=
++++++
>  6 files changed, 306 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ab8797b8d0a5..e394e0044f1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4038,6 +4038,7 @@ F:        arch/arm/boot/dts/zte/
>  F:     arch/arm/mach-zte/
>  F:     drivers/clk/zte/
>  F:     drivers/mfd/zte-zx297520v3-crm.c
> +F:     drivers/pmdomain/zte/
>  F:     include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:     include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  F:     include/dt-bindings/reset/zte,zx297520v3-reset.h
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 5341dff669be..d5050c22f064 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -21,5 +21,6 @@ source "drivers/pmdomain/tegra/Kconfig"
>  source "drivers/pmdomain/thead/Kconfig"
>  source "drivers/pmdomain/ti/Kconfig"
>  source "drivers/pmdomain/xilinx/Kconfig"
> +source "drivers/pmdomain/zte/Kconfig"
>
>  endmenu
> diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
> index d7aee13ae571..cc3cc7b3d1c2 100644
> --- a/drivers/pmdomain/Makefile
> +++ b/drivers/pmdomain/Makefile
> @@ -19,4 +19,5 @@ obj-y                                 +=3D tegra/
>  obj-y                                  +=3D thead/
>  obj-y                                  +=3D ti/
>  obj-y                                  +=3D xilinx/
> +obj-y                                  +=3D zte/
>  obj-y                                  +=3D core.o governor.o
> diff --git a/drivers/pmdomain/zte/Kconfig b/drivers/pmdomain/zte/Kconfig
> new file mode 100644
> index 000000000000..cc329d085e5a
> --- /dev/null
> +++ b/drivers/pmdomain/zte/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config ZTE_ZX297520V3_PM_DOMAIN
> +       tristate "ZTE zx297520v3 pm domain"
> +       depends on HAS_IOMEM
> +       depends on PM
> +       depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
> +       default SOC_ZX297520V3
> +       select PM_GENERIC_DOMAINS
> +       select MFD_SYSCON
> +       help
> +         Say y to enable the power domain driver for ZTE zx297520v3 boar=
ds.
> +         This driver is necessary to enable the USB hardware found on th=
is
> +         board. Say y or m if you are building a kernel for a zx297520v3=
 based
> +         device and plan to use its USB capabilities.
> diff --git a/drivers/pmdomain/zte/Makefile b/drivers/pmdomain/zte/Makefil=
e
> new file mode 100644
> index 000000000000..8a4185f48ff3
> --- /dev/null
> +++ b/drivers/pmdomain/zte/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ZTE_ZX297520V3_PM_DOMAIN) +=3D zx297520v3-pm-domain.o
> diff --git a/drivers/pmdomain/zte/zx297520v3-pm-domain.c b/drivers/pmdoma=
in/zte/zx297520v3-pm-domain.c
> new file mode 100644
> index 000000000000..3df4cd5f1b22
> --- /dev/null
> +++ b/drivers/pmdomain/zte/zx297520v3-pm-domain.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + *
> + * This driver controls power domain registers found on the ZTE zx297520=
v3 board. The USB and GSM
> + * controllers are controlled from here.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +

[...]

> +
> +static int zx29_pd_attach_dev(struct generic_pm_domain *domain, struct d=
evice *dev)
> +{
> +       /* The DT link to the consumer targets the (MFD) parent, which do=
esn't prevent unbinding the
> +        * this driver or removing the module. Either would leave the con=
sumer with a dangling
> +        * reference.
> +        */
> +       if (!device_link_add(dev, &domain->dev, DL_FLAG_AUTOREMOVE_CONSUM=
ER))
> +               return -ENOMEM;

This doesn't belong in this particular driver, but rather in the genpd
core. In fact, we have a proposed patch [1] that is being discussed;
but the bigger question is if we need genpd provider drivers to be
removable at all.

What is your use case for this?

[...]

Otherwise this looks good to me!

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261112-01-pm-device-link-v1-1-8932e0862378@ke=
rnel.org/

