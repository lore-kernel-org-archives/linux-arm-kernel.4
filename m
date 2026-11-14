Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A005606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzlJNNwa;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH25P++g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=pzlJNNwaJldEWN
	SA378GMzfGsX7GcLq6sFZheiMlEOsfbGV1+VwKQ0xgeP6Zq6JL0uKYdY7fig3iUwDVjB7I7WNquQk
	6mf7zyfPuc9piy4Jep16sL0cht3FRRyz5I4hnybqJAmchlMmwwZqlpfnErUKLHkKtxl6075ZH6Orm
	wUJW4mCLge4QjRKc3khBD/L7/LKb3r/WmHpot8viDBNsxpBanzYkk/qefnAkLiNhJpEjtbSGWexwx
	1FsEkEqoCEVt43ADEQF8cjwiAiMr9cVhpTY2fzNWC44iOGCRZ0hYGauOHdanC2QD6+6fp2ig3mHDd
	VE+YLlJNCa+6bb9ahOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBst-0000000Fsxz-3Tow;
	Sat, 14 Nov 2026 11:25:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBsr-0000000FsxO-0ZYV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:25:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w8m52054526
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=QXgSS9Rda3Kv+k9P
	gzqe3kFPN/uWfUmI7OADtIldqWZDD+slzWtMPC/6dTDxMoFuvQd0N7gxLeJPQzVL
	Gx34zKckA+LaBZxTE6Es8GYa5XxLVKKy317T8OsxSwsgfLMrwNDpbiV3RWna2uNQ
	Q633p0yhEKggDTX7xY11chbADeulqMByJf3qChWKnbWHcJGNHise6+F6CcEqaBXO
	v7Rji8HvkddJBsZBOsexcXlNKMu6jOxc8MdeQ2/nDx6+sCsRyufemJ7r0Jkq9hAj
	v0Ns66yN3GBHSutZp6sEOu6Enxd5pUElkn+mYUsqEfaGQv8mIwxQ2sA9HyaUMbFB
	AVbl5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8k2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:25:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so3104035a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 03:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655524; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGDukVpaWL3bqy35pd1g19oULXPUA5vZOXyije3bB7N7Bs4x+QsN6gVDAF1UuZraIJ
         H1gSe4tcUs1chMIYzi6uLt13RMArJehFaLMN8OrC86Re3h3uwVjqNLWYrEOJBBgJXWfh
         R9UbRuxcy+nc9sZX4XG0e2oWMKr1ofrGvkuQCzcny2ZZqTsoeAGe5TMSF8yP2m9WHspd
         ZLuBs85aQauz6Dr3qbGcj0xmX3/oXfHPsWbo1LtLCBSIZl8mBKqH2CLytGcSbC50+A/z
         w7w8a8HQ9Hnw9cSvjo1SzqEgdzKv7SXuCcxYNrM9UhpaDfU4PkWM7apruiYzKULDqGFy
         mb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        fh=FVlDoIXgjI2cfLxXS82BEyXMliFpM6fZ9sM8to4rs3E=;
        b=FAWCDlKd/qV2AbHnnz5i1ioKcvOPDEovI1wP1IE8Qzh4H7SQv4vSlbWtn1QA523Nyp
         xuMH0CExySEUxy9Gbn09BHtGHiG4krW8RqqqFARV6qAO5RAm+1HP7wv/zKykMkJaSORO
         xGnNP9qkBHHQwlUYtFEf/jQy7HEYj79W/H0mYL3XO+QVAF1KQO7WsxxlIbtjS3lHNAQ1
         CVW7/CZHHF0wGjSeR3PG1YPvfegkhv2Kp9jYpu+eRvHp9aap76zpGhZ3DDUTcgL6Uk6S
         3Yz9jDipQcs5KC/Rtb3j5anBBXsarIibsmu/REDWf89WM9tZOuB21AbEDBUXboIcbx74
         nhdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655524; x=1795260324; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=YH25P++gUH9ICHnzR3I5koVSPg2N6IbDOh0VSIdu82PMfxYwOzSgTeMgxVhrTREIc0
         NSiAI5T4u3HG6SUk63sJtx3Pmhu6X73qPh3wduDyolI4c/D66CjcPk8r6V37gHyNvj/0
         eXGpX6FCLh5zeLUqadAau8pZ92AD5LI53mjpGYWhU4m3XWEj9LlfjGmDmrJBMQSNGjJg
         fR9bZ4DkJP9gbO8VbqNYocsH3YYSr6jOhB9mUgElxu/Yts7vSU/1sRt7UymUE9HQdFlO
         FVpXqkdDKFkpy22Vv0vQYju7errcMlwNoyNpHPjIVs4LmUA5+mfcxlM8EdQhDnXxYPsv
         L4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655524; x=1795260324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=mv6ZQJZHUng21zM5rprNQdyRv6+cgbxf/6+TLfPh955AI8ydD+DXfUlQIZF4Ls7CA0
         yG0erAL+dTfWPjSlhiiZk3pQo97hUkyTi7+0nQD/V+bj7VUKqm18aRukEAfj2j2Mfwiz
         9OJWGNPyL1wgJaWPc0P5L48xJ+zlGBFmCSuGjHoLHFP+d0V8dBTpx7+hfVX+01Pf06qB
         5oOhS3bugQ2WjhxsJqTQ8DB55nqccR9q3jJ5hcVrDnv1gf6YFFI1qXN8dF3vd9ak93+M
         tuMWGr8iiDQ4s302ghOtAEs6w49O7AP5E4NzcnY+h/GNZ/dVEBjixaDkb5btHxLzWjfS
         NclQ==
X-Forwarded-Encrypted: i=1; AL+hErGoZVsaVS4JrURwhHKN1mf3w77jLHZCUZjknvAiTlJhufDw6VmuyaoX4gGMoBs9EExPvKisBF/hBoJR2vDuAAwz@lists.infradead.org
X-Gm-Message-State: APuU4Z/991EYi4xtb0bHjZtifYPMV72aB/HPA10lsf5LiKpesIKbIXzu
	HP7DVmNJ2c0l/WKZ4AYwhDWHiRSi033fuS9Vif5H0MBJed/vfO/BsRHFUCrGN9MUtSyRtD3jgBr
	jyzPVZ3i2i8sAXrU7hmXC90bxUXATdhv3drMGmY3m9tpSB4uJ8jb3BZakWhqRtVtKHFRfPLvMKr
	IvOun99wB38ufaVGs1hkhm6prII1Fiyx3MWRnorEGGv+jMzZwxr5wu
X-Gm-Gg: AYBFou1iBpCwlXDd/5NUp5fSDU0c6Fpkg4H6DDqjDKbJg6B3Hwi6JF2MYnUEp+r/3OE
	HMbZTe3cLQHemrwFBDDY3xxP2KN2bWN2ucZJDyOWU3g9t7rf3E8gOCTDw42ryEYDw4MtqmADKUE
	PhigjDpsg81QRtH7OKJlhHT74YAUvs324FTk1cTZ90Cjkrmmg76GTg4mAW/Q==
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr5901009a91.31.1794655523647;
        Sat, 14 Nov 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3b1b0ba53d2mr5900978a91.31.1794655523156; Sat, 14 Nov 2026
 03:25:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:25:11 +0100
X-Gm-Features: AclHuK8s11-7hbgMIVd4tuDyslF9iqGa3b4ELmL8p_Ex5PIsvw1_iyvVguSEqG4
Message-ID: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXwI1NoG2osgSD
 0GLHdjzNs54xge5N6lZ5Z1UDE12cLZrlB70Er90GuBrs8s0DSxvumbbXOgHooJLhdZaE/uTrAdJ
 MxTPMma9uCD4Kho6G+S9Vpz/o/d02v8=
X-Proofpoint-ORIG-GUID: mrI5MkQAinf3MM7YvGibDn2scXybmUoO
X-Proofpoint-GUID: mrI5MkQAinf3MM7YvGibDn2scXybmUoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+H4HIilxN+NC
 xRATmmNFQsNTWXmxFhfZ73qDPoDQDhkL9ZPcYQQrVfsIi/+9OKNbR1C94565+q+2Vcd/KW8Zyjy
 /Z7RwBzhcH7qWVVAjznkJiATvAmx8aelf8Z6RJmusY61plV2Ul7dtsXmwfvgsK9QUFtUumIQIy2
 RvDQ4UuRXZOSjMCT1MZXlPWxb45z67pHBgBb9QGNIWN0Zf8Jur0zilxqDsL6RuhTA/pDCm8MJoO
 BD0UdgjKOQKtp47VOTMcF+FnP1O0fbspnLh0+8Sc7S/iNKgTM25wdlQRutKAR1ZMPl0s/xtV9FL
 N8NxnYKTAN3KzwovLZPXrQCkl1NBOvzPHwl64Tl4Ee2rVChDBzprcqq7NUz1Kf87IuGet8KRGH7
 wfxeHibLDEDHYCs144Qc7UmyQIM4QXNvqKwSnMjzAHBvcmv9GnX4yclhCjHA1xQzTBYnAj6lwpk
 LO/5g8ho32DuwTzhT8A==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af84524 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=vyQqneORv_wdx-tV-QAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_032525_184191_64D67A99 
X-CRM114-Status: GOOD (  25.36  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the power management bus. This bridges
> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with power domain, clock, reset and hwm=
on
> providers.
>
> Expose the standard BPCM peripheral, memory, USB and PCIe domains and
> a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
> the peripheral and memory domains always on. The power domain provider
> now owns zone transitions, leaving the reset provider to pulse resets.
> The CPU and PLL blocks use different register layouts and are excluded.
> This new power domain integration has not been tested on hardware.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. Queue the bindings and drivers in MFD.

 I assume you are referring to patch1, 2 and 3?

In regards to the power domain driver (patch4) at quick review it
looks good to me.

If Lee decides to host an immutable branch, just let me know so I call
pull it in to apply patch4.

[...]

Kind regards
Uffe

