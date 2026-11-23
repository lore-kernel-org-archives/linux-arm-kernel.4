Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73442606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cHGy5lKb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrouaAOQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbhQASfg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=; b=cHGy5lKbCI4bxB
	/XjRyFz8Kf/6K1Fo8fLU3wx8/DDFKJ7xmt6Wd7jNyuietubJsQziER/7g86QZNuptcMAOHSK1bMbc
	HlNd02hTyBzztJnwg75b+RgwZSifr1QiVuVnDSDICTlIroSKi08MMGiJGxS/VuMZD/JqYfLHX9tPp
	RGv2tev9YGB2VsSf6GrJf0kePiBc+ReKVBbdfcJRsXxi8XOEc4nltzJe6xlQDZTSJhJQzUu0zDSGq
	RobwnVgZxPsGAajYZiFkmJDKBbOn9NR6uOfMxgcXD4hmWOOjJKSdc0SSOgeB5+G59brimRgnC33pS
	2cUJ/3Zjm20rtudeFObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMv4-00000002KlT-1ThF;
	Mon, 23 Nov 2026 05:48:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMv0-00000002Kl2-46Lc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:48:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51S60832607
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=; b=jrouaAOQBkpXIBv0
	p0KNvCgW1f7jEnIrr0Cy+Nnxx1dSw/Ay7K9cKDB6jBS47qatRVXeio/i+ZnrSdce
	gBvTeLdlV9/MQQCSmS7LdOrlE7vDZX4bFFRCfyDuM7ZqzSoSn71dQ0hXnVj0wk+1
	s+y7B8I9sJuwCvbI23laLvKIxRMGLO0iAMLdCB6h5N7c1eb/xD4m9VJLw3RxPJQA
	Qi+HvSIp6t2+9bx0FSBoeNzjEhhIGqydVasOOXI22En4OTjNS7QihXk88Sy84ZG8
	NXFa+AmgEzOrD50vCeO5kJlqHeOnun7pal3HL55qadLF2DfhM8mUHXNjdjAWD2ba
	loRXjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx04r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:48:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2edd25534afso24249055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795412925; x=1796017725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=kbhQASfgm2WSFclDxGKCTNFReuw6QOH3h/Hknd2ohJ/pesF3oFkvxgMh7C33nPPvZa
         81fkYCr8MrXNjY46QpcVmutwAUS+ZTNw13EhcTSfaEHlFa6xZpQrMJBeu0cBhbSrDgDB
         ZbpEsZoLFaZeYISG/lbKiVbBiw6mnXU/VKw2+HhtkutGNhXLUYFYybLQtfwfaPYtXOkS
         xtDmNYiE28T/BoRiJh017L0nRppA5zX7iWg+MBp6mc8wcLgU0RH2++FBXdCM5Kdfmc9y
         o0Vvi6YGLGmXhZJkZ/+H5822KEQYXqLr/VePMrBKHhGzMa8JSU8eXrZKe5V96W5oQkxt
         +wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412925; x=1796017725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=fgL/NgXBrUK/YgyKk85w6q2lpgmuepQ+/M0yG6WhcFCAO0I9QkEXB1FpomEUxZt4pL
         nmloYHkJze4jJgOuYJDM2E6g4MtCS2uTEO3G7g2fwKZ14HOwPkK9PPhwQBLqpDA/zCyz
         qzPCBNjic3hM2YD7gZ/4/EhX+qY5ewHodKwZZnj+XP3mzmDPRICK4aE92tWFPKxAPQMh
         HERu8FcgVEzgH1o69YbLYc1pRgNqEdHFwM0xaR7vAl5VHZl+CXGP1lb+RlqOl5loQtm9
         ZrZMJUmbNjJUL4Bp8bz9caSdIVYJHDIJ4+r7/KDZuswb3fI0l82cMJY6VfjtZq87kfZ5
         7vcg==
X-Forwarded-Encrypted: i=1; AL+hErHgrWM6rVUxmeYZBv0MGLTGFCDWFYHLUga8pS6KbtwxY1llQesFI+cbgHgWmX7UgzK/aNGdmWl4qjvx5lyA+UNx@lists.infradead.org
X-Gm-Message-State: APuU4Z9oOSplllN8vWrlgI1yAGE/o6YtKcZFVhI1Dlhj7mWhrGgeUR22
	7ZHTPvYQpGrp2ExTXWRCaM4HuuaWW8xxjkY9g/V3+TgvSGJrkAiuebNzWJ+NHc2lAJQ0yGen9SP
	NBN6fhljHEF7pN2TyrAyE+rXQ754hTCFGYojOYqtVy92FK1TKN15jIv9JoAyUTC4DJXVWHVQrNc
	Z+rw==
X-Gm-Gg: AZFdTZdeGmKGZh/rDJ15Gqes6awOxy2YvVHra1v4BgoCQPJjYyIDIVmuzbUndlhIhyB
	bwl1Hjc7yWVhUC07gPQFlIIose4PgQyPLbKSWbnXuSgek1ryqhQXb0iFainc7Q3oTpP+hGlhtTW
	k2G2cxPAhaspX6LIcXGtSURzhGii73DDDrW6Ze2UHKmJLcSY2xbx01kImjZmqqH5hQZ7QaGe79n
	oY0SRWK2PAZr9gYpYRM3Cn17R5HJjGF1Es6kq9AWkzOP0nVveLkp9xnm5a0EzqTbwwOLMYrLZUo
	D1tThKBvsQHEkvxnnNKyN6e8OTfHvcto79xmjWTIFJLvfPOScDmEwVKEVYwXbqiS711kuLIBnoO
	EEd7HVUo8+PPB3CCs7CPUx/O41XCrc2iP4rFFLcACdVH9kCzLj+grSz49QDu7W2aKcrlFo+iFY0
	E2qNbiy/532xFSmRq41tqWlJtb5vpUQ2xNlKqSK5gDZaJR
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526515ad.38.1795412925272;
        Sun, 22 Nov 2026 21:48:45 -0800 (PST)
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526295ad.38.1795412924773;
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46143615ad.64.2026.11.22.21.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Message-ID: <bee69c86-2433-46bf-b842-0277b8f2b76e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:48:40 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] cpufreq: s5pv210: Fix resource leaks on probe
 error paths
To: shyckless@gmail.com, viresh.kumar@linaro.org, krzk@kernel.org,
        peter.griffin@linaro.org, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
 <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b03d3be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M1YlFrUzwzMSSZYL3_kA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hunLA4EieScgSzdB7XV8MSHMB-YLauHm
X-Proofpoint-GUID: hunLA4EieScgSzdB7XV8MSHMB-YLauHm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfXy6tVn6VWOUPt
 xXeKsYv5iqKcj3hgCEMToH6ArTJ5wbl97Rf77zhc2uFJ51fSL6g9LsO+Km3mtLi88qhKt6ZAvwp
 UdSMkYwL2g2ZExFr/M34KGNNxjrJvdg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX+gUpPeEnwv9C
 VrC07/E//u/9cW54/YLoeCF1fnt6o/bRs9QUsLXFI7PxzXL+Kykeg3TMBFSy3I4qKyHT+06G03d
 yFFO6PyDrY/5+DvfzKFkqetkNxZQ7u0uKodfL2Rf2wtvcCen3hYRnO7hlJ7Ic4+J9ZBdYD3ujSu
 xZ9uem/SDoMza1GCCCHc5jN+xF33TB3cWPfxpsqJv8OqVgPBsfvj09vpeuufYRxln27YDFVOCwJ
 phS2KsRqm3KfGKFM8wG0QHPS/WANtdZrsij36hxyApbNmUbdsyp1Go8XncVkyvfE3oy3yV2GgLP
 97qLAk47kudBL/fHRgPHTTreWmAQS1W7kqjbSCtPVlsgMqajJ4mP0bZzjM46t7YxtpwiKYhhEwk
 ZJpg9AgqRPSSAlw2tG4lCOGETlAjMeT9PLxFc+4YaVMeG4n2wJgKK64yiFgs5MnOnCyNyOwgXyX
 rQaFsTJjdu6MvF0Oynw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_214847_290244_8345FDD5 
X-CRM114-Status: GOOD (  25.57  )
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

On 11/23/2026 1:40 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> s5pv210_cpufreq_probe() returns the result of cpufreq_register_driver()
> directly:
> 
> 	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
> 
> 	return cpufreq_register_driver(&s5pv210_driver);
> 
> If the registration fails, for example because s5pv210_cpu_init()
> fails, the resources taken by the probe itself are leaked: the two
> regulators and the clock and DMC register mappings. The reboot notifier
> also stays registered. (s5pv210_cpu_init() releases its own clocks on
> its error paths, and the cpufreq core tears down its own state.)
> 
> Also, when a DMC node has a bad alias, the code jumps to err_clk_base
> and skips unmapping DMC registers that were already mapped for an
> earlier node.
> 
> Unregister the reboot notifier and go through the existing unwind code
> when cpufreq_register_driver() fails, and jump to err_dmc on the alias
> error. The err_clk_base label has no users after this, so drop it.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: e8b4c1986efb ("[CPUFREQ] S5PV210: Add arm/int voltage control support")
> Fixes: fe7f1bcbff91 ("[CPUFREQ] S5PV210: Add reboot notifier to prevent system hang")
> Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/s5pv210-cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index e64e84e1ee79..29b1c5d71a8b 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -634,7 +634,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
>   			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>   			result = id;
> -			goto err_clk_base;
> +			goto err_dmc;
>   		}
>   
>   		dmc_base[id] = of_iomap(dmc, 0);
> @@ -655,7 +655,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   
>   	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
> -	return cpufreq_register_driver(&s5pv210_driver);
> +	result = cpufreq_register_driver(&s5pv210_driver);
> +	if (result)
> +		goto err_reboot_notifier;
> +
> +	return 0;
> +
> +err_reboot_notifier:
> +	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
>   err_dmc:
>   	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
> @@ -664,7 +671,6 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   			dmc_base[id] = NULL;
>   		}
>   
> -err_clk_base:
>   	iounmap(clk_base);
>   
>   err_clock:
> 


-- 
Thx and BRs,
Zhongqiu Han

