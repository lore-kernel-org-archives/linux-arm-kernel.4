Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=piGrBIeJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoFFOMK0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qs5UEK3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=; b=piGrBIeJshBBhC
	3EEvxBPW7QRGo8Kck8ON9qkvv1Erh4HncHaSNxpiPzNLAL0+5NdLksxY2dznLu7Yfsvx2hTbbigob
	3Mrakm1vrZSCr9KSN2Pn3pD/qe4ZEHr6m/X39UIDJfUiAQACT0dPq1y4ntUlUyO86y8RJgf/x6+Cp
	ywRxMriESU4NrLLYgX/ly+2EwAuFknh2w2R+KnLeOOhD7G0vGlPcE8Xv7tniSsVSkyXKHfAqElrqW
	K/xZ8ZFr6mJKwxFZvJjcgWPNBJ0nP7DV6cXMU5BdRbt2yaSiJCo7DVQ+GQyzSw2e2cDuE0SxxzqUQ
	b7JM23dnR2eXru2eyG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqci-00000001LZ9-3ltD;
	Mon, 16 Nov 2026 06:55:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqcf-00000001LYR-3qCB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:55:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LSWF2880937
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=; b=HoFFOMK0Ew4JZgOd
	mdJSri+fx+p1Z3YRl2DQlvbRhbPFDaAJhWg9xbQ5bg9syHMcMfrvRZsrTiq7EZ9M
	+UQbwvRl2LPQhtOI8ejcLQQcvNiaFUnriGkf8XYEBaHrRV0cg8hOCWZmZ8YJVsL6
	V3OSgs3eIF2KImJ5U9NdGf6w5/d0toJTjom6yy3PjyrwtZ0vIy4EgFYZ4d66/1qt
	gsx8Ed4RWM3BV2M/LdlD3/Nh5uVrYrM98bXw6c9a5n8BoReySnBlIuIcPQ4CK2LZ
	EcCPo1mOvT8KsIOA3peiVD11YKrCW3EWB25qlbwQmwr7OLHxjBfcU8NR5DpVc57l
	cYwujA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj4582e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so4079105b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812124; x=1795416924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=;
        b=Qs5UEK3a+vEb2r/VQRjVsVbuKpBfT4JFwh62wAv0jvGOTcMtE8XnIha0WTuhA2Y72C
         VcHYXlqlL0E8/UI9A4mPSlq72kvHCIRb/u22DJ3nm94TkRoE0hy5JUygEjIrSHwv02vR
         shZ/RhSc7KbsHGBw8GUpYffSQUcxSS7eMbSJAmYYQmcz8eRqWF86T4cLbK/4xmarz4j+
         awxcaSm9p8FPf8/p46OGsWrwhCtQJifIZYpz2e8PMoMdKVnACq58A/JqhnYOE5K4VMEf
         AX3NyscgLAIu7JcR+8VJTj8Uanbibkt4YmWv9/ayzf0/OxAHq1yY6/aoVdAYg2bwvSA7
         b8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812124; x=1795416924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=;
        b=Cr80NjFAnoEoY1mKhPeV9G9KRhIJjL+8OBMXuM5yccLvyJ4XB4kr60ZcuGdBzXN22k
         nIbdPbL3Piy1b26tXCEUfhvo/a6HJvaWAWj0GjfAX7yTeJ/jfkEhnIOVCQ1ctBMGbCAg
         ivfsxRtAWHzaoW1voTFxoPb1e+VDJq57Ae//RbaIjOi9lJp2h/EPhJQ4j/WkYoRoCBsu
         1X3LIecYJDiShRCFMQZFJEw3htIaPRGEvtw7R9sjx1aQucFcfO/YEnzVujxYaxyMTiGs
         teDRHctg6CQiJXMmnGxBvgfdjM8ho8eZKCvMEzdHs+fOdl5RrZ1ct3fva2I1JZsWMITq
         7+7A==
X-Forwarded-Encrypted: i=1; AL+hErG1JGKEG8lJtxWWT97E5aX3HHehcQLQr84YnZrvIQXS+YJaBNLG3qhffgO5KspQy76C0rzDNooZ5fLEW4YSUXsI@lists.infradead.org
X-Gm-Message-State: APuU4Z+hF2p+zL2G4XcjDAgNXuUS/HhW+K3qEYJ/jbftkA56OFbe5/MM
	y+HZ5kVnhumQHVSztIp5+sy4wO3AoQOe2Rfgxw3nQCWpW+t+AxLvx8W0nr1JjfaDd5Nc39f3b+N
	aqH9V6Mzory/8FTwgSG6oH4mWJ4R2sU82hIAyV3fm2BE8KCQ32+OYpQiKZw8xCCvdlOFpagBkNt
	wY2Q==
X-Gm-Gg: AYBFou0WRdgEfjcBxviS41UN6VJ8eUkJWtXr8MWgQ9Jc4rlvSuzpPxwYD7wtk1eIxyP
	rO9u/n8maMKWt29RFq7WyLG4SLW3I/kFu5Yx2lSMcBVYsPhbFp67qr0cbmwwYuh/YLVJO/NozCI
	lApCW161B7Vx76asPWFDHvSw+r6n6hbkxj18y74ZMKo4l/dbbjyfTK5Bt2QJohW8oW6O7ahf6lD
	/uyct3UGAOpv26CqKX9zlO5dG/Fk4eD+bnf1aEg8/sabmYReU1duPJKfwjwI+qpxgDSoJidgin/
	JDrlJHU7eC1LjtYLTel25XxQ544QeAjIMN/HULa4C+RKmZ/fH2XOgdGfXfsCYWj8bBPj8K8TfgX
	YHAbtuejaJeWveRBaFQmO8T6Low29N6kaRzJ7j31xn9GAow8M6H3Mg3tXuk78K/r+83owLtc67n
	I43NyI5C0/PyWuDX2J5w7FDXmqZhVA20Nh6JixjwkUfmw=
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8beb7c1fa6bmr9471532b3a.37.1794812123797;
        Sun, 15 Nov 2026 22:55:23 -0800 (PST)
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8beb7c1fa6bmr9471509b3a.37.1794812123291;
        Sun, 15 Nov 2026 22:55:23 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:22 -0800 (PST)
Message-ID: <46e134f6-37b9-448a-adcc-630e7427c5f6@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:53:34 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/10] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-4-songwei.chai@oss.qualcomm.com>
 <a627e328-93b8-4550-a521-1fa78e326aeb@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <a627e328-93b8-4550-a521-1fa78e326aeb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX5YisJhcVu6/P
 3w/o/WAFuzLyNA1eoBF60AMRuq4H+lz0Jri8ieTn77OexGmYIwngFMBa8M/BjHI63DGpt5O9es/
 UoFJHUQgEPv/tcIsivMffaxSuBNZyUJbVmh48RftmBBU2et/XDfNMo+KCnLH2580XelcI7AKN/9
 O3CYQvT8hBi9bYdS5BwWEYoyvMv99fyk78MDAlf9Rb4LkD0wK6FL77sqFaCSJSvbhGulHKGONyV
 UOJ6TetF9K2WNoyhx13qiOQdyXuvdfFD8Y8ifvLCAfxRdXawNdlkA5k90s8pFB56mcfVVMxhCLG
 oAsALUPuMsOaFBspYX/o8I0OgHt2Yw97uJ71+iFpXcyKNyuMWH9tmB4leO/AGRM9ur7H/LFD9yT
 HU1+VnQUMTA7R71Sh4vkG0OJX5CdQby806kjFSrj+H7zggr8ReQRQHBqiW2e07UcIIeOs/jBSDu
 ErXQuHALfgdNP0ARlug==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afaa8dc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=eTVmFti6TlQfcjQhFZ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hvuFhAETKxzMy76GRWTmB4AqN-K3pSlW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX6AWMOOnhqxgR
 63iTsYINmKCR526432Zswv6X+nzvgv6Pgg0FjhzxqLl0MiQOdlSO+/6tnilMCjVkau0r+yyFbrp
 RkV+f5n4nwaRsNFud0fX5HxmlYPUhHU=
X-Proofpoint-ORIG-GUID: hvuFhAETKxzMy76GRWTmB4AqN-K3pSlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_225526_109513_FC46E4D9 
X-CRM114-Status: GOOD (  23.03  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/13/2026 6:34 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  31 +++
>>   8 files changed, 270 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..66b12ffc2892
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        November 2026
>> +KernelVersion:    7.5
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe23913b1e43..faf8706b6584 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23264,6 +23264,17 @@ S:    Maintained
>>   F:    Documentation/tee/qtee.rst
>>   F:    drivers/tee/qcomtee/
>>   +QUALCOMM HARDWARETRACING DRIVER
>
> nit: HARDWARE TRACING DRIVER
confirmed.
>
>> +M:    Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +M:    Jie Gan <jie.gan@oss.qualcomm.com>
>> +M:    Suzuki K Poulose <suzuki.poulose@arm.com>
>> +L:    linux-arm-msm@vger.kernel.org
>> +S:    Maintained
>> +T:    git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
>> +F:    Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +F:    Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> +F:    drivers/hwtracing/qcom/
>> +
>>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>   M:    Bartosz Golaszewski <brgl@kernel.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 0841ea851847..f37edcf34e0d 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-$(CONFIG_QCOM_TGU)        += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..5c94c75ffa39
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,20 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    depends on ARCH_QCOM || COMPILE_TEST
>> +    depends on ARM_AMBA
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..ac1ae8bb0ec4
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,193 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/coresight.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>
> ...
>
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>
> ...
>
>> +}
>> +
>> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit 
>> (TGU). */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>
> ...
>
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>
> minor nit: Do we need "enable_tgu" in the name under /sys/.../tgu0/ ?
> Couldn' this be "enable" ? Also, the function names could be named
> as "tgu_enable_store/show"
confirmed.
>
> Suzuki

