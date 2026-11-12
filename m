Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E5606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZingdNLr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6R8d1Dc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=ZingdNLrN+dymv
	xIiozvugPzutEGrZaqPd9JRI4RISWOfV/xSaTn3klLr7kf6aN/ItWYd3zRp/xyHebrg7HWsqlKUbm
	0gHxjjuMbIKMCD1stIqKbbT0bjrTk9L9V2IWHV+MQwQc5d4/0pGIOThMkI4h4nJrRrd+ZkoIF/G9I
	synv7vZCn9yhTs5tFeyIwgMxojxe5wNrbRdpiGNfi5DQVfkgduirfNe4nfdpqXPUe0NPGip4LtaBE
	b8rmf5byxHy+kDvtGiVoxn9rbX5lICQAyqllCZWIj/JcKMHjfsljKRad5Mqo9GAxnDci6cY7McyRn
	RS4EE/Pn0zcUa9SDLz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPpE-000000091gS-1ZZ4;
	Thu, 12 Nov 2026 08:06:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPpC-000000091fm-1TIO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:06:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC548kB3477432
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=GCMGHbPBHiZjGm45
	eihsbjjHclEvPKwF0SXIHt/hk+pqn5tdeALQ5qh+MCit3sAPOuZ4STlimn9hCr1y
	9qBW984mW2+DAbuu5V8aqW5b0NLDQpKF5g6WZbf2KVnaVPMDQvSEP+KObioQpjZP
	ErNVr24Jj0IHJT8vLn1X2Ghh3w77iwaWO6lr2SzDh/CCBVFPzj1GIOuOTGcwBnXK
	4c4dzoiEWBrDa9oUqJLUbvwhqtNbGB/hdkD+Rk0u2CpDiiTiOrWeFRf+//wnQ5h3
	0CXfLJDT9M92fgXuvBh78Vs/QT7Q2BBTxNjJIENM9FvUQJ/V7V0eeZ1S8ijWsaCI
	6z3hJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugkda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:06:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535131e4c25so81406341cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470785; cv=none;
        d=google.com; s=arc-20260327;
        b=Ge+1dSzEmkqqkXDsj5duRcVGJILTpQFPv0HuA6y77a3Hn0GsoWuS/X2VfowoA0YaV5
         9hcJVORt4Pxmdgq3XTaK5mlzP0uzEyrfC+fkVmyy2f8MJj1o5LOQYDCKvwMVU4PQmS0G
         6uaSxP7daK27+yXTUMS7Kun2xKoymxE6T+Oy4ZAvZTTKrrWHshMZkJBzTLDgph2G3Whq
         ZWdQSGqfNEGoJROTPIXg9dJRK6kguJCgLmWoqX2x6t755hBObnVkPxjcLTXDEfSmRf+E
         kCJt43io6LFRUo58Y11OCZ1mQLVUcye27ZtKKXp2jreSW8hN8Yp3qEf/QH05XDC5cKgj
         ijmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        fh=0OgpNo/CejlXwCvi9KPDmwcPEi9sJF2TbzhX/h5T51c=;
        b=d4KfKXESCnW1EbtVKIudUH+x30TeXJuEudLrm+P4EjD7cmzMhKvC1xbjbWER/py/xc
         myLTs2V5+s6MSzdompcX6FqZKjv/3LwYFsmB1G4ouY4NtTluPqalTpYr8KhxS6/VcH2g
         MBsKydVZUyn3cYg75zP2oAGr+uZok/fozB7/VPCTv/uC6a/XIDWrKZTFlomMuT4QDmwa
         1k1h6GnzG6v4d2g3mj2658WpMV7gtIvOVUSYe5gWzNJYRfMY3UuqlDlAc0Aa5m5JAdGm
         wbnV/dDZAbJ8xMB4QkI2XySGFIzftAgZqucA8CjQkcoZ9e/7VmJ5aVuwPkWr1/4/+T0K
         rTwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470785; x=1795075585; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=b6R8d1DcnrhExCh+RrWphGwNLOP3UG5wL8dCpWTBmxRcUFq+9I0hS5Ib/htjqdnsz4
         seHPqV4i+Vtaq36PbBl9PtjC0QgDJD8w2fayhQUhK3KtW/8TN3l/epIkqsymN9+OFON6
         rGrIFl4jTXfriIGoIAWEwMOG4eEEEWk2Wr9UhAsRhS6dC1lISKyLVN0NXFiVtf5n8F4+
         6bSWwkINOAqjzVxbkr8KpNTbU8DGgmmY7LKTWmfpDeCDxsrTxfaXCvtPAnk9RDE/0Hwd
         WrHEmkBRjSduFvS0sATe63u1gpQ02sJUAVuXDsSPOI3hgL8vrgnefhwG+b7NatJ6hBPg
         92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470785; x=1795075585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=WuHt9VOQcb6DjowKuWHTMWsgFBv77t/omhwDbrHfUERWmmNajYE4u1pAWe8Of1VKvI
         WMNoXPwcIvP4Rh6WgCy+fEdLA3gE/fcSw0WwhFVGZNj84q4x42niXH21v1pMVg+I0zva
         IrRzOMKAdhI0aCYsTEGcIlX8lrE4/E6DTaYhs2A3fxK+BOz+Fjs9VWB/wMg592IZxBW8
         Q1/IVPhGe+9rPZHSPGZfJXstQcVO2gX0EjH72wnOEMAC/gwGnqCJMIqGrbzUawLjupjG
         jlwjfYNjbciID8ATwMSmatjvCRHDoXCG1PFcxj1oy0G0B72pze5zIDfn1Zd9zHrrMjVj
         MBXw==
X-Forwarded-Encrypted: i=1; AL+hErH4E1psaO4gq9yNLBs0S175CcaC5Ln9XiaOS4dNEr364Q6WZcMX9sGdHtPod51GxJOH/DyL2HG6vrRLPxUxNqrb@lists.infradead.org
X-Gm-Message-State: APuU4Z+Wxxf9ROChRtbW3oT53sxKo9RXXIhPtWz4HmULPBCPKHwqdewn
	1+X2h1HlyKVHYsa160IItb3drptx+F/f+s7XsRtj1rP59DMac67hEu7IBtSgvc373wKsJxx8/HB
	JP5UVeDi32NMR6YffPBtAkQqPMeloPHZgl4Y/6iUA4tKZdGqJHcSz0Ueq+vGR0pRlOPortAgY1w
	8PUSvQrYi1kvC6dD5d9ardVvdNl84NMOXxPWn84fx1y2z4/s2MBKFQ
X-Gm-Gg: AYBFou2aC8aDefYuPnPrsyRX3G/k4TWFyY3/kZLRaCDMk36/YFdKt3H9lUtNE05D8WO
	a+Ika4ynvK2m22cop8IS7YiWdsTlzZ4i/NRSyvXuQLG6OeqlSfyPNw3fRQuR60tYkl9Yw77RMLH
	PypdUKaFUGqxDikod4dRaxTzvuwqGNzgVLkDl/ZF9C6M4ppgAcDo6S84yfSbOK7uoNqb32qX3Cn
	qIRm8HbQ62I2cZjqdZ8RxsmxV+eGIoW1d87L/qK9B5tKKv4N357n7zT39AggMGpjX1jRnsSILs=
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id af79cd13be357-947aff88abemr902872385a.37.1794470784690;
        Thu, 12 Nov 2026 00:06:24 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-947aff88abemr902862685a.37.1794470783206; Thu, 12 Nov 2026
 00:06:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com> <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:06:12 +0100
X-Gm-Features: AclHuK9LrNxyKqjXo9lhssRniwpPC4kGf-DKVNvzPuscWH2E16tSx8OTAwPwjUg
Message-ID: <CAFEp6-0EXr=rWY5M=L__KU9eL3UDA06q_vmPWdd+CKxR4iEYdA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7 bits
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.Li@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: lNQJS7Jz38vu-VRgtPNdyLwmHreqniru
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXy2M3LehO7baz
 yH7B0wK3NOW84IooHD+9PJ5PLeY/frjrBipR3SoZjWzPmuAXeKRc4LgcWDqis4Pe5WXwvshe9Gj
 NdixSbEVHbUlwWfFAczPqkCaQXxCDGA=
X-Proofpoint-ORIG-GUID: lNQJS7Jz38vu-VRgtPNdyLwmHreqniru
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af57381 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=zoG6pt3vYd9LuZ-_mncA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXzhb4xbOTQuWs
 53W8jsDbCPhE9RZFXGamcCCR0u7/LCbFBp+EyKCk1QELx6trZ/SVKLom95jneJcbVq1aJemWPaI
 sS9s2YKNY0Xd9mouN5Ewmy4VX4UXGLSqcWZ0VyDzh4d2D0ahzMEKuSTqxvlj524Mdr5JpmxgkZi
 eZkhNTOV0D1AroMctnMfH+J6p4uafRGXVSsTiZg/q5EkBxsFWaE6+ELIEIgquFdVUQvXr5VIN5D
 c/JZwkkhFP49BLsuFJ3Tl+iL5BRGduwrSHCbQP/JsZ8is8q+NYRD9YGch1NdlvDTaRr6kaOt0+6
 Gbdsa7Qs3RrxOdoWVVQcTwOS/cYzowM2OuHTArwAPt1Q6gCsETBlXOG9I178Tl0hmdHd4J/UF5q
 O0oWEYSKGxpXICD15dr4uqqO1/FEa0yNO29w20OofAhiXfO5FCnvLDrSy9VsuF6aFFSv2TQv5qo
 316pK5Gy0Efw1z9XsVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_000626_597020_73C3483F 
X-CRM114-Status: GOOD (  19.69  )
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

On Tue, Sep 29, 2026 at 10:48=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.c=
om> wrote:
>
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL                                          0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)                                        (=
(n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(2=
9, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(3=
0, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888                          0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888                          0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888                          0x02
>
> --
> 2.34.1
>

