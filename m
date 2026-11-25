Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3m/EU+4w;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpB6FU//;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTQ7s1rm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=; b=3m/EU+4wTGzj2h
	GLK/m2YwX6nhh+JGhmw5xolhS/ErSe1pJcjw2+hS3TSqQbozbRn5ASne44ryYRr5z7LSoI6BA7Fxy
	2QkBzZAD/kpRey63fk8V+HJZEfSI4/X8DsGnigDL1JWmecXNVBMfD82cc+e0EMDm8FDz+U54Lwtxh
	w+MJXx8A8r0Qbdoq2ZDyeNQW+/fNfthcWjfMkhsaGJmOLAkZzc3g+wxQZHk1CC+pOFxpcqQm2nqG6
	ul7TC27HAhBNxkB3ECP/fdadUlM9JzQvkRmqbycWCwrSpoCn8mOhS8j0eDBI31CQ3lhR2+kWP7tAz
	vrmRnuHGMifXe8bBW70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErn-0000000ALAL-0uW8;
	Wed, 25 Nov 2026 15:25:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErT-0000000AL2W-0XSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM4oX047611
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=; b=OpB6FU//8xOqb7OS
	5fVG54KpU7ZjNVKjctadQgIBzM1pOMtfT+p8RLJQKyYAAI7DZyJ5qt+UOaP/9pq4
	u8sBWRPln3bzRSPYJOuCVV7hYFjGloUQUfoatqf+FTAUdrFoUXI8IRA4nJgD5hO1
	itivGuWNLrBgEQ4KnYHzi73YpEIkNS2hpwNeAhy7ZKl8SxdU6IFb+LEhb4BFL6GZ
	DmcN5Y+58aqVqcFdGV9uBwFeAW+ByxC0qjFbCfgk8N4RUZhVJhAGLOUIiB4jt5Kz
	fAq9A5IwNKwk2eFTo41CSn49JtybruJZBKPkwkWdyxqWMvEUDUxgC06m1qXnG5Yg
	jtr1nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bgxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so4722830a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620281; cv=none;
        d=google.com; s=arc-20260327;
        b=m1r0TkCoA5FuxGjMuq3zwq8bg3lO3BFUIZnPki6Wsir4UtxiqbAViTUnibvptrwesi
         CF8ll+468rx3vwY4ubTMbEbH2Siuqms5RY5aM68SU12obQJhmglG2+bqgtPYu37ofU4s
         IG7QhiOykIls2bcXL5fqHOuu7TQnU6ZEUtpBownxTIbuRh4AZCZeJcUWXthbhWjQPlv5
         9gGGCkZy/jtkn9x5nSCFkTC8v001a+Av/Y0oFs8WZ/Wy1NSIuxrZ6QCyjUYZj6WmIsOR
         KbVlWb5+6txsdlt018g6nyTFXV3q1mVyA2JSWdHqApoUvckbFbzVGbCO8eMTQyZf5Ve7
         0dYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        fh=m3KqMneNLE6CwJNPtn149mypr5KF/HcQOMR+Tz6MvP8=;
        b=C4ZxTAqd3laBTZmX91B+smyT3phARnSJ4JW1/QOBTLnyI9N1Xgr8pESksEP8rQAT8u
         6O5vNHHZF5UXD1+6FrXBryE8uqTRsfpAiwVzznDLKubpKOpJ2MNdMDe1KKHfe3JgvT9P
         +jGlEHEL18MmIQDm78wRbksXiY+2ka4O6U/ihHJpRT/M+NEPBvOWw8fHBMwoAOYhs9Lj
         lpAcbKpKmSzK/VdvqVHWqr9Y89HkTZkPMtBO16MBph4Tr9MN4ITf1+Y5+sIiAsDiADeV
         rXmqsOc3RGR1GHpdID1znaIOmY1D7ymQILRKVHjUR5Ry/lr/AZ7juqotiu2LZ6Jng8+Y
         alZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620281; x=1796225081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=WTQ7s1rmVmkUUFunChQxb2biZ6liDWHZJIEMHqUD2w9UP4ldWobF0STIotNCY9Sg8e
         5vIA4/kjGvBZJJwJv7G1GLkkNTB9hT+1qZt018+gq9M+1rVJkZe+AbOXkqHyOwTMQRPN
         xrxwu9xeXy8TNTD7AuUWKmpJWM5ihHVAqayOVIDyLMR8nPZ5QitcVfmToomAMrmEjmiy
         VpGxDQaF8Tio1jl/xUQCsfNgTnxxAfpxhv9zfJFUREiW3c9dFRlxokNXdwysQOEL3mLJ
         cRRj+aJ0I+h//SQslu0tukipYiPBcebQgTl+VKPc2rQrhFwr3wPbZNY6EicnolDAsZsB
         oMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620281; x=1796225081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=K+MNrLaD40a+f6fEdPAXB2mRg5I/2GspONM2BtAqYeg5WzZRn8rrXKAyqb2F+EIvmn
         W9DpJmWiPaX0IVBNssWlhbAlHJVDdT3+rbhbpqZK1g4eZbRz+UvMk0r31fGALsKfbYyy
         OFdvgpVLOT83AvIFDGyFPtBmkrl8SBhGWseMfuIDrwGn87eUtNjm9iOZXBaTVywR7i5c
         NVAJI0x1zFVeyfa3sb9hRSvmgIFlvhX6ZaA+B4Kr/mOeswOhsu2wlttFxSoGhNbOLzkr
         NSmHwfGW4px5pGsLvxGjVFLF8PgVJwD+Rhgm/bRLjSQWxk+j7RZGX88CDSeBqTFiPta2
         hkYw==
X-Forwarded-Encrypted: i=1; AL+hErFCLHS2D0zVUzBeVi0i3fhp2DWB/LVdFYyi8yVDg7E0Rp5KkYhQm1pgE+JDQAL18DQDji3Vr9UcuOqKmLzlzPcR@lists.infradead.org
X-Gm-Message-State: APuU4Z8u5JLyO+nAGsJsyGcAfr8BYzgNR4Ys2h1cGcrY4wPGscwSOyUG
	xwQia42JUPBuE1tgpvrn1DozEtU27ez+0417ZnXHtm1k6sWeoa40Rxjff0pum9tsO7DHwOEpX4B
	9StuPXGLcTWgpKD0UnpKnEf2pI/Wte8OiqT0pRNKuD9SRoZJGTP83PSXN/tWy2rWBEWn2WvxhPW
	urqiAEfLemael7pe217lHx57pjDvT0AguL5BVHqlWEXOmhgrmcuGKf
X-Gm-Gg: AZFdTZfXDlNU6YeF6OZrgiBJoYiPGG/pGKudi56Kk/UX1+JXHMY/CjNC4GOIANqp5In
	43kdKHztdtPaEYRW9f3pfkeQQg4LbGmsiT06+b9rXhCzxytpmDHQSfK+7mnvp0yh22dhR4Xe9Zo
	xp02HtDuSeHynKEtoqNin19Db+k9jYiZydu+4cwVkWeGQo5Tovu6TdR1453g==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr15762953a91.48.1795620281097;
        Wed, 25 Nov 2026 07:24:41 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id
 98e67ed59e1d1-3b41c988620mr15762922a91.48.1795620280668; Wed, 25 Nov 2026
 07:24:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:29 +0100
X-Gm-Features: Aa3M54pQyww1I_PbdCBse1VupHYmzcQQ8jGP2HKCbG8YvURb7jcXXUW3MJhTLAI
Message-ID: <CAPx+jO9aHqEwVu3j5CdVTsfrhk8cMRawA5rj51EA7AdVtn-U+A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06fdba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yRSEYQ9GznzmN70rNvQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: P0g0EoYoEcmYzFNvTbzL2XC_w2VnNc3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX142pk+Gy3v0T
 aKXpPdG5yegmHcHB/i5ksNKoz+j2Oovh2moK2OiUuulz0fYYDrZXk0E6iL/h+yjB8sc8e2yFT2l
 g6TBfJn9CMOg9lZMtCdV2489nQF4qnElKpFWSU3YvRPVFqi/o3jFYRF/zvZt4eXGSlfeMcMe2Gb
 RKZmN6y4TQ8cKsYanz4hELyJh0WU4vCBAHqvkLwVZpZdipwvqumC+9PTdMs57oOfG1OTySEt3xd
 5jFk2biL5OzbcxqTRwAH5H5TTdNEub/Y9WSOMcQxIOpIy5GtmWknw5h+8fsCDxR3k6GG18OqFaF
 ox7a62rgTyDBIptnr7lF5UV3nOWc3Xms29gImVcdPZtaNtUdaMR45BRhQD+ZgW0ZS21Ne/gIhqU
 a2C11F8gpOn2aBdLgJIn0LESuGpwHIhRc7ptKASdxHQhgEqdQNhmBneZm3MePxQg9EgV1lyo2ts
 UljUFr9DIvc81aAuxSw==
X-Proofpoint-ORIG-GUID: P0g0EoYoEcmYzFNvTbzL2XC_w2VnNc3s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX4hgX9SHCyBiF
 N+Jn7HV5+Ah/UK/S+0SevKEWN7TQGIoegcZtaw+vP+dzwlY4oruMPuDeQ+r/ytJzjEKaRecE95h
 DtKPSBKTz+iiU5Md3T3B3njbvxFHMkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072444_957660_43EC7151 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, Nov 25, 2026 at 4:44=E2=80=AFAM Stanislav Aleksandrov
<lightofmysoul@gmail.com> wrote:
>
> Document the RPMh Power Domains on the Qualcomm Halliday SoC
> (SXR2250P). Its command DB has the same power domains as SM8450
> (CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
> qcom,sm8450-rpmhpd as the fallback compatible.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied for next (available at the immutable dt branch as well), thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8ee1c25a7c9d..663baae9cc64 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -82,6 +82,10 @@ properties:
>            - enum:
>                - qcom,maili-rpmhpd
>            - const: qcom,hawi-rpmhpd
> +      - items:
> +          - enum:
> +              - qcom,halliday-rpmhpd
> +          - const: qcom,sm8450-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> --
> 2.55.0
>

