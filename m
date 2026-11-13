Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E5606D912
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T7tiaUOR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG4wpjRe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CN6lWIbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=; b=T7tiaUORsKjJH1
	pJXsmJo/Z/AA2EEYPFTpiIxDx88nz0zpMZ5/g9YFs4/kWNBEfEqGa95he4m9UEizSUzGij5IXw1PU
	fCGLD/0iuieUQBY005UdOCVaBc6Jhpq5guIfRbIzW8d5xZWANGrY2BHAK8+olzkJfhN9kbGGyJ84o
	JsvxVNnRN6WNgprC7POLshQzQHgHQPBcIQEizJ0FY7m8OQhv2JXK0W4BdiuT4xrfqiwb5TqpYhsQc
	1Gi/++hHCKG26sHaQRru7ifsJ3/3lNwbvIZScrG3DdT6AJNBq6UxUu5S14DXJGSCKbguniMLyOFts
	4ELTTiUUTL1vfvn0sYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmy9-0000000C92P-3LKP;
	Fri, 13 Nov 2026 08:49:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmy6-0000000C90J-10pF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:49:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VS221527748
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=; b=JG4wpjRede9BqySy
	asWcKN7gnfk4K6M2OIRSzP8giP87ESP9RDWddELjDwu69VBkBZRqGV2l5NYrJUdC
	bTP+PCSdFj7TD9Zen8Y+gc2yUajppwSEjfdkLxiUW4WNDCXGXpJqbyDVudZx0pJT
	CkZe92YogtRbAQAL6us0zP49xMtfry+n3VgtrG67vy/K7GPCvEBvCtslVcEmMFYd
	ZMxwOO+WnLD2L7Fv54ei39/iVUdq8xFWbufh3DLwPpGoMbugUzlvMSf6bRf2MjAC
	yvHENKEgEm4bO8YkyqCchn1TrATSPn7znH49fMVIaIUKzXrqwTU9dtXf7SjGX8Dp
	xzGuKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8gkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:49:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so1522421cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559748; x=1795164548; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=;
        b=CN6lWIbfW87Y1v376ew6HRLg3jow3cM4wM7B+TJyvpv13ypDJJX5a9Z9a2aeYqo6l+
         ZpKcGg0zibgwzvP8ZGpiNcD4EzmiM9cqeUFYls/pgzVEWaf2ZfIl3GEnOH1ip7Q9/cWe
         CW57uScD98jodwaJPTYHF028ku8G814xxkmssfpNYl+MVjrgGT6u044fW8sYdooFOOnk
         v3sXsFDzdHi/J7yIHfTe79OQ4gYFa1/JM+87c/uG+uyK4AVPXYwibBA+EDS9ZMs1lT3H
         DaabNg508SrLTF153fCAjfJgdBqOj5aVMcg/kBzwWjx1ABFWLbdotWPJ+a7UjkG0lXwu
         rkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559748; x=1795164548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tmMY3eKenrMyx/oleHX3vprC5A7QAAT1HsRVc/wf84=;
        b=toQLDeYp8KgvnQMu8J2HJE7fbqOGfGIkzhynMU+YmWRcmqw1oV8kokOgltqZulcYnP
         tAwoH43bX1KAvVywVf2xXkFM6u7LYSubqSJK/ES8ODEmf7MVLyI6JozjnSuPAkR1WSEy
         NXUg8ULzDBGkrQ17oXr6SFM4yxKC3iuu8VmAyGgeIwm1WCyHp5uceanjcr05CjU4yX8j
         DWcrQ4titPkRIVgDs/A0kiTaUlDpVqsbdb3r1CzGOK/jR++qsU1vgep+tBpwR3WceWLb
         oFM4S81gBTQOWGduZH/QOmI/4eW36Ud63fbKV2vPSrqw9MreBf4ueKvaNxyVR+f2I9nb
         rPBA==
X-Forwarded-Encrypted: i=1; AL+hErGNKYDBeslgbxWd5McYLvqV3Q9s6vpsAJ/V7OnioGwtthve2zwH/Ccw2AREKFyTQMz7o4DrePC4dxoBTzWLEHqq@lists.infradead.org
X-Gm-Message-State: APuU4Z9WqNKeFf0y28yq04/b6GmIhhRtYA+ADCM797qhbdlQsUH3DBq4
	OGj6nJoO1PEPNU72pS4tupS4R5FQ4IHh8kv6KOsfp3OAxmmAlT03nhuKdJnZZbt54U1sfQJXLPa
	FLvPmGTrlVswdF8R7TDTu9iLeNo5ecFO+JZm2zyRlPTXfjxaivg4YJtPq8uHKcVubNA622n+xPb
	/Yti3/5wEesw==
X-Gm-Gg: AYBFou011in7vwxBSymJfMDmqUkaXf/Z2axd0L03NKwAS0tm9kny9c7U5t2H6WZbjmx
	9cHVL9qI78bduFdtu+NCq4U/HXW+qYE23sNl+8ehKfjb4X2AgrrWUQqBFlqbognNvOh3PZ4IFi1
	sFhUIPcWXtA3jdKS3edA3zokvH0we7l0lweOQ5hBQ3V5XiCJYG7tTX1MoXv3Cjvk7F5JYyMzLTI
	/VKPzbzeJIBjRDCOVXJ5p5jVPU2gngi5n/xNCOWLncAVKA40RAqveYy6xYaNQntL0URJzVvf9cy
	s7vkniiDQFhoyKPPasrGysU0oasX3XuuDSmLnj104SpKPidWtw55iJufwzwMLyBZ11Ohb795pXk
	hwh4tW/jkGE7Hg5pejEF+pu96kpa3efZDOe0GgUE5pU8eSC4ApWlbx4OSQuxRvOieh2/2Egw=
X-Received: by 2002:a05:622a:e4da:10b0:54c:2dab:2d38 with SMTP id d75a77b69052e-55ac428a136mr28499521cf.1.1794559747598;
        Fri, 13 Nov 2026 00:49:07 -0800 (PST)
X-Received: by 2002:a05:622a:e4da:10b0:54c:2dab:2d38 with SMTP id d75a77b69052e-55ac428a136mr28499321cf.1.1794559747157;
        Fri, 13 Nov 2026 00:49:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm66912766b.85.2026.11.13.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:49:06 -0800 (PST)
Message-ID: <7da806d7-afdf-4e2c-ac1c-6757e7850025@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:49:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXzBj52mINCwuy
 esrkl/oCCbB8EJfRTv57GGWaw2IP4AlcyVE8GHC4LA4it8XqbidXdzZjL2pQfVbgCtg1nULo//d
 OMxDgJXMiqqLoO6KcE8wO3kQOw6dq5GK0a2ZIpjcdkr7wiOm4JIppsRgR2LK/L7vHrJWtjJAoxK
 xY4GquXfpRdDeVYunddsdLN1HNrwI0sUKDuvqe9uEJiNukoW2jsYeg5F04e8lBH0aGE6LvA0Z/g
 nQEIasc6k4+3VXMJDCOBs6HVYRrK1jI78JuIcQtowtwyMePfyrENMxkrhIpA34X9CPA1npKXB2p
 kYz//w4Cpetx/dcN6l3eiHootBRc7yCL6JVp2AgeoUNsiaRFUTNXDpIpWhBFq+H4J/WSNbMqTAw
 T4PTN96W1wIqbpT/61/Bcf0hAYsiF0PRp/1uUHkN93BmyEc+A5KkojViNclZLBxDlXV2kLfbUX/
 BznOtu4ne8igb8OGGow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX4Efc/aPPYNyI
 vVvKm7mfyA6TldrXpHPoNECxupkPCKeBeB4rzERqQFX9jdu6KH0NX0iMyaIjnGjoXg8iS8ORhGN
 Xs1DTFyhbHrlYN3UBxoxusSyxPw8qlQ=
X-Proofpoint-ORIG-GUID: 1lnlTjITkZ87ixmX2DgU2ZJzF7wTDdjs
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6cf04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=mx4ymb323s-aB6Ux9hoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1lnlTjITkZ87ixmX2DgU2ZJzF7wTDdjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004910_574598_C1B1B350 
X-CRM114-Status: GOOD (  21.13  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 12:53 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.

A doc confirms this is specific to "Select Windows [sw releases] only".
Let's move that override to sdm850.dtsi with a comment.

[...]

> +/* L3Cluster.D4 from the ACPI tables: powers down the cluster and its L3 */
>  &cluster_sleep_0 {
> -	arm,psci-suspend-param = <0x41008244>;
> +	arm,psci-suspend-param = <0x41000044>;
>  };

This isn't defined in the Android tree, but to my best understanding
should work just fine there, i.e. we can push it to sdm845.dtsi. I'm
sure someone from the extensive 845 linux phone crowd will give it a
test.

Konrad

