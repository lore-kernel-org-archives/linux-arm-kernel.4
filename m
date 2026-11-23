Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5BE606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hRtu+v1u;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTzJt6qn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2yeAAW+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=; b=hRtu+v1uN5lS1y
	U5GOCkGuHeGkthKCp3vRd92GtJUFCo0k1ejcJjR9SfRpDuqmf6OBQylgpyFzBbF6qhHCJFpec7VUX
	VrjZ4AoW1Lp2Hbj7PwA0ndqmw839jaeTpgtnvD+EtmfVAmJfqJvDgTAu1Qpz4z3bt4TJ8W7qmZ6qV
	lmat+lCY3ikf8P9a/Kzn3tBG6PEmi44KtIQ5ko5RYYx5HMeYQnTrNzyfPXhHa0b76Q3+xP2GqKTU2
	7LcjjC/jgf03R0/d/t/AHFSJWPL0Fs+JnQJDvzQhFCq0EvkHXMSoVWEmEQeoAAOiS+E6oYgXgeYwn
	L7vp9rPjuRXEnbQ76PMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKwW-00000002E8g-1wys;
	Mon, 23 Nov 2026 03:42:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKwT-00000002E7s-3uz5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:42:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNrmtF1310691
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=; b=oTzJt6qnLd0hstbd
	xT5GdQxklui3K8aOlQ3KlmrNk7szOErxUT/OHKDYv5tl0eR8noJQLb1H9ygwURRk
	Le99huTrH6aQVqzpwCbzYnht6MoWDr6GmvIkNp1itUcEBysCMcY2GjpjS9pM/OBr
	VeVoQSVgla3FrtKpWN6PvXNnLaUARUR3LpN4oZGZ2QSvDWORGQiWbB8fH09xaiUc
	w38ZoJlfqabPhdUPIOY2IzZ4JrSdbzBdGJqynRii0FaA7Ur6vJ2PbR3IOza+DfuS
	HJ4aB34bbOWMEdHAzTldUKyuFJearU9F+ODz0wxHp5kceA/FsFW5N5VCfcEE++7p
	Cqt1DQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6n42m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:42:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so2088217b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 19:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795405327; x=1796010127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=d2yeAAW+SMCmbntQMt6q8PqYPChpLyzGGmygVWQmwDHKK8DioU3olBVO3zTXlsGqi1
         GwpOA1Q8L/JWDxZMEw01B4Au2bvjt5oi/rOf63kinawPCQwNhzNzB14PRk3Uf12Zkv32
         jppk0RyyQZtSptqAQUv1BwfJjxhozBjfWSdO0urlqT/KY57ek3v3JB1q/A/3iwtW0JNs
         13CuLotXm3/19Qz/OoycKv+W/V1XcTPJNYEK7G2I8EFjrsPuPYqHaDG6GznrNi3zZT1L
         xUcZhUc2Qs8qKpu9eCATE/neCwsKztkMj1R5Lz5y8otCxLsEfgyoCFPmImHToFwai/ES
         rpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405327; x=1796010127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=mkzfTok8HAEew/w6uIvAIhC3MTSdbCB9Fr3g1Bv9FkTnWkCzcGKyo9QJxVZTjz9raG
         B0quTQ5vz61EwoQbaWANhdB63t+28Cx/I3RvIQH8tKd2jl0AXuwwVOKKWnxezXh5nXYI
         XT62DRoDT18UcDKwy3oh/9hD3lGqj+fZGpnpDBrLjeMcR1aLbOeCg6Qqk/ks83j2VUAx
         2NgX5m3JvPY5bzBMHbL3mHZTYr858NJZIAjwwSLSGXzFI41TXuLHlodJ4M+cyP2JaW1x
         clLAvM2Mp7EhMADuzx+fXerb0hYzYGweBRUoZ1WNlpKdS1OM52dV4kezMfx1CHSS61yX
         n1lA==
X-Forwarded-Encrypted: i=1; AL+hErEOdCnnoXallawrMQdn0Rkwj+cBN1ZoX58TLfNg/maf5V9NHst639mEBH7yzZlrgH5sKfwE4Aa6RXePIaEFXd1u@lists.infradead.org
X-Gm-Message-State: APuU4Z+V7Bw2T6ccN1advgjWtG461nO4fTJY0o4xK+XDOAdHTX+232+R
	wAJSUqIfD5qtn/FojMoy5upJitRvoHRTEqVcsSs0NUyW2oAIJILrCmNGFhpe8mhQXzjgUXdGtzk
	DicGIRT257ZtIjGJRDIIy8jv/rkxPfThrEeNIQ92AxsYQEsUsDirh4zWgDFHSBYNPrkWpEORkii
	9P5g==
X-Gm-Gg: AZFdTZeGFK7pDI5t3YERjXy+Y+QkebKi+P1wn2+WP4pkLK+NzRZJD2NlNx31sUoFaEf
	PHP49WOg3g5qMVTIIHHLlDWpG6Fq+V6tVBvaxY3bFF7y4Dt7PRY/fPR5eSZV+dWOtCJhvesvl8w
	vFrSVnljXh6LaPFSHb7LlRbm00LGrC4+rzVNzKw6XPiDcgb0CUPq8ebl54Nh761jp3NZBBTh+ps
	j3R2m9fo0gYGzOx1zA6ngYV4OMHOuEF/waxdHbbzbh4sCID14+/6FN6P9X1kOwS7rxtTHWSlvdI
	LJuuEPVtPxi8c2jC2OS/PpH2LrRIDAMPh3C5IPRds2bB1WomfEdq+DdnSz02SCT5Sp5qUm0ldhq
	5s86WY4iLLr5pC1GvcgYj2xJJ0VZscjNrt9edrIG8aoT62cRqiQ8oTEJ1bZN+C5GLuVe/ucGeKd
	HJmnf4RiWiroalGrexeOBiRqcUbclpCFx//xISBCmvrsl2Dw==
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216914637.66.1795405326620;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216896637.66.1795405326163;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm4362204a12.13.2026.11.22.19.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:42:05 -0800 (PST)
Message-ID: <f74a9623-4522-4a30-8d50-bcc148f2b9bc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:42:01 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: kirkwood: Put clocks on error and in remove
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lVGT41urTDauT3GsGs1EgSlXrRDcvFX1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfXyZJhRVAWsV1f
 UBY5qIcZcqOqPcWBvyyizhuj7jwynafhYUxUG8VTgQxIf2JvSmcOf4GJE4CWPw2Ta+nYKc6c/Jz
 oyDtrMdR+TkY2ri0ZPnfu+YsN/1unXI=
X-Proofpoint-ORIG-GUID: lVGT41urTDauT3GsGs1EgSlXrRDcvFX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfX7q3cj9YkJHgQ
 H7N1eiSCGba8zLaWO0Bpca2M2KhOJR4JJWrg9wSRVi0cCSo9oz1Iwvzt6THNPHbFTiZEf2XHNO4
 FUSuHAEuK3joXwMpxqOVAviVFIAA5hBTGrZVPhAjpVX0K3hoQAAIVPruEhU5z3FyAn22G7z9SOr
 hwBYsR1abg+1bohys+2LYGP/FBXokcaos1JUpQFarDb6835G6c0xO7zC5L0rEUIsm3QWudkeNAn
 oHUa1wrEwxtvf+Knpxr93/Yhx0vMqvVZDifYR7CpjPx0wjXA5i2lLmtTaLJSXUB7N9Stwqt4+D+
 l75G1odtnmVl6lUU29bX6rwqEuYHev/mWXehPglyvgEYNG6JZzaF/GDbhxizJ7tuOGBDX2fRj4H
 CBzGwji5MnaEyJwdNqxx3dXugnde6qdlVmAmChlp6aRfykCiw4jBCqVR8ji4rwKMB81MynTcMux
 WS9SlGVJFfAjJb+Ty9Q==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03b610 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9A-NSSyiqZj1DCQBHqoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_194210_152386_6280D9DC 
X-CRM114-Status: GOOD (  25.05  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> kirkwood_cpufreq_probe() gets three clocks with of_clk_get_by_name():
> cpu_clk, ddrclk and powersave. None of them is ever released with
> clk_put(). The error paths only disable and unprepare the clocks, and
> kirkwood_cpufreq_remove() does the same. So the clock references leak
> when probe fails (for example on -EPROBE_DEFER) and on every unbind.
> 
> Add the missing clk_put() calls to the error paths and to remove. The
> "Unable to prepare" paths now jump to new labels that only put the clock
> that failed to enable.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 2a4bd9f0db24 ("cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
> index 24b285cbeb8d..e85658081c07 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -125,7 +125,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.cpu_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare cpuclk\n");
> -		goto out_node;
> +		goto out_put_cpu;
>   	}
>   
>   	kirkwood_freq_table[0].frequency = clk_get_rate(priv.cpu_clk) / 1000;
> @@ -140,7 +140,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.ddr_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare ddrclk\n");
> -		goto out_cpu;
> +		goto out_put_ddr;
>   	}
>   	kirkwood_freq_table[1].frequency = clk_get_rate(priv.ddr_clk) / 1000;
>   
> @@ -153,7 +153,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.powersave_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare powersave clk\n");
> -		goto out_ddr;
> +		goto out_put_powersave;
>   	}
>   
>   	err = cpufreq_register_driver(&kirkwood_cpufreq_driver);
> @@ -167,10 +167,16 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   
>   out_powersave:
>   	clk_disable_unprepare(priv.powersave_clk);
> +out_put_powersave:
> +	clk_put(priv.powersave_clk);
>   out_ddr:
>   	clk_disable_unprepare(priv.ddr_clk);
> +out_put_ddr:
> +	clk_put(priv.ddr_clk);
>   out_cpu:
>   	clk_disable_unprepare(priv.cpu_clk);
> +out_put_cpu:
> +	clk_put(priv.cpu_clk);
>   out_node:
>   	of_node_put(np);
>   
> @@ -182,8 +188,11 @@ static void kirkwood_cpufreq_remove(struct platform_device *pdev)
>   	cpufreq_unregister_driver(&kirkwood_cpufreq_driver);
>   
>   	clk_disable_unprepare(priv.powersave_clk);
> +	clk_put(priv.powersave_clk);
>   	clk_disable_unprepare(priv.ddr_clk);
> +	clk_put(priv.ddr_clk);
>   	clk_disable_unprepare(priv.cpu_clk);
> +	clk_put(priv.cpu_clk);
>   }
>   
>   static struct platform_driver kirkwood_cpufreq_platform_driver = {
> 


-- 
Thx and BRs,
Zhongqiu Han

