Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEA606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLOgLXZf;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVw4OGBI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TouZqQGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=irAuZERJgfy5oKYpVBoCTW7OMNAhM+U1gISjyPpKtA0=; b=KLOgLXZflgfYkP
	UaplKLx4JLg3e0EOl0SUZFvz9ljTVmlIhErbF4WeE5cXzWd2OcaYeGbMq+GnV6lrERe7fgE3dUD4R
	CBtLhvHuYmFrbpvAhR7D7Btsa+LZdbwWcw2yPR0N/jsuTrXVOa7X58vmcHvqmew9hV1ErFrliehmf
	8Okvkd9AtZ5AuAaC3qNA82QhqmfvlW63/5sX+bk5aII5YF777kYjhmKBZ6OYXrzRw6BtRbnBLi1GH
	vjelPI58DTRzp3u0/2lCkP5zBi/adjyqMGTYM2M5W8AihpPbbNwTg43x9SVCHLi5rJEQRUzc08GXZ
	A6vk0AZCE66psJ+/fVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgHg-000000092ft-3KMU;
	Wed, 18 Nov 2026 14:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgHe-000000092eq-4Aiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:05:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIE4dEk3648072
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 14:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irAuZERJgfy5oKYpVBoCTW7OMNAhM+U1gISjyPpKtA0=; b=lVw4OGBI//R0O3GC
	y0xtCNFAPqPFkKBCtFpt4YLH/8Zer++4XHZMZv8ReqbmkNVmWlVi/PMBg4YJwS+l
	evTvKOjcxIi4rEcsDI4U4EQv1YePooiLDCGpdKqgAQcvI3Og8wzszVmumcJb451n
	cYf3vmZhEu3g0Uvzsx1t5zLdF+8A0RKeJdzxToyM1w7qyfTtwRPtvmjMInDW1dta
	yTM05peS0dRl3S1GReMXA7CdmzLHr5kHisPNKDv/hLnVnmOYR/YmoYXFrfJZE6Bu
	I3sv/MgSTlPzf7K5WrirH8oOPh6L5B4sGGhEsCg+JxDQlw7eYIck6LIzQvebCG/4
	I16eVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcr03s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 14:05:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso771101a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795010708; x=1795615508; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irAuZERJgfy5oKYpVBoCTW7OMNAhM+U1gISjyPpKtA0=;
        b=TouZqQGCNhX485IXHz2gTQBZhOpiHtfWLVUxIQvACrDRhTi/PXOLf29Nnw5Iy+Hl5P
         laVEIngJVyw2rn3bEgJsmwxoP6G4C5xO2TXRMZuDH4WfUUOn35Racr8XVA7aG3kbaiv4
         rEDq7G893cib1KYV/qd5Mry0zFgqSu+SR4dE7s0S6hR4Oh0I1sXuJkhS25yudaTy9gWL
         Si0a11VN0z1qd9nwPUWzpWmwGxa5/gJKReTO2a6VJdsQKI548443fvrewvARnAosPdF+
         hbJOT+fQHmYrco9ZLJJpjdpKqTAK5qeG52jfY4ZGy3nbscKClzMxCPkECJ9lL2anfByN
         Zw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010708; x=1795615508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irAuZERJgfy5oKYpVBoCTW7OMNAhM+U1gISjyPpKtA0=;
        b=1DkogvOaUD98Idp20sb70iIVjOSi3eO+HLqMfONBOeC1gVKBdoOczxdulB/th+vUKq
         EeHzl7nVGVzso4tc6sECsbaIjZCASQ4lEOzO91e33Kgn7V+yawLCMxdbOrmMB/FFhq5A
         rLrctTqAHsO5ctb5ZeUBDLzwXOSQb4TcuVpjf0zTuvxNENC5gnxxu4rNbDqkOF7yPL5c
         QSP6ug5wMWFib9SrdDmsANyaf3sK9u7bywrjCcRTNfPquai4/RYobQvMQ3qZrLiCc0pA
         U3GBGHg5XaY++JlQeF2kytI79hRROhHFcT224VScuNUVvcB8fgUAWdvf1aRYKgMMV8n4
         jxqw==
X-Forwarded-Encrypted: i=1; AL+hErGlELr5zoOSTCFmmTDC+PtU5OWnL2yxTxxD9/f+Ee2w3t4Ru+PruA3vJvWa/F/fm12MV1++I1sHJ0LJZUDj1AAY@lists.infradead.org
X-Gm-Message-State: APuU4Z+Pj5OxoMk9Q39g+vaxNL2CxFIOU/+e2mRE4yYmBwvryKEdEStB
	q9YlVt1prGKCad6HgegMvv2uFmfmfqMl7biLTtRN9mjUAM3mMFVfm+yPK78W4AlP0FmuYhd/KNF
	0yeGtyf0gax3E+YYjCtCn7F8t8SoSQQCpI1phyxMXewzW9LZCbO+ddWX41OtgCkFSUh3+CWVPH7
	GuNg==
X-Gm-Gg: AZFdTZcf7qzebmZZwX1PAX58J3kBt8QJwmdFKHPidqiD9ll/1fv1SZprc5kJirJ7565
	Wth3hvwQM7127a3n6wZmh8EljC3l9pK/hqx4zcZY6+9DV6fM9Evb1dhkrkj4T4xdRURHCXQPtnd
	FvtbqOs/S5imB10t+eHTvhdCvI5SGCO/KghYTfLQ+cDRAWqiXFd/UKIz1Bwxi5MLGidXg9Qddn0
	LL7jonLqYId0/MjBOq2HfdxxSNvAsVs0TPUxEFp/KRvftZs7FBe5s4KdB0kC+kxvugg4qhY8EGr
	pdSr4t+wbBHBC1EXKdUPWk/j5xl2obdCn0qa93SFa0UStYiCg2JeW6hsYIf7w8ivCqo5QE2BtYl
	58FFebtex+XZLIc5w1aERwGYheklsMAcuac039rV/uw2EP8/Ag6y7o8RgNaCDL+b0X25nFEwNGz
	n9ceS7kQ==
X-Received: by 2002:a17:90b:180c:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b3d06a3a73mr3027608a91.3.1795010707869;
        Wed, 18 Nov 2026 06:05:07 -0800 (PST)
X-Received: by 2002:a17:90b:180c:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b3d06a3a73mr3027545a91.3.1795010707249;
        Wed, 18 Nov 2026 06:05:07 -0800 (PST)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d0b6b42dsm4695853a91.0.2026.11.18.06.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:05:06 -0800 (PST)
Message-ID: <7b409fd8-2bb1-4e4b-aa68-a13c30ed3c2c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:34:53 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 06/10] power: reset: Add psci-reboot-mode driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-6-fa4b3ff1359b@oss.qualcomm.com>
 <avo65hxiVDxpJRn-@venus>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <avo65hxiVDxpJRn-@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZgJpeo6zZaFjCs2bwJIBi-cYnHWeXc_j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX6m0KI4QGXXq+
 d+ZUoeT4zWKywFNA1LKArWIyPFCe6Qb/zf/Pjp5HcYOHEYOkk+2A3bH1+q4cDNmd3YxP+OoHG9S
 G7QOjeaNDpyVSTxGRVAlnlcnlk6GS2Y=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdb095 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=_jzlLvw-XOvhGuOIOIMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ZgJpeo6zZaFjCs2bwJIBi-cYnHWeXc_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX0MpWZhxWqdw6
 o2u3nsIv/w2KXVHZDD1Ex1aDV3D8f0dVeqNKU/O8oVI06fhY0dOk62G+XyoqOs8yiyffwefCXiB
 TcFNvN6zIkRgna5twROMzPePSf61ZIF74wvbO5EJcwtcIHXTsLSjjxoJ90htV8hXALveFHWqA/6
 VPvfKdzPmqtcJjEYz12MMfGumFM3RjvfnQfQASxfIvK+RoB890Mg5ytnv5HjxSvHHD2ua6uURVL
 pSHStYpry3ixwMF/YIxO7dBxs5fyDHRpjzr9E3BFCFqqOLpGrfXKU/Km6BSC1R3SmQ5UIxvgCme
 7wAX15Rbg+KN54D9aU3krcvwd/Ln6wTWycwKzjHOjjfkSCClXrqlOEthF9AftXxuus0+r8rYNKx
 /VIh9nifKP9Lrg2+wjTFppx2TiXzx5NwcZB/QhMZqwO4cYlLlQsRe6qYJpHL+6OeUhdMYVa9N+0
 q3rNeIB06OwufVvWCjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_060511_168842_A766D020 
X-CRM114-Status: GOOD (  30.41  )
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



On 11/16/2026 4:38 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Oct 29, 2026 at 02:31:00PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add psci-reboot-mode as an auxiliary device created by the psci-devices
>> driver. Define two types of PSCI resets, predefined-resets and
>> vendor-specific resets. Predefined-resets are defined by psci driver
>> and vendor-specific resets are defined by SoC vendors, under the
>> psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/firmware/psci/psci-devices.c   |   4 ++
>>   drivers/power/reset/Kconfig            |  11 ++++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 101 +++++++++++++++++++++++++++++++++
>>   5 files changed, 118 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e4ca41cdd872..0e03826eec48 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22292,6 +22292,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>   
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> index d23befc490ed..04f24b8d9943 100644
>> --- a/drivers/firmware/psci/psci-devices.c
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
>>   	{
>>   		.name = "psci-cpuidle-domain",
>>   	},
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.of_node_name = "reboot-mode",
>> +	},
>>   };
>>   
>>   static void arm_psci_auxiliary_device_release(struct device *dev)
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bce996bbef28..f165a41d40ed 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on ARM_PSCI_DEVICES
>> +	select AUXILIARY_BUS
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here to enable the PSCI reboot mode driver. The driver
>> +	  registers with the reboot-mode framework to configure PSCI
>> +	  reset commands, which are executed by the PSCI driver during
>> +	  psci_sys_reset().
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index e31cab4ba78e..45d8aaaffaa1 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>>   obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 000000000000..c5dcfc40392a
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/psci.h>
>> +#include <linux/reboot-mode.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Predefined modes use two arguments. arg1/magic[0] is always zero and
>> + * arg2/magic[1] is one of the values defined by enum psci_standard_resets.
>> + */
>> +static const struct reboot_mode_entry psci_resets[] = {
>> +	{
>> +		.name  = "psci-system-reset",
>> +		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
>> +		.count = 2,
>> +	},
>> +	{
>> +		.name  = "psci-system-reset2-arch-warm-reset",
>> +		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
>> +		.count = 2,
>> +	},
>> +};
>> +
>> +static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
>> +{
>> +	u64 cookie = 0;
>> +	int i;
>> +
>> +	/*
>> +	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 bits.
>> +	 * For a 2-cell magic, arg2 is the low 32 bits.
>> +	 */
>> +	for (i = 1; i < count; i++)
>> +		cookie = (cookie << 32) | magic[i];
>> +
>> +	return cookie;
>> +}
>> +
>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  const u32 *magic, u32 count)
>> +{
>> +	if (count < 2 || count > 3)
>> +		return -EINVAL;
>> +
>> +	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
>> +	if (!IS_ENABLED(CONFIG_64BIT) && count == 3 && magic[1])
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0],
>> +				  psci_reboot_mode_get_cookie(magic, count));
>> +}
>> +
>> +static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
>> +				  const struct auxiliary_device_id *id)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct device *dev = &auxdev->dev;
>> +	size_t count;
>> +	int ret;
>> +
>> +	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot)
>> +		return -ENOMEM;
> 
> reboot = devm_kzalloc_obj(dev, *reboot);

will update in next post.

thanks,
Shivendra

