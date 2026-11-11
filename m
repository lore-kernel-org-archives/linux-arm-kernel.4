Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD20606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnM/PJlA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0YbEjmQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M72t3TOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=; b=vnM/PJlA2h/i9wSA/5k89OYUFz
	hoDxhzuT6Y62RmFk8ccjW2lbgveUOJdoWy4PYMh0oUOOcxCmGb03QoUcYid3ZKjHJ82QwdWtXLa8O
	8MP6OkpFcLf5Lg1ETk01rOxBnklANw0U+F/HP+DZ8PlIi3Cnb+5eTX0UpI3IPW9gYZMRMr1m+fbta
	k8EC/OE4RbjjmzEXqLJUrhG4Yox5GShr9thFAe2JFvVoRifEMmWSJ/w+FSibZDwDyPWASWIWixQAY
	88aLxFh3xi8K5yBFRu5SIDNHqjaOy0hVSjerZdn+QEz2otdZcgOIfsIGOauek5t9iuYXi28REmt7I
	yD1MicNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7fl-00000006heu-1nUS;
	Wed, 11 Nov 2026 12:43:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7fj-00000006heY-1DGj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:43:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ0AB2338047
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nLyGHp4qcirbe+SZhXZ5P8Yy
	+rXglhgyVMIGmTp7hZI=; b=N0YbEjmQBWUJSHllIctgvmge4ehK9Ko+T2ylVKBH
	wyBACIgWfQYeSDeymj2z4uBm84hVKKY0O19Hnyl+CGrbWdskfOVEXjEC44+M5+1J
	gGaR6EVTlxdsizCRtLAi+PAyCzeuTdoUg3SQo6fn58i5IgE2TshkKVtUyKfcohlR
	yfRTYBEMI9VRKEuEsv5MDMfBEAjWFPFRKJxPBJZwbcPcjIU9IBO/AeNyhz7hXfBQ
	mfA0GYDjwF56hGWHKwn8VV6rkArUhQ6BJAXZAes2qnqvpmmbf8CEPxgyu6ZPZZB9
	uhAsS4U6KzjOsWNRvbQgiDAQ0MihOmtOIwsLmV3+cfRRmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmambg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:43:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so648200285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401004; x=1795005804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=;
        b=M72t3TOl0O+9Ghmg8pauguNlkIkwP0CAA6837L33JWFKnmMkFbW/BZtmI2dVbBpG5B
         uUk5AJPuv1hj3ADIoCFVPRZnW0LsxyytgUK0+TEygO3Cdeq5t/rphhlTntzHlrBxa8rV
         wL76dPgY2dd+5ckHxo1nFJN1tHUcCBLRBJoYoQBSci7G2UwzFDduk0fkN2pfkAdqg4qy
         +vmofqDFB+TskRjrQF7jmr4lrJoEzD9prpcTx5BGYyaskNcN0H7+ZFwJzG0H7PkS+UsQ
         zFDFYlxo5AO5bjCgqxo2GDPSY/ao+EhnWZDjetXKMQo1MGbW6qgjVS92uwOFA+Sqd9Qm
         854w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401004; x=1795005804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLyGHp4qcirbe+SZhXZ5P8Yy+rXglhgyVMIGmTp7hZI=;
        b=rPhAtCTaZ+JVdpdS0GqOOfIPsFfVzlrS6ELE44xbIScmUFSdnImAARy8ff7VSkByDy
         hGer6X8NVojZbEYXSvmUvdD4hvRNa8rmljMrGXm35gh9rMtP44kotwjXnlh5bULdkJe2
         FtGsZBK69Sb5gY2h1FqEog4GAWjhgEClNdlPqWPsrX7w2gzHarJYPqrIMS5OFAYGxwx8
         ktyiu6lfSJEXzt3GBbXVUmfZZ11OMtfIvz9Q4w+h6+cFllZSngDGRv/XUqtb02dlwx3c
         rTK55lMLnYasrAszTQIT0dJn+0ddElGJsh+2HgScqPBHkqFcyP+iUXfIre1ODHCqQ9IZ
         VY+g==
X-Gm-Message-State: APuU4Z/j3+r//TGs8ia8MENxetjUaZAaoCwUar7Umc5zbh1bEo7QUsJ8
	KoksO9nvFmmMhl6IB+NgBCaI3+ykPvigt4aQN0s6O0FRN0ZuR22rYzMTsA2E17r+cJ0/lT1vjrJ
	fantycF+RVyYNN2WKaNEGVtkmFo2rTb4ouP7mYMyTml5mMj2s7ehU2h3Lai6m+oj3qP7Wa8d/Cj
	RBdQ==
X-Gm-Gg: AYBFou1KP+O/8h80E8ASYweiHZ+newerAMytosHYrfHI0OVLSkDzMizkkvg90Ouzn3S
	MiXbHcclwHyM+xh9HnMnL8WLaJybe3XqUIYLM5zUoPmuutfpFdB80rI66x1Az/azn0CflbtOhZF
	E51jsBJ/TT+/z72VmRVXG94GMPR6jTCtPpZSKhFfOe3FqgP6yrwMcIhMibk/lw1yXH5PAyo8PXd
	Yg/U2xl16QBZ7R3hvRyIjCZE5YhffmssY1AlhHvrvK2qzGgvSJGBZ91Yr/MPQVyn+tF5VKqRHH/
	3PEoAa4gfseJW2rw5oiIlfF9Xv++fEl6jCL2noX8Cg521JLhYCuIcpyFk+CNKtVuHy+4Xsc33C7
	3wSkV0+puSLqhKJIkPPl4OPskTWpYZ1eqii5PIFUe8lsoTv7cwtvnkm4LOEEhaKUrjo4xs4k08S
	9P9PDaCMK2XZTIlAuQ/t04+qolqs9RK/Ubgi8QJH1Qq2XAxqRO4QCyqxqlnyKXow==
X-Received: by 2002:a05:620a:3185:b0:939:6dea:374d with SMTP id af79cd13be357-947b00730e6mr343626585a.49.1794401004481;
        Wed, 11 Nov 2026 04:43:24 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:939:6dea:374d with SMTP id af79cd13be357-947b00730e6mr343623185a.49.1794401003960;
        Wed, 11 Nov 2026 04:43:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092629d0sm12242091fa.26.2026.11.11.04.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:43:23 -0800 (PST)
Date: Wed, 11 Nov 2026 14:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP
 bridge reference clock
Message-ID: <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-11-ardb+git@google.com>
X-Proofpoint-ORIG-GUID: rUjx7jeUARt5Wv40xb7L790Q_dRZsFIM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX7rF/5ZIZqKUU
 2IfC6h+F9jDsg8/wmVDzvzYLgH12CnBaw/QXLFo3xW/ogH4FnI09XUpf8SBB4qrOkNrtN6xUNv5
 lPGI6uERBd3Y97CCcEabQDBrso7n8ko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfXwsppn3GReX3F
 tT5cO7RK0GIJw4N64+eb3gzHPuN+lSPc2hkwAqUIPzSkf9Bz9d5hihL28zdlWNoEfAVCExjcQR+
 FqcKVI2IoElizruHtkHeMb3U7Vwcn+L1Hx+ZvRTKf23jxa5loCexJz8FgQdOL4vYluFfGq6hyS7
 QbLgIZvGunyFz6gCFhrJA+Xd8Tdlq47fACzXRJna862rt9F2+hGMjnZZvrkn7fo85kvIQtFPnPD
 hXxQ2b5XHds2WmTcNfVzzOpf+sjNvB56/ivqCv7OhR3Pr+AAXyuPQNvtkaxsqMKsHEWl1yuBBNd
 PCSLSXE9YXGGkdM44iWLl34OA1a6DxRw7EmPRaMeJOLA1v1UeAzEVVQnvoTtG4J+LNZ+NfVB50f
 Ep1kJ8OwEav69MJI7L9ICsn1ruergMilFf/kCfR32OeWTnTx1DF7G/gJQh3RTMo0gc1oI0Kl5je
 0iXp7uILeFQf1hjP99Q==
X-Proofpoint-GUID: rUjx7jeUARt5Wv40xb7L790Q_dRZsFIM
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af462ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=_PC-E5IO6Wh9n2e_leYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_044327_445343_2EC68D4E 
X-CRM114-Status: GOOD (  27.17  )
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

On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
> output of the PMIC, which also serves as the master clock of the WCD9340
> audio codec.
> 
> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
> only runs when the codec happens to have it enabled, and the WCD934x
> driver only enables it on demand. If the bridge is brought up while
> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
> before the codec, or while the codec is being initialized, all AUX
> transfers fail and the DP PLL does not lock, leaving the panel dark:
> 
>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
> 
> So describe the actual clock instead, so that the bridge driver keeps it
> enabled for as long as the bridge is powered up.

According to the schematics the actual clock is a divider clock coming
from the GPIO16 of the PMIC.

> 
> Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 9d38ae83c979..a4a573ea7e4a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -97,13 +97,6 @@ sw_edp_1p2: edp-1p2-regulator {
>  		vin-supply = <&vreg_l2a_1p2>;
>  	};
>  
> -	sn65dsi86_refclk: sn65dsi86-refclk {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -
> -		clock-frequency = <19200000>;
> -	};
> -
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -528,7 +521,7 @@ sn65dsi86: bridge@2c {
>  		vpll-supply = <&vreg_l14a_1p88>;
>  		vccio-supply = <&vreg_l14a_1p88>;
>  
> -		clocks = <&sn65dsi86_refclk>;
> +		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
>  		clock-names = "refclk";
>  
>  		no-hpd;
> -- 
> 2.56.0.611.g1030f0b940-goog
> 

-- 
With best wishes
Dmitry

