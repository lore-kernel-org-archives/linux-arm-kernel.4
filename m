Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896AC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f1Ourc+w;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YTinCTxt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=f1Ourc+w6dgi3Y
	snOt7y7TZ7JlDNEQqGnmzB5wx875S3KkTzikY9LwzUHEoicabFtzpodgLg5P7634LddCKAsJSUCiO
	p3dP8KQbO2OYJaTq3yZUtlhabTQKzyccUQAqZCXyLe7rkm/d0pMNjF48io2RqRyOXMDAF14FRbpSM
	nlWDUVP+zwtsD+gebgpH1Ee1F42TOGP5+0jNMchVfMgEqLhj1USmUiTfwqjkuDwT4tFeyZJjoNpF9
	ZL5O7uwDaLUodEZVT5q+3DnOw+CNyNa04ucBw+oFRa3rD/5nAjPOXIaAxWIp3y52uHhjvMIjjrrP2
	UVD/hL0e8jIyIQpgMpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQk3S-00000003dmh-0xUG;
	Tue, 10 Nov 2026 11:30:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQk3P-00000003dll-224X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:30:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAb683850970
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=QqnelBNbbS62un9n
	7ny8IsyVSWcBmz6Xf0VREBrSrSnCpvech2cV9YL94kXrOxcASwIRy+h0AgfiAoJD
	wyRFSAVn7H63KnF7UbKqKoCJakBJpBuVgVNRvm+Ay4CSdZ/YSMdhSSZn6m8L9DYU
	WcO21F0zTvhilgLPVXqBsbOXt+Cen0SaKaPoPHLE6PjzNMk0kpkiiZcn95esr67N
	6GJVmIJaeo2anyJbus5ugKMVf8tIKBny/CgmR0ge5/y6N27TvXOF6QvgDW+OxxWV
	lHEQwLnrYQHFb8uZcvaevnC388/FCcsTQqssJMV+7tCTgjLAUF00r8jkfeS0mFBb
	QV///w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84ghv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so306849241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310217; x=1794915017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=YTinCTxtrICVo/ZoBBEdvqOYV8xXnd1Jk5/HsMiN6nMP5/Q9fobWeM/JSQ0c1cxw4k
         4ufypS6ZZ7Ycqfe9lNOHVUumoej4PRwviZwwsdXMIjTI8NoLl85yF6w+JaV/jtDagOpn
         3XRoVxy9xR41KBmYacBaLPhepYdXwjVGgPZhilvpOhLG8jkwO6/duqbdrYXU5Bx4uXBn
         Km0AURrmvb5X9sA47b6em46VsLoXUTmsnwuDnGWCdHB4sk7cRhz+H1m6UWMIPV3AkvP+
         xrQZYes+4B2NU8pkxwXM9SRAWN8xrCQ681FPMPXdw/bFBRoa1hl39gLqds19bWiNBeem
         vStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310217; x=1794915017;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=Tv/90e+3VvRF1mbC9BxElhbYjP5FtiqzIGOoTIi2KHijVKHu7lciVvjxlEI3OlcS5x
         X5KfN73oi8hQmS16BmtcqwTRFPDbo9xnqlzuNWzYCMdEmyi7/0X/ypVuoEwchuc/jtcc
         /a1b7z0NSK4Bg3oe82Uk8Wj0z1tR86IW1isscLD2RcyG+b7u4xaKbeqyBl+cuuKKmwsu
         DsYDXSGhQWqDVWoPCL/rjRzSMcZwbZc/M1bvsZ7+qBO8yy6707zvH0BtwoLF5noCwEU2
         rV9QTOe/fupliFMDLNh2Q/D5FLvQE2giHkMjqg3BICanWhsGKjPb/oiirNtZMylz4NcQ
         vr6A==
X-Forwarded-Encrypted: i=1; AL+hErG0YH5etrarcxI96adwD5JG9kkk9UZttZo/5IQIJF1ifDgAbnEmVPBEA1BFekj0im4SlmR9XDV/5NFwpqCY066E@lists.infradead.org
X-Gm-Message-State: APuU4Z+Z7ElhfqgyzSiF+6dXqG+ONTXiTEcA/FFTqHifot6QMc5/MHG3
	8rlCzaF6WusPHWYmj1c2K6bxtIRKx8VWUh5E0xESsTKEQuebijrS1QyuAnS5hQlDXyc1hVpuPnD
	lIsfHcFjlthbjEydHir/a5tOD9d4PnRf/apDNi2IktY3NJQoMDSfwXnjQu3YUbKdZqxXfJ98bd6
	SoNA==
X-Gm-Gg: AYBFou3k9wHlyEcz3H9DsTWEcMMgA3nlhT1GHCDJdn2rz3nmtQre0JBPe2pWPYTHAcN
	8qgowHrUIeVFwAGxnCoW2zN3ShCFXulStEwytufmnVUu4iDH8rPnOwo7PbWSNUiJTHrWj/s/C5H
	KOmvIh1G+MqfbVjePsVW3JU7fkm3OhTfApgOTq0OK7xVOFOlEl0lihWWiU80rjO3jJzd8V6mdEt
	2YjxSLIgNNU59+Q5UpztlTGqScy4FI/DB1JLL+rgKW9FAOkAGbFjX49LUkjEDgSooGLAbBCsoWs
	5IXB3DM5LOTDX/Za/0Cn7LQ04gPZyP2Y9PfGIc5F9xh/9Uv0dkZl+3faBnllkrb0Gcq/KQOuqou
	4YVlEMQZcRgdlnFLxeco4WKYXyH1FTnf3XxY7FiUM8a95k+k2eaV/6qjbLLZ/rlVK6TsaoBqQfu
	p7tt68NlNDM9UEpdZtgnqxPMN4FHpsjwb44kpye/XVtZmQtFjTVUYmNN9oo/TogA==
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613066137.11.1794310216431;
        Tue, 10 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613056137.11.1794310215878;
        Tue, 10 Nov 2026 03:30:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm68744635e9.15.2026.11.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:30:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 10 Nov 2026 12:30:12 +0100
Message-ID: <179431014821.61906.16254753709778386743.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af30049 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WvVV-90v2Qb5btd7p0QA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 2lggM9c9uCLNihumoAEYHYyaYShaWmcf
X-Proofpoint-ORIG-GUID: 2lggM9c9uCLNihumoAEYHYyaYShaWmcf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX3+9Am/vwMhyR
 mqkHLVCq37LStC70ak8mC+wa/O5TwQJondzV8Mi0qMYZwox4pPIuKEhNuwQtNerRTbBiuUgDX95
 gpH6pGi+J2ueMIMokvZtEZgSRZvWP9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX1MGtYGhw7O5e
 aB4100z+6Rgz6X8e9kTwl+wxd3xL5Q7H2c/6d9F5E5rmi9Pa3Kfzh7D205au/xiOm6fvy8WnJ40
 4vzgdLMO70RpRyQTWmayn29Jwweeuiz2W8KEgCViph0Lcwt7zYqJ1UY04FakpFvZTcI4g0oX/5j
 9zakdQ24rGmFhH/PNbVSGSWPVGLcbtYf8cLn4Cc6rpmLm1ora9Fcma4I2RqRz47Lh/SXNGx5w37
 cKzYUOtRt6ugVr8TnqYULmMOeE+fdNfxHQ9vgKs+6vj5FCcPwN6lvoHYNMrO1x8XW777I7O5pEh
 N2g6wtUJRE/e5bTiP8zzd7O6toWJold0j6ai0WAwOmy8l82WVU0DbFR7QVpmBDNz/lXRyvsGH7K
 Wm7GOGOYHKLLYEND/gIOC8KaXFGCYQdBifmli7wGfc4e4HORI5l86HR0ilNwLEXHizXhnLquXWB
 modkgvafw63nmK/E/eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_033019_639561_963FCC35 
X-CRM114-Status: GOOD (  15.53  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: gpio: vf610: fix clock requirements per SoC
        https://git.kernel.org/brgl/c/cebd1c0961d802092bdb68c591d4007b1b662296
[02/11] gpio: vf610: simplify with irq_set_irq_wake()
        https://git.kernel.org/brgl/c/4d49c80223fea433266e5b84464211c6acd86347
[03/11] gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
        https://git.kernel.org/brgl/c/00e3c475fefd0eceb7e1e01305ae3587e654bd94
[04/11] gpio: vf610: drop unneeded header
        https://git.kernel.org/brgl/c/78b100b8a3d2119b141041ddb3fd358190c988b8
[05/11] gpio: vf610: drop unnecessary wrappers
        https://git.kernel.org/brgl/c/0cd60ba4dd958f343cea5970f237c80d589f4cd0
[06/11] MAINTAINERS: Add VF610 GPIO driver support
        https://git.kernel.org/brgl/c/c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

