Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B58606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JE0KmZFQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoPo7sJe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j23iFmoL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=; b=JE0KmZFQxowq1u
	9wKSyPsroetCVs4quECrsybSegnhBRZ9AWLlYYpVNXSQFCnXvI5dPIbe/OXWWFsTx0zOY0zplnvcO
	QF6pWoQ04cYN/yrsv2jQxc04EuWnAGzLZ2rUmy/hg97gOVrnmn43XUuFZHs/ZbQIIolH1H6h7QWQc
	hrQN1hdBw87LI8C/Y2uxVVnb2q1uP1caRLKx3vQkN/LaRgHgAFPbSvGW9iVKaQrdrbEmLV9kVTCZE
	fwH/6SUZdMe14IxIOo781gS8grSHkC+WpUeTiZ20FK+mZOyFq9wOYou7vWCP+2UUquB8Ncr32jIM0
	jhYQPQzrYbzEU7Zb3bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaf-0000000DNVZ-1dzX;
	Thu, 26 Nov 2026 13:32:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaT-0000000DNRU-2g72
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:32:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVc2s2758861
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=; b=PoPo7sJeg+xtsXCK
	fu/4K/5jjRDVGzOFe1N/PocF2ucAdYwy+P/4K0O6OHFTo7jMYNoy5+WcCMRHfrSB
	GXVhj9pxbdKvvtTxFZfb6cGptg4VNZZA4KjdhPMVh8pjxBeNQIWta57Jdt2PiQlb
	6T1doTNGpPG6VqSY6o8JRYtFOcHhPghAG/trL/oAkmXB9GBYWP9Nsf36VCIT8eOS
	iIKfwj/TigRSmQ+BiHJUoZbvEFLS6AnULQw0xa1/TB5+vwvH0HGRf1uLVcQdD0QQ
	+TaOCz0Bgoy9Gdo2hPcOGNfiu3EYnl4adIRh4+jIDwWeTaB7zC95usDjj/ywD68c
	4M943Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvkdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:32:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso8082915b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699952; cv=none;
        d=google.com; s=arc-20260327;
        b=Tm4MiDssLEDWZkDV2d8W/H7GqCYtlhH0Mf92PVQwaCIGa1oQpmkp5eF5/x2Lr9QfVh
         /+Trq42svWsmqJQICuSXjSaCiSmVFmckgzHK4i+XhkMMeYzCsD0czr4WVhpagcCz9TIT
         J7uNrzb4HXzsTwEJcYvuhrkvfkOyTpzrpEmvmaj/S9LZGwzyyV1eYCvquKOVzS+09Dwu
         rf9PPkFgsEZul/b/J0TXRjUZnGa7QnfQL/f6KCq55O3gUhNS1UP38v0NTOyLab6Z62l7
         XOkS+zn2LdH5Kp/LuEZIb4AZNOcqF9ALGURSBjggjH5bYtZiobYMUsRRYWUikgCIVCbb
         rYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        fh=Y0c60AzoKhSGR3GrJc6tD2qup8LzzPLLenUNJfAF4wk=;
        b=VelQOt3kygKwl5gYsmQJln/NsMaGHg/1aOWRynf3/iuiEzpuJpX3iybOtyAEYgDgiY
         sKEg7B2YHEa6ABa5Z6FtZUYSz0OhasxGLv6DXvODUTQtvgJCOCIO/YHlQ+P/64UuaR8s
         i4953+EFFibhjGz5/nCZNYf32WQRf/gFaz+Jq5cJB54COxNDW1pAsVaExQSGK95yEAVH
         hpFBZDV6Np5s0mYQ6qSqGIgjxp3npj9XstsyQbW6xMfOiW+J/MiA+LnfQe9gokhk14FD
         bayi5oRN5gFOHhjKeXsboZoC23pV8YYl/vw6zO8S99SzhlBaexBdHbooHxDafwp5V7+L
         mZrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699952; x=1796304752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        b=j23iFmoLUg3u7wucQViOR05ChudrxMUSuufMqCuGf22zvG348Xk+L0o4XU4htXqk5Q
         kF/7ALgzbWT+EsuZdiAQ3dZcTAdcjvLogYgbSk/eFn6GjhDOwoRrUfPJhgH74ztCGi2K
         JAvLp2TiV9JsoiNAyaee9tmCGgirHkFUwAF75GqPVkNDR/xUumGZqLYsqFKB8V/yMrea
         HdgOJL6G4zqmIj4Ee5MUFL3Dbs0Nt2hweivKGgJfXBf/pnLjfTuWtw9V+Rx8TDoxQAm7
         EX5BvUV0mABQ/TONhAukrqOSmEHZ9oVNOqVusyIAp3Mwx6YGroIi/KXtU/jwf2VWh+zV
         rTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699952; x=1796304752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        b=n1r7xwBpDt9Wkkvs+8Gi8Iqv5pZIgdgUVKzVnUn2dCX0pC74mjTGyIsRbfQp3LRX3L
         HoKHX/1apMUzQks5dy/BQdMZdJvwvnYYpcsXkHJ2Wq7wGTdqupVpBrFMJE0LRXfgGzxV
         J9FNSlzdrrsXdQjtoSflo3Aztk+0jxf/Cxyqw8ydaOJvvIKVWD84GPUWZFD+W89xTcbW
         kEBVSLpSFlDfpi1TwBpxrPpXv7m7IFJX86Ckf7iQDQDFmINHR8d/GeOjRLFjcw51ZO4D
         8t8NlJNkWYYxQwpNZe5ICUlw3HQ0lsxL1DdGS1/QjiROVWQ7fCTxHT5qNrjpOs+fq8tl
         JvNg==
X-Forwarded-Encrypted: i=1; AL+hErF56+thgakyfGRW3Z0yY+t2wAR91YEsbjPSz+lfhhGTGccOLfl3fAE9aGZW/nUoDDDs3j6EachrsGniwV2rSjYT@lists.infradead.org
X-Gm-Message-State: APuU4Z/buRdGcpcG/ySVulqYPwsrMActo9/gfdK547NTotpQ+sPMtDEn
	d6RQ/OBct24D6Ieab7gk7LqYB+Q38e1sWB/lEq2qOQkvlRUB8DwXRtLoY8qc03W4EzppufWqX8C
	eUIH70jromQBa1odqXy/Ef+MUER+JNgFQiPb9r2n0yIdq0mWBliO0zClfrhAYskGYSeflqKDSPU
	v3Vht9ZslsWtYRjoTETzNddjZo7CiBNOrBMut0gsnk/UYrZ7nF2oqa
X-Gm-Gg: AZFdTZdpB2DHfCZrouRza4Y1tOxdFZ1Lr1bhA4hi/kUTJXN7pE3S1JCMPukbrkO1DXY
	TwuT+QdMOJluctEu3mBhQQARjTlA3T0a55hxZwlLp3Dd3cwvlwUvpNztBzgsJ5HBa1VT/x/HpWA
	/ChmjwSETY45FqUxBTJaw+TRlK1PtulS8NqgU2eX24M+6Q9VCpysQ0VEZKcQ==
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id d2e1a72fcca58-8c87d2289f9mr17554758b3a.47.1795699952410;
        Thu, 26 Nov 2026 05:32:32 -0800 (PST)
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id
 d2e1a72fcca58-8c87d2289f9mr17554733b3a.47.1795699951925; Thu, 26 Nov 2026
 05:32:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <tencent_3D56658FAE8FA8158A1175935B194992D907@qq.com>
In-Reply-To: <tencent_3D56658FAE8FA8158A1175935B194992D907@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:20 +0100
X-Gm-Features: Aa3M54qXSJDQK9M8_TJey7rIFwFmkk5uLORdWM7iQeDYcpEdTPrd_CxmSK3nm9E
Message-ID: <CAPx+jO-JsScaTCX4_OTxGf21b-yTGxqGcLRVGitHrK0rKU-yKQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: samsung: fix device node leak in exynos_pd_probe()
To: Yuwei Chen <2522445001@qq.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 6utBk78pHA-siM3uMAyf05J-JOtT7RMs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX+k70GnXhKtJu
 VIaA2MbONI8YPPdd7xvSU00VQfFmKkZDpkjjt8Uk/PacFSZoKs4xpsAJDf/J6dCLec7L18vuh8x
 6vFcjU5R1lpUshLDwdmijLPt7CBsgcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX5frA7VaictLz
 commKYhGG8aBCJiQmrmrrur1EBcK3tLJRpUpfaEN7H9NKnb/BedoZHXuUL23WepH1RJSfjSIvHS
 hq41zrRIEeeeIRrCyjRvO8P0AJmVB4ZA/yIziQglovyjXOATikScPrYtp8b4Ddw1bZ9hXQ8sXbd
 pE9d+eYk3SPTAcJUulI9+kJegiTgWh9JuYOZZFDzYuh3gCJdAzMaY8y0+HaDh9PfVkCbXpTG02w
 4mMXwqzevKSVwVIixWZ2RrgkoSru4Ek+PqrdhEkIbJr830vz6tPEc17hdJ63xzgTjfcxmFKhhx2
 8bQK8IbsW1a7WQIuqZqsMneUWqKSTD2vAf337NUem9jIZ6YJkcdjNhZ3ogIYqJwSKWCjQ2mlfrQ
 EIfPeGyXj2upyPVxjgq2z8DSl0GTk9KaEeB3imoRnU6BtvzCqIcj7vqRIhKMtpwnJTNWaK36npV
 YJkmYGHJQI8Yj2pjNJg==
X-Proofpoint-ORIG-GUID: 6utBk78pHA-siM3uMAyf05J-JOtT7RMs
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0834f1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=dZbOZ2KzAAAA:8 a=VwQbUJbxAAAA:8
 a=mD-zHhwtQrdt06HBgxkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053233_714767_A5BC8DA9 
X-CRM114-Status: GOOD (  22.45  )
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

On Thu, Nov 26, 2026 at 5:26=E2=80=AFAM Yuwei Chen <2522445001@qq.com> wrot=
e:
>
> exynos_pd_probe() looks up the parent power domain with
> of_parse_phandle_with_args(). The caller must of_node_put() the node
> returned in parent.np. of_genpd_add_subdomain() only compares that
> pointer, and probe never drops it, so each domain with a parent leaks
> one reference. child.np is assigned from dev->of_node and already
> belongs to the device.
>
> The lookup runs from core_initcall. The extra reference pins that
> static parent node for the rest of the boot.
>
> Drop parent.np after the subdomain is registered and after the
> messages that print the node.
>
> Earlier trees keep this driver at drivers/soc/samsung/pm_domains.c, so
> this diff does not apply there.
>
> Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platfo=
rm driver")
> Cc: stable@vger.kernel.org # v6.6+
> Signed-off-by: Yuwei Chen <2522445001@qq.com>

Applied for fixes and by slimming down the commit message a bit, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index c8c2ea06e990..01017c406fe6 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -153,6 +153,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>                 else
>                         pr_info("%pOF has as child subdomain: %pOF.\n",
>                                 parent.np, child.np);
> +               of_node_put(parent.np);
>         }
>
>         pm_runtime_enable(dev);
>
> base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> --
> 2.53.0.windows.2
>

