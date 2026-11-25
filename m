Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5247606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vkfk1NnW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhuwtsfP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FbIO61MC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=; b=Vkfk1NnWcFF+L9
	yj9CJKL/e1PEgUi5TXDJFvlbClqAbWivF6ZWRC3SHEVBw4/axylxmBP4+NNa8FKNSjm1leIbRFEOR
	sg7OKGwTrvPV5mZ2MB37Qvkv/jMfJieaEYQUgOhPRh6LONWi2WKlyZLrwjhZOi1ol77PZJ4cjCK89
	Z457AjPJSHJojGnc7UsYNaIW53PRY8hB/l+xG17Gc0CWXkhZBXSStPybZbPmAQZYS8lZLrE7mVo5g
	Gv9f5Qe8qndGrZkfPWivLPRD6ia3ZGSp9Q79LVZBNYkuYYZuM/OWHDqlaLMjXCkdmvBU3HmMFsWmo
	gS8cajpcpWXnE2acXRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBiD-00000009lJa-2SN2;
	Wed, 25 Nov 2026 12:02:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBiB-00000009lJ6-0ve6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:02:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mGsv3126478
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=; b=mhuwtsfPr5AGvE6p
	fwSfZvqeBdTl1/D1nhadjSBV1vUJNEhynUdpZiRx8rOflS6izzyVYmzOmsk6ipJz
	+xmsGByIzzA2UoBOa7dheLVvQc0p7l+mueaQo4A57u8YNeFANZXZ6uhFKSw/bbEm
	QenHMCxQlXL3MSO1k5gsnFFmgsfc6wTKkvYWvsmWzarD1Mlewyd5e4a+oXMtwBrY
	mZkWSjzUeFVMesXkiXpLKhQxAvq/3gSExl+K+1dBD7jg5at3vo9XWH4lAYyK3/ad
	2/CYM9kme/Kugl2vuur1/4/cxJOov4PHSTnExK+BVBuSKAfHfComNKZvM4whoJ73
	GFSFRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydc1wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:02:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso52985155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608174; cv=none;
        d=google.com; s=arc-20260327;
        b=XV1dii2wuKJqe+vpACAXAOdX0mRnRTZOAc9wPyITujWzFvVc+z5V98oHO/56xU8o3L
         9gXNJ74Zs0NgF4XFwfwa/UvZfvOzF8Cs+QofPkYl07JN+aGhbxyzoOJL+HYMlhsTpFBd
         KIPeDt/+ZmqIex1e7bw4jUAsSvDEVbCIXivzO8Cl7g6z3MbHWjoiBJMAKhXNqbKZKboa
         N5+0Fw2ES00rtMF9LeAHmNuuwDTd2IPEmg3agPUo7TQHTh/uF5SBX3twdrNPkWhfvgiP
         uC1bwQj36KtlJYjOw9meD2Sl/80Tg6OfJRqw0LjQpn69YSryVKlolYN3siwtIW+ny0Xc
         5QZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        fh=8H+nZBLfe6SM/Dv7dmNuaXa8FCcLnboKf4q1GUZDXZ4=;
        b=T6AJwA8olUxQZItdtF+Jmwda+LeIkh00l56kd4Xq42ia4MYUm2WE0EJ/t8oEpd0H10
         WXdfhybe0NYFa7w5dzV7G2RxOGJAH7BlDQBPjwyTLyr9pnHQesSb+oQ+dk3SChKV3/vf
         nwHnTHIgYrV5jg/FvrZHP3IgCQRpvf2ZkocQpXD7hyBK+d0krRexi+5JwlzK15XUTnE5
         wHyWmPCEkZdsW0mMT1gDK7q9zjv2cE0orV+8BaxQx0yTZ9MDiHBNzNReYJEJQ7BBAFtP
         oAHlekC6ROBxcL4rlIqu5foTpzjH5W3ftyZrQe2c3fFpXl2B/v2mLooXSovZuGn3+RhG
         riNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608174; x=1796212974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        b=FbIO61MC59cnDJHX+OK/MvqdOgnrT6kwZYAsdWdZk2UIRn+KmsDrxKg+SQwXqRtYyR
         Tf8OC0K6b+M4BW0yDYAUtOzfd5g6aBdEiOAF63K6TFATbJNZy/x1k7yJJbIhN6943KaP
         lAwIcCJPj0k2GyHKIhW/1hZzT5kvU6BDTgTtgddFQzIuUshvAt+8UINlvfT574n2LhtK
         LeB8HP3tfachPEbA8HWYhFJLkumFWpenmZru70oWN2DHcvFGBdFsyYMjwvHoIF17iVeg
         FWjupWtnsYYdAtxwQg9Llk/aj/5Ovj2We2KJSFbvxu4D6yDoBrcMycRFlGBtSV76SKae
         59TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608174; x=1796212974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        b=ddL0MB2c/Teg3/BEWw/tl+4Y0xCmhduQ8OOJs1A28vwbLOWABRbntc4KdI1HhtqpVi
         uOubXXfR9Umxp/uxUZAu04K4AaQfxnO+K07jlIP6CFZE4KoMkx/d5bkfhmjaqOz6D0Nh
         r2bCj+yZ/P1wq/IiuFuTwj/CIH/ZeHBF8Nkcd35bq66+OObaOYUo4H51ADCtTnTmuCFu
         myqMffU7H29IifZ5r5AvKGTYsQdK4W3Hdip38eNfRBEdeO4I1jWg+FmUy4okxJsZl7xc
         sJoYH1wveqtCvwzamZQm1NCDvN2NhdKAK15gN2CcFCq3oqowe/cdKK+OhqKIFMesH/gr
         AoXQ==
X-Forwarded-Encrypted: i=1; AL+hErGyE9E8iqoCub2tHSHqPe8vDnHP+OEGnhe+2r1h2yjHdR+Hepl9eYdO1YR8Qu+R47+fheXBpd2+2eGfZvSaGm6I@lists.infradead.org
X-Gm-Message-State: APuU4Z9psOJ6FgHc0g0BLudBsdDdN5XIMCqK5Ub4LbgUCPCXhIZJ2AUs
	Pb2sFBqQtnhoLszo7nnAizE/4b1DGSBA1hfh8PRNWNZYy0s+Tj/1V/pOAA/2KhKaXSMJ9Ob04uc
	DM11EEoHju6sDF3LHKJJJpkKd+K9T1wbHNGyO422BRSYzkHjPXQJV0FRouf+k7UdK6VcEZ+xwIf
	93SzMtaua9EDYPPY1Ih3EeUMosDAYomkh16yiv6wXs+ABCYfDfCRV8
X-Gm-Gg: AZFdTZc7ngaq2KtayyXqZmaA1Tfw053O2Udo/bIFjmRR79pc6gwwTlX8222ZKD6khWF
	kl7rm0JII2SjCU0iakibaJ7FgG2lxFqLv5atABo1iGi/dRGHSFXooJ7wDNdPmlZuVsA5M2+YT/r
	ghxZEUba4Gi4y2Y/wD05DH4whJhjHrfpG1L1uB80J6JoVQmaMlX65r5QBj1g==
X-Received: by 2002:a17:902:ecc4:b0:2f0:3c38:9133 with SMTP id d9443c01a7336-2f0c5f91aa0mr49108685ad.43.1795608173711;
        Wed, 25 Nov 2026 04:02:53 -0800 (PST)
X-Received: by 2002:a17:902:ecc4:b0:2f0:3c38:9133 with SMTP id
 d9443c01a7336-2f0c5f91aa0mr49108355ad.43.1795608173161; Wed, 25 Nov 2026
 04:02:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org> <20261122-xg6846b-bcmbca-xrdp-reset-v6-3-bf2104a25095@kernel.org>
In-Reply-To: <20261122-xg6846b-bcmbca-xrdp-reset-v6-3-bf2104a25095@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:02:40 +0100
X-Gm-Features: Aa3M54qQSa1-iu_NQ3Vu-hbUnlJTISMBYoMz5cyhIaJ8PjDAWNwA46R1m2mVESg
Message-ID: <CAPx+jO9Q-kSftm2iZn+5LJ84G2ANRO5HyxGmUZ6RAySZf5ZnGQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] pmdomain: bcm: Add BCMBCA PMB power domains
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX5JQB3KqcW05Q
 3C2vB1Gx9j1RFwyHnhi9dWUk6sxcPhsAMFYV6i9r85ksYASVP0pXHO9wJvt93koprrSReHy7O4+
 cdI7ha0FcLo74Rnc2b7T4Q3Th/53WNQ=
X-Proofpoint-ORIG-GUID: Wd3baLS8c_b_Y_fLKt-4o_vGc2AwEkvP
X-Proofpoint-GUID: Wd3baLS8c_b_Y_fLKt-4o_vGc2AwEkvP
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06ce6e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=K0o9GnANF0TDe8bVdfEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX8c04u990pHfP
 weISuH0FwAAuszhN98TRGKOUliXcSnNrwHupyH0fVONYJ6wBxwgVqt6wsbZOwhcfUai3fG7/vPo
 NybbAYrkTXvji6BsQ4vVampIMn/NKfLhONhH1u2gb//Fz4PfQSNvkEW7MesxAEy+ykthbzatwzD
 bLm5cUCoZD//M2y+DdvV4JKC6oG1mOIwgEFYJcuXIGr4EdJnPLqit5+5StGRxoCcmYS5EGZ0033
 0BlwUUitjuV+9boyGPf/qkamq3QHD+mPh07PtOEKiiygLFCe+RcrfRtYwnUj96GV4cqHVYMP5jZ
 7G/Hdw6ji5qSdhP9LLmd6ylCmzAzZa7RCx7iYWBHqvJ4zBtkZGXbKJ5PZmHojfR+75PIbOQftA6
 A9cy0TlMJerWpPhJSkIlGNU5vh9/oDBGvz1qeiAUE37yMKopXCcAPYASQ1GMiCTJw6+selly9hq
 HbdVc0ejCg1ONDxLT5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_040255_292460_77CD2E80 
X-CRM114-Status: GOOD (  26.99  )
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

On Sun, Nov 22, 2026 at 9:32=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Implement BCM6846 BPCM power domains.
>
> Group XRDP, its three Runner cores and WAN in vendor xrdp_pmb[] order,
> so consumers can power the complete packet engine before resetting it.
>
> Also expose peripheral, memory, USB and PCIe domains. Keep the peripheral
> and memory domains always on; exclude CPU and PLL blocks with different
> register layouts.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

If Lee wants to route this via his tree, that's perfectly fine by me.
Otherwise, I can pull an immutable branch with the DT changes as well,
doesn't matter, just let me know.

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  MAINTAINERS                       |   1 +
>  drivers/pmdomain/bcm/Kconfig      |  10 ++
>  drivers/pmdomain/bcm/Makefile     |   1 +
>  drivers/pmdomain/bcm/bcmbca-pmb.c | 279 ++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 291 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1857e720ce3a..cfe64722a708 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5449,6 +5449,7 @@ M:        Linus Walleij <linusw@kernel.org>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
>  F:     drivers/mfd/bcmbca_pmc3_pmb.c
> +F:     drivers/pmdomain/bcm/bcmbca-pmb.c
>  F:     include/dt-bindings/clock/brcm,bcm6846-pmb.h
>  F:     include/dt-bindings/power/brcm,bcm6846-pmb.h
>  F:     include/dt-bindings/reset/brcm,bcm6846-pmb.h
> diff --git a/drivers/pmdomain/bcm/Kconfig b/drivers/pmdomain/bcm/Kconfig
> index b28c9f6d256b..fb0c2baea156 100644
> --- a/drivers/pmdomain/bcm/Kconfig
> +++ b/drivers/pmdomain/bcm/Kconfig
> @@ -31,6 +31,16 @@ config BCM_PMB
>           This enables support for the Broadcom's PMB (Power Management B=
us) that
>           is used for disabling and enabling SoC devices.
>
> +config BCMBCA_PMB_POWER
> +       bool "Broadcom BCMBCA PMB power domains"
> +       depends on MFD_BCMBCA_PMB
> +       depends on PM
> +       default MFD_BCMBCA_PMB
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Provide power domains for BCM6846 blocks through the shared PMC=
3
> +         Power Management Bus regmap, including the XRDP packet processo=
r.
> +
>  config BCM63XX_POWER
>         bool "BCM63xx power domain driver"
>         depends on BMIPS_GENERIC || (COMPILE_TEST && OF)
> diff --git a/drivers/pmdomain/bcm/Makefile b/drivers/pmdomain/bcm/Makefil=
e
> index 6bfbe4e4db13..ed8a1d3d4c10 100644
> --- a/drivers/pmdomain/bcm/Makefile
> +++ b/drivers/pmdomain/bcm/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_BCM_PMB)                   +=3D bcm-pmb.o
>  obj-$(CONFIG_BCM2835_POWER)            +=3D bcm2835-power.o
>  obj-$(CONFIG_BCM63XX_POWER)            +=3D bcm63xx-power.o
>  obj-$(CONFIG_RASPBERRYPI_POWER)                +=3D raspberrypi-power.o
> +obj-$(CONFIG_BCMBCA_PMB_POWER)         +=3D bcmbca-pmb.o
> diff --git a/drivers/pmdomain/bcm/bcmbca-pmb.c b/drivers/pmdomain/bcm/bcm=
bca-pmb.c
> new file mode 100644
> index 000000000000..9a631b7b0360
> --- /dev/null
> +++ b/drivers/pmdomain/bcm/bcmbca-pmb.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Broadcom BCM6846 BPCM power zones, accessed through the PMC3 PMB regm=
ap. */
> +
> +#include <linux/bits.h>
> +#include <linux/mfd/bcmbca-pmb.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/power/brcm,bcm6846-pmb.h>
> +
> +/* BCM6846 BPCM zone control, in PMB words, with eight words per zone. *=
/
> +#define BCM6846_ZONE_CONTROL(zone)     (32 + (zone) * 8)
> +#define BCM6846_ZONE_DPG_EN            BIT(8)
> +#define BCM6846_ZONE_POWER_DOWN                BIT(9)
> +#define BCM6846_ZONE_POWER_UP          BIT(10)
> +#define BCM6846_ZONE_MEM_POWER         BIT(11)
> +#define BCM6846_ZONE_RESET             BIT(12)
> +#define BCM6846_ZONE_POWER_OFF         BIT(25)
> +#define BCM6846_ZONE_POWER_ON          BIT(26)
> +
> +struct bcmbca_pmb_power_block {
> +       u8 bus;
> +       u8 device;
> +       u8 zones;
> +};
> +
> +struct bcmbca_pmb_power_data {
> +       const char *name;
> +       const struct bcmbca_pmb_power_block *blocks;
> +       unsigned int num_blocks;
> +       unsigned int flags;
> +};
> +
> +struct bcmbca_pmb_power_domain {
> +       struct generic_pm_domain genpd;
> +       struct device *dev;
> +       struct regmap *regmap;
> +       const struct bcmbca_pmb_power_data *data;
> +};
> +
> +static const struct bcmbca_pmb_power_block bcm6846_periph[] =3D { { 0, 0=
, 4 } };
> +static const struct bcmbca_pmb_power_block bcm6846_memc[] =3D { { 1, 8, =
1 } };
> +static const struct bcmbca_pmb_power_block bcm6846_usb20[] =3D { { 1, 10=
, 4 } };
> +static const struct bcmbca_pmb_power_block bcm6846_pcie0[] =3D { { 0, 18=
, 1 } };
> +static const struct bcmbca_pmb_power_block bcm6846_pcie1[] =3D { { 0, 19=
, 1 } };
> +
> +/* Power up XRDP, three Runners, then WAN. */
> +static const struct bcmbca_pmb_power_block bcm6846_xrdp[] =3D {
> +       { 1, 12, 3 }, { 1, 14, 1 }, { 1, 15, 1 }, { 1, 16, 1 }, { 1, 11, =
3 },
> +};
> +
> +static const struct bcmbca_pmb_power_data bcm6846_domains[] =3D {
> +       [BCM6846_PD_PERIPH] =3D {
> +               .name =3D "periph",
> +               .blocks =3D bcm6846_periph,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_periph),
> +               .flags =3D GENPD_FLAG_ALWAYS_ON,
> +       },
> +       [BCM6846_PD_MEMC] =3D {
> +               .name =3D "memc",
> +               .blocks =3D bcm6846_memc,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_memc),
> +               .flags =3D GENPD_FLAG_ALWAYS_ON,
> +       },
> +       [BCM6846_PD_USB20] =3D {
> +               .name =3D "usb20",
> +               .blocks =3D bcm6846_usb20,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_usb20),
> +       },
> +       [BCM6846_PD_XRDP] =3D {
> +               .name =3D "xrdp",
> +               .blocks =3D bcm6846_xrdp,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_xrdp),
> +       },
> +       [BCM6846_PD_PCIE0] =3D {
> +               .name =3D "pcie0",
> +               .blocks =3D bcm6846_pcie0,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_pcie0),
> +       },
> +       [BCM6846_PD_PCIE1] =3D {
> +               .name =3D "pcie1",
> +               .blocks =3D bcm6846_pcie1,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_pcie1),
> +       },
> +};
> +
> +static unsigned int bcmbca_pmb_zone_reg(const struct bcmbca_pmb_power_bl=
ock *block,
> +                                       unsigned int zone)
> +{
> +       return BCMBCA_PMB_REG(block->bus, block->device, BCM6846_ZONE_CON=
TROL(zone));
> +}
> +
> +static int bcmbca_pmb_zone_off(struct bcmbca_pmb_power_domain *pd,
> +                              const struct bcmbca_pmb_power_block *block=
, unsigned int zone)
> +{
> +       unsigned int reg =3D bcmbca_pmb_zone_reg(block, zone);
> +       unsigned int value;
> +       int ret;
> +
> +       /* Request power-down and cancel power-up. */
> +       ret =3D regmap_write_bits(pd->regmap, reg,
> +                               BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_PO=
WER_UP,
> +                               BCM6846_ZONE_POWER_DOWN);
> +       if (ret)
> +               return ret;
> +
> +       return regmap_read_poll_timeout(pd->regmap, reg, value,
> +                                       value & BCM6846_ZONE_POWER_OFF, 1=
0, 10000);
> +}
> +
> +static int bcmbca_pmb_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct bcmbca_pmb_power_domain *pd =3D container_of(genpd, typeof=
(*pd), genpd);
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       /* One bit per zone, tracking only zones changed by this attempt.=
 */
> +       u32 changed[ARRAY_SIZE(bcm6846_xrdp)] =3D {};
> +       const struct bcmbca_pmb_power_block *block;
> +       unsigned int i, zone, reg, value, mask;
> +       int ret;
> +
> +       for (i =3D 0; i < data->num_blocks; i++) {
> +               block =3D &data->blocks[i];
> +               for (zone =3D 0; zone < block->zones; zone++) {
> +                       reg =3D bcmbca_pmb_zone_reg(block, zone);
> +                       ret =3D regmap_read(pd->regmap, reg, &value);
> +                       if (ret)
> +                               goto rollback;
> +                       if ((value & BCM6846_ZONE_POWER_ON) &&
> +                           !(value & BCM6846_ZONE_POWER_DOWN))
> +                               continue;
> +
> +                       changed[i] |=3D BIT(zone);
> +                       /* Enable dynamic gating, memory power control an=
d block reset. */
> +                       mask =3D BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_D=
PG_EN |
> +                              BCM6846_ZONE_POWER_UP | BCM6846_ZONE_MEM_P=
OWER |
> +                              BCM6846_ZONE_RESET;
> +                       ret =3D regmap_write_bits(pd->regmap, reg, mask,
> +                                               mask & ~BCM6846_ZONE_POWE=
R_DOWN);
> +                       if (ret)
> +                               goto rollback;
> +                       ret =3D regmap_read_poll_timeout(pd->regmap, reg,=
 value,
> +                                                      value & BCM6846_ZO=
NE_POWER_ON, 10, 10000);
> +                       if (ret)
> +                               goto rollback;
> +               }
> +       }
> +       return 0;
> +
> +rollback:
> +       dev_err(pd->dev, "%s power-up failed at bus %u device %u zone %u:=
 %d\n",
> +               data->name, block->bus, block->device, zone, ret);
> +       /* Preserve zones left powered by firmware or an earlier attempt.=
 */
> +       for (i =3D data->num_blocks; i-- > 0;) {
> +               block =3D &data->blocks[i];
> +               for (zone =3D block->zones; zone-- > 0;)
> +                       if ((changed[i] & BIT(zone)) && bcmbca_pmb_zone_o=
ff(pd, block, zone))
> +                               dev_err(pd->dev, "%s power-up rollback fa=
iled\n", data->name);
> +       }
> +       return ret;
> +}
> +
> +static int bcmbca_pmb_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct bcmbca_pmb_power_domain *pd =3D container_of(genpd, typeof=
(*pd), genpd);
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       unsigned int i;
> +       int ret;
> +
> +       /* Powering down zone zero powers down the whole block. */
> +       for (i =3D data->num_blocks; i-- > 0;) {
> +               ret =3D bcmbca_pmb_zone_off(pd, &data->blocks[i], 0);
> +               if (ret) {
> +                       /* genpd keeps the domain logically on when power=
-off fails. */
> +                       if (bcmbca_pmb_power_on(genpd))
> +                               dev_err(pd->dev, "%s power-off recovery f=
ailed\n", data->name);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int bcmbca_pmb_power_is_off(struct bcmbca_pmb_power_domain *pd, b=
ool *off)
> +{
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       unsigned int i, zone, value;
> +       int ret;
> +
> +       *off =3D false;
> +       for (i =3D 0; i < data->num_blocks; i++) {
> +               for (zone =3D 0; zone < data->blocks[i].zones; zone++) {
> +                       ret =3D regmap_read(pd->regmap, bcmbca_pmb_zone_r=
eg(&data->blocks[i], zone),
> +                                         &value);
> +                       if (ret)
> +                               return ret;
> +                       if (!(value & BCM6846_ZONE_POWER_ON) || (value & =
BCM6846_ZONE_POWER_DOWN))
> +                               *off =3D true;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int bcmbca_pmb_power_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);
> +       struct bcmbca_pmb_power_domain *domains;
> +       struct genpd_onecell_data *onecell;
> +       unsigned int i;
> +       bool off;
> +       int ret;
> +
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       onecell =3D devm_kzalloc(dev, sizeof(*onecell), GFP_KERNEL);
> +       if (!onecell)
> +               return -ENOMEM;
> +       onecell->num_domains =3D ARRAY_SIZE(bcm6846_domains);
> +       onecell->domains =3D devm_kcalloc(dev, onecell->num_domains,
> +                                       sizeof(*onecell->domains), GFP_KE=
RNEL);
> +       domains =3D devm_kcalloc(dev, onecell->num_domains, sizeof(*domai=
ns), GFP_KERNEL);
> +       if (!onecell->domains || !domains)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < onecell->num_domains; i++) {
> +               struct bcmbca_pmb_power_domain *pd =3D &domains[i];
> +
> +               pd->dev =3D dev;
> +               pd->regmap =3D regmap;
> +               pd->data =3D &bcm6846_domains[i];
> +               pd->genpd.name =3D pd->data->name;
> +               pd->genpd.flags =3D pd->data->flags;
> +               pd->genpd.power_on =3D bcmbca_pmb_power_on;
> +               pd->genpd.power_off =3D bcmbca_pmb_power_off;
> +               ret =3D bcmbca_pmb_power_is_off(pd, &off);
> +               if (ret)
> +                       goto remove_domains;
> +               /* Always-on domains must be fully powered before genpd i=
nitialization. */
> +               if (off && (pd->data->flags & GENPD_FLAG_ALWAYS_ON)) {
> +                       ret =3D bcmbca_pmb_power_on(&pd->genpd);
> +                       if (ret)
> +                               goto remove_domains;
> +                       off =3D false;
> +               }
> +               ret =3D pm_genpd_init(&pd->genpd, NULL, off);
> +               if (ret)
> +                       goto remove_domains;
> +               onecell->domains[i] =3D &pd->genpd;
> +       }
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, onecell);
> +       if (!ret)
> +               return 0;
> +
> +remove_domains:
> +       while (i-- > 0)
> +               pm_genpd_remove(onecell->domains[i]);
> +       return dev_err_probe(dev, ret, "failed to register PMB power doma=
ins\n");
> +}
> +
> +static const struct of_device_id bcmbca_pmb_power_of_match[] =3D {
> +       { .compatible =3D "brcm,bcm6846-pmb-power" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, bcmbca_pmb_power_of_match);
> +
> +static struct platform_driver bcmbca_pmb_power_driver =3D {
> +       .probe =3D bcmbca_pmb_power_probe,
> +       .driver =3D {
> +               .name =3D "bcmbca-pmb-power",
> +               .of_match_table =3D bcmbca_pmb_power_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +};
> +builtin_platform_driver(bcmbca_pmb_power_driver);
> +
> +MODULE_DESCRIPTION("Broadcom BCMBCA PMB power domains");
> +MODULE_LICENSE("GPL");
>
> --
> 2.56.1
>

