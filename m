Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA60606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNjLHEVL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QoraXHFR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hJmqZ68T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=; b=xNjLHEVL4Q/GQf
	kx/qNJW65xb6lRCQoXx/RlOtJN+u+wihuNT2a0GGqEPpltH7mQnIY7mtBzEJNnC1gtc6Av3p+2yVD
	m3icpC8ZZxKaVbOqIOSWPEtu1RO/xXwOL2wxmnvH/TGMM1Fk2mVUbswrWaHoXDsC0xKHXd2W5aoKY
	6so92QhMq48hkb2h9OjhxmvzGObyB55ophwF0qr/7dw4wDubKkvVxqvIBfJ1CPymxoMGsnkzFeGeY
	sDti8spuSLfa6sHaABxbcXG80Meutoi/b9Tw2jl/HseuWjYyF6fVBBa+BbFOZB5QeqKPoMqNIpBiB
	7S5dr+V49z6CE0lj5OHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKcT-00000002CCI-00HW;
	Mon, 23 Nov 2026 03:21:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKcP-00000002CBu-3TC4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:21:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNrKJw2880693
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=; b=QoraXHFRbb9UnELq
	GPO9l0JpOcU6VcmdtSJDDANpnm/s8tsML/fOenKlPD0WCAVWVv/LTJ+jtaD919Ft
	8e6C4XensAVOHJZo4vqvy4/LXxnTkHpXH5fVHruBWo6oOx+AI5c2oD9cNQt0mPRB
	J3J+7AgmHgcPY+iY9T+wSyigCKKvbwMwvHWYC0OqZJSZa/mtK5/WBOtOfNQp7dga
	egnjjrhuj5AvhXHQ5aB6lNCgj6tkRUhuVFFyDljY+NCkfKOIQgfk+37WqbagzLF2
	D4au9eJ6BI7d1cCX/zL7K7rdvCMtJ9KpSI22d/ARSobgQOtTvWMGX2QPdAeWsWDQ
	wGnoKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnwb1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:21:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41b099809so2468435a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795404083; x=1796008883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=hJmqZ68TSt/Hl9P6AUqipkDCfKPCp+t3gNulIVgUcXoniKXqZEzTy+V+cNbXXifitZ
         i0bH8ulYfv12ttXA4C6hFM5JbfXpu9hOc4iu4jYw/aspB+TZici3XUpJyqYmc9ekPDB8
         +Ekw9ROxvPMcP27HBDbIhcPZPlqytiEDccZckNnGoDAXPDIBswfpHsA0ltsAoLG4y/rb
         C6mysZ7EdOYLgNOXhr2hZH//x/KR7lIww7UbvtfnHjQ/Pp619BJ3pkmq9MUlKVG5j5xr
         BUPIT66itDti+So9Nb2Fr+SYCeqv6wE/A67b3Do17CSUMzzBwWnmRDnkS89rLFAqO7T0
         OFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404083; x=1796008883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=xzzBCDXlYeN0IBwK0jed2Fjpmsg9f+80/siUfN6KTXzuXAeVMEXi/xUywH88Te6BND
         pR3s2oL8Y6RtQ1/dOrDTrggm+UxeM7p9cd0siSfh5hkdwEV9QBnG9h4pRL4GlYjjDc+4
         amGmG5X+1nCblm6PnZfdYaRlqs6xQ6jLNYbXaokYvc1uPfF7PMp13EUxY2WxmPmKbCNO
         JZmiv4WlECW4/uDkX/ITzt6U8J2rF2mMU3n85K4MmqPfUTC0ziNeNZMoM2P3wbzZn7rd
         zeooC2bd9HkEZQvRTXzrY/dfcy91uZpK7vEupEIkp++L6CcgrKcAPKDcGhg4hPzWU/d6
         5C2Q==
X-Forwarded-Encrypted: i=1; AL+hErF7ECBV68Cm4utiC3FW5JAUQikI45Dq/WGiXl6xBTQ91Xg/mHJUywQ6NqAVhwnLV6UkJxBSiXrjCYM8wZcD1cNV@lists.infradead.org
X-Gm-Message-State: APuU4Z8qC2IfVhalH7kHBBDOyXpA8/dJLaoV0L1xWmd76tIqaKbaxkVZ
	HxVv75Ce+AAKpt9e8GDv7jhkWuDfgHehOQZYfz+pS7AaSKuYTh7Q6XNsHttRvgavAoptVkYJ0Fu
	V7/NeFXDsaCna/BVmTFoESWuz0sROFCMarufWE+uLbACmz/xO1EhG9anphYkV+5HHAcxLgjcb+z
	FXlw==
X-Gm-Gg: AZFdTZesqPK+q9ggK3IVdk+cdBPy8yBYN7kZRWXmIm07XnfuZFCEymwT8NSLKyoxyKx
	FJqj1NB68cQHEfPGQpErt/uk2mEs/WUt7mpBaGrdmwxvzfebEzkpSMC2FMkE5NbGLgN9ntVdYOY
	HOouwKu56TPKu5csKuMTWIt/xivM1ljUqULd3UhWCVJy0YAmooCVsfvn1Yp7VKxit7+SjTkY3Cu
	kOuRR62ay0TJ5Msh06radtO9i6x02CmkaJOuvEhXh1d/O/bti2DBrMDTfPWuzuOP/BKQfL6l5my
	hWuP4a7Cr1AYI+O2tZqUsM4R/QiSPOfK9qKoeDiYjOeUYa9V7snnTX3wSr8mKIU+3Xs0ZKkvpY7
	REj3+BZPxK49CyzU4Ip4EKl89jVqHyPQnZqfOsmR9mpI8QUtCIl0yzeDwDLvA9uc8piSlSNkak3
	lpmi8rrYbrPVjjmNAKSRAdQsqXxodPw9wyaPChADCYtPV8pA==
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091510a91.57.1795404082680;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091488a91.57.1795404082223;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b828ab9sm5057963a91.2.2026.11.22.19.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:21:21 -0800 (PST)
Message-ID: <681285cf-b668-46c6-b6b1-793782925602@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:21:17 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cpufreq: highbank: Put cpu clock if clk notifier
 registration fails
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX1JZ4VC+XkE/1
 vC0qE661lWfwjeXfXf6/xXKf+8vxFqKGSSRu7JxbirwgQiJCx6GQ4FlUSpOp64K8FkpmfC5ADIZ
 hDOvf3qRL9NV9gIj07315PjPMbKWA9VFfHkP1yl7MhFTLNeWU8gl71aI7MiOrTvDqhhqMvvFIye
 NwoXzlhmhTf+/rjTylifNI9WGoIuB7iNMbc4zqrRkb9gZi43dsxmAxyJOCZq7PU1JqQnLXrL4iK
 VnpjNIjwONYMq1ThmJNP5pmCqZh+j05EYRe7hKEe+PRtTibHNxAlp/hlflc486b26L754ylVm+n
 o2bdJ7wtHqRdmeLLdeDlhGOHDNMmbR8WWgDz1UFDqut0I/c8hHfdQHpe2D8xKe8TNi2dO2LzkAc
 QYEaivVJ3QHnVQAijUwW58GCFpIUEneVRcQEocout0QSeKKhNA+rXAhsVfLmGGjmAkTcRKitko/
 zm45kySQdIZVnXvGU+w==
X-Proofpoint-ORIG-GUID: OamcmlgY13GjBMRtFeSXASjPILWfgs5l
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03b133 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gElGNr783DhJT2Mv8Y0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX9BC4ujKQDSjC
 z3pdrGBb8rq4L2lEphvkLP/lV/TIMEvT3EpxiDx/kSuLh4LcuFTdCbeN15x/XUwGHSmPbHgZ0SZ
 guKKBRD8Taa6cC2FVJtNIc9AdykwnQw=
X-Proofpoint-GUID: OamcmlgY13GjBMRtFeSXASjPILWfgs5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_192126_006745_F46AB62D 
X-CRM114-Status: GOOD (  20.76  )
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
> hb_cpufreq_driver_init() gets the cpu0 clock with clk_get() and then
> registers a clk notifier on it. If clk_notifier_register() fails, the
> function jumps to out_put_node and returns the error, but the clock
> reference is never dropped.
> 
> Call clk_put() on that error path.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 6754f556103b ("cpufreq / highbank: add support for highbank cpufreq")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/highbank-cpufreq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/highbank-cpufreq.c
> index a45864701143..ccdaff4384d2 100644
> --- a/drivers/cpufreq/highbank-cpufreq.c
> +++ b/drivers/cpufreq/highbank-cpufreq.c
> @@ -89,6 +89,7 @@ static int __init hb_cpufreq_driver_init(void)
>   	ret = clk_notifier_register(cpu_clk, &hb_cpufreq_clk_nb);
>   	if (ret) {
>   		pr_err("failed to register clk notifier: %d\n", ret);
> +		clk_put(cpu_clk);
>   		goto out_put_node;
>   	}
>   
> 


-- 
Thx and BRs,
Zhongqiu Han

