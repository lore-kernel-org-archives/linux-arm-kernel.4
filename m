Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D76606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S2Mp6Pnd;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsiwFWbl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=; b=S2Mp6Pndt9LTDu
	p1x+DXiGuwZDSIrzXEQoagfPqyoR+NKmq9Csww9sCyipUC7CAB1C3gdY1qJLTW78/7CEzpsce8FpL
	6l+iEnybj+6WPIXvpN5Qf66iEoV72ifK0PJJDpdRpzijM66r0RLAHBt0Cfow0fYs6MgrXBFKbXn/y
	7o3tcT7Ln2i7Cbjk26CCM5401AqBWMIm7pVUUn3DmuGOtYTLG9ynyAH0bB6x1vPDWoZpTyhtaR0ZI
	6Xq741MoFMg3x3jHnOmijRIeQ3a7dwdJi6251igwEd5LqeTb9oYFnNuAbdT+L96ZhJLqofyqFZhyg
	2n4PbuNeMRUK/jfkv1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSm48-00000000uWf-1vHs;
	Mon, 16 Nov 2026 02:03:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSm45-00000000uWI-1qaH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:03:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L3fV3997253
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=; b=N5ah1FsbeT0W4Wvd
	aQ8LpFyVl+juaE5h9YPvH4ymv4aBF0E7lV3d/Y6FbD1e+cpTzke0vlO4S1DB5BO9
	aEv/SsPShzP0YbNU5ggpZkOfKQx56WxIvGU9NlydHM1R9aJB+2tjSrx5R9WyDvhT
	6AdVPKZUkvYuh2+VifsxyoKfYD/D1mquEGIhisIek92rVW3iHYS/xFZ1TXAtP4mS
	cfBk6fC5pqHxbKk0UB4AOvMJ5EgJeKH+64++uz0deZ02T1beae6KPE2VaWq9MXd1
	UoMQyxF6plOaNGrb27jIDvcqpsnqgmQoYn2ke/kIFa+tNwn+DlKIsM7yJAmvGmuC
	FjmNdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx4d8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:03:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso1377463a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794794602; x=1795399402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=TsiwFWblHXAqgISSAsB1q4K0DLPBsrjAeBDYSBOZM4kWFiemkPrFFS6gdbK0E4ssqC
         JgGmtOmEgNNwx+69HqymMz4no6QqcPNx3ltKR5IcqyPc6i9OVrL5uoQtNOK88H1TT+mq
         DYjwY6RxFVjdg8X7i/ZqGnKSHZPLS3PsnMiN7g6lBQhL+zIt+/MCh1uDRnM7KMrg3hWB
         12/CjHh9Fud3oEIGkpgVGiYje8d+xvkLBoO2YdFK37+4PlQRGUqDyAOaQJY8pRM+aj0Q
         wolNNydXSISQQE/5PEFKE5+MkkOxrQSVSy7G5DJcfQPc4ttgg+Ou8iFHqcRlVLF5pNNP
         lErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794602; x=1795399402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=vkOvP9/Xb0j9Xrn56YUgMHyvIoR4EOWtyNi/+2TDTG89Q1Y9GVCTlxJwNKuh/9GAo4
         rhCiWtG25NisVB2c2kP7nookSfwan3aoV7OmX9yADOwuuEw9VayjIbBjZG2fkL6GJvN7
         kZcB14woEmgOwDgqT33vDP30kE2AbZkNulXQmW5UcOd03yQ64ykZT3zfB5RN6G1oAXEp
         zwbKzE/0M3qN05fQWsMwEBTQqFHIy7756SpYyk/E7iMN7kA9Fewdyhgw+iwnnIhA0IBk
         LEi5aOBZ3Tc69snz30zaWQcAz7zVufqOqg8Lk9iN+fuaUHzkt25TbIoiU6u950RgyIZM
         BWPQ==
X-Forwarded-Encrypted: i=1; AL+hErEc41yi8saxWGSFrOCPavhX7/c6sbxkg7SIVtjUMU3RV8lF3YT0nMskqXt9LNxrt5lNg+147qVCNhs6HwlcZomB@lists.infradead.org
X-Gm-Message-State: APuU4Z+etbZqGI0bb9d3gbL22l381d44FXeBzRfU973Ryi8H31u5hZas
	3s4oG110tGKnLsIbSMCsVPWVFxJ3j6ATSoXV+ck6tRQj2LhoT5F6DgE/NNTip9nWShVXbJ/Yyxf
	VlMbj2NQ6EqL2ReBMRDBzisdVjdUNsmn87iJ5eIXytjoyUJFD3jNPxxwWwRXoI4IlbJmYszWTI2
	lH0w==
X-Gm-Gg: AYBFou1V4rMEvr5hMGErxOonRx4WKFIYgG1S+u9DFRdQjSOlE+NucsoAf05vnhpVMEB
	lFFoEmPkjmUJLdIEFvrmlZxsIgg3rQeoJMS+gm2kAgoH066RPX/C0dBRJ+WdKq5fV5HAG9YiKJ5
	BDq9FhOCeasWRGKPG7Grw2U2aLWPcOOKaCwC7LbyqL6MuiZQiHzej27vUo3HU29i/Ggz+hr00oz
	7HJZpB8c8qjhqy7zBeE1sgEWFniGyxjcKM0ctUbECgN7/+rsYD83QqaHGjJURCbDOOJX4YdlTv6
	MlvITGhQVNGwVrFJccGmNM5hEtB2R0/sHnc8eJgzXhadZPHzzQYSTmzc+f5IUJ9xDZOxKmTDig9
	iQg8tYguFhMhrumHcCfLaGla0LASHiLuKSuhc2jxchGDVVoJFHPKlJeXXsQRj68Adws0XZozWgY
	GPtEu+Jv6TvEGHSybXt/zCV0Jn6FOFc+6yz4/f
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635801a91.33.1794794602541;
        Sun, 15 Nov 2026 18:03:22 -0800 (PST)
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635767a91.33.1794794601836;
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm19748961a91.11.2026.11.15.18.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Message-ID: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:03:14 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <20261111204322.GH9176@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261111204322.GH9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfXzy0bIGIIwCRU
 kn9lYueihkNf+r86xUVzz4HiKegzUlKtk3ECowyoiSXjHloEn6phLbLjfIPh3wg3EHHsNugHFfg
 gLPF+LQelXGU+b0CqyHKMCjbQatIIlfbco0iJ7GtaVMdRWpjnUA4kb0f4azdS58pyvLdUlkCRc2
 TgePuglzNSNgwPYFTO0gyqzfxlEwY/KBrF+cykZm6em8mbrAxqVltTOIs7AaHXOADlr5Aph5/IV
 c9yFIdBsoWvUG1PQzBeB7ASqSfusF40/Lli99RsL89R9KgWQQALFoWEw+RDl1uYMPjHoXD/s/DG
 MD6p8k/REcdiqHTNeQ5m5iAXcLD4v2J0nQ3kFWXYPHM6y+IPDoK325J6xBxjI3aZPei/m4mubA1
 6DDWVrNjANok+KJZ9rf+PZ7znzZk9wZtQVYcgUpZvSzEoZwqcV/M5OWWTFl3E9wd9JPSmO7lbzN
 T7YhriGSb2uy3XXF2IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfX4FeacZGTWKo3
 2bd1qE3JAM9u41e6mn3OccWnTDV0jt+lgKK45owy2+5WyAqXAzq25a79J2Y0xUSLmKmmHeq/Nz6
 DzVJH5iIphx/OKW2LyvrA1OgE/C5880=
X-Proofpoint-ORIG-GUID: uB-FbhZDi4oKLfuDxKDA5RN7sikgIrUb
X-Proofpoint-GUID: uB-FbhZDi4oKLfuDxKDA5RN7sikgIrUb
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa646b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Yhdbyfe_LZq1WiuscQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_180325_617938_2FA346DB 
X-CRM114-Status: GOOD (  20.78  )
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



On 11/12/2026 4:43 AM, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>
>> But it works fine on some platforms? We have a property to override the
>> peripheral-ID which would solve your issue. That would be much simpler
>> and avoid the ABI break on any of the working platforms.
> 
> Looking back at the earlier discussion [1], Jie in v2 already proposed
> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
> mixed together. The series later moved towards platform-device probing,
> then became current shape.
> 
> Hope we make the right decision on arm,primecell-periphid this time.
> 
> Anyway, I'd like to apologise to Jie for all the back and forth.
> 

Never mind.

Hi Suzuki, Rob,

The "arm,primecell-periphid" override is the simplest fix for the issue. 
Which fix are your preferring for the issue? If we want fix it with DT 
property, we can revert the patch series and I will post a new one to 
fix it.

As Leo mentioned, the AMBA probe is not affecting by the series.

Thanks,
Jie

> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/


